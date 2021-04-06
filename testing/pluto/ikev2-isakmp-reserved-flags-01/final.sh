../../guestbin/ipsec-look.sh
# Should be 2 hits for both west (sending) and east (receiving)
grep ISAKMP_FLAG_MSG_RESERVED_BIT6 /tmp/pluto.log >/dev/null && echo payload found
if [ -f /sbin/ausearch ]; then ausearch -r -m avc -ts recent ; fi
