/testing/guestbin/swan-prep --x509 --x509name key2032
fipscheck
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add westnet-eastnet-ikev2
echo "initdone"
