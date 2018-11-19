<?php

    include('config/database.php');
    include('class/class.core.php');

    $core = new Core();
    $core->dbConnect();

    $rawlink = $_GET['link'];
    $link = $core->extractLink($rawlink);

	echo "Wycieczki - projekt ISBD".'<br><br>';

	echo "Test bazy danych, tabela klasy:".'<br><br>';

	$classes = $core -> getAllClasses();

	foreach($classes as $k => $v){
	    echo $v['id'].". ".$v['symbol'].'<br>';
    }