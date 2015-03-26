-- phpMyAdmin SQL Dump
-- version 4.1.13
-- http://www.phpmyadmin.net
--
-- Hoszt: 127.0.0.1
-- Létrehozás ideje: 2015. Már 26. 08:26
-- Szerver verzió: 5.5.27
-- PHP verzió: 5.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `szervizmunkalap`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munkalapok`
--

CREATE TABLE IF NOT EXISTS `munkalapok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cim` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `hibaleiras` text COLLATE utf8_hungarian_ci,
  `eszkozok` text COLLATE utf8_hungarian_ci,
  `ugyfel_id` int(11) NOT NULL,
  `bejelentes_ideje` datetime NOT NULL,
  `felvette` int(11) NOT NULL,
  `javitas_kezdete` datetime DEFAULT NULL,
  `javito` int(11) DEFAULT NULL,
  `javitas_befejezese` datetime DEFAULT NULL,
  `javitas_leirasa` text COLLATE utf8_hungarian_ci,
  `ar` int(11) DEFAULT NULL,
  `atvetel_ideje` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ugyfel_id` (`ugyfel_id`),
  KEY `felvette` (`felvette`),
  KEY `javito` (`javito`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci AUTO_INCREMENT=9 ;

--
-- A tábla adatainak kiíratása `munkalapok`
--

INSERT INTO `munkalapok` (`id`, `cim`, `hibaleiras`, `eszkozok`, `ugyfel_id`, `bejelentes_ideje`, `felvette`, `javitas_kezdete`, `javito`, `javitas_befejezese`, `javitas_leirasa`, `ar`, `atvetel_ideje`) VALUES
(1, 'Alaplaphibas szamitogep', 'rendszeresen ujraindul', 'asus x110 pro ultimate ', 1, '2015-03-02 09:15:00', 1, '2015-03-23 10:59:53', 1, NULL, NULL, NULL, NULL),
(2, 'képhibas laptop', 'a gep mukodik de nem ad kepet ', 'acer 1660xy laptop', 2, '2015-02-27 13:22:00', 1, '2015-03-02 08:00:00', 1, '2015-03-23 10:59:24', 'kabel nem volt jo ', 12000, '2015-03-23 10:59:46'),
(3, 'memoria bovites ', '+4gb ram telepitese ', 'asztali pc comodor', 2, '2015-03-02 09:00:00', 1, '2015-03-02 09:29:00', 1, '2015-03-02 11:00:00', 'tesztelve es mukodokepes alapotban', 8000, '2015-03-23 10:03:50'),
(4, 'nyomtato patron csere', NULL, 'hp laser jet x660', 1, '2015-02-25 10:00:00', 1, '2015-02-26 12:00:00', 1, '2015-02-26 17:00:00', 'patron kicserelve', 16000, '2015-03-27 14:00:00'),
(6, 'Hibás hdd csere', '10% csere', 'hdd', 1, '2015-03-18 11:04:02', 1, '2015-03-23 10:01:43', 1, NULL, NULL, NULL, NULL),
(7, 'ram hibás laptop ', 'asdasf', 'afasd', 2, '2015-03-25 15:16:31', 1, '2015-03-25 15:27:27', 1, NULL, NULL, NULL, NULL),
(8, 'asd', 'asdas', 'dasd', 1, '2015-03-25 15:34:23', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `text` text COLLATE utf8_hungarian_ci NOT NULL,
  `date` date NOT NULL,
  `lead` varchar(200) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci AUTO_INCREMENT=3 ;

--
-- A tábla adatainak kiíratása `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `date`, `lead`) VALUES
(1, '15% leárazások', 'A Best-Comp szervizhálózata minden best-comp Szakszervezeti tag részére kedvezményeket nyújt.\r\n\r\nA kedvezmény mértéke szerviz igénybevétele esetén 15%.\r\n\r\nSzámítógép, nyomtató és egyéb informatikai eszköz vásárlása esetén 8% kedvezményt tudunk adni árainkból.', '2015-02-10', ''),
(2, 'Itt minden eszközt meg Javítunk', 'Jöjjenek be bátran minden ügyfelet boldogan várunk, akár milyen problémával', '2015-02-19', 'PÉK');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `realid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `text` text COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`realid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci AUTO_INCREMENT=3 ;

--
-- A tábla adatainak kiíratása `pages`
--

INSERT INTO `pages` (`realid`, `id`, `title`, `text`) VALUES
(1, 'kapcsolat', 'Kapcsolat', 'Braun Péter <br>\n<br>\ntel: 06202926962 <br>\n<br>\n\nfax: 06820222626 <br>\n <br>\ne-mail: Peti1021@hotmail.com<br>\n<br>\nItt találhatóak az elérhetőségeim, ha gondjuk akadna nyugodtan hívjanak/írjanak.'),
(2, 'bemutatkozas', 'Bemutatkozás', 'Kedves Látogató,\r\n\r\nElőször is üdvözöljük a Best-Comp Számítástechnikai üzletek honlapján! Tevékenységünk kezdete 2001-re tevődik, amióta számítástechnikai szaktudásunk egyre bővült és bővül. Jelenleg a 2004-ben alapult Dankó és Fia Mérnöki Iroda Kft. üzemelteti a Best-Comp üzleteket, mely egy építőipari és számítástechnikai cég. Az üzletek 2007-től működnek Best-Comp néven, és reméljük termékeink, illetve szolgáltatásaink által elnyerhetjük bizalmát és öregbíthetjük ezt a nevet.\r\n\r\nA kezdetekben csak használt, Nyugat-Európából importált márkás, minőségi számítógépekkel, monitorokkal, nyomtatókkal, notebookokkal, alkatrészekkel foglalkoztunk, de egyre inkább felmerült az új alkatrészekre való igény is, melynek eredményeképpen ma már boltonként több száz termék található raktáron. Jelenleg használt és új termékeket is forgalmazunk, melyet azért kedvelnek különösen az Ügyfeleink, mert fenntarthatják maguknak a választási lehetőséget, hogy a használt pénztárcakímélő, de mégis minőségi megoldást, vagy a drágább, de teljesen új megoldást választják, vagy a kettőt kombinálják. Például egy új számítógép + használt monitor kombináción több tízezer forintot azonnal megspórolhatnak. Másik előnye a használt és új termékek egy helyen való forgalmazásának, hogy a használt termékeket beszámítjuk új termékekbe, mely által ugyancsak akár több tízezer forint takarítható meg. Ha anyagi akadályok merülnek fel, akkor is megoldjuk a gépcserét, a használt eszközöket megvesszük, és ez az összeg lesz a saját erő az áruhitelből, így akár kezdőbefizetés nélkül is elviheti új számítógépét!\r\n\r\nCégünk lakossági, közszolgálati (iskolák, kisebb hivatalok) illetve kis,- és középvállalati szinten kínál megoldásokat. Szlogenünk "számítástechnika a legjavából", mely arra utal, hogy Ügyfeleink számára folyamatosan olyan megoldásokat keresünk, melyek eredményeképpen elérhetik számítástechnikai céljaikat a lehető legjobb minőségben, de a lehető legalacsonyabb áron. Ilyen volt például a TP-LINK hálózati termékek felfedezése és tesztelése, mely eszközöket az Ügyfeleknek 5 év teljes körű garanciával, az egyéb márkák piaci árszínvonala alatt kínálunk.\r\nTehát információ és tapasztalatszerzésünkkel kiküszöböljük termékpalettánkról a problémás márkákat vagy termékeket, ugyanakkor megőrizzük a nagy márkák mellett a bevált minőségű, de reklámokból még nem ismert eszközöket is, utat nyitva ezzel a pénztárcakímélő lehetőségeknek.\r\n\r\nSzolgáltatásaink különösen emberközpontúak, meglévő Ügyfeleink véleménye szerint nálunk rendkívül közvetlen a kapcsolattartás és minden egyes Ügyfélre jut egy szakember! A szakemberrel folytatott beszélgetés során nem csak eladói, hanem tanácsadói tevékenységgel is állunk rendelkezésre, melynek során jó vagy rossz tapasztalatainkat közöljük a szóban forgó termékkel kapcsolatban és személyre szabottan kínálunk megoldásokat minden egyes Ügyfélnek.\r\n\r\nKihangsúlyozzuk, hogy munkánk során a cél nem az egyszeri termékeladás, hanem mindenképpen a megfelelő személyre szabás, melynek következményeképpen az Ügyfelek arra használhatják a megvásárolt eszközt, amire vették. Ha rajtunk múlik, az Ügyfeleket nem érhetik kellemetlen meglepetések, ezáltal reméljük, hogy vissza fognak térni!\r\n\r\nHa Ön már Ügyfelünk, köszönjük, hogy elolvasta bemutatkozásunkat, és bízunk benne, hogy a leírtakkal megegyezőket tapasztalta szolgáltatásainkkal kapcsolatban.\r\n\r\nHa Ön még nem Ügyfelünk, kérjük tegyen próbára minket, állunk rendelkezésére a "Kapcsolat" menüpont alatt található elérhetőségeken!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rights`
--

CREATE TABLE IF NOT EXISTS `rights` (
  `id` tinyint(4) NOT NULL,
  `description` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rights`
--

INSERT INTO `rights` (`id`, `description`) VALUES
(1, 'Adminisztrátor'),
(2, 'Hírszerkesztő'),
(3, 'Vendég');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ugyfelek`
--

CREATE TABLE IF NOT EXISTS `ugyfelek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `cegnev` varchar(60) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `adoszam` varchar(13) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `e-mail` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_hungarian_ci NOT NULL,
  `irsz` varchar(4) COLLATE utf8_hungarian_ci NOT NULL,
  `telepules` varchar(60) COLLATE utf8_hungarian_ci NOT NULL,
  `utcahaz` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci AUTO_INCREMENT=4 ;

--
-- A tábla adatainak kiíratása `ugyfelek`
--

INSERT INTO `ugyfelek` (`id`, `nev`, `cegnev`, `adoszam`, `e-mail`, `telefon`, `irsz`, `telepules`, `utcahaz`) VALUES
(1, 'Braun Péter', NULL, NULL, 'peti1021@citromail.hu', '06302926962', '7400', 'kaposvár', 'bercsneyi 22'),
(2, 'Pityu Debi', 'Microsoft X PRO', '7400', 'microsoftxpro@fastmeup.com', '0682222654', '7400', 'kaposvár', 'Somsich pál joszef utca 855'),
(3, 'Barat fecó', 'gls.ie', '451546458', 'lol@hop.hu', '06205214521', '', '', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  `upass` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `rights` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci AUTO_INCREMENT=4 ;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `uname`, `upass`, `name`, `email`, `rights`) VALUES
(1, 'Peti1021', '$1$tB1.yW5.$G6HYcML8O5DoWM8aHLGfQ.', 'Petya', '', 1),
(2, 'braun1994', '$1$lW3.K44.$zDgT8iYjTXq0mp96rXEWD/', 'péter', 'peti1021@citromail.hu', 2),
(3, 'Krisztian', '$1$yN4.TT1.$puWEG7JlH81S2j5eHiQTb.', 'korsos krisz', 'korsoskrisz@gmail.com', 1);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `munkalapok`
--
ALTER TABLE `munkalapok`
  ADD CONSTRAINT `munkalapok_ibfk_1` FOREIGN KEY (`ugyfel_id`) REFERENCES `ugyfelek` (`id`),
  ADD CONSTRAINT `munkalapok_ibfk_2` FOREIGN KEY (`felvette`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `munkalapok_ibfk_3` FOREIGN KEY (`javito`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
