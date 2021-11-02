hostname_search="$(cat /etc/hosts | grep -E '\s*127.0.0.1\s+lzins.42lyon.fr')"
if [ -z "$hostname_search" ]; then
	cat /etc/hosts | sed -r '/(^|\s)lzins\.42lyon\.fr($|\s)/d' > /tmp/hostfile
	echo -e "\n127.0.0.1\tlzins.42lyon.fr" >> /tmp/hostfile
	sudo mv /tmp/hostfile /etc/hosts
fi
