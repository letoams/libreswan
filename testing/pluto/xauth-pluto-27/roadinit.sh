/testing/guestbin/swan-prep
ipsec start
../../guestbin/wait-until-pluto-started
../../guestbin/block-non-ipsec.sh
ipsec auto --add road-east
ipsec whack --impair suppress-retransmits
echo initdone
