# Only the first two exchange types should be ISAKMP_v2_SA_INIT
grep "exchange type:" /tmp/pluto.log
if [ -f /sbin/ausearch ]; then ausearch -r -m avc -ts recent ; fi
