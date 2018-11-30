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
            DEBUG ? die('SQL Error: ' . $e->getMessage()) : die();
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

    #place

    function getAllPlaces()
    {

        try {

            $sql = "
            SELECT 
                miejsca.id, miejsca.nazwa, miejsca.adres, miejscowosci.nazwa AS miejscowosc
            FROM miejsca LEFT JOIN miejscowosci ON miejsca.id_miejscowosci= miejscowosci.id;
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

    function addProtector($nazwisko, $imie, $adres, $kod, $pesel, $telefon, $email){

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
				";

            $stmt = $this->db->prepare($sql);
            $stmt->bindValue(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindValue(':imie', $imie, PDO::PARAM_STR);
            $stmt->bindValue(':adres', $adres, PDO::PARAM_STR);
            $stmt->bindValue(':kod', $kod, PDO::PARAM_STR);
            $stmt->bindValue(':pesel', $pesel, PDO::PARAM_STR);
            $stmt->bindValue(':telefon', $telefon, PDO::PARAM_INT);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->execute();
            $stmt->closeCursor();
            unset($stmt);
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

}