SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOMAIN_NAME="$(cat "$SCRIPT_DIR"/.env | grep 'DOMAIN_NAME=' | head -n 1 | cut -d= -f2)"
DOMAIN_NAME_ESCAPED="$(echo $DOMAIN_NAME | sed 's/\./\\./g')"
hostname_search="$(cat /etc/hosts | grep -E '\s*127\.0\.0\.1\s+'""$DOMAIN_NAME_ESCAPED""'(\$|\s)')"
if [ -z "$hostname_search" ]; then
	cat /etc/hosts | sed -r '/(^|\s)'"$DOMAIN_NAME_ESCAPED"'($|\s)/d' > /tmp/hostfile
	echo -e "127.0.0.1\t$DOMAIN_NAME" >> /tmp/hostfile
	sudo mv /tmp/hostfile /etc/hosts
fi
