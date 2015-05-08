# Make life easy, just include everything that is needed.

ifndef top_srcdir
include $(dir $(lastword $(MAKEFILE_LIST)))dirs.mk
endif

include $(top_srcdir)/mk/config.mk
include $(top_srcdir)/mk/version.mk
include $(top_srcdir)/mk/targets.mk

KLIPSD=${LIBRESWANSRCDIR}/linux/include
KLIPSSRCDIR=${LIBRESWANSRCDIR}/linux/net/ipsec
MANSRCDIR=${LIBRESWANSRCDIR}/lib/libswan

LEX=flex
ifeq ($(USE_YACC),true)
BISON=yacc -b parser
else
BISON=bison
endif

VPATH+= ${KLIPSSRCDIR}
OSDEP?=$(shell uname -s | tr 'A-Z' 'a-z')

# Original flags
INCLUDES+=-I. -I${KLIPSSRCDIR} -I${KLIPSD} -I${LIBRESWANSRCDIR}
INCLUDES+=-I${LIBRESWANSRCDIR}/include 
# nss
INCLUDES+=${NSSFLAGS}

CFLAGS+=${PORTINCLUDE} ${INCLUDES} ${CROSSFLAGS}

CFLAGS+=-pthread

# XXX: hack until everything uses a consistent .c.o rule
CFLAGS+=$(USERLAND_CFLAGS)

ARFLAGS=crvs
MANS=

.PHONY:	all install clean l t lt tar check checkprograms

SHOULDWERESTART=$(wildcard ${ONEFILE})
ifeq ($(SHOULDWERESTART),${ONEFILE})
all programs man config clean install:
	set -e ; \
	cd ${LIBRESWANSRCDIR} && cd ${OBJDIRTOP}/lib/lib${LIBRARY} && ${MAKE} $@
else
all:	$(LIB) 
programs: $(LIB) 
clean:	cleanall
install: doinstall

endif

doinstall:
	@for d in $(MANDIR); do mkdir -p $$d; done
	@for f in $(MANS) ; \
	do \
		$(INSTALL) $(INSTMANFLAGS) $(MANSRCDIR)/$$f $(MANDIR)/ipsec_$$f || exit 1 ; \
	done
	@$(LIBRESWANSRCDIR)/packaging/utils/manlink $(foreach man, $(MANS), ${MANSRCDIR}/$(man)) | \
	while read from to; \
	do \
		ln -s -f ipsec_$$from $(MANDIR)/$$to; \
	done


install_file_list:
	@for f in $(MANS) ; \
	do \
		echo $(MANDIR)/ipsec_$$f;\
	done;
	@$(LIBRESWANSRCDIR)/packaging/utils/manlink $(foreach man, $(MANS), ${MANSRCDIR}/$(man)) | \
	while read from to; \
	do \
		echo $(MANDIR)/$$to; \
	done

$(LIB): $(OBJS)
	$(AR) $(ARFLAGS) $(LIB) $(OBJS)

$(OBJS):	$(HDRS)

cleanall::
	rm -rf ${OBJS} $(LIB)

MK_DEPEND_FILES = $(OBJS)
MK_DEPEND_CFLAGS = $(CFLAGS)
include $(top_srcdir)/mk/depend.mk
