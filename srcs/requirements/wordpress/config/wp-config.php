<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$WORDPRESS_DATABASE' );

/** MySQL database username */
define( 'DB_USER', '$MYSQL_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );

/** MySQL hostname */
define( 'DB_HOST', 'db:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

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
define('AUTH_KEY',         '9nvV^2227v</B.-H~|F%(}G<4$Z[eGj!G4R$OKBrp]umji^[pbE:$;`p,Afpbgyv');
define('SECURE_AUTH_KEY',  '&;!_#ai%B{ME#xD( =u$9)|i=NwzY]S=BT?_TlB:JaJ|4sRMYo~P{Mw@?)%2PeWz');
define('LOGGED_IN_KEY',    '+1iv`PgX/BN DEp-|&>Y*)A9-D&?Js(zg!<SI*y)d@={;M3?EcNBS`MQI>L}-N>)');
define('NONCE_KEY',        '80L&DJmYj5%=Sm+Y(SSZ%}cDS$mwe1<1dCc1Y `LUS.xEzS/1<H{E,GH^Bs&+PTf');
define('AUTH_SALT',        '/]2v|UBg#u&wdDs/0f7+-r:E/2[[I{XZDgb6C|u!xZ;+E2o$eA`(eG1gtwU*N3W]');
define('SECURE_AUTH_SALT', 'WpqkZ1%uruAY%V9L,:-/qm+7kziIYWVI,bZDnrm*jel[/5HO(t=>r-(B/Q|9km/3');
define('LOGGED_IN_SALT',   '&:EW0XUt=kC(;84p[b>!n5+;-u1/V96Qc5oOs+x7_QBa@@X`VQI)cYj O1kS(c D');
define('NONCE_SALT',       '<~z}+3B<d,PuHi,J|Y}_~$%gLg1sY;bc2M-O31+7qS-w=IG>Q-;W?xU4E5-B5+da');

/**#@-*/

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
