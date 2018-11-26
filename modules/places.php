<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
            $core -> addClass($_POST['symbol']);
        }

        break;

    default:
        $places = $core->getAllPlaces();
        $smarty->assign('places', $places);

        break;
}