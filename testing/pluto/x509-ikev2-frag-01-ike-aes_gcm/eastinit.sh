/testing/guestbin/swan-prep --x509
iptables -I INPUT -p udp -m length --length 0x5dc:0xffff -j DROP
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add x509
echo "initdone"
