-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 116.202.211.83:3306
-- Czas generowania: 12 Cze 2022, 20:43
-- Wersja serwera: 10.5.15-MariaDB-0+deb11u1
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_79640`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_mecano', 'Mecano', 1),
('society_mokotowski', 'Mokotowski', 1),
('society_offambulance', 'EMS - poza sluzba', 1),
('society_offmecano', ' LSC - poza sluzba', 1),
('society_offpolice', ' LSPD - poza sluzba', 1),
('society_piekarz', 'Piekarz', 1),
('society_police', 'Police', 1),
('society_sadownik', 'Sadownik', 1),
('society_taxi', 'Taxi', 1),
('society_unemployed', 'Bezrobotny', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 4000, NULL),
(2, 'society_mecano', 1500, NULL),
(3, 'society_mokotowski', 0, NULL),
(4, 'society_offambulance', 0, NULL),
(5, 'society_offmecano', 0, NULL),
(6, 'society_offpolice', 0, NULL),
(7, 'society_piekarz', 0, NULL),
(8, 'society_police', 2147483647, NULL),
(9, 'society_sadownik', 0, NULL),
(10, 'society_taxi', 0, NULL),
(11, 'society_unemployed', 0, NULL),
(27, 'property_black_money', 0, 'steam:1100001358d8ba2'),
(28, 'property_black_money', 0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7'),
(29, 'property_black_money', 0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7'),
(30, 'property_black_money', 0, 'char3:89d949272b0cf738a59a943e19226ce5b8fa8fe7');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('housing', 'Housing', 0),
('property', 'Mieszkanie', 0),
('society_ambulance', 'Ambulance', 1),
('society_mecano', 'Mecano', 1),
('society_mokotowski', 'Mokotowski', 1),
('society_offambulance', 'EMS - poza sluzba', 1),
('society_offmecano', ' LSC - poza sluzba', 1),
('society_offpolice', ' LSPD - poza sluzba', 1),
('society_piekarz', 'Piekarz', 1),
('society_police', 'Police', 1),
('society_sadownik', 'Sadownik', 1),
('society_taxi', 'Taxi', 1),
('society_unemployed', 'Bezrobotny', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(397, 'property', 'bread', 10, 'Char2:1100001358d8ba2'),
(398, 'property', 'water', 0, 'Char2:1100001358d8ba2'),
(399, 'property', 'bread', 32, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7'),
(400, 'property', 'pistol', 0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7'),
(401, 'property', 'pistol', 0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7'),
(402, 'property', 'bread', 20, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anticheat`
--

CREATE TABLE `anticheat` (
  `identifier` varchar(46) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nazwa` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `powod` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `typkary` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `datanadania` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hwid` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `baninfo`
--

INSERT INTO `baninfo` (`id`, `license`, `identifier`, `liveid`, `xblid`, `discord`, `playerip`, `playername`) VALUES
(1, 'license:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'steam:1100001358d8ba2', 'live:985154351643367', 'xbl:2535418885976914', 'discord:509748243803144202', 'ip:77.73.16.78', 'EZ'),
(2, 'license:bb39d4e3104661c9cd160079bf064b21ba37a12f', 'steam:110000117fd6eb4', 'live:985154296857640', 'xbl:2535445412262472', 'discord:418534750547083276', 'ip:213.134.182.132', 'Bejdzoor'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'license:d0c7bc9b49d982fa7294386f6e55b7f396b4e055', 'steam:1100001058d18af', 'live:985154091994793', 'xbl:2535409097520425', 'discord:454666014429544468', 'ip:217.102.190.202', 'Frog Boots'),
(5, 'license:d051701d583dc26920f07e2aad53a480fa0eb8bb', 'steam:11000013663a880', 'live:914798764295152', 'xbl:2535461748613272', 'discord:425012629111570443', 'ip:185.56.211.65', 'Zuza135'),
(6, 'license:3006c9beff905825a697c569351560f1752141eb', 'steam:1100001399148e4', NULL, NULL, NULL, 'ip:194.29.183.74', 'DantuŚ'),
(7, 'license:63a19e784cbefc86f993ba11656b2ed8871ad559', 'steam:110000140e994a2', 'live:985154249181267', 'xbl:2535457945066361', 'discord:855964401956945961', 'ip:90.255.72.231', 'Piggy The Pig'),
(8, 'license:e948f43d17426de133f106d10e64df8dbd1102b5', 'steam:11000010a425a8c', NULL, NULL, 'discord:370991144760377346', 'ip:188.146.135.86', 'Pucky'),
(9, 'license:34d2a1a07f9bfb63c37de36a1d3cbae9bd504107', 'steam:11000010f3ef195', 'live:985154452188818', 'xbl:2535469606400836', 'discord:642064967511572481', 'ip:83.21.125.10', 'Lisek'),
(10, 'license:aa7dedac882bd071e7673563cf6804f02eeebb28', 'steam:11000010e5c6b62', 'live:914798065687365', 'xbl:2535422009346110', 'discord:414088374329147394', 'ip:89.64.104.228', '[OUTLAW] Raczeq #HowlGG'),
(11, 'license:25b4b15a16caa36418c0d4acec6786569ee59754', 'steam:110000136246096', NULL, NULL, 'discord:412235004228141069', 'ip:77.254.250.136', 'Ronek'),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'license:ff9f88aaebf5b05765581fbd668ff1298ffc36dc', 'steam:110000150039dba', 'live:985154153402194', 'xbl:2535444386772139', 'discord:977848447296221296', 'ip:83.11.225.94', 'Phoboos'),
(14, 'license:a4a8b9fb9768581938eb63a5cf66d84820875801', 'steam:11000012efab4c8', NULL, NULL, 'discord:956225731124412476', 'ip:185.127.22.144', 'anime_boy'),
(15, 'license:65d2e60edd81f3577b56eab6c3e32b6ab61245d8', 'steam:1100001148ed628', 'live:914802152089896', 'xbl:2535433873616040', 'discord:336808246977363971', 'ip:188.47.124.210', 'Smokey');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crew_phone_bank`
--

CREATE TABLE `crew_phone_bank` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crew_phone_news`
--

CREATE TABLE `crew_phone_news` (
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_police', 'Police', 1),
('society_mecano', 'Mecano', 1),
('society_ambulance', 'EMS', 1),
('property', 'Mieszkanie', 0),
('society_offambulance', 'EMS - poza sluzba', 1),
('society_offpolice', ' LSPD - poza sluzba', 1),
('society_piekarz', 'Piekarz', 1),
('society_sadownik', 'Sadownik', 1),
('society_offmecano', ' LSC - poza sluzba', 1),
('society_unemployed', 'Bezrobotny', 1),
('society_mokotowski', 'Mokotowski', 1),
('society_taxi', 'Taxi', 1),
('society_police', 'Police', 1),
('property', 'Propriété', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'society_mecano', NULL, '{}'),
(3, 'society_ambulance', NULL, '{}'),
(4, 'society_offambulance', NULL, '{}'),
(5, 'society_offpolice', NULL, '{}'),
(6, 'society_piekarz', NULL, '{}'),
(7, 'society_sadownik', NULL, '{}'),
(8, 'society_offmecano', NULL, '{}'),
(9, 'society_unemployed', NULL, '{}'),
(10, 'society_mokotowski', NULL, '{}'),
(11, 'society_taxi', NULL, '{}'),
(12, 'property', 'steam:1100001358d8ba2', '{}'),
(13, 'property', 'steam:110000117fd6eb4', '{}'),
(14, 'property', 'steam:1100001058d18af', '{}'),
(15, 'property', 'steam:11000013663a880', '{}'),
(16, 'property', 'steam:1100001399148e4', '{}'),
(17, 'property', 'Char2:1100001358d8ba2', '{}'),
(18, 'property', 'steam:110000140e994a2', '{}'),
(19, 'property', 'steam:11000010a425a8c', '{\"dressing\":[{\"skin\":{\"nose_peak_lowering\":0,\"lipstick_2\":0,\"arms_2\":0,\"eyebrows_1\":0,\"chain_1\":0,\"bags_1\":0,\"watches_2\":0,\"helmet_2\":0,\"blush_2\":0,\"pants_1\":146,\"chain_2\":0,\"pants_2\":0,\"chimp_bone_lowering\":0,\"eye_color\":0,\"jaw_bone_width\":0,\"moles_2\":0,\"hair_color_2\":0,\"tshirt_1\":15,\"nose_peak_lenght\":0,\"eyebrown_high\":0,\"moles_1\":0,\"age_1\":0,\"cheeks_width\":0,\"bproof_2\":0,\"beard_2\":0,\"blush_1\":0,\"age_2\":0,\"helmet_1\":-1,\"glasses_1\":24,\"lipstick_1\":0,\"ears_2\":0,\"mask_1\":0,\"hair_2\":0,\"beard_1\":0,\"hair_1\":74,\"nose_bone_twist\":0,\"bags_2\":0,\"mask_2\":0,\"chest_3\":0,\"decals_2\":0,\"makeup_1\":50,\"chimp_bone_width\":0,\"shoes_2\":0,\"lips_thickness\":0,\"sex\":0,\"chimp_bone_lenght\":0,\"lipstick_4\":0,\"beard_4\":0,\"nose_peak_hight\":0,\"chimp_hole\":0,\"eyebrows_2\":0,\"hair_color_1\":38,\"shoes_1\":6,\"bracelets_1\":-1,\"bracelets_2\":0,\"eyebrows_3\":0,\"chest_1\":0,\"face\":0,\"ears_1\":-1,\"decals_1\":0,\"blush_3\":0,\"cheeks_bone_width\":0,\"skin\":2,\"beard_3\":0,\"neck_thikness\":0,\"makeup_4\":43,\"nose_bone_high\":0,\"torso_2\":1,\"arms\":0,\"tshirt_2\":0,\"lipstick_3\":0,\"chest_2\":0,\"cheeks_bone_high\":0,\"watches_1\":-1,\"jaw_bone_back_lenght\":0,\"torso_1\":402,\"makeup_3\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"eyes_openning\":0,\"eyebrown_forward\":0,\"nose_width\":0,\"makeup_2\":10,\"glasses_2\":4},\"label\":\"sdas\"}]}'),
(20, 'property', 'steam:11000010f3ef195', '{}'),
(21, 'property', 'steam:11000010e5c6b62', '{}'),
(22, 'property', 'steam:110000136246096', '{}'),
(23, 'property', 'steam:11000010ef8a2c5', '{}'),
(24, 'property', 'steam:110000150039dba', '{}'),
(25, 'property', 'steam:11000012efab4c8', '{}'),
(26, 'property', 'steam:1100001148ed628', '{}'),
(27, 'property', 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{}'),
(28, 'property', 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{}'),
(29, 'property', 'char3:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `donators`
--

CREATE TABLE `donators` (
  `identifier` varchar(46) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gb_banking`
--

CREATE TABLE `gb_banking` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(24) DEFAULT NULL,
  `password` varchar(24) DEFAULT NULL,
  `removecode` varchar(4) DEFAULT NULL,
  `balance` int(24) NOT NULL DEFAULT 0,
  `debitcard` varchar(24) DEFAULT NULL,
  `dc_pin` varchar(4) DEFAULT NULL,
  `isLogged` int(11) NOT NULL DEFAULT 0,
  `realOwner` varchar(50) DEFAULT NULL,
  `mainAccount` int(11) NOT NULL DEFAULT 0,
  `accountNumber` varchar(24) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT 1,
  `weight` int(32) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `weight`, `rare`, `can_remove`) VALUES
('advancedrifle', 'CTAR-21', 10, 1, 0, 1),
('amfetamin', 'Amfetamin', 40, 1, 0, 1),
('appistol', 'Colt SCAMP', 10, 1, 0, 1),
('assaultrifle', 'AK 47', 10, 1, 0, 1),
('assaultrifle_mk2', 'assaultrifle_mk2', 10, 1, 0, 1),
('assaultshotgun', 'UTAS UTS-15', 10, 1, 0, 1),
('assaultsmg', 'Magpul PDR', 10, 1, 0, 1),
('autoshotgun', 'AA-12', 10, 1, 0, 1),
('bag', 'Torba', 1, 1, 1, 1),
('ball', 'ball', 1, 1, 0, 1),
('ball_ammo', 'ball_ammo', 100, 1, 0, 1),
('bandage', 'Bandaż', 100, 1, 0, 1),
('bat', 'Baseball Bat', 1, 1, 0, 1),
('battleaxe', 'Battle Axe', 10, 1, 0, 1),
('binoculars', 'Lornetka', 1, 1, 0, 1),
('blowpipe', 'Palnik', 10, 1, 0, 1),
('bottle', 'Butelka', 20, 1, 0, 1),
('bread', 'Chleb', 30, 1, 0, 1),
('bullpuprifle', 'Type 86-S', 10, 1, 0, 1),
('bullpuprifle_mk2', 'bullpuprifle_mk2', 10, 1, 0, 1),
('bullpupshotgun', 'Kel-Tec KSG', 10, 1, 0, 1),
('bzgas', 'bz gas', 20, 1, 0, 1),
('c4_bank', 'Termit', 10, 1, 0, 1),
('c4_bomb', 'C4', 10, 10, 1, 1),
('carbinerifle', 'M4A1', 10, 1, 0, 1),
('carbinerifle_mk2', 'carbinerifle_mk2', 10, 1, 0, 1),
('carokit', 'Części blacharskie', 3, 1, 0, 1),
('carotool', 'Częsci naprawcze', 4, 1, 0, 1),
('chleb', 'Chleb', 25, 1, 0, 1),
('cigarette', 'Papieros', 100, 1, 0, 1),
('clip', 'Magazynek', 20, 1, 0, 1),
('cocaine', 'Kokaina', 40, 1, 0, 1),
('coffee', 'Kawa', 15, 1, 0, 1),
('coke', 'Kokaina', 80, 1, 0, 1),
('coke_pooch', 'Torebka Kokainy', 60, 1, 0, 1),
('combatmg', 'M249E1', 101, 1, 0, 1),
('combatmg_mk2', 'combatmg_mk2', 10, 1, 0, 1),
('combatpdw', 'SIG Sauer MPX', 1, 10, 0, 1),
('combatpistol', 'Sig Sauer P228', 10, 1, 0, 1),
('compactlauncher', 'M79 GL', 10, 1, 0, 1),
('compactrifle', 'Micro Draco AK Pistol', 10, 1, 0, 1),
('crowbar', 'Crow Bar', 10, 1, 0, 1),
('cupcake', 'Babeczka', 15, 1, 0, 1),
('cutter', 'Przecinak', 1, 1, 1, 1),
('dagger', 'Dagger', 1, 1, 0, 1),
('dbshotgun', 'Zabala short-barreled side-by-side shotgun', 10, 1, 0, 1),
('diamond', 'Diament', 25, 1, 0, 1),
('dildo', 'Dildo', 10, 1, 0, 1),
('donut', 'Pączek', 10, 1, 0, 1),
('doubleaction', 'doubleaction', 10, 1, 0, 1),
('drill', 'Wiertło', 10, 1, 0, 1),
('drug_coke_brick', 'Kostka kokainy', 100, 1, 0, 1),
('drug_weed_brick', 'Kostka marichuanny', 100, 1, 0, 1),
('earrning', 'Kolczyki', 150, 1, 0, 1),
('figurka', 'Figurka', 40, 1, 1, 1),
('fixkit', 'Narzedzia naprawcze', 10, 1, 0, 1),
('fixtool', 'Zestaw do naprawy', 10, 1, 0, 1),
('flare', 'Flare', 10, 1, 0, 1),
('flaregun', 'Flare Gun', 10, 1, 0, 1),
('flare_ammo', 'Flares', 100, 1, 0, 1),
('flashlight', 'Flashlight', 10, 1, 0, 1),
('gasmask', 'Maska gazowa', 10, 1, 0, 1),
('gazbottle', 'Butelka z gazem', 10, 1, 0, 1),
('gold', 'Złoto', 200, 1, 0, 1),
('goldTrolly', 'goldTrolly', 10, 1, 0, 1),
('golfclub', 'Golf Club', 10, 1, 0, 1),
('gps', 'GPS', 10, 1, 0, 1),
('grenade', 'grenade', 20, 1, 0, 1),
('grenadelauncher', 'Milkor MGL', 10, 1, 0, 1),
('grenadelauncher_ammo', 'grenadelauncher_ammo', 100, 1, 0, 1),
('grenadelauncher_smoke_ammo', 'grenadelauncher_smoke_ammo', 100, 1, 0, 1),
('gusenberg', 'M1928A1 Thompson SMG', 10, 1, 0, 1),
('gzgas_ammo', 'gzgas_ammo', 100, 1, 0, 1),
('hackerDevice', 'Hacking Device', 5, 1, 0, 1),
('hack_keycard', 'Karta do Hackowania', 10, 1, 0, 1),
('hack_usb', 'Pendrive', 10, 1, 0, 1),
('hamburger', 'Hamburger', 30, 1, 0, 1),
('hammer', 'Hammer', 10, 1, 0, 1),
('handcuffs', 'Kajdanki', 20, 1, 0, 1),
('hatchet', 'hatchet', 10, 1, 0, 1),
('headbag', 'Worek na głowę', 10, 1, 0, 1),
('heavypistol', 'EWB 1911', 10, 1, 0, 1),
('heavyshotgun', 'Saiga-12K', 10, 1, 0, 1),
('heavysniper', 'M107', 10, 1, 0, 1),
('heavysniper_mk2', 'heavysniper_mk2', 10, 1, 0, 1),
('heroina', 'Heroina', 80, 1, 0, 1),
('heroina_pooch', 'Torebka Heroiny', 60, 1, 0, 1),
('hominglauncher', 'SA-7 Grail', 10, 1, 0, 1),
('icetea', 'Bubbletea', 30, 1, 0, 1),
('id_card_f', 'Karta dostępu', 1, 1, 1, 1),
('indica_weed', 'Słaba paczka marichuana', 40, 1, 0, 1),
('kamizelka', 'kamizelka', 5, 1, 0, 1),
('key1', 'key1', 10, 1, 0, 1),
('key2', 'key2', 10, 1, 0, 1),
('knife', 'Knife', 10, 1, 0, 1),
('knuckle', 'Knuckledusters', 10, 1, 0, 1),
('laptop', 'Laptop', 5, 1, 1, 1),
('machete', 'machete', 10, 1, 0, 1),
('machinepistol', 'TEC-9', 10, 1, 0, 1),
('marksmanpistol', 'Thompson-Center Contender G2', 10, 1, 0, 1),
('marksmanrifle', 'M39 EMR', 10, 1, 0, 1),
('marksmanrifle_mk2', 'marksmanrifle_mk2', 10, 1, 0, 1),
('medikit', 'MedKit', 100, 1, 0, 1),
('mg', 'PKP Pecheneg', 10, 1, 0, 1),
('mg_ammo', 'MG Ammo', 100, 1, 0, 1),
('microsmg', 'Micro SMG', 10, 1, 0, 1),
('militaryrifle', 'Karabin wojskowy', 10, 1, 0, 1),
('minigun', 'minigun', 10, 1, 0, 1),
('minigun_ammo', 'Minigun Ammo', 100, 1, 0, 1),
('minismg', 'Skorpion Vz. 61', 10, 1, 0, 1),
('molotov', 'Molotov Cocktail', 20, 1, 0, 1),
('molotov_ammo', 'molotov_ammo', 100, 1, 0, 1),
('musket', 'Brown Bess', 10, 1, 0, 1),
('necklace', 'Najszyjnik', 150, 1, 0, 1),
('nightstick', 'ASP Baton', 10, 1, 0, 1),
('oxygen_mask', 'Maska tlenowa', 10, 1, 0, 1),
('paczka', 'Paczka', 40, 1, 1, 1),
('parachute', 'parachute', 10, 1, 0, 1),
('petrolcan', 'Petrol Can', 10, 1, 0, 1),
('phone', 'Telefon', 10, 1, 0, 1),
('picnic', 'Zestaw Piknikowy', 5, 1, 0, 1),
('pipebomb', 'pipe bomb', 10, 1, 0, 1),
('pistol', 'Colt M1911', 10, 1, 0, 1),
('pistol50', 'Desert Eagle', 10, 1, 0, 1),
('pistol_ammo', 'Pistol Ammo', 500, 1, 0, 1),
('pistol_ammo_box', 'pistol_ammo_box', 10, 1, 0, 1),
('pistol_mk2', 'Sig Sauer P226', 10, 1, 0, 1),
('plane_rocket_ammo', 'plane_rocket_ammo', 100, 1, 0, 1),
('player_laser_ammo', 'player_laser_ammo', 100, 1, 0, 1),
('poolcue', 'pool cue', 10, 1, 0, 1),
('proxmine', 'Proxmine Mine', 20, 1, 0, 1),
('pumpshotgun', 'Remington 870', 10, 1, 0, 1),
('pumpshotgun_mk2', 'pumpshotgun_mk2', 10, 1, 0, 1),
('purple_weed', 'Mocna paczka marichuana', 40, 1, 0, 1),
('radio', 'Radio', 10, 1, 0, 1),
('railgun', 'railgun', 10, 1, 0, 1),
('redbull', 'Redbull', 10, 1, 0, 1),
('remotesniper', 'Remote Sniper', 10, 1, 0, 1),
('revolver', 'Taurus Raging Bull', 10, 1, 0, 1),
('revolver_mk2', 'revolver_mk2', 10, 1, 0, 1),
('rifle_ammo', 'Rifle Ammo', 100, 1, 0, 1),
('rifle_ammo_box', 'rifle_ammo_box', 10, 1, 0, 1),
('ring', 'Pierscionek', 150, 1, 0, 1),
('robbery_red_pen', 'Czerwony długopis', 10, 1, 0, 1),
('rolex', 'Rolex', 150, 1, 1, 1),
('rose', 'Róża', 5, 1, 0, 1),
('rpg', 'RPG-7', 10, 1, 0, 1),
('rpg_ammo', 'RPG Ammo', 100, 1, 0, 1),
('sandwich', 'Kanapka', 15, 1, 0, 1),
('sativa_weed', 'Średnia  paczka marichuana', 10, 1, 0, 1),
('sawnoffshotgun', 'Mossberg 500', 10, 1, 0, 1),
('shotgun_ammo', 'Shotgun Ammo', 100, 1, 0, 1),
('shotgun_ammo_box', 'shotgun_ammo_box', 10, 1, 0, 1),
('sim', 'Karta Sim', 10, 1, 0, 1),
('smg', 'MP5A3', 10, 1, 0, 1),
('smg_ammo', 'SMG Ammo', 100, 1, 0, 1),
('smg_ammo_box', 'smg_ammo_box', 10, 1, 0, 1),
('smg_mk2', 'smg_mk2', 10, 1, 0, 1),
('smokegrenade', 'smoke grenade', 20, 1, 0, 1),
('smokegrenade_ammo', 'smokegrenade_ammo', 100, 1, 0, 1),
('sniperrifle', 'PSG-1', 10, 1, 0, 1),
('sniper_ammo', 'Sniper Ammo', 100, 1, 0, 1),
('sniper_remote_ammo', 'Sniper Remote Ammo', 100, 1, 0, 1),
('snowball', 'Snow Ball', 10, 1, 0, 1),
('snspistol', 'H&K P7', 10, 1, 0, 1),
('snspistol_mk2', 'snspistol_mk2', 10, 1, 0, 1),
('specialcarbine', 'H&K G36C', 10, 1, 0, 1),
('specialcarbine_mk2', 'specialcarbine_mk2', 10, 1, 0, 1),
('stickybomb', 'sticky bomb', 20, 1, 0, 1),
('stickybomb_ammo', 'stickybomb_ammo', 100, 1, 0, 1),
('stinger', 'stinger', 10, 1, 0, 1),
('stinger_ammo', 'stinger_ammo', 100, 1, 0, 1),
('stungun', 'X26 Taser', 10, 1, 0, 1),
('stungun_ammo', 'Stungun Ammo', 100, 1, 0, 1),
('switchblade', 'Switchblade', 10, 1, 0, 1),
('thermite_bomb', 'Termit', 10, 1, 1, 1),
('umbrella', 'Parasol', 5, 1, 0, 1),
('vanBottle', 'Butla tequili', 1, 1, 0, 1),
('vanDiamond', 'Wielki Diament', 1, 1, 0, 1),
('vanNecklace', 'Zdobiony Naszyjnik', 1, 1, 0, 1),
('vanPanther', 'Pantera z diamentami', 1, 1, 0, 1),
('videorecord', 'Nagranie z porwania', 10, 1, 0, 1),
('vintagepistol', 'FN Model 1910', 10, 1, 0, 1),
('water', 'Woda', 200, 1, 0, 1),
('zapalniczka', 'Zapalniczka', 5, 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(46) NOT NULL,
  `jail_time` int(10) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'Pogotowie ratunkowe', 1),
('mecano', 'Mechanik', 1),
('offambulance', 'EMS - poza sluzba', 1),
('offmecano', ' LSC - poza sluzba', 1),
('offpolice', ' LSPD - poza sluzba', 1),
('police', 'LSPD', 1),
('unemployed', 'Bezrobotny', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Zasilek', 100, '{}', '{}'),
(123, 'ambulance', 0, 'ambulance', 'Stazysta', 200, '{}', '{}'),
(124, 'ambulance', 1, 'ambulance', 'Pielzgniarz', 200, '{}', '{}'),
(126, 'ambulance', 2, 'ambulance', 'Ratownik', 300, '{}', '{}'),
(129, 'ambulance', 3, 'doctor', 'Ratownik Medyczny', 400, '{}', '{}'),
(130, 'ambulance', 4, 'doctor', 'Lekarz', 500, '{}', '{}'),
(131, 'ambulance', 5, 'chief_doctor', 'Lekarz Specjalista', 600, '{}', '{}'),
(132, 'ambulance', 6, 'proffessor', 'Doktor', 700, '{}', '{}'),
(134, 'ambulance', 7, 'boss', 'Chirurg', 800, '{}', '{}'),
(135, 'ambulance', 8, 'boss', 'Zastepca Ordynatora', 900, '{}', '{}'),
(136, 'offambulance', 0, 'ambulance', 'Stazysta', 200, '{}', '{}'),
(137, 'offambulance', 1, 'ambulance', 'Pielzgniarz', 200, '{}', '{}'),
(139, 'offambulance', 2, 'ambulance', 'Ratownik', 300, '{}', '{}'),
(142, 'offambulance', 3, 'doctor', 'Ratownik Medyczny', 400, '{}', '{}'),
(143, 'offambulance', 4, 'doctor', 'Lekarz', 500, '{}', '{}'),
(144, 'offambulance', 5, 'chief_doctor', 'Lekarz Specjalista', 600, '{}', '{}'),
(145, 'offambulance', 6, 'proffessor', 'Doktor', 700, '{}', '{}'),
(147, 'offambulance', 7, 'boss', 'Chirurg', 800, '{}', '{}'),
(148, 'offambulance', 8, 'boss', 'Zastepca Ordynatora', 900, '{}', '{}'),
(223, 'police', 5, 'lieutenant', 'Sierzant II', 700, '{}', '{}'),
(224, 'police', 6, 'lieutenant', 'Sierzant III\n', 800, '{}', '{}'),
(226, 'police', 8, 'lieutenant', 'Porucznik II', 2500, '{}', '{}'),
(265, 'police', 3, 'officer', 'Officer III ', 500, '{}', '{}'),
(285, 'police', 13, 'boss', 'Szef LSPD', 100000, '{}', '{}'),
(287, 'police', 9, 'lieutenant', 'Porucznik III', 800, '{}', '{}'),
(296, 'police', 4, 'officer', 'Sierzant I', 500, '{}', '{}'),
(335, 'police', 7, 'lieutenant', 'Porucznik I', 800, '{}', '{}'),
(525, 'police', 11, 'boss', 'Kapitan II', 1000, '{}', '{}'),
(535, 'police', 10, 'boss', 'Kapitan I', 1000, '{}', '{}'),
(1180, 'mecano', 10, 'boss', 'Szef Zakladu Mechanicznego', 1000, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1181, 'mecano', 9, 'chief', 'Zastepca Szef', 1000, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1182, 'mecano', 8, 'chief', 'Kierownik', 900, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1183, 'mecano', 7, 'chief', 'Zastepca Kierownika', 900, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1184, 'mecano', 6, 'experimente', 'Menadzer', 800, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1185, 'mecano', 5, 'experimente', 'Szkoleniowiec', 700, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1186, 'mecano', 4, 'experimente', 'Starszy Mechanik', 600, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1187, 'mecano', 3, 'novice', 'Mechanik', 600, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1188, 'mecano', 2, 'novice', 'Mlodszy Mechanik', 500, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1189, 'mecano', 1, 'recrue', 'Sprzatacz', 500, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1190, 'mecano', 0, 'recrue', 'Praktykant', 400, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1191, 'offmecano', 10, 'boss', 'Szef Zakladu Mechanicznego', 1000, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1192, 'offmecano', 9, 'chief', 'Zastepca Szef', 1000, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1193, 'offmecano', 8, 'chief', 'Kierownik', 900, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1194, 'offmecano', 7, 'chief', 'Zastepca Kierownika', 900, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1195, 'offmecano', 6, 'experimente', 'Menadzer', 800, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1196, 'offmecano', 5, 'experimente', 'Szkoleniowiec', 700, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1197, 'offmecano', 4, 'experimente', 'Starszy Mechanik', 600, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1198, 'offmecano', 3, 'novice', 'Mechanik', 600, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1199, 'offmecano', 2, 'novice', 'Mlodszy Mechanik', 500, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1201, 'offmecano', 1, 'recrue', 'Sprzatacz', 500, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1202, 'offmecano', 0, 'recrue', 'Praktykant', 400, '{\\\"tshirt_1\\\":155,\\\"tshirt_2\\\":0,\\\"torso_1\\\":111,\\\"torso_2\\\":5,\\\"shoes_1\\\":62,\\\"shoes_2\\\":2,\\\"pants_1\\\":9, \\\"pants_2\\\":7, \\\"arms\\\":11, \\\"helmet_1\\\":11, \\\"helmet_2\\\":0,\\\"bags_1\\\":0,\\\"bags_2\\\":0,\\\"ears_1\\\":0,\\\"glasses_1\\\":0,\\\"ears_2\\\":0,\\\"glasses_2\\\":0}\',', '{}'),
(1335, 'offpolice', 7, 'lieutenant', 'Porucznik I', 800, '{}', '{}'),
(2123, 'offpolice', 5, 'lieutenant', 'Sierzant II', 700, '{}', '{}'),
(2126, 'offpolice', 8, 'lieutenant', 'Porucznik II', 2250, '{}', '{}'),
(2165, 'offpolice', 3, 'officer', 'Officer III ', 500, '{}', '{}'),
(2187, 'offpolice', 9, 'lieutenant', 'Porucznik III', 800, '{}', '{}'),
(2196, 'offpolice', 4, 'officer', 'Sierzant I', 500, '{}', '{}'),
(2222, 'police', 0, 'recruit', 'Kadet', 150, '{}', '{}'),
(2223, 'police', 1, 'officer', 'Oficer I', 500, '{}', '{}'),
(2334, 'police', 2, 'officer', 'Oficer II ', 500, '{}', '{}'),
(2344, 'police', 12, 'boss', 'Zastepca szefa LSPD', 1000, '{}', '{}'),
(2815, 'offpolice', 13, 'boss', 'Szef LSPD', 1000, '{}', '{}'),
(5125, 'offpolice', 11, 'boss', 'Kapitan II', 1000, '{}', '{}'),
(5135, 'offpolice', 10, 'boss', 'Kapitan I', 1000, '{}', '{}'),
(21124, 'offpolice', 6, 'lieutenant', 'Sierzant III\n', 800, '{}', '{}'),
(21334, 'offpolice', 2, 'officer', 'Oficer II', 500, '{}', '{}'),
(22212, 'offpolice', 0, 'Kadet', 'Kadet ', 150, '{}', '{}'),
(22213, 'offpolice', 1, 'officer', 'Oficer I', 500, '{}', '{}'),
(23144, 'offpolice', 12, 'boss', 'Zastepca szefa LSPD', 1000, '{}', '{}'),
(23354, 'ambulance', 9, 'boss', 'Ordynator', 1000, '{}', '{}'),
(23355, 'offambulance', 9, 'boss', 'Ordynator', 1000, '{}', '{}'),
(23385, 'offambulance', 10, 'boss', 'Szef EMS', 1000, '{}', '{}'),
(23386, 'ambulance', 10, 'boss', 'Szef EMS', 1000, '{}', '{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kartoteka`
--

CREATE TABLE `kartoteka` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `verdict` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `cop` varchar(128) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kartoteka_notatki`
--

CREATE TABLE `kartoteka_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `note` text NOT NULL,
  `policjant` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Lodz'),
('cabbage_processing', 'Cabbage Processing License'),
('dmv', 'Teoretyczny'),
('drive', 'Prawko B'),
('drive_bike', 'Prawko A'),
('drive_truck', 'Prawko C'),
('ems_insurance', 'Ubezpieczenie Zdrowotne'),
('gold_processing', 'Gold Processing License'),
('oc_insurance', 'Ubezpieczenie OC'),
('oil_processing', 'Oil Processing License'),
('sand_processing', 'Sand Processing License'),
('weapon', 'Licencja na bron'),
('weapon_long', 'Licencja na bron dluga');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_judgments_suggestion`
--

CREATE TABLE `lspd_mdc_judgments_suggestion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `length` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `showName` tinyint(1) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `lspd_mdc_judgments_suggestion`
--

INSERT INTO `lspd_mdc_judgments_suggestion` (`id`, `name`, `description`, `length`, `fee`, `categoryId`, `showName`) VALUES
(1, 'Przekroczenie prękości', 'Przekroczenie prękości', 0, 4000, 1, 0),
(2, 'Przejazd na czerownym świetle', 'Przejazd na czerownym świetle', 0, 1500, 1, 0),
(3, 'Parkowanie w miejscu nieprzeznaczonym do tego', 'Parkowanie w miejscu nieprzeznaczonym do tego', 0, 5000, 1, 0),
(4, 'Jazda bez prawa jazdy', 'Jazda bez prawa jazdy', 0, 5000, 1, 0),
(5, 'Nadmierne palenie gumy', 'Nadmierne palenie gumy', 0, 2000, 1, 0),
(6, 'Spowodowanie wypadku', 'Spowodowanie wypadku', 0, 3500, 1, 0),
(7, 'Poruszanie się pojazdem uszkodzonym', 'Poruszanie się pojazdem uszkodzonym', 0, 2500, 1, 0),
(8, 'Brawurowa jazda', 'Brawurowa jazda', 0, 8000, 1, 0),
(9, 'Kradzież radiowozu', 'Kradzież radiowozu', 20, 20000, 2, 0),
(10, 'Ucieczka przed policją', 'Ucieczka przed policją', 10, 20000, 2, 0),
(11, 'Kradzież pojazdu', 'Kradzież pojazdu', 10, 10000, 2, 0),
(12, 'Wtargnięcie na teren ograniczonego dostępu', 'Wtargnięcie na teren ograniczonego dostępu', 0, 20000, 2, 0),
(13, 'Fałszywe zgłoszenie', 'Fałszywe zgłoszenie', 0, 2000, 2, 0),
(14, 'Chodzenie zamaskowanym po mieście', 'Chodzenie zamaskowanym po mieście', 0, 5000, 2, 0),
(15, 'Niszczenie mienia', 'Niszczenie mienia', 0, 4500, 2, 0),
(16, 'Niewykonywanie poleceń FP', 'Niewykonywanie poleceń FP', 10, 2000, 2, 0),
(17, 'Obraza FP', 'Obraza FP', 10, 6000, 2, 0),
(18, 'Utrudnianie pracy EMS lub LSPD', 'Utrudnianie pracy EMS lub LSPD', 5, 1500, 2, 0),
(19, 'Próba przekupstwa', 'Próba przekupstwa', 15, 5000, 2, 0),
(20, 'Składanie fałszywych zeznań', 'Składanie fałszywych zeznań', 20, 20000, 2, 0),
(21, 'Prowokowanie policji', 'Prowokowanie policji', 5, 10000, 2, 0),
(22, 'Morderstwo', 'Morderstwo', 600, 5000000, 3, 0),
(23, 'Usiłowanie zabójstwa FP / EMS', 'Usiłowanie zabójstwa FP / EMS', 40, 40000, 3, 0),
(24, 'Usiłowanie zabójstwa cywila', 'Usiłowanie zabójstwa cywila', 20, 30000, 3, 0),
(25, 'Napaść na FP', 'Napaść na FP', 25, 20000, 3, 0),
(26, 'Napaść na cywila', 'Napaść na cywila', 15, 10000, 3, 0),
(27, 'Groźby utraty życia lub zdrowia', 'Groźby utraty życia lub zdrowia', 5, 5000, 3, 0),
(28, 'Groźby bronią palną', 'Groźby bronią palną', 15, 18000, 3, 0),
(29, 'Niebezpieczna broń biała', 'Niebezpieczna broń biała', 10, 40000, 4, 0),
(30, 'Bezpodstawne użycie broni palnej', 'Bezpodstawne użycie broni palnej', 10, 50000, 4, 0),
(31, 'Posiadanie broni legalnej bez licencji', 'Posiadanie broni legalnej bez licencji', 20, 30000, 4, 0),
(32, 'Posiadanie nielegalnej broni kl.1', 'Posiadanie nielegalnej broni kl.1', 25, 40000, 4, 0),
(33, 'Posiadanie nielegalnej broni kl.2', 'Posiadanie nielegalnej broni kl.2', 60, 90000, 4, 0),
(34, 'Napad na kasetke w sklepie', 'Napad na kasetke w sklepie', 20, 30000, 5, 0),
(35, 'Napad na Jubilera', 'Napad na Jubilera', 30, 50000, 5, 0),
(36, 'Napad na Flecca', 'Napad na Flecca', 55, 80000, 5, 0),
(37, 'Napad na Bank Główny', 'Napad na Bank Główny', 70, 120000, 5, 0),
(38, 'Napad na Jacht', 'Napad na Jacht', 100, 150000, 5, 0),
(39, 'Napad na Humane Labs', 'Napad na Humane Labs', 120, 200000, 5, 0),
(40, 'Kierowanie grupą przestępcza', 'Kierowanie grupą przestępcza', 200, 500000, 6, 0),
(41, 'Członkostwo w grupie przestępczej', 'Członkostwo w grupie przestępczej', 150, 250000, 6, 0),
(42, 'Porwanie cywila', 'Porwanie cywila', 20, 12500, 6, 0),
(43, 'Porwanie FP / Medyka', 'Porwanie FP / Medyka', 40, 25000, 6, 0),
(44, 'Współudział w przestępstwie', 'Współudział w przestępstwie', 30, 40000, 6, 0),
(45, 'Odbicie konwoju ', 'Odbicie konwoju ', 60, 60000, 6, 0),
(46, 'Terroryzm', 'Terroryzm', 500, 5000000, 6, 0),
(47, 'Posiadanie narkotyków miękkich (Marichuana powyżej 5g)', 'Posiadanie narkotyków miękkich (Marichuana powyżej 5g)', 7, 7500, 7, 0),
(48, 'Posiadanie narkotyków twardych', 'Posiadanie narkotyków twardych', 13, 20000, 7, 0),
(49, 'Posiadanie kontrabandy (Do 50000$)', 'Posiadanie kontrabandy (Do 50000$)', 15, 35000, 7, 0),
(50, 'Posiadanie kontrabandy (Do 100000$)', 'Posiadanie kontrabandy (Do 100000$)', 15, 70000, 7, 0),
(51, 'Posiadanie kontrabandy (Do 500000$)', 'Posiadanie kontrabandy (Do 500000$)', 15, 250000, 7, 0),
(52, 'Posiadanie kontrabandy (Od 1000000$)', 'Posiadanie kontrabandy (Od 1000000$)', 15, 500000, 7, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_judgments_suggestion_category`
--

CREATE TABLE `lspd_mdc_judgments_suggestion_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `lspd_mdc_judgments_suggestion_category`
--

INSERT INTO `lspd_mdc_judgments_suggestion_category` (`id`, `name`, `color`) VALUES
(1, 'Ruch drogowy', 'blue'),
(2, 'Wykroczenia', 'dodgerblue'),
(3, 'Utrata życia lub zdrowia', 'red'),
(4, 'Posiadanie broni', 'orange'),
(5, 'Napady', 'purple'),
(6, 'Grupa przestępcza oraz porwania', 'red'),
(7, 'Narkotyki oraz kontrabanda', 'green');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_tag_suggestion`
--

CREATE TABLE `lspd_mdc_tag_suggestion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_user_notes`
--

CREATE TABLE `lspd_mdc_user_notes` (
  `id` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `addedBy` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `lspd_mdc_user_notes`
--

INSERT INTO `lspd_mdc_user_notes` (`id`, `userId`, `text`, `addedBy`, `date`) VALUES
(0, 'steam:110000117fd6eb4', 'Poszukiwany', 'Christopher Camaro (LSPD - Szef LSPD)', '2022-05-24 18:03:27'),
(0, 'steam:1100001358d8ba2', 'ezzz wesew', 'David Tibiski (LSPD - Kapitan I)', '2022-06-10 17:09:04');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_mdc_vehicle_notes`
--

CREATE TABLE `lspd_mdc_vehicle_notes` (
  `id` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `addedBy` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lspd_user_judgments`
--

CREATE TABLE `lspd_user_judgments` (
  `id` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `crimes` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `note` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `addedBy` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `length` int(10) DEFAULT NULL,
  `fee` int(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `lspd_user_judgments`
--

INSERT INTO `lspd_user_judgments` (`id`, `userId`, `crimes`, `note`, `addedBy`, `length`, `fee`, `date`) VALUES
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'Parkowanie w miejscu nieprzeznaczonym do tego x1 | Przejazd na czerownym świetle x1 | Nadmierne palenie gumy x1 | Brawurowa jazda x1 | Poruszanie się pojazdem uszkodzonym x1 | ez x1 | 1--', '', 'David Mokotowski', 1, 19000, '2022-06-12 06:11:37'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'Parkowanie w miejscu nieprzeznaczonym do tego x1 | Współudział w przestępstwie x8 | Członkostwo w grupie przestępczej x3 | 1075000', '', 'David Mokotowski', 690, 1075000, '2022-06-12 06:16:40'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'Posiadanie kontrabandy (Od 1000000$) x6 | ez', '', 'David Mokotowski', 90, 3000000, '2022-06-12 06:20:12'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 1, 98599275, '2022-06-12 06:27:48'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 1, 98599275, '2022-06-12 06:29:44'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 1, 2000000000, '2022-06-12 06:33:19'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 1, 2147483647, '2022-06-12 06:35:06'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '2000000000 x1 | ', '', 'David Mokotowski', 0, 2000000000, '2022-06-12 06:37:11'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 0, 12343564, '2022-06-12 06:38:23'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '1000000 x1 | ', '', 'David Mokotowski', 1, 1000000, '2022-06-12 06:46:35'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ', '', 'David Mokotowski', 1, 100000, '2022-06-12 07:00:23'),
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', 'ez x1 | ez', '', 'David Mokotowski', 1, 1000000, '2022-06-12 07:10:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `multicharacter_slots`
--

CREATE TABLE `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `multicharacter_slots`
--

INSERT INTO `multicharacter_slots` (`identifier`, `slots`) VALUES
('steam:1100001358d8ba2', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odznaka`
--

CREATE TABLE `odznaka` (
  `id` int(255) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `callsign` varchar(255) NOT NULL,
  `odznaka` varchar(255) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `odznaka`
--

INSERT INTO `odznaka` (`id`, `identifier`, `callsign`, `odznaka`) VALUES
(3, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '10', '10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_keys`
--

CREATE TABLE `owned_keys` (
  `owner` varchar(46) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `shared` varchar(60) DEFAULT NULL,
  `arleady_owned` int(11) NOT NULL DEFAULT 0,
  `co_owner1` varchar(60) DEFAULT NULL,
  `co_owner2` varchar(60) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `owned_properties`
--

INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`, `shared`, `arleady_owned`, `co_owner1`, `co_owner2`) VALUES
(0, 'HillcrestAvenue2862', 1500000, 0, 'steam:1100001358d8ba2', NULL, 0, NULL, NULL),
(0, 'MadWayneThunder', 1500000, 0, 'Char2:1100001358d8ba2', NULL, 0, NULL, NULL),
(0, 'MadWayneThunder', 1500000, 0, 'Char3:1100001358d8ba2', NULL, 0, NULL, NULL),
(0, 'TinselTowersApt12', 1700000, 0, 'steam:1100001058d18af', NULL, 0, NULL, NULL),
(0, 'WildOatsDrive', 1500000, 0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, 0, NULL, NULL),
(0, 'HillcrestAvenue2862', 1500000, 0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(55) NOT NULL,
  `owner` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `owner_type` int(2) NOT NULL DEFAULT 1,
  `state` int(4) NOT NULL DEFAULT 0,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicleid` int(11) DEFAULT NULL,
  `model` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `zlom` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `zlomed` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `lasthouse` int(11) DEFAULT 0,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `job` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `stored` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `police_vehicles`
--

CREATE TABLE `police_vehicles` (
  `id` int(55) NOT NULL,
  `owner` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `owner_type` int(2) NOT NULL DEFAULT 1,
  `state` int(4) NOT NULL DEFAULT 0,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `job` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `stored` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 25),
(2, 'TwentyFourSeven', 'water', 25),
(3, 'TwentyFourSeven', 'cocacola', 35),
(4, 'TwentyFourSeven', 'fanta', 35),
(5, 'TwentyFourSeven', 'wodka', 75),
(6, 'TwentyFourSeven', 'whisky', 125),
(7, 'TwentyFourSeven', 'wino', 50),
(8, 'TwentyFourSeven', 'banan', 30),
(9, 'TwentyFourSeven', 'chips', 30),
(10, 'TwentyFourSeven', 'babeczka', 30),
(11, 'TwentyFourSeven', 'czekolada', 30),
(12, 'TwentyFourSeven', 'hamburger', 40),
(13, 'TwentyFourSeven', 'energetyk', 150),
(14, 'RobsLiquor', 'bread', 25),
(15, 'RobsLiquor', 'water', 25),
(16, 'RobsLiquor', 'cocacola', 35),
(17, 'RobsLiquor', 'fanta', 35),
(18, 'RobsLiquor', 'wodka', 75),
(19, 'RobsLiquor', 'whisky', 125),
(20, 'RobsLiquor', 'wino', 75),
(21, 'RobsLiquor', 'banan', 30),
(22, 'RobsLiquor', 'chips', 30),
(23, 'RobsLiquor', 'babeczka', 30),
(24, 'RobsLiquor', 'czekolada', 30),
(25, 'RobsLiquor', 'hamburger', 40),
(26, 'RobsLiquor', 'energetyk', 150),
(27, 'LTDgasoline', 'bread', 25),
(28, 'LTDgasoline', 'water', 25),
(29, 'LTDgasoline', 'cocacola', 35),
(30, 'LTDgasoline', 'fanta', 35),
(31, 'LTDgasoline', 'wodka', 75),
(32, 'LTDgasoline', 'whisky', 125),
(33, 'LTDgasoline', 'wino', 50),
(34, 'LTDgasoline', 'banan', 30),
(35, 'LTDgasoline', 'chips', 30),
(36, 'LTDgasoline', 'babeczka', 30),
(37, 'LTDgasoline', 'czekolada', 30),
(38, 'LTDgasoline', 'hamburger', 40),
(39, 'LTDgasoline', 'energetyk', 150),
(40, 'Techniczny', 'fixkit', 12500),
(41, 'WeaponShop', 'pistol', 50000),
(42, 'WeaponShop', 'pistol_ammo_box', 7500),
(43, 'DarkShop', 'pistol', 125000),
(44, 'DarkShop', 'pistol_ammo_box', 10000),
(45, 'Multimedialny', 'phone', 1000),
(46, 'TwentyFourSeven', 'scratchcardgold', 17500),
(47, 'RobsLiquor', 'scratchcardgold', 17500),
(48, 'LTDgasoline', 'scratchcardgold', 17500),
(49, 'Techniczny', 'handcuffs', 12500),
(50, 'Techniczny', 'phone', 1000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sim`
--

CREATE TABLE `sim` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `number` varchar(555) NOT NULL,
  `label` varchar(555) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `property` varchar(50) DEFAULT NULL,
  `used` varchar(50) DEFAULT '0'
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sim`
--

INSERT INTO `sim` (`id`, `identifier`, `number`, `label`, `owner`, `property`, `used`) VALUES
(0, 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '7594818', 'Karta SIM - #7594818', 'char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, '0'),
(0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '7618713', 'Karta SIM - #7618713', 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, '0'),
(0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '8937347', 'Karta SIM - #8937347', 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, '0'),
(0, 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '2539459', 'Karta SIM - #2539459', 'char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', NULL, '0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tablet_accounts`
--

CREATE TABLE `tablet_accounts` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `identifier` varchar(46) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tablet_notatki`
--

CREATE TABLE `tablet_notatki` (
  `identifier` varchar(46) DEFAULT NULL,
  `notatka` text DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tablet_ogloszenia`
--

CREATE TABLE `tablet_ogloszenia` (
  `id` int(11) NOT NULL,
  `ogloszenie` text NOT NULL,
  `policjant` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tablet_ogloszenia_seen`
--

CREATE TABLE `tablet_ogloszenia_seen` (
  `identifier` varchar(46) DEFAULT NULL,
  `seen` tinyint(1) DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tablet_raporty`
--

CREATE TABLE `tablet_raporty` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `raport` text NOT NULL,
  `policjant` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-1213.72,"y"-191.010,"z":39.322,"heading":56.69}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kartoteka_avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `armour` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `health` tinyint(3) UNSIGNED NOT NULL DEFAULT 200,
  `tattoos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `wyborequ` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'true',
  `ped` varchar(255) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `phone_number`, `license`, `name`, `avatar`, `kartoteka_avatar`, `jail`, `armour`, `health`, `tattoos`, `wyborequ`, `ped`) VALUES
('char1:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{\"bank\":9984925,\"money\":99998860000,\"black_money\":0}', 'admin', '{\"bread\":1099993,\"pistol\":1,\"pistol_ammo\":959,\"smg\":1,\"parachute\":1}', 'ambulance', 9, '[]', '{\"heading\":332.1,\"x\":368.0,\"y\":-688.5,\"z\":29.3}', 'David', 'Tibiski', '11/11/1999', 'm', 189, '{\"bodyb_3\":-1,\"pants_2\":0,\"lipstick_1\":0,\"bodyb_2\":0,\"bodyb_1\":-1,\"blemishes_1\":0,\"skin_md_weight\":50,\"jaw_2\":0,\"chest_3\":0,\"eyebrows_1\":0,\"sex\":0,\"beard_4\":0,\"chest_1\":0,\"eye_squint\":0,\"pants_1\":0,\"chin_2\":0,\"eyebrows_4\":0,\"nose_2\":0,\"eyebrows_6\":0,\"helmet_1\":-1,\"tshirt_2\":0,\"chest_2\":0,\"hair_1\":0,\"cheeks_3\":0,\"helmet_2\":0,\"shoes_1\":0,\"decals_1\":0,\"nose_3\":0,\"makeup_4\":0,\"makeup_3\":0,\"lipstick_4\":0,\"lipstick_2\":0,\"makeup_1\":0,\"chin_3\":0,\"chain_1\":0,\"bracelets_1\":-1,\"bags_2\":0,\"neck_thickness\":0,\"bracelets_2\":0,\"blush_3\":0,\"chin_13\":0,\"ears_2\":0,\"moles_1\":0,\"chin_1\":0,\"bproof_1\":0,\"mom\":21,\"bproof_2\":0,\"mask_1\":0,\"torso_2\":0,\"watches_2\":0,\"nose_4\":0,\"hair_2\":0,\"tshirt_1\":0,\"lip_thickness\":0,\"hair_color_2\":0,\"eyebrows_2\":0,\"beard_2\":0,\"makeup_2\":0,\"blush_2\":0,\"chain_2\":0,\"arms_2\":0,\"cheeks_2\":0,\"moles_2\":0,\"face_md_weight\":50,\"arms\":0,\"dad\":0,\"ears_1\":-1,\"blemishes_2\":0,\"bodyb_4\":0,\"sun_2\":0,\"jaw_1\":0,\"nose_5\":0,\"torso_1\":0,\"complexion_2\":0,\"cheeks_1\":0,\"nose_1\":0,\"eye_color\":0,\"complexion_1\":0,\"nose_6\":0,\"beard_3\":0,\"lipstick_3\":0,\"beard_1\":0,\"glasses_1\":0,\"chin_4\":0,\"hair_color_1\":0,\"sun_1\":0,\"eyebrows_3\":0,\"shoes_2\":0,\"decals_2\":0,\"glasses_2\":0,\"mask_2\":0,\"age_1\":0,\"blush_1\":0,\"watches_1\":-1,\"bags_1\":0,\"eyebrows_5\":0,\"age_2\":0}', '[{\"name\":\"hunger\",\"percent\":58.30555555555556,\"val\":1049500},{\"name\":\"thirst\",\"percent\":58.30555555555556,\"val\":1049500},{\"name\":\"drunk\",\"percent\":0.0,\"val\":0}]', 0, 0, 0, NULL, NULL, NULL, '', NULL, NULL, 0, 0, 200, '', 'true', ''),
('char2:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{\"money\":0,\"bank\":10000100,\"black_money\":0}', 'admin', '[]', 'unemployed', 0, '[]', '{\"z\":39.2,\"heading\":219.8,\"x\":-1214.2,\"y\":-191.5}', 'David', 'TinbiskiW', '11/11/1999', 'm', 189, '{\"age_2\":0,\"hair_1\":0,\"sun_2\":0,\"glasses_1\":0,\"beard_4\":0,\"decals_2\":0,\"shoes_2\":0,\"blemishes_2\":0,\"complexion_1\":0,\"nose_1\":0,\"torso_2\":0,\"ears_2\":0,\"helmet_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"eyebrows_4\":0,\"tshirt_1\":0,\"nose_5\":0,\"cheeks_3\":0,\"lipstick_2\":0,\"bodyb_1\":-1,\"chin_1\":0,\"bracelets_2\":0,\"blush_2\":0,\"nose_3\":0,\"nose_6\":0,\"sex\":0,\"jaw_1\":0,\"chin_4\":0,\"hair_color_2\":0,\"jaw_2\":0,\"bags_1\":0,\"decals_1\":0,\"moles_1\":0,\"complexion_2\":0,\"torso_1\":0,\"blemishes_1\":0,\"blush_1\":0,\"tshirt_2\":0,\"nose_2\":0,\"chest_3\":0,\"chin_2\":0,\"pants_2\":0,\"cheeks_1\":0,\"mask_1\":0,\"chain_1\":0,\"eye_squint\":0,\"beard_2\":0,\"blush_3\":0,\"pants_1\":0,\"beard_3\":0,\"eyebrows_3\":0,\"skin_md_weight\":50,\"helmet_1\":-1,\"chin_13\":0,\"bracelets_1\":-1,\"shoes_1\":0,\"chin_3\":0,\"beard_1\":0,\"makeup_1\":0,\"lip_thickness\":0,\"dad\":0,\"moles_2\":0,\"face_md_weight\":50,\"bodyb_3\":-1,\"nose_4\":0,\"watches_1\":-1,\"arms\":0,\"bags_2\":0,\"mom\":21,\"glasses_2\":0,\"ears_1\":-1,\"hair_color_1\":0,\"chest_2\":0,\"eye_color\":0,\"eyebrows_6\":0,\"eyebrows_2\":0,\"neck_thickness\":0,\"bproof_1\":0,\"lipstick_3\":0,\"sun_1\":0,\"makeup_2\":0,\"arms_2\":0,\"chain_2\":0,\"cheeks_2\":0,\"mask_2\":0,\"bodyb_2\":0,\"hair_2\":0,\"bodyb_4\":0,\"chest_1\":0,\"age_1\":0,\"lipstick_4\":0,\"watches_2\":0,\"bproof_2\":0,\"eyebrows_5\":0,\"eyebrows_1\":0,\"makeup_3\":0}', '[{\"name\":\"hunger\",\"val\":1705500,\"percent\":94.75},{\"name\":\"thirst\",\"val\":1705500,\"percent\":94.75},{\"name\":\"drunk\",\"val\":0,\"percent\":0.0}]', 0, 0, 0, NULL, NULL, NULL, '', NULL, NULL, 0, 0, 200, '', 'true', 'none'),
('char3:89d949272b0cf738a59a943e19226ce5b8fa8fe7', '{\"black_money\":0,\"bank\":10000300,\"money\":0}', 'admin', '[]', 'unemployed', 0, '[]', 'null', 'David', 'Mokotowski', '11/11/1978', 'm', 167, '{\"hair_1\":0,\"beard_1\":0,\"lipstick_4\":0,\"beard_4\":0,\"eye_squint\":0,\"sex\":0,\"chin_1\":0,\"sun_1\":0,\"lipstick_1\":0,\"bproof_1\":0,\"lipstick_3\":0,\"lipstick_2\":0,\"eyebrows_5\":0,\"nose_5\":0,\"beard_3\":0,\"makeup_2\":0,\"face_md_weight\":50,\"age_1\":0,\"bags_2\":0,\"cheeks_2\":0,\"eyebrows_2\":0,\"eye_color\":0,\"chest_2\":0,\"watches_2\":0,\"age_2\":0,\"glasses_1\":0,\"glasses_2\":0,\"eyebrows_1\":0,\"chin_13\":0,\"sun_2\":0,\"arms\":0,\"eyebrows_6\":0,\"cheeks_1\":0,\"eyebrows_4\":0,\"bodyb_1\":-1,\"beard_2\":0,\"pants_2\":0,\"chest_3\":0,\"mask_1\":0,\"bracelets_2\":0,\"ears_1\":-1,\"blush_1\":0,\"makeup_3\":0,\"torso_2\":0,\"watches_1\":-1,\"bodyb_2\":0,\"complexion_1\":0,\"torso_1\":0,\"pants_1\":0,\"chin_4\":0,\"bproof_2\":0,\"bags_1\":0,\"tshirt_1\":0,\"nose_6\":0,\"cheeks_3\":0,\"blemishes_1\":0,\"nose_2\":0,\"jaw_1\":0,\"nose_4\":0,\"chain_2\":0,\"nose_1\":0,\"skin_md_weight\":50,\"decals_2\":0,\"neck_thickness\":0,\"tshirt_2\":0,\"ears_2\":0,\"nose_3\":0,\"chain_1\":0,\"blush_3\":0,\"arms_2\":0,\"dad\":0,\"blush_2\":0,\"shoes_2\":0,\"helmet_1\":-1,\"moles_1\":0,\"decals_1\":0,\"jaw_2\":0,\"hair_2\":0,\"helmet_2\":0,\"makeup_4\":0,\"lip_thickness\":0,\"eyebrows_3\":0,\"moles_2\":0,\"blemishes_2\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"shoes_1\":0,\"mom\":21,\"chin_2\":0,\"bracelets_1\":-1,\"bodyb_4\":0,\"bodyb_3\":-1,\"chin_3\":0,\"mask_2\":0,\"makeup_1\":0,\"complexion_2\":0,\"chest_1\":0}', '[{\"name\":\"hunger\",\"percent\":85.48611111111112,\"val\":1538750},{\"name\":\"thirst\",\"percent\":85.48611111111112,\"val\":1538750},{\"name\":\"drunk\",\"percent\":0.0,\"val\":0}]', 0, 0, 0, NULL, NULL, NULL, '', NULL, NULL, 0, 0, 200, '', 'true', 'none');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_kartoteka`
--

CREATE TABLE `user_kartoteka` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policjant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `powod` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grzywna` int(11) DEFAULT NULL,
  `ilosc_lat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_lastcharacter`
--

CREATE TABLE `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_lastcharacter`
--

INSERT INTO `user_lastcharacter` (`steamid`, `charid`) VALUES
('steam:1100001358d8ba2', 1),
('steam:1100001058d18af', 1),
('steam:11000010e5c6b62', 1),
('steam:110000117fd6eb4', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `time` int(50) NOT NULL DEFAULT -1
) ENGINE=Aria DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `label`, `type`, `owner`, `time`) VALUES
(1, NULL, 'dmv', 'steam:1100001358d8ba2', -1),
(2, NULL, 'dmv', 'steam:1100001358d8ba2', -1),
(3, NULL, 'dmv', 'steam:1100001358d8ba2', -1),
(4, NULL, 'dmv', 'steam:1100001358d8ba2', -1),
(5, NULL, 'dmv', 'steam:1100001358d8ba2', -1),
(6, NULL, 'dmv', 'steam:1100001358d8ba2', -1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_poszukiwania`
--

CREATE TABLE `user_poszukiwania` (
  `identifier` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policjant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `powod` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pojazd` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_properties`
--

CREATE TABLE `user_properties` (
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 35000, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 120000, 'motorcycles'),
('Bati 801RR', 'bati2', 190000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 550000, 'sports'),
('BF400', 'bf400', 65000, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('Blista', 'blista', 12000, 'compacts'),
('BMX (velo)', 'bmx', 1600, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 50000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 120000, 'sports'),
('Buffalo S', 'buffalo2', 200000, 'sports'),
('Bullet', 'bullet', 180000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 80000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sportsclassics'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 400000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Stretch', 'stretch', 90000, 'sedans'),
('Sultan', 'sultan', 150000, 'sports'),
('Sultan RS', 'sultanrs', 350000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 450000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sportsclassics'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Voltic', 'voltic', 90000, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 20000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Moto'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVY'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_properties`
--

CREATE TABLE `vehicle_properties` (
  `vehicleId` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `imglink` longtext DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `nazwa`, `price`, `imglink`) VALUES
(1, 'GunShop', 'pistol', 'Pistolet', 95000, ''),
(2, 'GunShop', 'snspistol', 'SnsPistol', 85000, ''),
(2, 'GunShop', 'ammmoboxpistol', 'Pudełko Amunicji', 1500, '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indeksy dla tabeli `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indeksy dla tabeli `anticheat`
--
ALTER TABLE `anticheat`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeksy dla tabeli `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`);

--
-- Indeksy dla tabeli `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indeksy dla tabeli `donators`
--
ALTER TABLE `donators`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeksy dla tabeli `gb_banking`
--
ALTER TABLE `gb_banking`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeksy dla tabeli `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kartoteka`
--
ALTER TABLE `kartoteka`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeksy dla tabeli `kartoteka_notatki`
--
ALTER TABLE `kartoteka_notatki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indeksy dla tabeli `multicharacter_slots`
--
ALTER TABLE `multicharacter_slots`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `slots` (`slots`) USING BTREE;

--
-- Indeksy dla tabeli `odznaka`
--
ALTER TABLE `odznaka`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `owned_keys`
--
ALTER TABLE `owned_keys`
  ADD PRIMARY KEY (`owner`);

--
-- Indeksy dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tablet_ogloszenia`
--
ALTER TABLE `tablet_ogloszenia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tablet_raporty`
--
ALTER TABLE `tablet_raporty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indeksy dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indeksy dla tabeli `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_kartoteka`
--
ALTER TABLE `user_kartoteka`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indeksy dla tabeli `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT dla tabeli `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT dla tabeli `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `gb_banking`
--
ALTER TABLE `gb_banking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23387;

--
-- AUTO_INCREMENT dla tabeli `kartoteka`
--
ALTER TABLE `kartoteka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `kartoteka_notatki`
--
ALTER TABLE `kartoteka_notatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `odznaka`
--
ALTER TABLE `odznaka`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `tablet_ogloszenia`
--
ALTER TABLE `tablet_ogloszenia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tablet_raporty`
--
ALTER TABLE `tablet_raporty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT dla tabeli `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `user_kartoteka`
--
ALTER TABLE `user_kartoteka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
