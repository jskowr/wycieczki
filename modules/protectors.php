<?php

switch($link[2]) {

    case 'add':
        if($_POST['action'] == 'add'){
        }

        break;

    default:
        $protectors = $core->getAllProtectors();
        $smarty->assign('protectors', $protectors);

        break;
}