grep -v -P "\t0$" /proc/net/xfrm_stat
ipsec whack --shutdown
# there should be no vti0 device left
ip addr show vti0
if [ -f /sbin/ausearch ]; then ausearch -r -m avc -ts recent ; fi
