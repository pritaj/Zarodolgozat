-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 28. 15:33
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szokereso_palyak`
--

CREATE TABLE `szokereso_palyak` (
  `id` int(11) NOT NULL,
  `neve` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szokereso_palyak`
--

INSERT INTO `szokereso_palyak` (`id`, `neve`) VALUES
(1, 'Gyümölcsök'),
(2, 'Állatok'),
(3, 'Ruhák');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szokereso_szavak`
--

CREATE TABLE `szokereso_szavak` (
  `id` int(11) NOT NULL,
  `szo` text NOT NULL,
  `sor` int(11) NOT NULL,
  `oszlop` int(11) NOT NULL,
  `irany` int(11) NOT NULL,
  `palya_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szokereso_szavak`
--

INSERT INTO `szokereso_szavak` (`id`, `szo`, `sor`, `oszlop`, `irany`, `palya_id`) VALUES
(1, 'Körte', 4, 11, 0, 1),
(2, 'Alma', 0, 0, 1, 1),
(3, 'Barack', 6, 0, 2, 1),
(4, 'Szilva', 8, 5, 3, 1),
(5, 'Mandarin', 12, 5, 4, 1),
(6, 'Citrom', 5, 11, 5, 1),
(7, 'Eper', 12, 8, 6, 1),
(8, 'Málna', 11, 16, 7, 1),
(9, 'Cica', 16, 16, 0, 2),
(10, 'Kutya', 2, 2, 5, 2),
(11, 'Viziló', 2, 7, 1, 2),
(12, 'Bagoly', 11, 4, 2, 2),
(13, 'Hal', 0, 16, 3, 2),
(14, 'Sündisznó', 10, 7, 4, 2),
(15, 'Teknős', 10, 6, 6, 2),
(16, 'Patkány', 8, 14, 7, 2),
(17, 'Malac', 11, 1, 5, 2),
(18, 'Kecske', 10, 15, 0, 2),
(19, 'Zokni', 10, 5, 4, 3),
(20, 'Bugyi', 10, 8, 6, 3),
(21, 'Nadrág', 5, 10, 3, 3),
(22, 'Ing', 1, 13, 2, 3),
(23, 'Farmer', 4, 13, 1, 3),
(24, 'Blúz', 4, 2, 0, 3),
(25, 'Kesztyű', 10, 11, 7, 3),
(26, 'Póló', 12, 4, 5, 3),
(27, 'Sál', 9, 2, 6, 3),
(28, 'Sapka', 15, 11, 4, 3);

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
-- A tábla indexei `szokereso_szavak`
--
ALTER TABLE `szokereso_szavak`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `szokereso_palyak`
--
ALTER TABLE `szokereso_palyak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `szokereso_szavak`
--
ALTER TABLE `szokereso_szavak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
