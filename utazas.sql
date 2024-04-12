-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 12. 08:50
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas`
--
CREATE DATABASE IF NOT EXISTS `utazas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `utazas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmu`
--

DROP TABLE IF EXISTS `jarmu`;
CREATE TABLE IF NOT EXISTS `jarmu` (
  `jarmuAzon` int(32) NOT NULL AUTO_INCREMENT,
  `tipus` varchar(20) NOT NULL,
  `varosAzon` int(32) NOT NULL,
  PRIMARY KEY (`jarmuAzon`),
  UNIQUE KEY `varosAzon` (`varosAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jarmu`
--

INSERT INTO `jarmu` (`jarmuAzon`, `tipus`, `varosAzon`) VALUES
(1, 'auto', 20),
(2, 'autó', 22),
(3, 'teherautó', 24),
(4, 'autó', 21),
(5, 'motor', 23);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofor`
--

DROP TABLE IF EXISTS `sofor`;
CREATE TABLE IF NOT EXISTS `sofor` (
  `soforAzon` int(32) NOT NULL,
  `vezetekNev` varchar(30) NOT NULL,
  `keresztNev` varchar(30) NOT NULL,
  `jarmuAzon` int(32) NOT NULL,
  PRIMARY KEY (`soforAzon`),
  UNIQUE KEY `jarmuAzon` (`jarmuAzon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `sofor`
--

INSERT INTO `sofor` (`soforAzon`, `vezetekNev`, `keresztNev`, `jarmuAzon`) VALUES
(30, 'Kiss', 'Zoltán', 1),
(31, 'Nagy', 'Zita', 2),
(32, 'Polyák', 'Zoltán', 3),
(33, 'Sass', 'István', 4),
(34, 'Hegedűs', 'Viktória', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varos`
--

DROP TABLE IF EXISTS `varos`;
CREATE TABLE IF NOT EXISTS `varos` (
  `varosAzon` int(32) NOT NULL,
  `nev` varchar(150) NOT NULL,
  PRIMARY KEY (`varosAzon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `varos`
--

INSERT INTO `varos` (`varosAzon`, `nev`) VALUES
(20, 'Budapest'),
(21, 'Szolnok'),
(22, 'Eger'),
(23, 'Kelenföld'),
(24, 'Hatvan'),
(25, 'Miskolc');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jarmu`
--
ALTER TABLE `jarmu`
  ADD CONSTRAINT `jarmu_ibfk_1` FOREIGN KEY (`jarmuAzon`) REFERENCES `sofor` (`jarmuAzon`),
  ADD CONSTRAINT `jarmu_ibfk_2` FOREIGN KEY (`varosAzon`) REFERENCES `varos` (`varosAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
