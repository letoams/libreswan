/testing/guestbin/swan-prep
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --status |grep westnet-eastnet-ipv4-psk-ikev2
echo "initdone"
