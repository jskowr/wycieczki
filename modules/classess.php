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
                elseif(!$_SESSION['msg']['m1']['err']){
                    $_SESSION['msg']['m1']['title'] = "Błąd dodawania klasy.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'classess');
                    exit();
                } else{
                    header('Location: ' .$config['url'] . 'classess/add');
                    exit();
                }
            }

            break;

    case 'edit':

        $class = $core->getClassById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updateClass($link[3], $_POST['symbol'])){
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano klasę.";
                header('Location: ' .$config['url'] . 'classess');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'classess/edit/'.$link[3]);
                exit();
            }
        }

        if (!$_POST['edit']) {
            foreach ($class as $k => $v) {
                $_POST[$k] = $v;
            }
        }

        break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                if($core -> deleteClass($link[3])) {
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto klasę.";
                    header('Location: ' . $config['url'] . 'classess');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania klasy.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'classess');
                    exit();
                }
            }
        }

        break;

    default:
            $classes = $core->getAllClasses();
            $smarty->assign('classess', $classes);

            break;
}