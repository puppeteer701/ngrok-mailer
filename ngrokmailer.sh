
#!/bin/sh
# Made By Developer From Jokela 2018
#
# Remember to setup sSMTP for first time by editing file 'sudo nano /etc/ssmtp/ssmtp.conf' manually, or script does it for you.
# Script Depends on: sSMTP, ngrok, unzip and wget
# Run Script as root (using sudo if not loged in as root), if ssmtp command is not found, and if you enable for dependencies checkfordependencies

forwarding_port="1234" # Port to forward
forwarding_connectiontype="http" # Forwarding type http or tcp (See more in ngrok documentation)
email_addr="send_to_username@gmail.com" #Email address for sending Ngrok address in case server or device rebooted
email_from="Dummy" #Email address for sending Ngrok address in case server or device rebooted

# kill previous ngrok service
(! pidof ngrok) || kill -9 $(pidof ngrok)
sleep 5

# start ngrok service
./ngrok $forwarding_connectiontype -bind-tls=true -log=stdout $forwarding_port > ngrok.log &
sleep 5

ngrok_url=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')

rm -f msg.txt
cat > msg.txt <<EOF
To: $email_addr
From: $email_from
Subject: Ngrok Mailer got url!

Hello! Here is your server's URL from Ngrok
https://$ngrok_url
Cheers
EOF
msmtp $email_addr < msg.txt