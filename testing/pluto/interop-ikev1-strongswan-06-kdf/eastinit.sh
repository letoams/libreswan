/testing/guestbin/swan-prep
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add westnet-eastnet-aes_ctr
echo "initdone"
