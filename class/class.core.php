<?php

class Core
{

    #config functions

    function dbConnect()
    {
        try {
            $this->db = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->db->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
            $this->db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, true);
            $this->db->query("SET NAMES utf8");
        } catch (PDOException $e) {
            DEBUG ? die('DATABASE CONNECTION ERROR: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function dbDisconnect()
    {
        unset($this->db);
    }

    #core functions

    function extractLink($link)
    {
        if (is_string($link) && $link) {
            $link = explode('/', $link);
            foreach ($link as $k => $v) {
                $link[$k] = $this->check($v, 'plain');
            }
                return $link;
        } else {
            return false;
        }
    }

    #db functions

    ###############
    ########
    ###############

    #class

    function getAllClasses()
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`klasy`
				ORDER BY `symbol` ASC	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function getClassById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`klasy`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addClass($symbol){

        try {
            $sql = "
				INSERT INTO 
					`klasy`
				SET    
				`symbol` = :symbol                              
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':symbol', $symbol, PDO::PARAM_STR);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podany symbol klasy już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }

    }

    function updateClass($id, $symbol)
    {
        try {
            $sql = "
				UPDATE
					`klasy`
				SET 
                    `symbol` = :symbol
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':symbol', $symbol, PDO::PARAM_STR);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podany symbol klasy już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function deleteClass($id)
    {
        try {
            $sql = "
				DELETE FROM 
					`klasy`
				WHERE
					`id` = :id
				LIMIT 1;
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    function assignClassToTrip($class, $trip){
        try {
            $sql = "
				INSERT INTO 
					`klasy_wycieczki`
				SET    
				`id_klasy` = :class,                              
				`id_wycieczki` = :trip                              
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':class', $class, PDO::PARAM_INT);
            $stmt->bindValue(':trip', $trip, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podany symbol klasy już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function assignGuideToTrip($guide, $trip){
        try {
            $sql = "
				INSERT INTO 
					`przewodnicy_wycieczek`
				SET    
				`id_przewodnika` = :guide,                              
				`id_wycieczki` = :trip                              
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':guide', $guide, PDO::PARAM_INT);
            $stmt->bindValue(':trip', $trip, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podany symbol klasy już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function assignClassToProtector($class, $protector){
        try {
            $sql = "
				INSERT INTO 
					`opiekunowie_klas`
				SET    
				`id_klasy` = :class,                              
				`id_opiekuna` = :protector                              
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':class', $class, PDO::PARAM_INT);
            $stmt->bindValue(':protector', $protector, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podany symbol klasy już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function unassignClassFromTrips($id){
            try {
                $sql = "
				DELETE FROM 
					`klasy_wycieczki`
				WHERE
					`id_klasy` = :id
				";
                $stmt = $this->db->prepare($sql);
                $stmt->bindValue(':id', $id, PDO::PARAM_INT);
                $stmt->execute();
                $stmt->closeCursor();
                unset($stmt);
                return true;
            } catch (PDOException $e) {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
    }

    function unassignGuidesFromTrips($id){
        try {
            $sql = "
				DELETE FROM 
					`przewodnicy_wycieczek`
				WHERE
					`id_wycieczki` = :id
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    function unassignClassFromProtector($id){
        try {
            $sql = "
				DELETE FROM 
					`opiekunowie_klas`
				WHERE
					`id_klasy` = :id
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    function checkClassAssignedToTrip($class){
        try {

            $sql = "
				SELECT
					*
				FROM
					`klasy_wycieczki`
				WHERE `id_klasy` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $class, PDO::PARAM_INT);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function checkGuideAssignedToTrip($trip){
        try {

            $sql = "
				SELECT
					*
				FROM
					`przewodnicy_wycieczek`
				WHERE `id_wycieczki` = :trip	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':trip', $trip, PDO::PARAM_INT);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }


    function checkClassAssignedToProtector($class){
        try {

            $sql = "
				SELECT
					*
				FROM
					`opiekunowie_klas`
				WHERE `id_klasy` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $class, PDO::PARAM_INT);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    #place

    function getAllPlaces($sort = null)
    {
        $cond = "";

        if($sort){
            switch($sort){
                case 2:
                    $cond = " ORDER BY miejsca.nazwa";
                    break;
                case 3:
                    $cond = " ORDER BY miejsca.adres";
                    break;
                case 4:
                    $cond = " ORDER BY `miejscowosc`";
                    break;
                default:
                    $cond = " ORDER BY `miejsca.id`";
                    break;
            }
        }

        try {

            $sql = "
            SELECT 
                miejsca.id, miejsca.nazwa, miejsca.adres, miejscowosci.nazwa AS miejscowosc
            FROM miejsca LEFT JOIN miejscowosci ON miejsca.id_miejscowosci= miejscowosci.id
            $cond
            ;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function getPlaceById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`miejsca`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addPlace($nazwa, $adres, $id_miejscowosci){

        try {
            $sql = "
				INSERT INTO 
					`miejsca`
				SET    
				  `nazwa` = :nazwa,
					`adres` = :adres,
					`id_miejscowosci` = :id_miejscowosci                           
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwa', $nazwa, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa miasta już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }

    }

    function updatePlace($id, $name, $address, $city)
    {
        try {
            $sql = "
				UPDATE
					`miejsca`
				SET 
                    `nazwa` = :name,
                    `adres` = :address,
                    `id_miejscowosci` = :city
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':name', $name, PDO::PARAM_STR);
            $stmt->bindValue(':address', $address, PDO::PARAM_STR);
            $stmt->bindValue(':city', $city, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa miejsca już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function deletePlace($id)
    {
        try {
            $sql = "
				DELETE FROM 
					`miejsca`
				WHERE
					`id` = :id
				LIMIT 1;
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    #city

    function getAllCities()
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`miejscowosci`
					ORDER BY `nazwa` ASC	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addCity($nazwa){

        try {
            $sql = "
				INSERT INTO 
					`miejscowosci`
				SET    
				`nazwa` = :nazwa                              
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwa', $nazwa, PDO::PARAM_STR);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa miasta już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }

    }

    function updateCity($id, $nazwa)
    {
        try {
            $sql = "
				UPDATE
					`miejscowosci`
				SET 
                    `nazwa` = :nazwa
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':nazwa', $nazwa, PDO::PARAM_STR);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa miasta już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    function getCityById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`miejscowosci`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function deleteCity($id)
    {
        try {
            $sql = "
				DELETE FROM 
					`miejscowosci`
				WHERE
					`id` = :id
				LIMIT 1;
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    #wycieczki

    function getAllTrips()
    {

        try {

            $sql = "
            SELECT
            wycieczki.id, wycieczki.nazwa, wycieczki.data_rozpoczecia, wycieczki.data_zakonczenia, wycieczki.data_zakonczenia,
            wycieczki.liczba_uczniow, miejscowosci.nazwa AS miejscowosc
            FROM wycieczki LEFT JOIN miejscowosci ON wycieczki.id_miejscowosci = miejscowosci.id;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function getTripById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`wycieczki`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addTrip($nazwa, $data_rozpoczecia, $data_zakonczenia, $liczba_uczniow, $id_miejscowosci){

        try {
            $sql = "
				INSERT INTO 
					`wycieczki`
				SET    
				    `nazwa` = :nazwa,
					`data_rozpoczecia` = :data_rozpoczecia,
					`data_zakonczenia` = :data_zakonczenia,
					`liczba_uczniow` = :liczba_uczniow,
					`id_miejscowosci` = :id_miejscowosci                           
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwa', $nazwa, PDO::PARAM_STR);
            $stmt->bindValue(':data_rozpoczecia', $data_rozpoczecia, PDO::PARAM_STR);
            $stmt->bindValue(':data_zakonczenia', $data_zakonczenia, PDO::PARAM_STR);
            $stmt->bindValue(':liczba_uczniow', $liczba_uczniow, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa wycieczki już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }

    }

    function updateTrip($id, $nazwa, $data_rozpoczecia, $data_zakonczenia, $liczba_uczniow, $id_miejscowosci)
    {
        try {
            $sql = "
				UPDATE
					`wycieczki`
				SET 
                    `nazwa` = :nazwa,
					`data_rozpoczecia` = :data_rozpoczecia,
					`data_zakonczenia` = :data_zakonczenia,
					`liczba_uczniow` = :liczba_uczniow,
					`id_miejscowosci` = :id_miejscowosci      
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':nazwa', $nazwa, PDO::PARAM_STR);
            $stmt->bindValue(':data_rozpoczecia', $data_rozpoczecia, PDO::PARAM_STR);
            $stmt->bindValue(':data_zakonczenia', $data_zakonczenia, PDO::PARAM_STR);
            $stmt->bindValue(':liczba_uczniow', $liczba_uczniow, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $_SESSION['msg']['m1']['title'] = "Podana nazwa wycieczki już istnieje.";
                $_SESSION['msg']['m1']['err'] = true;
                return false;
            } else {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
            }
        }
    }

    #protectors

    function getAllProtectors()
    {

        try {

            $sql = "
            SELECT
                opiekunowie.id, opiekunowie.nazwisko, opiekunowie.imie, opiekunowie.adres,
                miejscowosci.nazwa as miejscowosc, opiekunowie.kod_pocztowy, opiekunowie.pesel,
                opiekunowie.telefon, opiekunowie.email 
            FROM 
                opiekunowie LEFT JOIN miejscowosci ON opiekunowie.id_miejscowosci=miejscowosci.id;
			";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function getProtectorById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`opiekunowie`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addProtector($nazwisko, $imie, $adres, $kod, $pesel, $telefon, $email, $id_miejscowosci){

        if(!preg_match('/^[0-9]{11}$/D', $pesel)){
            $_SESSION['msg']['m1']['title'] = "Błędny pesel.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match('/^[0-9]{9}$/D', $telefon)){
            $_SESSION['msg']['m1']['title'] = "Błędny telefon.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i", $email)){
            $_SESSION['msg']['m1']['title'] = "Błędny adres e-mail.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^([0-9]{2})(-[0-9]{3})?$/i", $kod)){
            $_SESSION['msg']['m1']['title'] = "Błędny kod pocztowy.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }


        try {
            $sql = "
				INSERT INTO 
					`opiekunowie`
				SET    
                `nazwisko` = :nazwisko,
                `imie` = :imie,
                `adres` = :adres,
                `kod_pocztowy` = :kod,
                `pesel` = :pesel,
                `telefon` = :telefon,
                `email` = :email,
                `id_miejscowosci` = :id_miejscowosci                             
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindValue(':imie', $imie, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':kod', $kod, PDO::PARAM_STR);
            $stmt->bindValue(':pesel', $pesel, PDO::PARAM_STR);
            $stmt->bindValue(':telefon', $telefon, PDO::PARAM_INT);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }

    }

    function updateProtector($id, $nazwisko, $imie, $adres, $kod, $pesel, $telefon, $email, $id_miejscowosci)
    {
        if(!preg_match('/^[0-9]{11}$/D', $pesel)){
            $_SESSION['msg']['m1']['title'] = "Błędny pesel.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match('/^[0-9]{9}$/D', $telefon)){
            $_SESSION['msg']['m1']['title'] = "Błędny telefon.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i", $email)){
            $_SESSION['msg']['m1']['title'] = "Błędny adres e-mail.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^([0-9]{2})(-[0-9]{3})?$/i", $kod)){
            $_SESSION['msg']['m1']['title'] = "Błędny kod pocztowy.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        try {
            $sql = "
				UPDATE
					`opiekunowie`
				SET 
                    `nazwisko` = :nazwisko,
                    `imie` = :imie,
                    `adres` = :adres,
                    `kod_pocztowy` = :kod,
                    `pesel` = :pesel,
                    `telefon` = :telefon,
                    `email` = :email,
                    `id_miejscowosci` = :id_miejscowosci
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindValue(':imie', $imie, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':kod', $kod, PDO::PARAM_STR);
            $stmt->bindValue(':pesel', $pesel, PDO::PARAM_STR);
            $stmt->bindValue(':telefon', $telefon, PDO::PARAM_INT);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
                DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    function deleteProtector($id)
    {
        try {
            $sql = "
				DELETE FROM 
					`opiekunowie`
				WHERE
					`id` = :id
				LIMIT 1;
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    #guides

    function getAllGuides()
    {

        try {

            $sql = "
                SELECT
                przewodnicy.id, przewodnicy.nazwisko, przewodnicy.imie, przewodnicy.adres,
                miejscowosci.nazwa as miejscowosc, przewodnicy.kod_pocztowy, przewodnicy.pesel,
                przewodnicy.telefon, przewodnicy.email 
                FROM
                przewodnicy LEFT JOIN miejscowosci ON przewodnicy.id_miejscowosci=miejscowosci.id
				";

            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                $retval[$result['id']] = $result;

            }
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function getGuideById($id)
    {

        try {

            $sql = "
				SELECT
					*
				FROM
					`przewodnicy`
				WHERE `id` = :id	
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $retval = $stmt->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            return $retval;

        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die('System tymczasowo niedostepny. Zapraszamy pozniej.');
        }
    }

    function addGuide($nazwisko, $imie, $adres, $kod, $pesel, $telefon, $email, $id_miejscowosci){

        if(!preg_match('/^[0-9]{11}$/D', $pesel)){
            $_SESSION['msg']['m1']['title'] = "Błędny pesel.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match('/^[0-9]{9}$/D', $telefon)){
            $_SESSION['msg']['m1']['title'] = "Błędny telefon.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i", $email)){
            $_SESSION['msg']['m1']['title'] = "Błędny adres e-mail.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^([0-9]{2})(-[0-9]{3})?$/i", $kod)){
            $_SESSION['msg']['m1']['title'] = "Błędny kod pocztowy.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }


        try {
            $sql = "
				INSERT INTO 
					`przewodnicy`
				SET    
                `nazwisko` = :nazwisko,
                `imie` = :imie,
                `adres` = :adres,
                `kod_pocztowy` = :kod,
                `pesel` = :pesel,
                `telefon` = :telefon,
                `email` = :email,
                `id_miejscowosci` = :id_miejscowosci                             
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindValue(':imie', $imie, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':kod', $kod, PDO::PARAM_STR);
            $stmt->bindValue(':pesel', $pesel, PDO::PARAM_STR);
            $stmt->bindValue(':telefon', $telefon, PDO::PARAM_INT);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }

    }


    function updateGuide($id, $nazwisko, $imie, $adres, $kod, $pesel, $telefon, $email, $id_miejscowosci)
    {
        if(!preg_match('/^[0-9]{11}$/D', $pesel)){
            $_SESSION['msg']['m1']['title'] = "Błędny pesel.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match('/^[0-9]{9}$/D', $telefon)){
            $_SESSION['msg']['m1']['title'] = "Błędny telefon.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i", $email)){
            $_SESSION['msg']['m1']['title'] = "Błędny adres e-mail.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        if(!preg_match("/^([0-9]{2})(-[0-9]{3})?$/i", $kod)){
            $_SESSION['msg']['m1']['title'] = "Błędny kod pocztowy.";
            $_SESSION['msg']['m1']['err'] = true;
            return false;
        }

        try {
            $sql = "
				UPDATE
					`przewodnicy`
				SET 
                    `nazwisko` = :nazwisko,
                    `imie` = :imie,
                    `adres` = :adres,
                    `kod_pocztowy` = :kod,
                    `pesel` = :pesel,
                    `telefon` = :telefon,
                    `email` = :email,
                    `id_miejscowosci` = :id_miejscowosci
				WHERE 
					`id` = :id
				LIMIT 1;
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->bindValue(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindValue(':imie', $imie, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':kod', $kod, PDO::PARAM_STR);
            $stmt->bindValue(':pesel', $pesel, PDO::PARAM_STR);
            $stmt->bindValue(':telefon', $telefon, PDO::PARAM_INT);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->bindValue(':id_miejscowosci', $id_miejscowosci, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }

    function deleteGuide($id)
    {
        try {
            $sql = "
				DELETE FROM 
					`przewodnicy`
				WHERE
					`id` = :id
				LIMIT 1;
				";
            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
            return true;
        } catch (PDOException $e) {
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
        }
    }



}