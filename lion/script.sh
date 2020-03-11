if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root!"
	exit 1
fi

apt-get install openssh-server -y

# Define the new port number.
PORT_NUMBER="9001"

cp /etc/ssh/sshd_config /etc/ssh/sshd_config_BACKUP

sed -i "s/^Port .*/Port $PORT_NUMBER/g" /etc/ssh/sshd_config

echo "New SSH Port number: $PORT_NUMBER"

/etc/init.d/ssh restart
