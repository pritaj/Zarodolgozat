-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Feb 07. 16:21
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

--
-- A tábla adatainak kiíratása `aknakereso_eredmenyek`
--



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
-- A tábla adatainak kiíratása `szokereso_eredmenyek`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szokereso_palyak`
--

CREATE TABLE `szokereso_palyak` (
  `id` int(11) NOT NULL,
  `szo` text NOT NULL,
  `sor` int(11) NOT NULL,
  `oszlop` int(11) NOT NULL,
  `irany` int(11) NOT NULL,
  `palya` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szokereso_palyak`
--

INSERT INTO `szokereso_palyak` (`id`, `szo`, `sor`, `oszlop`, `irany`, `palya`) VALUES
(1, 'Körte', 4, 11, 0, 'Gyümölcsök'),
(2, 'Alma', 0, 0, 1, 'Gyümölcsök'),
(3, 'Barack', 6, 0, 2, 'Gyümölcsök'),
(4, 'Szilva', 8, 5, 3, 'Gyümölcsök'),
(5, 'Mandarin', 12, 5, 4, 'Gyümölcsök'),
(6, 'Citrom', 5, 11, 5, 'Gyümölcsök'),
(7, 'Eper', 12, 8, 6, 'Gyümölcsök'),
(8, 'Málna', 11, 16, 7, 'Gyümölcsök'),
(9, 'Cica', 16, 16, 0, 'Állatok'),
(10, 'Kutya', 2, 2, 5, 'Állatok'),
(11, 'Viziló', 2, 7, 1, 'Állatok'),
(12, 'Bagoly', 11, 4, 2, 'Állatok'),
(13, 'Hal', 0, 16, 3, 'Állatok'),
(14, 'Sündisznó', 10, 7, 4, 'Állatok'),
(15, 'Teknős', 10, 6, 6, 'Állatok'),
(16, 'Patkány', 8, 14, 7, 'Állatok'),
(17, 'Malac', 11, 1, 5, 'Állatok'),
(18, 'Kecske', 10, 15, 0, 'Állatok'),
(19, 'Zokni', 10, 5, 4, 'Ruhák'),
(20, 'Bugyi', 10, 8, 6, 'Ruhák'),
(21, 'Nadrág', 5, 10, 3, 'Ruhák'),
(22, 'Ing', 1, 13, 2, 'Ruhák'),
(23, 'Farmer', 4, 13, 1, 'Ruhák'),
(24, 'Blúz', 4, 2, 0, 'Ruhák'),
(25, 'Kesztyű', 10, 11, 7, 'Ruhák'),
(26, 'Póló', 12, 4, 5, 'Ruhák'),
(27, 'Sál', 9, 2, 6, 'Ruhák'),
(28, 'Sapka', 15, 11, 4, 'Ruhák');

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
-- A tábla indexei `szokereso_palyak`
--
ALTER TABLE `szokereso_palyak`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aknakereso_eredmenyek`
--
ALTER TABLE `aknakereso_eredmenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT a táblához `szokereso_eredmenyek`
--
ALTER TABLE `szokereso_eredmenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT a táblához `szokereso_palyak`
--
ALTER TABLE `szokereso_palyak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
