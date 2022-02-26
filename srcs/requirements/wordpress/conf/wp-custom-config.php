// https://wordpress.org/support/topic/wp-behind-reverse-proxy-all-content-insecure/
if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https')
	$_SERVER['HTTPS'] = 'on';
