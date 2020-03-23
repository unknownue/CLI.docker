
dd if=/dev/zero of=/tmpswap bs=64M count=16
mkswap /tmpswap
chmod 0600 /tmpswap 
swapon /tmpswap

