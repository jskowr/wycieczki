-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Sty 2019, 13:27
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wycieczki`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierownicy`
--

CREATE TABLE `kierownicy` (
  `ID` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `nr_tel` int(9) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kierownicy`
--

INSERT INTO `kierownicy` (`ID`, `login`, `password`, `Nazwisko`, `Imie`, `nr_tel`, `email`) VALUES
(1, 'kierowniktest1', 'testpass1', 'Testowy', 'Test', 123456789, 'wwwwww@www@ww'),
(2, 'kierowniktest2', 'ZAQ!2wsx', 'Test', 'hhhhh', 999666444, 'ccv@www.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` int(11) NOT NULL,
  `symbol` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klasy`
--

INSERT INTO `klasy` (`id`, `symbol`) VALUES
(3, 'Ib'),
(4, 'IIa'),
(6, 'IVc'),
(8, 'IIa'),
(9, 'IIf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy_wycieczki`
--

CREATE TABLE `klasy_wycieczki` (
  `id` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL,
  `id_wycieczki` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klasy_wycieczki`
--

INSERT INTO `klasy_wycieczki` (`id`, `id_klasy`, `id_wycieczki`) VALUES
(3, 6, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsca`
--

CREATE TABLE `miejsca` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) NOT NULL,
  `adres` varchar(40) NOT NULL,
  `id_miejscowosci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `miejsca`
--

INSERT INTO `miejsca` (`id`, `nazwa`, `adres`, `id_miejscowosci`) VALUES
(1, 'Muzeum Narodowe', 'Aleje Jerozolimskie 3', 3),
(2, 'Hotel Aqua', 'Zamkowa Góra 35', 4),
(3, 'Tropical Island', 'Tropical-Islands-Allee 1', 1),
(4, 'B&B Hotel', 'Leona Szumana 8', 5),
(5, 'Hotel Skaliny', 'Pardałówka 3b', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejscowosci`
--

CREATE TABLE `miejscowosci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `miejscowosci`
--

INSERT INTO `miejscowosci` (`id`, `nazwa`) VALUES
(1, 'Opole'),
(2, 'Żmigród'),
(3, 'Zakopane'),
(4, 'Berlin'),
(5, 'Wrocław');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie`
--

CREATE TABLE `opiekunowie` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(25) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `login` varchar(32) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `pesel` varchar(11) NOT NULL,
  `telefon` int(9) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `id_miejscowosci` int(11) DEFAULT NULL,
  `id_szkoly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `opiekunowie`
--

INSERT INTO `opiekunowie` (`id`, `nazwisko`, `imie`, `login`, `haslo`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `email`, `id_miejscowosci`, `id_szkoly`) VALUES
(1, 'Nowak', 'Mirosław', 'opiekun2', 'ZAQ!2wsx', 'Jęczmienna 104', '53-307', '90100719855', 534768012, 'miroslaw.nowak@gmail.com', 1, 2),
(2, 'Pietrzak', 'Aleksandra', 'opiekuntest', 'ZXCV', 'Wojska Polskiego 12', '48-330', '85241109019', 501097145, 'aleksandra.pietrzak@gmail.com', 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie_klas`
--

CREATE TABLE `opiekunowie_klas` (
  `id` int(11) NOT NULL,
  `id_opiekuna` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `opiekunowie_klas`
--

INSERT INTO `opiekunowie_klas` (`id`, `id_opiekuna`, `id_klasy`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przewodnicy`
--

CREATE TABLE `przewodnicy` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(25) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `pesel` varchar(11) NOT NULL,
  `telefon` int(9) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `id_miejscowosci` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przewodnicy`
--

INSERT INTO `przewodnicy` (`id`, `nazwisko`, `imie`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `email`, `id_miejscowosci`) VALUES
(1, 'Wróbel', 'Krzysztof', 'Mickiewicza 21', '51-304', '86311910514', 456098123, 'wrobel.krzysztof@gmail.com', 5),
(2, 'Wiśniewski', 'Janusz', 'Piłsudskiego 4', '57-102', '89280119451', 532467834, 'janusz.wisniewski@onet.pl', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przewodnicy_miejsc`
--

CREATE TABLE `przewodnicy_miejsc` (
  `id` int(11) NOT NULL,
  `id_przewodnika` int(11) NOT NULL,
  `id_miejsca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przewodnicy_miejsc`
--

INSERT INTO `przewodnicy_miejsc` (`id`, `id_przewodnika`, `id_miejsca`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 5),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szkola`
--

CREATE TABLE `szkola` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(255) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Miasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `szkola`
--

INSERT INTO `szkola` (`ID`, `Nazwa`, `Adres`, `Miasto`) VALUES
(1, 'Szkoła podstawowa imienia Oblatów NMP', 'Szkolna 17', 5),
(2, 'Szkoła podstawowa nr 3', 'Konopnickiej 2', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(25) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `plec` varchar(1) DEFAULT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `pesel` varchar(11) NOT NULL,
  `telefon` int(9) DEFAULT NULL,
  `id_klasy` int(11) NOT NULL,
  `id_miejscowosci` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`id`, `nazwisko`, `imie`, `plec`, `adres`, `kod_pocztowy`, `pesel`, `telefon`, `id_klasy`, `id_miejscowosci`) VALUES
(1, 'Kowalski', 'Jan', 'M', 'Mickiewicza 19b', '60-134', '01311910514', 872213095, 3, 2),
(2, 'Nowak', 'Adam', 'M', 'Sienkiewicza 7', '00-014', '01280119451', 837268767, 3, 2),
(3, 'Adamska', 'Krystyna', 'K', 'Grabiszyńska 8', '53-507', '00221614457', 509213234, 3, 1),
(4, 'Skotnicka', 'Wiktoria', 'K', 'Narutowicza 3', '80-007', '99100719855', 867234654, 4, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wycieczki`
--

CREATE TABLE `wycieczki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) NOT NULL,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `liczba_uczniow` int(11) NOT NULL,
  `id_miejscowosci` int(11) DEFAULT NULL,
  `id_kierownika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wycieczki`
--

INSERT INTO `wycieczki` (`id`, `nazwa`, `data_rozpoczecia`, `data_zakonczenia`, `liczba_uczniow`, `id_miejscowosci`, `id_kierownika`) VALUES
(1, 'Zwiedzanie Muzeum Narodowego', '2018-11-22', '2018-11-23', 32, 3, 1),
(2, 'Zielona szkoła 2018', '2018-11-28', '2018-11-30', 16, 4, 2),
(3, 'Tropical Island Berlin 2017', '2018-12-27', '2018-12-30', 21, 1, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klasy_wycieczki`
--
ALTER TABLE `klasy_wycieczki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_wycieczki` (`id_wycieczki`);

--
-- Indeksy dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indeksy dla tabeli `miejscowosci`
--
ALTER TABLE `miejscowosci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`),
  ADD KEY `id_szkoly` (`id_szkoly`);

--
-- Indeksy dla tabeli `opiekunowie_klas`
--
ALTER TABLE `opiekunowie_klas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_opiekuna` (`id_opiekuna`),
  ADD KEY `id_klasy` (`id_klasy`);

--
-- Indeksy dla tabeli `przewodnicy`
--
ALTER TABLE `przewodnicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indeksy dla tabeli `przewodnicy_miejsc`
--
ALTER TABLE `przewodnicy_miejsc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_przewodnika` (`id_przewodnika`),
  ADD KEY `id_miejsca` (`id_miejsca`);

--
-- Indeksy dla tabeli `szkola`
--
ALTER TABLE `szkola`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indeksy dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`),
  ADD KEY `id_kierownika` (`id_kierownika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `klasy_wycieczki`
--
ALTER TABLE `klasy_wycieczki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `miejscowosci`
--
ALTER TABLE `miejscowosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `opiekunowie_klas`
--
ALTER TABLE `opiekunowie_klas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `przewodnicy`
--
ALTER TABLE `przewodnicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `przewodnicy_miejsc`
--
ALTER TABLE `przewodnicy_miejsc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `szkola`
--
ALTER TABLE `szkola`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klasy_wycieczki`
--
ALTER TABLE `klasy_wycieczki`
  ADD CONSTRAINT `klasy_wycieczki_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `klasy_wycieczki_ibfk_2` FOREIGN KEY (`id_wycieczki`) REFERENCES `wycieczki` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  ADD CONSTRAINT `miejsca_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD CONSTRAINT `opiekunowie_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opiekunowie_ibfk_2` FOREIGN KEY (`id_szkoly`) REFERENCES `szkola` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `opiekunowie_klas`
--
ALTER TABLE `opiekunowie_klas`
  ADD CONSTRAINT `opiekunowie_klas_ibfk_1` FOREIGN KEY (`id_opiekuna`) REFERENCES `opiekunowie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opiekunowie_klas_ibfk_2` FOREIGN KEY (`id_klasy`) REFERENCES `klasy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `przewodnicy`
--
ALTER TABLE `przewodnicy`
  ADD CONSTRAINT `przewodnicy_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `przewodnicy_miejsc`
--
ALTER TABLE `przewodnicy_miejsc`
  ADD CONSTRAINT `przewodnicy_miejsc_ibfk_1` FOREIGN KEY (`id_przewodnika`) REFERENCES `przewodnicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `przewodnicy_miejsc_ibfk_2` FOREIGN KEY (`id_miejsca`) REFERENCES `miejsca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uczniowie_ibfk_2` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD CONSTRAINT `wycieczki_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `wycieczki_ibfk_2` FOREIGN KEY (`id_kierownika`) REFERENCES `kierownicy` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
