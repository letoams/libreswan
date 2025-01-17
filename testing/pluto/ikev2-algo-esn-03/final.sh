# replay-window will show up as 0 when ESN is enabled due to kernel bug.
ip xfrm state |grep replay-window
grep "enabling ESN" /tmp/pluto.log
: ==== cut ====
ipsec auto --status
ipsec look # ../guestbin/ipsec-look.sh
: ==== tuc ====
if [ -f /sbin/ausearch ]; then ausearch -r -m avc -ts recent ; fi
