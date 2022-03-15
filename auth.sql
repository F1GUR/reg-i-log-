-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Mar 2022, 12:39
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `auth`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `passwordHash`) VALUES
(1, 'jkowalski@firma.pl', '$argon2i$v=19$m=65536,t=4,p=1$N1ZCRjBzenBmcXltSTd3Sg$uBUoeN5plVS6THXn+6nz8y6DXCZt85PJDn9OoEs3m00'),
(2, 'janekkapec@firma.pl', '$argon2i$v=19$m=65536,t=4,p=1$UzkzVDlpd2cwTXFTdThrTA$FYz9z9GhfpnPLn2+9Hz68hPqvLlgm25DP+HuZ7P4USs'),
(5, 'japczan@firma.pl', '$argon2i$v=19$m=65536,t=4,p=1$akRUdENpRHZ1YjRMTWQzdQ$UOERw3G78yIl3F0mS0gxTF+/vxJEUJ3gG0WxpZKZf54'),
(6, 'janekbaran@firma.pl', '$argon2i$v=19$m=65536,t=4,p=1$YUtnTVQuNHBBU3dleXFwWg$nWvh4qQvVPuX4peZ/crUX3uhL1Whcz3f2z7Z/gzTT9c');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
