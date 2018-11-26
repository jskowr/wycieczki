<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
            $core -> addCity($_POST['nazwa']);
        }

        break;

    default:
        $cities = $core->getAllCities();
        $smarty->assign('cities', $cities);

        break;
}