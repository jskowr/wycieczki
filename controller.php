<?php

global $config;
if ($link[1] && file_exists('modules/' . $link[1] . '.php') && (in_array($link[1], $config['permissions']['show'][$_SESSION['user']['role']])) || $link[1] == 'trips' || $_POST['action'] == 'logout' || $_POST['action'] == 'login') {
    include('modules/' . $link[1] . '.php');
} else {
    include('modules/index.php');
}