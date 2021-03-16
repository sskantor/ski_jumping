-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 01 Lut 2021, 14:04
-- Wersja serwera: 8.0.21
-- Wersja PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `g11`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add kalendarz ps', 7, 'add_kalendarzps'),
(26, 'Can change kalendarz ps', 7, 'change_kalendarzps'),
(27, 'Can delete kalendarz ps', 7, 'delete_kalendarzps'),
(28, 'Can view kalendarz ps', 7, 'view_kalendarzps'),
(29, 'Can add sedziowie', 9, 'add_sedziowie'),
(30, 'Can change sedziowie', 9, 'change_sedziowie'),
(31, 'Can delete sedziowie', 9, 'delete_sedziowie'),
(32, 'Can view sedziowie', 9, 'view_sedziowie'),
(33, 'Can add skocznie', 8, 'add_skocznie'),
(34, 'Can change skocznie', 8, 'change_skocznie'),
(35, 'Can delete skocznie', 8, 'delete_skocznie'),
(36, 'Can view skocznie', 8, 'view_skocznie'),
(37, 'Can add zawodnicy', 10, 'add_zawodnicy'),
(38, 'Can change zawodnicy', 10, 'change_zawodnicy'),
(39, 'Can delete zawodnicy', 10, 'delete_zawodnicy'),
(40, 'Can view zawodnicy', 10, 'view_zawodnicy'),
(41, 'Can add wyniki', 11, 'add_wyniki'),
(42, 'Can change wyniki', 11, 'change_wyniki'),
(43, 'Can delete wyniki', 11, 'delete_wyniki'),
(44, 'Can view wyniki', 11, 'view_wyniki'),
(45, 'Can add oceny', 12, 'add_oceny'),
(46, 'Can change oceny', 12, 'change_oceny'),
(47, 'Can delete oceny', 12, 'delete_oceny'),
(48, 'Can view oceny', 12, 'view_oceny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$zhvw7hQ8w1Dm$SRmWR7rOWj/W8KAGnxU9i27QN8jbXk7heUxxXyP2Je8=', '2021-01-12 09:41:51.495513', 1, 'g11', '', '', '', 1, 1, '2021-01-05 13:02:07.829565');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-01-05 21:48:44.140721', 'POL_WIS', 'Skocznie object (POL_WIS)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2021-01-05 21:54:05.491675', '1', 'KalendarzPs object (1)', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-01-06 14:47:29.231490', 'FIN_RUK', 'Skocznie object (FIN_RUK)', 1, '[{\"added\": {}}]', 8, 1),
(4, '2021-01-06 14:50:46.253849', '2', 'KalendarzPs object (2)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2021-01-06 14:51:01.531536', '3', 'KalendarzPs object (3)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2021-01-07 12:28:14.205334', 'RUS_NTG', 'RUS_NTG', 1, '[{\"added\": {}}]', 8, 1),
(7, '2021-01-07 12:29:41.098745', 'SWI_ENG', 'SWI_ENG', 1, '[{\"added\": {}}]', 8, 1),
(8, '2021-01-07 12:31:25.474866', 'GER_OBE', 'GER_OBE', 1, '[{\"added\": {}}]', 8, 1),
(9, '2021-01-07 12:33:21.786527', 'GER_GAP', 'GER_GAP', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-01-07 12:36:51.024252', 'AUS_INN', 'AUS_INN', 1, '[{\"added\": {}}]', 8, 1),
(11, '2021-01-07 12:39:02.125515', 'AUS_BIS', 'AUS_BIS', 1, '[{\"added\": {}}]', 8, 1),
(12, '2021-01-07 14:56:15.799172', 'FIN_RUK', 'FIN_RUK', 2, '[{\"changed\": {\"fields\": [\"Kraj\"]}}]', 8, 1),
(13, '2021-01-07 14:56:23.343670', 'POL_WIS', 'POL_WIS', 2, '[{\"changed\": {\"fields\": [\"Kraj\"]}}]', 8, 1),
(14, '2021-01-07 14:59:44.511175', '4', '4', 1, '[{\"added\": {}}]', 7, 1),
(15, '2021-01-07 14:59:50.008541', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Liczba uczestnikow kwali\"]}}]', 7, 1),
(16, '2021-01-07 14:59:55.446648', '2', '2', 2, '[{\"changed\": {\"fields\": [\"Liczba uczestnikow kwali\"]}}]', 7, 1),
(17, '2021-01-07 15:00:25.644216', '5', '5', 1, '[{\"added\": {}}]', 7, 1),
(18, '2021-01-07 15:01:16.441416', '6', '6', 1, '[{\"added\": {}}]', 7, 1),
(19, '2021-01-07 15:01:35.179296', '7', '7', 1, '[{\"added\": {}}]', 7, 1),
(20, '2021-01-07 15:02:58.661508', '8', '8', 1, '[{\"added\": {}}]', 7, 1),
(21, '2021-01-07 15:03:56.647647', '9', '9', 1, '[{\"added\": {}}]', 7, 1),
(22, '2021-01-07 15:05:05.190359', '10', '10', 1, '[{\"added\": {}}]', 7, 1),
(23, '2021-01-07 15:06:01.500227', '11', '11', 1, '[{\"added\": {}}]', 7, 1),
(24, '2021-01-07 15:06:08.155835', '10', '10', 2, '[{\"changed\": {\"fields\": [\"Data\"]}}]', 7, 1),
(25, '2021-01-07 22:46:09.266881', '1', 'Geiger', 1, '[{\"added\": {}}]', 10, 1),
(26, '2021-01-07 22:47:06.847900', '1', 'Jiri Parma', 1, '[{\"added\": {}}]', 9, 1),
(27, '2021-01-07 22:48:57.264247', '2', 'Phillip Schödler', 1, '[{\"added\": {}}]', 9, 1),
(28, '2021-01-07 22:49:10.435532', '3', 'Ryszard Guńka', 1, '[{\"added\": {}}]', 9, 1),
(29, '2021-01-07 22:49:31.001555', '4', 'Amelie Contamine', 1, '[{\"added\": {}}]', 9, 1),
(30, '2021-01-07 22:49:46.117292', '5', 'Miha Sever', 1, '[{\"added\": {}}]', 9, 1),
(31, '2021-01-07 22:50:13.722325', '1', 'Jiři Parma', 2, '[{\"changed\": {\"fields\": [\"Imie\"]}}]', 9, 1),
(32, '2021-01-07 22:51:39.314849', '2', 'Granerud', 1, '[{\"added\": {}}]', 10, 1),
(33, '2021-01-07 22:51:49.577081', '1', 'Geiger', 2, '[{\"changed\": {\"fields\": [\"Narodowosc\"]}}]', 10, 1),
(34, '2021-01-07 22:52:51.061720', '3', 'Stoch', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'polls', 'kalendarzps'),
(12, 'polls', 'oceny'),
(9, 'polls', 'sedziowie'),
(8, 'polls', 'skocznie'),
(11, 'polls', 'wyniki'),
(10, 'polls', 'zawodnicy'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-03 13:09:04.424389'),
(2, 'auth', '0001_initial', '2021-01-03 13:09:04.579213'),
(3, 'admin', '0001_initial', '2021-01-03 13:09:05.006614'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-03 13:09:05.115265'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-03 13:09:05.129746'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-03 13:09:05.255474'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-03 13:09:05.326401'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-03 13:09:05.397009'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-03 13:09:05.412949'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-03 13:09:05.463947'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-03 13:09:05.470141'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-03 13:09:05.486460'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-03 13:09:05.545015'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-03 13:09:05.611728'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-03 13:09:05.664436'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-03 13:09:05.677796'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-03 13:09:05.733482'),
(18, 'sessions', '0001_initial', '2021-01-03 13:09:05.758244'),
(19, 'polls', '0001_initial', '2021-01-05 14:44:29.334593'),
(20, 'polls', '0002_auto_20210106_1134', '2021-01-06 10:34:23.538952'),
(21, 'polls', '0003_auto_20210106_1537', '2021-01-06 14:37:43.806941');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5vmikx79u8dknjpojeu4mmov9d8fukb1', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kzGBT:JVetYYeLxU0TNZFoNNAz3SavhwtuiTl-Dq26FPt0WoQ', '2021-01-26 09:41:51.502055'),
('776ixa3x2dbgs9p42n4bffif6nzf0fn2', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kxARt:nstWE2Upq3IXFM4u5HzTxzeEXXopWA8Wv_AC0IDYjkA', '2021-01-20 15:10:09.436517'),
('hvpuwhgrvkcn2znizcrprez4mviy246k', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kxsgf:41CW3xZxRKrEyzFXe6X3ymIKHyQpUGOEFpjRIJUNiRc', '2021-01-22 14:24:21.565829'),
('jvjar0rndlnogu0axrvkx2n067k5l3dv', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kxEfI:Zw_P92Kt9wHduP_P3J9zv-f-Wu70SvbTliavbPBlbpA', '2021-01-20 19:40:16.173634'),
('s4tr099ls0w6cl6lm4hwne0v5lzzy50g', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kxAU9:6vSZxQVEttFxjxcO4O-ilHj8QX5I99nOtwZB-XXfzkQ', '2021-01-20 15:12:29.423867'),
('wzqs4hlh9hst8fy0snhy40totqh79uu1', '.eJxVjEEOwiAQRe_C2pAhQwdw6d4zkBkgUjWQlHZlvLs26UK3_733Xyrytta4jbLEOauzMur0uwmnR2k7yHdut65Tb-syi94VfdChrz2X5-Vw_w4qj_qtxZAgMAcBTwKEQDlYZIsOAgslB-BD5sl6LEKB0JXC6IMx7CFP6v0Bxv43CQ:1kwmFj:iJZRgW4gBHRR6l3JnHoi_uCL8gW85XStVLFC_XOzx7o', '2021-01-19 13:19:59.794064');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kalendarz_ps`
--

CREATE TABLE `kalendarz_ps` (
  `id_konkursu` int NOT NULL COMMENT 'min(id_konkursu)=1, max(id_konkursu)=23',
  `id_skoczni` varchar(255) NOT NULL,
  `typ_konkursu` varchar(45) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `kalendarz_ps`
--

INSERT INTO `kalendarz_ps` (`id_konkursu`, `id_skoczni`, `typ_konkursu`, `data`) VALUES
(1, 'POL_WIS', 'indywidualny', '2020-11-22'),
(2, 'FIN_RUK', 'indywidualny', '2020-11-28'),
(3, 'FIN_RUK', 'indywidualny', '2020-11-29'),
(4, 'RUS_NTG', 'indywidualny', '2020-12-05'),
(5, 'RUS_NTG', 'indywidualny', '2020-12-06'),
(6, 'SWI_ENG', 'indywidualny', '2020-12-19'),
(7, 'SWI_ENG', 'indywidualny', '2020-12-20'),
(8, 'GER_OBE', 'indywidualny, TCS', '2020-12-29'),
(9, 'GER_GAP', 'indywidualny, TCS', '2021-01-01'),
(10, 'AUS_INN', 'indywidualny, TCS', '2021-01-03'),
(11, 'AUS_BIS', 'indywidualny, TCS', '2021-01-06');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id_oceny` int NOT NULL,
  `ocena` float NOT NULL,
  `id_zawodnika` int NOT NULL,
  `id_sedziego` int NOT NULL,
  `id_skoku` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id_oceny`, `ocena`, `id_zawodnika`, `id_sedziego`, `id_skoku`) VALUES
(451, 15.5, 1, 1, 128),
(452, 15.5, 1, 2, 128),
(453, 15.5, 1, 3, 128),
(454, 15.5, 1, 4, 128),
(455, 15.5, 1, 5, 128),
(456, 17, 6, 1, 129),
(457, 18, 6, 2, 129),
(458, 17.5, 6, 3, 129),
(459, 17.5, 6, 4, 129),
(460, 17, 6, 5, 129),
(461, 15.5, 2, 1, 130),
(462, 15.5, 2, 2, 130),
(463, 15.5, 2, 3, 130),
(464, 15.5, 2, 4, 130),
(465, 15.5, 2, 5, 130),
(466, 18.5, 3, 1, 131),
(467, 18.5, 3, 2, 131),
(468, 18, 3, 3, 131),
(469, 18.5, 3, 4, 131),
(470, 18.5, 3, 5, 131),
(476, 15.5, 7, 2, 133),
(477, 18, 7, 1, 133),
(478, 17.5, 7, 4, 133),
(479, 17, 7, 3, 133),
(480, 16.5, 7, 5, 133),
(481, 16.5, 1, 1, 134),
(482, 16, 1, 3, 134),
(483, 16.5, 1, 2, 134),
(484, 16.5, 1, 4, 134),
(485, 16, 1, 5, 134),
(486, 17.5, 6, 1, 135),
(487, 17, 6, 3, 135),
(488, 17, 6, 2, 135),
(489, 18.5, 6, 4, 135),
(490, 17, 6, 5, 135),
(491, 16.5, 2, 1, 136),
(492, 16, 2, 3, 136),
(493, 15.5, 2, 2, 136),
(494, 16.5, 2, 5, 136),
(495, 15.5, 2, 4, 136),
(496, 17, 3, 1, 137),
(497, 17.5, 3, 2, 137),
(498, 19.5, 3, 3, 137),
(499, 19, 3, 4, 137),
(500, 18.5, 3, 5, 137),
(506, 17, 7, 1, 139),
(507, 16.5, 7, 3, 139),
(508, 17, 7, 2, 139),
(509, 16.5, 7, 4, 139),
(510, 17.5, 7, 5, 139),
(511, 17.5, 9, 1, 140),
(512, 17, 9, 2, 140),
(513, 18, 9, 3, 140),
(514, 16, 9, 4, 140),
(515, 17, 9, 5, 140),
(516, 16.5, 6, 1, 141),
(517, 17.5, 6, 3, 141),
(518, 17.5, 6, 2, 141),
(519, 17, 6, 4, 141),
(520, 18.5, 6, 5, 141),
(521, 18.5, 4, 1, 142),
(522, 18.5, 4, 3, 142),
(523, 19.5, 4, 2, 142),
(524, 18.5, 4, 4, 142),
(525, 19.5, 4, 5, 142),
(526, 19.5, 5, 2, 143),
(527, 19.5, 5, 3, 143),
(528, 19, 5, 4, 143),
(529, 19, 5, 5, 143),
(530, 19.5, 5, 1, 143),
(531, 18, 9, 1, 144),
(532, 19, 9, 2, 144),
(533, 18, 9, 3, 144),
(534, 19, 9, 4, 144),
(535, 18, 9, 5, 144),
(536, 15.5, 6, 1, 145),
(537, 15.5, 6, 2, 145),
(538, 15.5, 6, 3, 145),
(539, 15.5, 6, 4, 145),
(540, 15.5, 6, 5, 145),
(541, 18, 5, 1, 146),
(542, 17, 5, 2, 146),
(543, 18, 5, 3, 146),
(544, 17.5, 5, 4, 146),
(545, 17, 5, 5, 146),
(546, 19, 4, 1, 147),
(547, 19, 4, 2, 147),
(548, 20, 4, 3, 147),
(549, 18.5, 4, 4, 147),
(550, 19.5, 4, 5, 147),
(566, 17, 4, 1, 151),
(567, 17.5, 4, 2, 151),
(568, 17.5, 4, 4, 151),
(569, 18.5, 4, 3, 151),
(570, 19, 4, 5, 151),
(571, 15.5, 2, 1, 152),
(572, 15.5, 2, 3, 152),
(573, 15.5, 2, 2, 152),
(574, 15.5, 2, 4, 152),
(575, 15.5, 2, 5, 152),
(576, 17, 9, 1, 153),
(577, 17, 9, 3, 153),
(578, 16, 9, 2, 153),
(579, 17.5, 9, 4, 153),
(580, 17, 9, 5, 153),
(581, 18, 3, 1, 154),
(582, 19.5, 3, 2, 154),
(583, 19.5, 3, 3, 154),
(584, 18.5, 3, 4, 154),
(585, 18, 3, 5, 154),
(586, 17, 3, 1, 155),
(587, 18.5, 3, 2, 155),
(588, 18.5, 3, 3, 155),
(589, 18.5, 3, 4, 155),
(590, 19, 3, 5, 155),
(591, 17, 4, 1, 156),
(592, 18, 4, 2, 156),
(593, 17, 4, 3, 156),
(594, 18, 4, 4, 156),
(595, 18, 4, 5, 156),
(596, 17, 4, 2, 157),
(597, 16.5, 4, 1, 157),
(598, 18, 4, 3, 157),
(599, 16.5, 4, 4, 157),
(600, 16, 4, 5, 157),
(601, 17, 5, 1, 158),
(602, 19, 5, 2, 158),
(603, 17.5, 5, 3, 158),
(604, 17.5, 5, 4, 158),
(605, 18, 5, 5, 158),
(606, 18.5, 5, 3, 159),
(607, 19.5, 5, 2, 159),
(608, 18.5, 5, 1, 159),
(609, 19, 5, 4, 159),
(610, 19.5, 5, 5, 159),
(636, 15.5, 12, 1, 167),
(637, 15.5, 12, 2, 167),
(638, 15.5, 12, 3, 167),
(639, 15.5, 12, 4, 167),
(640, 15.5, 12, 5, 167),
(641, 15.5, 6, 1, 168),
(642, 15.5, 6, 2, 168),
(643, 15.5, 6, 3, 168),
(644, 15.5, 6, 4, 168),
(645, 15.5, 6, 5, 168),
(651, 15.5, 12, 2, 170),
(652, 15.5, 12, 1, 170),
(653, 15.5, 12, 4, 170),
(654, 15.5, 12, 3, 170),
(655, 15.5, 12, 5, 170),
(656, 15.5, 7, 1, 171),
(657, 15.5, 7, 2, 171),
(658, 15.5, 7, 3, 171),
(659, 15.5, 7, 4, 171),
(660, 15.5, 7, 5, 171),
(661, 15.5, 7, 2, 172),
(662, 16.5, 7, 1, 172),
(663, 16.5, 7, 4, 172),
(664, 15.5, 7, 3, 172),
(665, 15.5, 7, 5, 172);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sedziowie`
--

CREATE TABLE `sedziowie` (
  `id_sedziego` int NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `narodowosc` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `sedziowie`
--

INSERT INTO `sedziowie` (`id_sedziego`, `imie`, `nazwisko`, `narodowosc`) VALUES
(1, 'Jiři', 'Parma', 'Czechy'),
(2, 'Phillip', 'Schödler', 'Szwajcaria'),
(3, 'Ryszard', 'Guńka', 'Polska'),
(4, 'Amelie', 'Contamine', 'Francja'),
(5, 'Miha', 'Sever', 'Słowenia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skocznie`
--

CREATE TABLE `skocznie` (
  `id_skoczni` varchar(255) NOT NULL,
  `kraj` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `punkt_k` float NOT NULL,
  `punkt_hs` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `skocznie`
--

INSERT INTO `skocznie` (`id_skoczni`, `kraj`, `miasto`, `nazwa`, `punkt_k`, `punkt_hs`) VALUES
('AUS_BIS', 'Austria', 'Bischofshofen', 'Paul-Ausserleitner-Schanze', 125, 142),
('AUS_INN', 'Austria', 'Innsbruck', 'Bergisel', 120, 129),
('FIN_RUK', 'Finlandia', 'Ruka', 'Rukatunturi', 120, 142),
('GER_GAP', 'Niemcy', 'Garmisch-Partenkirchen', 'Große Olympiaschanze', 125, 142),
('GER_OBE', 'Niemcy', 'Oberstdorf', 'Schattenbergschanze (Audi Arena Oberstdorf)', 120, 137),
('POL_WIS', 'Polska', 'Wisla', 'Skocznia im. Adama Malysza \"Malinka\"', 120, 134),
('RUS_NTG', 'Rosja', 'Niżny Tagił', 'Aist', 120, 134),
('SWI_ENG', 'Szwajcaria', 'Engelberg', 'Gross-Titlis-Schanze', 125, 140);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skoki`
--

CREATE TABLE `skoki` (
  `id_skoku` int NOT NULL,
  `id_konkursu` int NOT NULL,
  `id_zawodnika` int NOT NULL,
  `odleglosc` float NOT NULL,
  `typ` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `skoki`
--

INSERT INTO `skoki` (`id_skoku`, `id_konkursu`, `id_zawodnika`, `odleglosc`, `typ`) VALUES
(128, 2, 1, 125, 'First'),
(129, 2, 6, 134, 'First'),
(130, 2, 2, 118, 'First'),
(131, 2, 3, 138, 'First'),
(133, 2, 7, 133, 'First'),
(134, 2, 1, 126, 'Second'),
(135, 2, 6, 136, 'Second'),
(136, 2, 2, 123, 'Second'),
(137, 2, 3, 139, 'Second'),
(139, 2, 7, 136, 'Second'),
(140, 3, 9, 125, 'First'),
(141, 3, 6, 133, 'First'),
(142, 3, 4, 140, 'First'),
(143, 3, 5, 137, 'First'),
(144, 3, 9, 128, 'Second'),
(145, 3, 6, 139, 'Second'),
(146, 3, 5, 141, 'Second'),
(147, 3, 4, 136, 'Second'),
(151, 5, 4, 126, 'First'),
(152, 5, 2, 100, 'First'),
(153, 5, 9, 123, 'First'),
(154, 4, 3, 132, 'First'),
(155, 4, 3, 133, 'Second'),
(156, 4, 4, 129, 'First'),
(157, 4, 4, 131, 'Second'),
(158, 4, 5, 126, 'First'),
(159, 4, 5, 128, 'Second'),
(167, 11, 12, 140, 'First'),
(168, 11, 6, 138, 'First'),
(170, 10, 12, 120, 'First'),
(171, 10, 7, 130, 'First'),
(172, 11, 7, 126, 'First');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id_wyniku` int NOT NULL,
  `id_konkursu` int NOT NULL,
  `id_zawodnika` int NOT NULL,
  `1_punkty` float NOT NULL DEFAULT '0',
  `2_punkty` float NOT NULL DEFAULT '0',
  `wynik` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id_wyniku`, `id_konkursu`, `id_zawodnika`, `1_punkty`, `2_punkty`, `wynik`) VALUES
(41, 2, 1, 171.5, 174.9, 346.4),
(42, 2, 6, 186.2, 188.2, 374.4),
(43, 2, 2, 164.5, 171, 335.5),
(44, 2, 3, 193.2, 193.9, 387.1),
(46, 2, 7, 183.7, 186.7, 370.4),
(47, 3, 9, 176.3, 183.2, 359.5),
(48, 3, 6, 185.2, 185.5, 370.7),
(49, 3, 4, 196.7, 193.6, 390.3),
(50, 3, 5, 194.9, 193.5, 388.4),
(54, 5, 4, 179.7, 0, 179.7),
(55, 5, 2, 146.5, 0, 146.5),
(56, 5, 9, 173.7, 0, 173.7),
(57, 4, 3, 188.1, 187.9, 376),
(58, 4, 4, 181.8, 181.4, 363.2),
(59, 4, 5, 179.4, 185, 364.4),
(61, 11, 12, 186.5, 0, 186.5),
(62, 11, 6, 184.5, 0, 184.5),
(64, 10, 12, 166.5, 0, 166.5),
(65, 10, 7, 176.5, 0, 176.5),
(66, 11, 7, 173.7, 0, 173.7);

--
-- Wyzwalacze `wyniki`
--
DELIMITER $$
CREATE TRIGGER `wyniki_AFTER_INSERT` AFTER INSERT ON `wyniki` FOR EACH ROW BEGIN
UPDATE `zawodnicy` SET `ilosc_punktow` = `ilosc_punktow` + NEW.`wynik` WHERE `id_zawodnika`= NEW.`id_zawodnika`;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `wyniki_AFTER_UPDATE` AFTER UPDATE ON `wyniki` FOR EACH ROW BEGIN
UPDATE `zawodnicy` SET `ilosc_punktow` = `ilosc_punktow` + NEW.`wynik` - OLD.`wynik` WHERE `id_zawodnika`= NEW.`id_zawodnika`;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `wyniki_BEFORE_DELETE` BEFORE DELETE ON `wyniki` FOR EACH ROW BEGIN
UPDATE `zawodnicy` SET `ilosc_punktow` = `ilosc_punktow` - OLD.`wynik` WHERE `id_zawodnika`= OLD.`id_zawodnika`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnicy`
--

CREATE TABLE `zawodnicy` (
  `id_zawodnika` int NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `narodowosc` varchar(45) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `ilosc_punktow` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `zawodnicy`
--

INSERT INTO `zawodnicy` (`id_zawodnika`, `imie`, `nazwisko`, `narodowosc`, `data_urodzenia`, `ilosc_punktow`) VALUES
(1, 'Karl', 'Geiger', 'Niemcy', '1993-02-11', 346.4),
(2, 'Halvor Egner', 'Granerud', 'Norwegia', '1996-05-29', 482),
(3, 'Kamil', 'Stoch', 'Polska', '1987-05-25', 763.1),
(4, 'Dawid', 'Kubacki', 'Polska', '1990-03-12', 933.2),
(5, 'Piotr', 'Żyła', 'Polska', '1987-01-16', 752.8),
(6, 'Stefan', 'Kraft', 'Austria', '1993-05-13', 929.6),
(7, 'Markus', 'Eisenbichler', 'Niemcy', '1991-04-03', 720.6),
(9, 'Andreas', 'Wellinger', 'Niemcy', '1995-08-28', 533.2),
(12, 'Bbbbb', 'Bbbb', 'Bbb', '1998-01-14', 353);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeksy dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeksy dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeksy dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeksy dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeksy dla tabeli `kalendarz_ps`
--
ALTER TABLE `kalendarz_ps`
  ADD PRIMARY KEY (`id_konkursu`),
  ADD UNIQUE KEY `id_konkursu_UNIQUE` (`id_konkursu`),
  ADD KEY `fk_kalendarz_ps_skocznie_idx` (`id_skoczni`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD UNIQUE KEY `id_oceny_UNIQUE` (`id_oceny`),
  ADD KEY `fk_oceny_zawodnicy_idx` (`id_zawodnika`),
  ADD KEY `fk_oceny_sedziowie_idx` (`id_sedziego`),
  ADD KEY `fk_oceny_skoki_idx` (`id_skoku`);

--
-- Indeksy dla tabeli `sedziowie`
--
ALTER TABLE `sedziowie`
  ADD PRIMARY KEY (`id_sedziego`),
  ADD UNIQUE KEY `id_sedziego_UNIQUE` (`id_sedziego`);

--
-- Indeksy dla tabeli `skocznie`
--
ALTER TABLE `skocznie`
  ADD PRIMARY KEY (`id_skoczni`),
  ADD UNIQUE KEY `id_skoczni_UNIQUE` (`id_skoczni`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indeksy dla tabeli `skoki`
--
ALTER TABLE `skoki`
  ADD PRIMARY KEY (`id_skoku`),
  ADD UNIQUE KEY `id_skoku_UNIQUE` (`id_skoku`),
  ADD KEY `fk_skoki_zawodnicy_idx` (`id_zawodnika`),
  ADD KEY `fk_skoki_kalendarz_ps_idx` (`id_konkursu`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id_wyniku`),
  ADD UNIQUE KEY `id_wyniku_UNIQUE` (`id_wyniku`),
  ADD KEY `fk_wyniki_kalendarz_ps_idx` (`id_konkursu`),
  ADD KEY `fk_wyniki_zawodnicy_idx` (`id_zawodnika`);

--
-- Indeksy dla tabeli `zawodnicy`
--
ALTER TABLE `zawodnicy`
  ADD PRIMARY KEY (`id_zawodnika`),
  ADD UNIQUE KEY `id_zawodnika_UNIQUE` (`id_zawodnika`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `kalendarz_ps`
--
ALTER TABLE `kalendarz_ps`
  MODIFY `id_konkursu` int NOT NULL AUTO_INCREMENT COMMENT 'min(id_konkursu)=1, max(id_konkursu)=23', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id_oceny` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=666;

--
-- AUTO_INCREMENT dla tabeli `sedziowie`
--
ALTER TABLE `sedziowie`
  MODIFY `id_sedziego` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `skoki`
--
ALTER TABLE `skoki`
  MODIFY `id_skoku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id_wyniku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT dla tabeli `zawodnicy`
--
ALTER TABLE `zawodnicy`
  MODIFY `id_zawodnika` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `kalendarz_ps`
--
ALTER TABLE `kalendarz_ps`
  ADD CONSTRAINT `fk_kalendarz_ps_skocznie` FOREIGN KEY (`id_skoczni`) REFERENCES `skocznie` (`id_skoczni`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `fk_oceny_sedziowie` FOREIGN KEY (`id_sedziego`) REFERENCES `sedziowie` (`id_sedziego`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oceny_skoki` FOREIGN KEY (`id_skoku`) REFERENCES `skoki` (`id_skoku`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oceny_zawodnicy` FOREIGN KEY (`id_zawodnika`) REFERENCES `zawodnicy` (`id_zawodnika`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `skoki`
--
ALTER TABLE `skoki`
  ADD CONSTRAINT `fk_skoki_kalendarz_ps` FOREIGN KEY (`id_konkursu`) REFERENCES `kalendarz_ps` (`id_konkursu`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_skoki_zawodnicy` FOREIGN KEY (`id_zawodnika`) REFERENCES `zawodnicy` (`id_zawodnika`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD CONSTRAINT `fk_wyniki_kalendarz_ps` FOREIGN KEY (`id_konkursu`) REFERENCES `kalendarz_ps` (`id_konkursu`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wyniki_zawodnicy` FOREIGN KEY (`id_zawodnika`) REFERENCES `zawodnicy` (`id_zawodnika`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
