/testing/guestbin/swan-prep --x509
ipsec start
../../guestbin/wait-until-pluto-started
ipsec auto --add nss-cert
ipsec auto --status |grep nss-cert
ipsec whack --impair suppress-retransmits
echo "initdone"
