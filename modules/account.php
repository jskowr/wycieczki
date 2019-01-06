<?php

session_start();
global $config;

if($_POST['action'] == 'login'){

    $role = $_POST['role'];
    $login = $_POST['login'];
    $haslo = $_POST['haslo'];

    switch($role){
        case 'wychowawca':
            if($config['wychowawca']['login'] == $login && $config['wychowawca']['password'] = $haslo) {
                $_SESSION['user']['login'] = $login;
                $_SESSION['user']['role'] = $role;
                $_SESSION['msg']['m1']['title'] = 'Zalogowałeś się prawidłowo.';
                header("Location: ".$config['url'].'account');
                exit();
            } else{
                $_SESSION['msg']['m1']['title'] = "Błąd logowania.";
                $_SESSION['msg']['m1']['err'] = true;
                header("Location: ".$config['url'].'account');
                exit();
            }
            break;
        case 'kierownik':
            if($config['kierownik']['login'] == $login && $config['kierownik']['password'] = $haslo) {
                $_SESSION['user']['login'] = $login;
                $_SESSION['user']['role'] = $role;
                $_SESSION['msg']['m1']['title'] = 'Zalogowałeś się prawidłowo.';
                header("Location: ".$config['url'].'account');
                exit();
            } else{
                $_SESSION['msg']['m1']['title'] = "Błąd logowania.";
                $_SESSION['msg']['m1']['err'] = true;
                header("Location: ".$config['url'].'account');
                exit();
            }
            break;
        default:
            $_SESSION['msg']['m1']['title'] = "Błąd logowania.";
            $_SESSION['msg']['m1']['err'] = true;
            header("Location: ".$config['url'].'account');
            exit();
            break;
    }

} elseif($_POST['action'] == 'logout'){
    unset($_SESSION['user']);
    $_SESSION['msg']['m1']['title'] = 'Wylogowałeś się.';
    header("Location: ".$config['url'].'account');
    exit();
}