#!/bin/sh
ip -4 route
ipsec auto --up road-east-x509-ipv4
../../guestbin/ping-once.sh --up 192.0.2.254
ipsec whack --trafficstatus
ip -4 route
echo done
