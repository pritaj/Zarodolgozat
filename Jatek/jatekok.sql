-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jan 25. 16:22
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `jatekok`
--
CREATE DATABASE IF NOT EXISTS `jatekok` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `jatekok`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aknakereso_eredmenyek`
--

CREATE TABLE `aknakereso_eredmenyek` (
  `id` int(11) NOT NULL,
  `nev` text NOT NULL,
  `palya` int(11) NOT NULL COMMENT '0 - kezdő, 1- normal 2 - halado',
  `masodperc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szokereso_eredmenyek`
--

CREATE TABLE `szokereso_eredmenyek` (
  `id` int(11) NOT NULL,
  `nev` text NOT NULL,
  `palya` int(11) NOT NULL,
  `masodperc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `aknakereso_eredmenyek`
--
ALTER TABLE `aknakereso_eredmenyek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `szokereso_eredmenyek`
--
ALTER TABLE `szokereso_eredmenyek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aknakereso_eredmenyek`
--
ALTER TABLE `aknakereso_eredmenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szokereso_eredmenyek`
--
ALTER TABLE `szokereso_eredmenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
