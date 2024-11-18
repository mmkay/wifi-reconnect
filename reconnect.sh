#!/bin/bash

URL="http://www.google.com"

# try to fetch the url
for i in {1..3}; do
	curl -s --head "$URL" > /dev/null
	if [ $? -eq 0 ]; then
		exit 0
	fi
	sleep 5
done

# replace with your interface, you can find it using nmcli
# for it to work in crontab, you also need to add the following line in visudo:
# YOUR_USERNAME ALL=(ALL) NOPASSWD: /usr/bin/nmcli
sudo nmcli d disconnect wlxd84489b64550
sleep 2
sudo nmcli d connect wlxd84489b64550
