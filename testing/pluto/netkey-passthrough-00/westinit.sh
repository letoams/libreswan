/testing/guestbin/swan-prep
# confirm that the network is alive
## ping -n -c 4 -I 192.1.2.45 192.1.2.23
# ensure that clear text does not get through
## iptables -A INPUT -i eth0 -s 192.1.2.23/32 -p icmp -j DROP
## iptables -I INPUT -m policy --dir in --pol ipsec -j ACCEPT
# confirm clear text does not get through
## ping -n -c 4 -I 192.1.2.45 192.1.2.23
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add west-east
ipsec auto --add west-east-passthrough
ipsec auto --route west-east-passthrough
ipsec whack --impair suppress-retransmits
echo "initdone"
