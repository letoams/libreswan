/testing/guestbin/swan-prep --x509
certutil  -d sql:/etc/ipsec.d -D -n mainca
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add westnet-eastnet-x509-nosend
ipsec auto --status | grep westnet-eastnet-x509-nosend
echo "initdone"
