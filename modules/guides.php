<?php

global $config;

switch($link[2]) {

    case 'add':
        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if($_POST['action'] == 'add'){
            if($core -> addGuide($_POST['nazwisko'], $_POST['imie'], $_POST['adres'], $_POST['kod_pocztowy'],$_POST['pesel'],$_POST['telefon'],$_POST['email'], $_POST['id_miejscowosci'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nowego przewodnika.";
                header('Location: ' .$config['url'] . 'guides');
                exit();
            }
        }

        break;

    case 'edit':

        $guide = $core->getGuideById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updateGuide($link[3], $_POST['nazwisko'], $_POST['imie'], $_POST['adres'], $_POST['kod_pocztowy'],$_POST['pesel'],$_POST['telefon'],$_POST['email'], $_POST['id_miejscowosci'])) {
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano dane przewodnika.";
                header('Location: ' .$config['url'] . 'guides');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'guides/edit/'.$link[3]);
                exit();
            }
        }

        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if (!$_POST['edit']) {
            foreach ($guide as $k => $v) {
                $_POST[$k] = $v;
            }
        }

        break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                if($core -> deleteGuide($link[3])) {
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto przewodnika.";
                    header('Location: ' . $config['url'] . 'guides');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania przewodnika.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'guides');
                    exit();
                }
            }
        }

        break;

    default:
        $guides = $core->getAllGuides();
        $smarty->assign('guides', $guides);

        break;
}