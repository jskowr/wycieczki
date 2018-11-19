<?php

if ($link[1] && file_exists('modules/' . $link[1] . '.php')) {
    include('modules/' . $link[1] . '.php');
} else {
    include('modules/index.php');
}