<?php

global $config;

switch($link[2]) {

    case 'add':
        $cities = $core -> getAllCities();
        $smarty -> assign('cities', $cities);

        if($_POST['action'] == 'add'){
            if($core -> addTrip($_POST['nazwa'], $_POST['data_rozpoczecia'], $_POST['data_zakonczenia'], $_POST['liczba_uczniow'], $_POST['id_miejscowosci'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nowe miejsce.";
                header('Location: ' .$config['url'] . 'trips');
                exit();
            }
        }

        break;

    case 'edit':

        $place = $core->getTripById($link[3]);

        if($_POST['action'] == 'edit'){
            if($core -> updateTrip($link[3], $_POST['nazwa'], $_POST['data_rozpoczecia'], $_POST['data_zakonczenia'], $_POST['liczba_uczniow'], $_POST['id_miejscowosci'])){
                $_SESSION['msg']['m1']['title'] = "Pomyślnie edytowano wycieczkę.";
                header('Location: ' .$config['url'] . 'trips');
                exit();
            }else{
                header('Location: ' .$config['url'] . 'trips/edit/'.$link[3]);
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
                    $_SESSION['msg']['m1']['title'] = "Pomyślnie usunięto wycieczkę.";
                    header('Location: ' . $config['url'] . 'trips');
                    exit();
                }
                else{
                    $_SESSION['msg']['m1']['title'] = "Błąd usuwania wycieczki.";
                    $_SESSION['msg']['m1']['err'] = true;
                    header('Location: ' .$config['url'] . 'trips');
                    exit();
                }
            }
        }

        break;

    case 'assign':

        if($_POST['action'] == 'assign'){
            $assign_guides = $_POST['assign_guides'];

            $core -> unassignGuidesFromTrips($link[3]);

            foreach($assign_guides as $k => $v) {
                $core->assignGuideToTrip($v, $link[3]);
            }

            $_SESSION['msg']['m1']['title'] = "Pomyślnie przypisano wycieczkę do przewodników.";
            header('Location: ' . $config['url'] . 'trips/assign/'.$link[3]);
            exit();
        }

        $checks = $core -> checkGuideAssignedToTrip($link[3]);
        $check = array();
        foreach($checks as $k => $v){
            array_push($check, $v['id_przewodnika']);
        }

        $smarty -> assign('check_guides', $check);

        $trip = $core -> getTripById($link[3]);
        $smarty -> assign('trip', $trip);

        $guides = $core -> getAllGuides();
        $smarty -> assign('guides', $guides);

        break;

    default:
        $trips = $core->getAllTrips();
        $smarty->assign('trips', $trips);

        break;
}