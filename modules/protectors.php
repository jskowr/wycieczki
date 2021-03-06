<?php

global $config;

switch($link[2]) {

    case 'add':
        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if($_POST['action'] == 'add'){
            if($core -> addProtector($_POST['nazwisko'], $_POST['imie'], $_POST['adres'], $_POST['kod_pocztowy'],$_POST['pesel'],$_POST['telefon'],$_POST['email'], $_POST['id_miejscowosci'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nowego opiekuna.";
                header('Location: ' .$config['url'] . 'protectors');
                exit();
            }
        }

        break;

    case 'edit':

        $protector = $core->getProtectorById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updateProtector($link[3], $_POST['nazwisko'], $_POST['imie'], $_POST['adres'], $_POST['kod_pocztowy'],$_POST['pesel'],$_POST['telefon'],$_POST['email'], $_POST['id_miejscowosci'])) {
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano dane opiekuna.";
                header('Location: ' .$config['url'] . 'protectors');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'protectors/edit/'.$link[3]);
                exit();
            }
        }

        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if (!$_POST['edit']) {
            foreach ($protector as $k => $v) {
                $_POST[$k] = $v;
            }
        }

        break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                if($core -> deleteProtector($link[3])) {
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto opiekuna.";
                    header('Location: ' . $config['url'] . 'protectors');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania opiekuna.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'protectors');
                    exit();
                }
            }
        }

        break;

    default:
        $protectors = $core->getAllProtectors();
        $smarty->assign('protectors', $protectors);

        break;
}