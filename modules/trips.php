<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
        }

        break;

    default:
        $trips = $core->getAllTrips();
        $smarty->assign('trips', $trips);

        break;
}