ipsec whack --name road-eastnet-forceencaps --initiate
../../guestbin/ping-once.sh --up 192.0.2.254
ipsec whack --trafficstatus
echo done
