## ngrok
1. Download ngrok
2. Extract
3. Move `ngrok` binary in mailer folder

## Mail
### Install
```
sudo apt install msmtp msmtp-mta ca-certificates
```

### Enable less secure apps on gmail - Possibly not needed
https://myaccount.google.com/lesssecureapps and check the toggle

### Enable 2FA and create an App Password
```
Google Account/2Fa
Google Account/Security/App Password
```
### Setup msmtp config
```
sudo vim /etc/msmtprc
```

Content
```
# Generics
defaults
auth           on
tls            on
# following is different from ssmtp:
tls_trust_file /etc/ssl/certs/ca-certificates.crt
# user specific log location, otherwise use /var/log/msmtp.log, however,
# this will create an access violation if you are user pi, and have not changes the access rights
logfile        ~/.msmtp.log

# Gmail specifics
account        gmail
host           smtp.gmail.com
port           587

from           dummy
user           username@gmail.com
password       App Password

# Default
account default : gmail
```

## Local Videos
```
/var/lib/motioneye/Camera1/
```

## Ngrok mailer
```
/home/pi/mailer
```

## Crontab
```
crontab -e
```

```
@reboot sleep 30 && /home/pi/mailer/ngrokmailer.sh
@weekly /home/pi/mailer/ngrokmailer.sh
```