/testing/guestbin/swan-prep --46
# confirm that the network is alive
ping6 -n -c 4 -I 2001:db8:1:2::45 2001:db8:1:2::23
# ensure that clear text does not get through
ip6tables -A INPUT -i eth0 -s 2001:db8:1:2::23 -p ipv6-icmp --icmpv6-type echo-reply -j DROP
ip6tables -I INPUT -m policy --dir in --pol ipsec -j ACCEPT
# confirm clear text does not get through
ping6 -n -c 4 -I 2001:db8:1:2::45 2001:db8:1:2::23
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add v6-transport
ipsec auto --status
echo "initdone"
