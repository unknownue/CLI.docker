
Run socat as a deamean task for docker GUI application

See also https://medium.com/@fahimhossain_16989/adding-startup-scripts-to-launch-daemon-on-mac-os-x-sierra-10-12-6-7e0318c74de1

```shell
$ chmod +x socat.sh
# Config the path of socat.sh in com.startup.docker-socat.plist
$ vim com.startup.docker-socat.plist
$ cp com.startup.docker-socat.plist /Library/LaunchDaemons/com.startup.docker-socat.plist
$ sudo chown root /Library/LaunchDaemons/com.startup.docker-socat.plist
$ sudo chgrp whell /Library/LaunchDaemons/com.startup.docker-socat.plis
# add the property list file onto the launchctl
$ sudo launchctl load -w /Library/LaunchDaemons/com.startup.docker-socat.plist
```

Notes:
```shell
# Start the daemons programs
$ sudo launchctl start /Library/LaunchDaemons/com.startup.docker-socat.plist
# Stop the daemons programs
$ sudo launchctl stop /Library/LaunchDaemons/com.startup.docker-socat.plist

# Remove the daemons programs
$ sudo launchctl unload -w /Library/LaunchDaemons/com.startup.docker-socat.plist
$ rm /Library/LaunchDaemons/com.startup.docker-socat.plist
```
