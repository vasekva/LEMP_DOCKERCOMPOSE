<?php

define( 'DB_NAME', getenv('DATABASE'));
define( 'DB_USER', getenv('DB_USER'));
define( 'DB_PASSWORD', getenv('DB_PASSWORD'));
define( 'DB_HOST', getenv('DB_HOST'));
define( 'DB_CHARSET', 'utf8');
define( 'DB_COLLATE', '');

#redis_cache

define( 'WP_REDIS_HOST', 'redis_cache' );
define( 'WP_REDIS_PORT', 6379 );

define( 'FS_METHOD', 'direct' );
// define( 'WP_REDIS_HOST', 'redis_cache');
// define( 'WP_REDIS_PORT', 6379 );
// define( 'WP_REDIS_CLIENT', 'redis_cache' );
define( 'WP_CACHE_KEY_SALT', getenv('WP_URL'));
define( 'WP_CACHE', true);

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '0121b2b0fdd543febe16df5321a6ed515e99c025');
define('SECURE_AUTH_KEY',  '761d80a2c29679c0022002e64e3493f51b1a1d70');
define('LOGGED_IN_KEY',    '744f2076c6aa1c41499ace2acbaf25859948e672');
define('NONCE_KEY',        'f6376137823fc6fe879e5c99b3c62fed4704a71f');
define('AUTH_SALT',        '956ea1e50f540c75438ad25575d0cd82ff580275');
define('SECURE_AUTH_SALT', '6c5a28d99659928535681f784f175f6706c13d31');
define('LOGGED_IN_SALT',   '43c402fe7eb08bb2cd79339d94bee8fcd9da6326');
define('NONCE_SALT',       'babb7b01526b80c0d47002f26aea6a00ed30014a');

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
// Enable Debug logging to the /wp-content/debug.log file
define( 'WP_DEBUG_LOG', true );

// Disable display of errors and warnings
define( 'WP_DEBUG_DISPLAY', false );
@ini_set( 'display_errors', 0 );
/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';