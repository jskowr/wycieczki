<?php

global $config;

switch($link[2]) {

    case 'add':

        if($_POST['action'] == 'add'){
            if($core -> addCity($_POST['nazwa'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nowe miasto.";
                header('Location: ' .$config['url'] . 'cities');
                exit();
            }
        }
        break;

    case 'edit':

        $city = $core->getCityById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updateCity($link[3], $_POST['nazwa'])){
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano miasto.";
                header('Location: ' .$config['url'] . 'cities');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'cities/edit/'.$link[3]);
                exit();
            }
        }

        if (!$_POST['edit']) {
            foreach ($city as $k => $v) {
                $_POST[$k] = $v;
            }
        }

        break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                if($core -> deleteCity($link[3])) {
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto miasto.";
                    header('Location: ' . $config['url'] . 'cities');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania miasta.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'cities');
                    exit();
                }
            }
        }

        break;

    default:
        $cities = $core->getAllCities();
        $smarty->assign('cities', $cities);

        break;
}