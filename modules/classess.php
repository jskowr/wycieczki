<?php

switch($link[2]) {

    case 'add':
            if($_POST['action'] == 'add'){
                $core -> addClass($_POST['symbol']);
            }

            break;

    default:
            $classes = $core->getAllClasses();
            $smarty->assign('classess', $classes);

            break;
}