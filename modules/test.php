<?php

echo "Test bazy danych, tabela klasy:" . '<br><br>';

$classes = $core->getAllClasses();

foreach ($classes as $k => $v) {
    echo $v['id'] . ". " . $v['symbol'] . '<br>';
}