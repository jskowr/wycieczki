<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
            if($core -> addClass($_POST['nazwisko'], $_POST['imie'], $_POST['adres'], $_POST['kod_pocztowy'],$_POST['pesel'],$_POST['telefon'],$_POST['email'])) {
                $_SESSION['msg']['m1']['title'] = "Dodano nową klasę.";
                header('Location: ' .$config['url'] . 'classess');
                exit();
            }
        }

        break;

    default:
        $protectors = $core->getAllProtectors();
        $smarty->assign('protectors', $protectors);

        break;
}