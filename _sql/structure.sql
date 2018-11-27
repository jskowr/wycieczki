-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 27 Lis 2018, 20:50
-- Wersja serwera: 10.1.26-MariaDB-0+deb9u1
-- Wersja PHP: 7.2.8-1+0~20180725124257.2+stretch~1.gbp571e56

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` int(11) NOT NULL,
  `symbol` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy_wycieczki`
--

CREATE TABLE `klasy_wycieczki` (
  `id` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL,
  `id_wycieczki` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejscowosci`
--

CREATE TABLE `miejscowosci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie`
--

CREATE TABLE `opiekunowie` (
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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie_klas`
--

CREATE TABLE `opiekunowie_klas` (
  `id` int(11) NOT NULL,
  `id_opiekuna` int(11) NOT NULL,
  `id_klasy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przewodnicy_miejsc`
--

CREATE TABLE `przewodnicy_miejsc` (
  `id` int(11) NOT NULL,
  `id_przewodnika` int(11) NOT NULL,
  `id_miejsca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id_miejscowosci` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klasy_wycieczki`
--
ALTER TABLE `klasy_wycieczki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_wycieczki` (`id_wycieczki`);

--
-- Indexes for table `miejsca`
--
ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indexes for table `miejscowosci`
--
ALTER TABLE `miejscowosci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indexes for table `opiekunowie_klas`
--
ALTER TABLE `opiekunowie_klas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_opiekuna` (`id_opiekuna`),
  ADD KEY `id_klasy` (`id_klasy`);

--
-- Indexes for table `przewodnicy`
--
ALTER TABLE `przewodnicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indexes for table `przewodnicy_miejsc`
--
ALTER TABLE `przewodnicy_miejsc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_przewodnika` (`id_przewodnika`),
  ADD KEY `id_miejsca` (`id_miejsca`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- Indexes for table `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_miejscowosci` (`id_miejscowosci`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `klasy_wycieczki`
--
ALTER TABLE `klasy_wycieczki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  ADD CONSTRAINT `opiekunowie_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `wycieczki_ibfk_1` FOREIGN KEY (`id_miejscowosci`) REFERENCES `miejscowosci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
