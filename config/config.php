<?php

    $config['url'] = 'http://wycieczki.pl/';

    $config['kierownik']['login'] = 'kierownik';
    $config['kierownik']['password'] = 'kierownik123';

    $config['wychowawca']['login'] = 'wychowawca';
    $config['wychowawca']['password'] = 'wychowawca123';

    $config['roles'][1] = 'wychowawca';
    $config['roles'][2] = 'kierownik';

    $config['permissions']['show']['wychowawca'] = array('classess', 'places', 'cities', 'protectors', 'guides', 'trips');
    $config['permissions']['edit']['wychowawca'] = array('classess');
    $config['permissions']['show']['kierownik'] = array('places', 'classess', 'cities', 'protectors', 'guides', 'trips');
    $config['permissions']['edit']['kierownik'] = array('places', 'cities', 'protectors', 'guides', 'trips');

?>
