hostname | grep east > /dev/null && grep -E "no Certificate Authority in NSS Certificate DB|authentication using rsasig failed" /tmp/pluto.log
if [ -f /sbin/ausearch ]; then ausearch -r -m avc -ts recent ; fi
