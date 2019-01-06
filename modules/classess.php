<?php

if(!$_SESSION['user']) die('Nie jesteś zalogowany.');
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

    case 'assign':

        if($_POST['action'] == 'assign'){
            $assigns = $_POST['assign'];
            $assign_protectors = $_POST['assign_protectors'];

            $core -> unassignClassFromTrips($link[3]);
            foreach($assigns as $k => $v) {
                $core->assignClassToTrip($link[3], $v);
                }

            $core -> unassignClassFromProtector($link[3]);
            foreach($assign_protectors as $k => $v) {
                $core->assignClassToProtector($link[3], $v);
            }
            $_SESSION['msg']['m1']['title'] = "Pomyślnie przypisano klasy do wycieczek oraz opiekunów.";
            header('Location: ' . $config['url'] . 'classess/assign/'.$link[3]);
            exit();
        }

        $checks = $core -> checkClassAssignedToTrip($link[3]);
        $check = array();
        foreach($checks as $k => $v){
            array_push($check, $v['id_wycieczki']);
        }

        $checks_p = $core -> checkClassAssignedToProtector($link[3]);
        $check_p = array();
        foreach($checks_p as $k => $v){
            array_push($check_p, $v['id_opiekuna']);
        }
        $smarty -> assign('check_protectors', $check_p);

        $smarty -> assign('check', $check);

        $class = $core -> getClassById($link[3]);
        $smarty -> assign('class', $class);

        $trips = $core -> getAllTrips();
        $smarty -> assign('trips', $trips);

        $protectors = $core -> getAllProtectors();
        $smarty -> assign('protectors', $protectors);



        break;

    default:
            $classes = $core->getAllClasses();
            $smarty->assign('classess', $classes);

            break;
}