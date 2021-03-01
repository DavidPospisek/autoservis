-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 01. bře 2021, 12:42
-- Verze serveru: 10.4.17-MariaDB
-- Verze PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `automechanik`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `automobily`
--

CREATE TABLE `automobily` (
  `id` int(11) NOT NULL,
  `registranci_znacka` varchar(45) NOT NULL,
  `vyrobce` varchar(45) NOT NULL,
  `rok_vyroby` varchar(45) NOT NULL,
  `barva` varchar(45) NOT NULL,
  `obsah_motoru` varchar(45) NOT NULL,
  `typ_vozu_id` int(11) NOT NULL,
  `majitele_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `automobily`
--

INSERT INTO `automobily` (`id`, `registranci_znacka`, `vyrobce`, `rok_vyroby`, `barva`, `obsah_motoru`, `typ_vozu_id`, `majitele_id`) VALUES
(1, '7ZZ-0365', 'Škoda', '2012', 'modrá', '1,6', 1, 1),
(2, '5B5-5555', 'Audi', '2006', 'zelená', '2', 2, 2),
(3, '5M67-8765', 'Ford', '2019', 'žlutá', '8,0', 3, 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktura tabulky `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `majitele`
--

CREATE TABLE `majitele` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(45) NOT NULL,
  `prijmeni` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `majitele`
--

INSERT INTO `majitele` (`id`, `jmeno`, `prijmeni`, `adresa`, `telefon`, `e-mail`) VALUES
(1, 'Martin', 'Ševčík', 'Boršická Brno 136', '155 184 642', 'Martinsevca@seznam.cz'),
(2, 'Tomáš', 'Krátký', 'Za Mlýnem Hluk 687', '145 654 464', 'TomKratky@seznam.cz'),
(3, 'Blanka', 'Smutná', 'Krátká Praha 68', '665 656 565', 'SmutnaBlanka@seznam.cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `polozka_menu` varchar(45) DEFAULT NULL,
  `displej_nazev` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `opravy`
--

CREATE TABLE `opravy` (
  `id` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `doba_opravy` varchar(45) NOT NULL,
  `zamestnanec_id` int(11) NOT NULL,
  `soucastky_id` int(11) NOT NULL,
  `pocet_ks` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `opravy`
--

INSERT INTO `opravy` (`id`, `datum`, `doba_opravy`, `zamestnanec_id`, `soucastky_id`, `pocet_ks`) VALUES
(1, '2021-02-09 00:00:00', '8 dny', 1, 1, '1'),
(2, '2021-02-17 00:00:00', '1 den ', 2, 2, '1'),
(3, '2021-02-01 00:00:00', '30 dní', 3, 3, '1');

-- --------------------------------------------------------

--
-- Struktura tabulky `soucastky`
--

CREATE TABLE `soucastky` (
  `id` int(11) NOT NULL,
  `zamestnanci_id` int(11) NOT NULL,
  `opravy_id` int(11) NOT NULL,
  `soucastka` varchar(45) NOT NULL,
  `typ_vozu` varchar(45) NOT NULL,
  `cena` varchar(45) NOT NULL,
  `skladem_ks` varchar(45) NOT NULL,
  `automobily_id` int(11) NOT NULL,
  `automobily_typ_vozu_id` int(11) NOT NULL,
  `automobily_majitele_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `soucastky`
--

INSERT INTO `soucastky` (`id`, `zamestnanci_id`, `opravy_id`, `soucastka`, `typ_vozu`, `cena`, `skladem_ks`, `automobily_id`, `automobily_typ_vozu_id`, `automobily_majitele_id`) VALUES
(1, 1, 1, '1', 'Ford', '10000', '1', 1, 1, 1),
(2, 2, 2, '2', 'Audi', '7000', '1', 3, 3, 3),
(3, 3, 3, '3', 'Škoda', '12000', '10', 2, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `typ_vozu`
--

CREATE TABLE `typ_vozu` (
  `id` int(11) NOT NULL,
  `typ_vozu` varchar(45) NOT NULL,
  `prevodovka` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `typ_vozu`
--

INSERT INTO `typ_vozu` (`id`, `typ_vozu`, `prevodovka`) VALUES
(1, 'Škoda', 'ne'),
(2, 'Audi', 'ano'),
(3, 'Ford', 'ne');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$10$T5TGMmGGK6KhBG9yhWQIy.2ET4qQnxUOAQ.TbMJ4/hV/4K4fOQR6W', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1614596160, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Struktura tabulky `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanci`
--

CREATE TABLE `zamestnanci` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(45) NOT NULL,
  `prijmeni` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `zamestnanci`
--

INSERT INTO `zamestnanci` (`id`, `jmeno`, `prijmeni`, `telefon`) VALUES
(1, 'Šimon', 'Otravný', '155 150 887'),
(2, 'Petr', 'Bílý', '889 889 899'),
(3, 'Lubomír', 'Štíhlý', '454 454 656');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `automobily`
--
ALTER TABLE `automobily`
  ADD PRIMARY KEY (`id`,`typ_vozu_id`,`majitele_id`);

--
-- Klíče pro tabulku `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `majitele`
--
ALTER TABLE `majitele`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `opravy`
--
ALTER TABLE `opravy`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `soucastky`
--
ALTER TABLE `soucastky`
  ADD PRIMARY KEY (`id`,`zamestnanci_id`,`opravy_id`,`automobily_id`,`automobily_typ_vozu_id`,`automobily_majitele_id`);

--
-- Klíče pro tabulku `typ_vozu`
--
ALTER TABLE `typ_vozu`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Klíče pro tabulku `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Klíče pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `automobily`
--
ALTER TABLE `automobily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `majitele`
--
ALTER TABLE `majitele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `opravy`
--
ALTER TABLE `opravy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `soucastky`
--
ALTER TABLE `soucastky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `typ_vozu`
--
ALTER TABLE `typ_vozu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
