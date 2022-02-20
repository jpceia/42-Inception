<?php

// https://wordpress.org/support/topic/wp-behind-reverse-proxy-all-content-insecure/
if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https')
	$_SERVER['HTTPS'] = 'on';

// REDIS setup
define ('WP_REDIS_HOST', 'redis' );
define ('WP_CACHE_KEY_SALT', 'UjQyy1x2Z2Dg' );
define ('WP_CACHE', true);

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', '$MYSQL_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'd76744c8a56da643f8dea02cbc4f1e0d' );
define( 'SECURE_AUTH_KEY',  '0f0f81728d1f9c45fcf10673c415fc22' );
define( 'LOGGED_IN_KEY',    'adc1dfe1467e813c1be05db942152606' );
define( 'NONCE_KEY',        '051fd993415b7e1d94b11b2a7edefb00' );
define( 'AUTH_SALT',        'da83a5b57857f34d2915da45a641a797' );
define( 'SECURE_AUTH_SALT', 'c9777be83db29faf3c2d098237509ede' );
define( 'LOGGED_IN_SALT',   'fae738531bda10a010b83944fac2c18a' );
define( 'NONCE_SALT',       'f3f3240b4aa5fc7f7767a37cbb2c192b' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
