<?php

session_start();
define('DEBUG', true);

include('config/database.php');
include('config/config.php');
include('class/class.core.php');
include('libs/mpdf/vendor/autoload.php');

$mpdf = new \Mpdf\Mpdf();

$core = new Core();
$core->dbConnect();

# biblioteka Smarty
include('libs/smarty/Smarty.class.php');

$smarty = new Smarty;

# smarty config
$smarty->force_compile = true;
$smarty->template_dir = "";
$smarty->debugging = false;
$smarty->caching = true;
$smarty->cache_lifetime = 3600;
$smarty->force_compile = true;
$smarty->setTemplateDir("")
    ->setConfigDir('./tmp/config')
    ->setCompileDir('./tmp/templates_c')
    ->setCacheDir('./tmp/cache');

$link = explode("/", $_SERVER['REQUEST_URI']);

$smarty->assign('link', $link);
$smarty->assign('config', $config);

include('controller.php');
$smarty->display('controller.tpl');

unset($_SESSION['msg']);