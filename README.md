## ngrok
1. Download ngrok
2. Extract
3. Move `ngrok` binary in mailer folder

## Mail
### Install
```
sudo apt install msmtp msmtp-mta ca-certificates
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
password       1234

# Default
account default : gmail
```

### Enable less secure apps on gmail
https://myaccount.google.com/lesssecureapps and check the toggle