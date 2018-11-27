<?php

global $config;

switch($link[2]) {

    case 'add':
            if($_POST['action'] == 'add'){
                if($core -> addClass($_POST['symbol'])) {
                    $_SESSION['msg']['m1']['title'] = "Dodano nową klasę.";
                    header('Location: ' .$config['url'] . 'classess');
                    exit();
                }
            }

            break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                $core -> deleteClass($link[3]);
                header('Location: ' .$config['url'] . 'classess');
                exit();
            }
        }

        break;

    default:
            $classes = $core->getAllClasses();
            $smarty->assign('classess', $classes);

            break;
}