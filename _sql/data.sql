--
-- Zrzut danych tabeli `kierownicy`
--

INSERT INTO `kierownicy` (`ID`, `login`, `password`, `Nazwisko`, `Imie`, `nr_tel`, `email`) VALUES
(1, 'kierowniktest1', 'testpass1', 'Testowy', 'Test', 123456789, 'wwwwww@www@ww'),
(2, 'kierowniktest2', 'ZAQ!2wsx', 'Test', 'hhhhh', 999666444, 'ccv@www.com');

-- --------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `klasy`
--

INSERT INTO `klasy` (`id`, `symbol`) VALUES
(3, 'Ib'),
(4, 'IIa'),
(6, 'IVc'),
(8, 'IIa'),
(9, 'IIf');

-- --------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `klasy_wycieczki`
--

INSERT INTO `klasy_wycieczki` (`id`, `id_klasy`, `id_wycieczki`) VALUES
(3, 6, 3);

-- ---------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `miejsca`
--

INSERT INTO `miejsca` (`id`, `nazwa`, `adres`, `id_miejscowosci`) VALUES
(1, 'Muzeum Narodowe', 'Aleje Jerozolimskie 3', 3),
(2, 'Hotel Aqua', 'Zamkowa Góra 35', 4),
(3, 'Tropical Island', 'Tropical-Islands-Allee 1', 1),
(4, 'B&B Hotel', 'Leona Szumana 8', 5),
(5, 'Hotel Skaliny', 'Pardałówka 3b', 2);

-- ---------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `miejscowosci`
--

INSERT INTO `miejscowosci` (`id`, `nazwa`) VALUES
(1, 'Opole'),
(2, 'Żmigród'),
(3, 'Zakopane'),
(4, 'Berlin'),
(5, 'Wrocław');

-- ---------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `opiekunowie`
--

INSERT INTO `opiekunowie` (`id`, `nazwisko`, `imie`, `login`, `haslo`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `email`, `id_miejscowosci`, `id_szkoly`) VALUES
(1, 'Nowak', 'Mirosław', 'opiekun2', 'ZAQ!2wsx', 'Jęczmienna 104', '53-307', '90100719855', 534768012, 'miroslaw.nowak@gmail.com', 1, 2),
(2, 'Pietrzak', 'Aleksandra', 'opiekuntest', 'ZXCV', 'Wojska Polskiego 12', '48-330', '85241109019', 501097145, 'aleksandra.pietrzak@gmail.com', 3, 1);

-- ----------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `opiekunowie_klas`
--

INSERT INTO `opiekunowie_klas` (`id`, `id_opiekuna`, `id_klasy`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 6);

-- ----------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `przewodnicy`
--

INSERT INTO `przewodnicy` (`id`, `nazwisko`, `imie`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `email`, `id_miejscowosci`) VALUES
(1, 'Wróbel', 'Krzysztof', 'Mickiewicza 21', '51-304', '86311910514', 456098123, 'wrobel.krzysztof@gmail.com', 5),
(2, 'Wiśniewski', 'Janusz', 'Piłsudskiego 4', '57-102', '89280119451', 532467834, 'janusz.wisniewski@onet.pl', 4);

-- -----------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `przewodnicy_miejsc`
--

INSERT INTO `przewodnicy_miejsc` (`id`, `id_przewodnika`, `id_miejsca`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 5),
(4, 2, 2);

-- ------------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `szkola`
--

INSERT INTO `szkola` (`ID`, `Nazwa`, `Adres`, `Miasto`) VALUES
(1, 'Szkoła podstawowa imienia Oblatów NMP', 'Szkolna 17', 5),
(2, 'Szkoła podstawowa nr 3', 'Konopnickiej 2', 3);

-- ------------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`id`, `nazwisko`, `imie`, `plec`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `id_klasy`, `id_miejscowosci`) VALUES
(1, 'Kowalski', 'Jan', 'M', 'Mickiewicza 19b', '60-134', '01311910514', 872213095, 3, 2),
(2, 'Nowak', 'Adam', 'M', 'Sienkiewicza 7', '00-014', '01280119451', 837268767, 3, 2),
(3, 'Adamska', 'Krystyna', 'K', 'Grabiszyńska 8', '53-507', '00221614457', 509213234, 3, 1),
(4, 'Skotnicka', 'Wiktoria', 'K', 'Narutowicza 3', '80-007', '99100719855', 867234654, 4, 5);

-- ------------------------------------------------------------------------------------------------------

--
-- Zrzut danych tabeli `wycieczki`
--

INSERT INTO `wycieczki` (`id`, `nazwa`, `data_rozpoczecia`, `data_zakonczenia`, `liczba_uczniow`, `id_miejscowosci`, `id_kierownika`) VALUES
(1, 'Zwiedzanie Muzeum Narodowego', '2018-11-22', '2018-11-23', 32, 3, 1),
(2, 'Zielona szkoła 2018', '2018-11-28', '2018-11-30', 16, 4, 2),
(3, 'Tropical Island Berlin 2017', '2018-12-27', '2018-12-30', 21, 1, 2);

-- -------------------------------------------------------------------------------------------------------