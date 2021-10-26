<?php

require_once ABSPATH wp-admin/includes/upgrade.php

$blog_title = 'le-site'
$user_name = 'polo'
$user_email = 'polo@polo.polo'
$public = ''
$deprecated = ''
$user_password = '0000'
$language = ''

wp_install($blog_title, $user_name, $user_email, $public, $deprecated, $user_password, $language);

?>
