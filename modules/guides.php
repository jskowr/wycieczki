<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
        }

        break;

    default:
        $guides = $core->getAllGuides();
        $smarty->assign('guides', $guides);

        break;
}