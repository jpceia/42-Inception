bash add-user.sh $FTP_USER $FTP_PASSWORD
echo $FTP_USER | tee -a /etc/vsftpd.userlist
unset FTP_USER FTP_PASSWORD

exec "$@"
