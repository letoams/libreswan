/testing/guestbin/swan-prep
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add westnet-eastnet-aes128
ipsec auto --status
echo "initdone"
