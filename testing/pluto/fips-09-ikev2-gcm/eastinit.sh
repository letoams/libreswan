/testing/guestbin/swan-prep --fips
fipscheck
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add westnet-eastnet-ikev2
echo "initdone"
