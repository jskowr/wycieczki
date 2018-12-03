<?php

global $config;

switch($link[2]) {

    case 'add':
        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if($_POST['action'] == 'add'){
            if($core -> addPlace($_POST['name'], $_POST['address'], $_POST['city'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nowe miejsce.";
                header('Location: ' .$config['url'] . 'places');
                exit();
            }
        }

        break;

    case 'edit':

        $place = $core->getPlaceById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updatePlace($link[3], $_POST['nazwa'], $_POST['adres'], $_POST['id_miejscowosci'])){
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano miejsce.";
                header('Location: ' .$config['url'] . 'places');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'places/edit/'.$link[3]);
                exit();
            }
        }

        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if (!$_POST['edit']) {
            foreach ($place as $k => $v) {
                $_POST[$k] = $v;
            }
        }

        break;

    case 'del':
        if($_POST['action'] == 'del'){
            if($_POST['confirm']){
                if($core -> deletePlace($link[3])) {
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto miejsce.";
                    header('Location: ' . $config['url'] . 'places');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania miejsca.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'places');
                    exit();
                }
            }
        }

        break;

    default:

        $places = $core->getAllPlaces($_POST['sort']);
        $smarty->assign('places', $places);

        break;
}