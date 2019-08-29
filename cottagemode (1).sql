-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 29 2019 г., 16:04
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cottagemode`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hud_action_logs`
--

CREATE TABLE `hud_action_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_action_logs_extensions`
--

CREATE TABLE `hud_action_logs_extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_action_logs_extensions`
--

INSERT INTO `hud_action_logs_extensions` (`id`, `extension`) VALUES
(1, 'com_banners'),
(2, 'com_cache'),
(3, 'com_categories'),
(4, 'com_config'),
(5, 'com_contact'),
(6, 'com_content'),
(7, 'com_installer'),
(8, 'com_media'),
(9, 'com_menus'),
(10, 'com_messages'),
(11, 'com_modules'),
(12, 'com_newsfeeds'),
(13, 'com_plugins'),
(14, 'com_redirect'),
(15, 'com_tags'),
(16, 'com_templates'),
(17, 'com_users'),
(18, 'com_checkin');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_action_logs_users`
--

CREATE TABLE `hud_action_logs_users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `notify` tinyint(1) UNSIGNED NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_action_logs_users`
--

INSERT INTO `hud_action_logs_users` (`user_id`, `notify`, `extensions`) VALUES
(421, 0, '[\"com_banners\",\"com_categories\",\"com_contact\",\"com_newsfeeds\",\"com_content\",\"com_media\",\"com_modules\",\"com_config\",\"com_installer\",\"com_menus\",\"com_tags\",\"com_redirect\",\"com_plugins\",\"com_users\",\"com_checkin\",\"com_templates\",\"com_messages\",\"com_cache\"]');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_action_log_config`
--

CREATE TABLE `hud_action_log_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_action_log_config`
--

INSERT INTO `hud_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_assets`
--

CREATE TABLE `hud_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_assets`
--

INSERT INTO `hud_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 343, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 218, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),
(9, 1, 219, 220, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 221, 222, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 223, 226, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1}}'),
(12, 1, 227, 228, 1, 'com_login', 'com_login', '{}'),
(13, 1, 229, 230, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 231, 232, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 233, 234, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 235, 240, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1}}'),
(17, 1, 241, 242, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 243, 300, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1}}'),
(19, 1, 301, 304, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20, 1, 305, 306, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1}}'),
(21, 1, 307, 308, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1}}'),
(22, 1, 309, 310, 1, 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(23, 1, 311, 312, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1}}'),
(24, 1, 313, 316, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1}}'),
(26, 1, 317, 318, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 29, 2, 'com_content.category.2', 'Default', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 302, 303, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 314, 315, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 319, 320, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 321, 322, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 323, 324, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 325, 326, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 327, 328, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 329, 330, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 244, 245, 2, 'com_modules.module.1', 'Главное меню', '{}'),
(40, 18, 246, 247, 2, 'com_modules.module.2', 'Форма авторизации', '{}'),
(41, 18, 248, 249, 2, 'com_modules.module.3', 'Популярные статьи', '{}'),
(42, 18, 250, 251, 2, 'com_modules.module.4', 'Последние новости', '{}'),
(43, 18, 252, 253, 2, 'com_modules.module.8', 'Панель инструментов', '{}'),
(44, 18, 254, 255, 2, 'com_modules.module.9', 'Панель быстрого доступа', '{}'),
(45, 18, 256, 257, 2, 'com_modules.module.10', 'Авторизованные пользователи', '{}'),
(46, 18, 258, 259, 2, 'com_modules.module.12', 'Меню панели управления', '{}'),
(47, 18, 260, 261, 2, 'com_modules.module.13', 'Подменю панели управления', '{}'),
(48, 18, 262, 263, 2, 'com_modules.module.14', 'Статус пользователя', '{}'),
(49, 18, 264, 265, 2, 'com_modules.module.15', 'Заголовок', '{}'),
(52, 18, 266, 267, 2, 'com_modules.module.79', 'Мультиязычность', '{}'),
(53, 18, 268, 269, 2, 'com_modules.module.86', 'Версия Joomla!', '{}'),
(54, 16, 236, 237, 2, 'com_menus.menu.1', 'Меню', '{}'),
(56, 1, 331, 332, 1, 'com_privacy', 'com_privacy', '{}'),
(57, 1, 333, 334, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
(58, 18, 270, 271, 2, 'com_modules.module.88', 'Лог действий - последние', '{}'),
(59, 18, 272, 273, 2, 'com_modules.module.89', 'Панель управления персональными данными', '{}'),
(60, 11, 224, 225, 2, 'com_languages.language.2', 'Русский (Россия)', '{}'),
(61, 8, 30, 65, 2, 'com_content.category.8', 'Новости', '{}'),
(62, 8, 66, 175, 2, 'com_content.category.9', 'Продукция CM Scandinavia', '{}'),
(63, 62, 67, 92, 3, 'com_content.category.10', 'CM Decking', '{}'),
(64, 63, 68, 73, 4, 'com_content.category.11', 'CM Care', '{}'),
(65, 62, 93, 96, 3, 'com_content.category.12', 'CM Bord', '{}'),
(66, 62, 97, 106, 3, 'com_content.category.13', 'CM Garden', '{}'),
(67, 62, 107, 110, 3, 'com_content.category.14', 'CM Cladding', '{}'),
(68, 62, 111, 114, 3, 'com_content.category.15', 'CM Railing', '{}'),
(69, 62, 115, 118, 3, 'com_content.category.16', 'CM Fencing', '{}'),
(70, 62, 119, 122, 3, 'com_content.category.17', 'CM Vättern', '{}'),
(71, 62, 123, 142, 3, 'com_content.category.18', 'CM Wood Natur', '{}'),
(72, 71, 124, 129, 4, 'com_content.category.19', 'Террасная доска', '{}'),
(73, 71, 130, 133, 4, 'com_content.category.20', 'Фасадная облицовка', '{}'),
(74, 71, 134, 141, 4, 'com_content.category.21', 'Интерьерные материалы', '{}'),
(75, 62, 143, 166, 3, 'com_content.category.22', 'CM Wood Thermo', '{}'),
(76, 75, 144, 149, 4, 'com_content.category.23', 'Террасная доска', '{}'),
(77, 75, 150, 157, 4, 'com_content.category.24', 'Фасадная облицовка', '{}'),
(78, 75, 158, 165, 4, 'com_content.category.25', 'Интерьерные материалы', '{}'),
(79, 8, 176, 183, 2, 'com_content.fieldgroup.1', 'SEO', '{}'),
(80, 8, 184, 185, 2, 'com_content.field.1', 'Бренд', '{}'),
(81, 8, 186, 203, 2, 'com_content.fieldgroup.2', 'Дополнительно', '{}'),
(82, 8, 204, 217, 2, 'com_content.fieldgroup.3', 'Таблица', '{}'),
(83, 81, 187, 188, 3, 'com_content.field.2', 'Преимущество', '{}'),
(84, 81, 189, 190, 3, 'com_content.field.3', 'Чертеж', '{}'),
(85, 81, 191, 192, 3, 'com_content.field.4', 'Документы', '{}'),
(86, 81, 193, 194, 3, 'com_content.field.5', 'Иконки', '{}'),
(87, 81, 195, 196, 3, 'com_content.field.6', 'Слайдер', '{}'),
(88, 81, 197, 198, 3, 'com_content.field.7', 'Вариации цветов', '{}'),
(89, 82, 205, 206, 3, 'com_content.field.8', 'Размер', '{}'),
(90, 82, 207, 208, 3, 'com_content.field.9', 'Упаковка', '{}'),
(91, 82, 209, 210, 3, 'com_content.field.10', 'Профиль', '{}'),
(92, 82, 211, 212, 3, 'com_content.field.11', 'Текстуры', '{}'),
(93, 82, 213, 214, 3, 'com_content.field.12', 'Термообработка', '{}'),
(94, 63, 74, 75, 4, 'com_content.article.1', 'CM Decking серия Bark', '{}'),
(95, 63, 76, 77, 4, 'com_content.article.2', 'CM Decking серия Robust', '{}'),
(96, 63, 78, 79, 4, 'com_content.article.3', 'CM Stair Ступени', '{}'),
(97, 63, 80, 81, 4, 'com_content.article.4', 'CM Decking серия Grand', '{}'),
(98, 63, 82, 83, 4, 'com_content.article.5', 'CM Decking серия Vintage', '{}'),
(99, 63, 84, 85, 4, 'com_content.article.6', 'CM Decking серия Mix', '{}'),
(100, 63, 86, 87, 4, 'com_content.article.7', 'CM Decking серия Solid', '{}'),
(101, 63, 88, 89, 4, 'com_content.article.8', 'CM Decking серия Natur', '{}'),
(102, 64, 69, 70, 5, 'com_content.article.9', 'CM Care для Террас', '{}'),
(103, 64, 71, 72, 5, 'com_content.article.10', 'CM Care Универсальное', '{}'),
(104, 65, 94, 95, 4, 'com_content.article.11', 'CM Bord', '{}'),
(105, 66, 98, 99, 4, 'com_content.article.12', 'CM Garden Клумбы', '{}'),
(106, 66, 100, 101, 4, 'com_content.article.13', 'CM Garden Оградки', '{}'),
(107, 66, 102, 103, 4, 'com_content.article.14', 'CM Garden Садовый паркет', '{}'),
(108, 66, 104, 105, 4, 'com_content.article.15', 'CM Garden Скамейки', '{}'),
(109, 67, 108, 109, 4, 'com_content.article.16', 'CM Cladding', '{}'),
(110, 68, 112, 113, 4, 'com_content.article.17', 'CM Railing', '{}'),
(111, 69, 116, 117, 4, 'com_content.article.18', 'CM Fencing', '{}'),
(112, 70, 120, 121, 4, 'com_content.article.19', 'CM Vattern', '{}'),
(113, 72, 125, 126, 5, 'com_content.article.20', 'CM Wood Natur Палубная доска', '{}'),
(114, 72, 127, 128, 5, 'com_content.article.21', 'CM Wood Natur Террасная доска', '{}'),
(115, 73, 131, 132, 5, 'com_content.article.22', 'CM Wood Natur Фасадная облицовка', '{}'),
(116, 74, 135, 136, 5, 'com_content.article.23', 'CM Wood Natur Штиль брашированный', '{}'),
(117, 74, 137, 138, 5, 'com_content.article.24', 'CM Wood Natur Штиль', '{}'),
(118, 74, 139, 140, 5, 'com_content.article.25', 'CM Wood Natur Паркетная доска', '{}'),
(119, 76, 145, 146, 5, 'com_content.article.26', 'CM Wood Thermo CMLD2 PF2', '{}'),
(120, 76, 147, 148, 5, 'com_content.article.27', 'CM Wood Thermo CMSHP', '{}'),
(121, 77, 151, 152, 5, 'com_content.article.28', 'CM Wood Thermo CMSHP', '{}'),
(122, 77, 153, 154, 5, 'com_content.article.29', 'CM Wood Thermo CMUTV', '{}'),
(123, 77, 155, 156, 5, 'com_content.article.30', 'CM Wood Thermo CMVR / CMHSS', '{}'),
(124, 78, 159, 160, 5, 'com_content.article.31', 'CM Wood Thermo CMSHP', '{}'),
(125, 78, 161, 162, 5, 'com_content.article.32', 'CM Wood Thermo CMHLL', '{}'),
(126, 78, 163, 164, 5, 'com_content.article.33', 'CM Wood Thermo CMSTP', '{}'),
(127, 27, 19, 20, 3, 'com_content.article.34', 'О компании', '{}'),
(128, 27, 21, 22, 3, 'com_content.article.35', 'Где купить?', '{}'),
(129, 27, 23, 24, 3, 'com_content.article.36', 'Стать дилером', '{}'),
(130, 27, 25, 26, 3, 'com_content.article.37', 'Задать вопрос', '{}'),
(131, 27, 27, 28, 3, 'com_content.article.38', 'Политика в отношении обработки персональных данных', '{}'),
(132, 61, 31, 32, 3, 'com_content.article.39', 'Новый дизайн сайта COTTAGEMODE', '{}'),
(133, 61, 33, 34, 3, 'com_content.article.40', 'CM Scandinavia на выставках в Новосибирске и Краснодаре', '{}'),
(134, 61, 35, 36, 3, 'com_content.article.41', 'Результаты выставок SibBuild и YugBuild', '{}'),
(135, 61, 37, 38, 3, 'com_content.article.42', 'Приглашаем посетить наш стенд на выставке MosBuild-2018', '{}'),
(136, 61, 39, 40, 3, 'com_content.article.43', 'CM Scandinavia — Подарки к каждой террасе', '{}'),
(137, 61, 41, 42, 3, 'com_content.article.44', '«Нордический характер»: новинка в CM Cladding', '{}'),
(138, 61, 43, 44, 3, 'com_content.article.45', 'Новая акция в гипермаркетах Вимос!', '{}'),
(139, 61, 45, 46, 3, 'com_content.article.46', 'Новая акция начинается, а старая — продолжается!', '{}'),
(140, 61, 47, 48, 3, 'com_content.article.47', 'Летняя распродажа CM Decking серии Vintage и MIX в ЦФО', '{}'),
(141, 61, 49, 50, 3, 'com_content.article.48', 'Летняя распродажа CM Cladding в СЗФО', '{}'),
(142, 61, 51, 52, 3, 'com_content.article.49', 'ПОСЛЕДНИЙ МЕСЯЦ ЛЕТА - НОВАЯ АКЦИЯ ДЛЯ СЗФО ', '{}'),
(143, 61, 53, 54, 3, 'com_content.article.50', 'Осенние скидки на ДПК!', '{}'),
(144, 61, 55, 56, 3, 'com_content.article.51', 'Новый строительный сезон - новый фасадный материал!', '{}'),
(145, 61, 57, 58, 3, 'com_content.article.52', 'Приглашаем на MosBuild-2019!', '{}'),
(146, 61, 59, 60, 3, 'com_content.article.53', 'Итоги выставки MosBuild-2019', '{}'),
(147, 61, 61, 62, 3, 'com_content.article.54', 'CM Scandinavia в Татарстане: выставка ВолгаСтройЭкспо-2019', '{}'),
(148, 61, 63, 64, 3, 'com_content.article.55', 'Новые серии CM Decking уже в России!', '{}'),
(149, 79, 179, 180, 3, 'com_content.field.13', 'Заголовок H1', '{}'),
(150, 79, 177, 178, 3, 'com_content.field.14', 'Заголовок H2', '{}'),
(151, 16, 238, 239, 2, 'com_menus.menu.2', 'Социальные сети', '{}'),
(152, 18, 274, 275, 2, 'com_modules.module.90', 'Социальные сети', '{}'),
(153, 18, 276, 277, 2, 'com_modules.module.91', 'CM Scandinavia: Террасы, Фасады, Водостоки', '{}'),
(154, 18, 278, 279, 2, 'com_modules.module.92', 'Слайдер', '{}'),
(155, 18, 280, 281, 2, 'com_modules.module.93', 'Новость', '{}'),
(156, 18, 282, 283, 2, 'com_modules.module.94', 'Новость', '{}'),
(157, 18, 284, 285, 2, 'com_modules.module.95', 'Последние новости', '{}'),
(158, 1, 335, 336, 1, 'com_rsform', 'com_rsform', '{}'),
(159, 18, 286, 287, 2, 'com_modules.module.96', 'Стать дилером', '{}'),
(160, 18, 288, 289, 2, 'com_modules.module.97', 'Задать вопрос', '{}'),
(161, 81, 199, 200, 3, 'com_content.field.15', 'Заголовок H2', '{}'),
(162, 79, 181, 182, 3, 'com_content.field.16', 'Бренд', '{}'),
(163, 81, 201, 202, 3, 'com_content.field.17', 'Бренд', '{}'),
(164, 18, 290, 291, 2, 'com_modules.module.98', 'Другие продукты', '{}'),
(165, 18, 292, 293, 2, 'com_modules.module.99', 'Задать вопрос', '{}'),
(166, 18, 294, 295, 2, 'com_modules.module.100', 'Задать вопрос', '{}'),
(167, 18, 296, 297, 2, 'com_modules.module.101', 'Заказать образец', '{}'),
(168, 62, 167, 168, 3, 'com_content.article.56', 'Аксессуары CM Cladding', '{}'),
(169, 82, 215, 216, 3, 'com_content.field.18', 'Аксессуар', '{}'),
(170, 62, 169, 170, 3, 'com_content.article.57', 'Аксессуары CM Railing', '{}'),
(171, 62, 171, 172, 3, 'com_content.article.58', 'Аксессуары CM Fencing', '{}'),
(172, 62, 173, 174, 3, 'com_content.article.59', 'Элементы и аксессуары CM Vattern', '{}'),
(173, 63, 90, 91, 4, 'com_content.article.60', 'Аксессуары CM Decking', '{}'),
(174, 1, 337, 338, 1, 'com_osmap', 'COM_OSMAP', '{}'),
(175, 1, 339, 340, 1, 'com_fields', 'com_fields', '{}'),
(176, 1, 341, 342, 1, 'com_associations', 'com_associations', '{}'),
(177, 18, 298, 299, 2, 'com_modules.module.102', 'Слайдер', '{}');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_associations`
--

CREATE TABLE `hud_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_banners`
--

CREATE TABLE `hud_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_banner_clients`
--

CREATE TABLE `hud_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_banner_tracks`
--

CREATE TABLE `hud_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_categories`
--

CREATE TABLE `hud_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_categories`
--

INSERT INTO `hud_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 47, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 421, '2019-07-03 12:10:16', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'default', 'com_content', 'Default', 'default', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-03 15:10:16', 421, '2019-07-04 06:55:45', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-03 12:10:16', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-03 12:10:16', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-03 12:10:16', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-03 12:10:16', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 61, 1, 11, 12, 1, 'news', 'com_content', 'Новости', 'news', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 06:56:02', 0, '2019-07-04 06:56:02', 0, '*', 1),
(9, 62, 1, 13, 46, 1, 'products', 'com_content', 'Продукция CM Scandinavia', 'products', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', 'Продукция CottageMode под брендом CM Scandinavia: CM Decking, CM Vattern, CM Garden, CM Railing, CM Wood, CM Bord, CM Care, CM Fencing.', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 12:56:26', 421, '2019-07-17 14:00:54', 0, '*', 1),
(10, 63, 9, 14, 17, 2, 'products/terrasnaja-doska-cm-decking', 'com_content', 'CM Decking', 'terrasnaja-doska-cm-decking', '', '<h4>Декинг из древесно-полимерного композита</h4>\r\n<p>Террасная доска CM Decking производится из древесно-полимерного композита (ДПК) на основе древесной муки. Декинг имеет привлекательный внешний вид и приятен на ощупь. На поверхности террасной доски из ДПК нет сучков, поэтому она не скользит даже в дождливую погоду. ДПК от CottageMode прекрасно подходит для полов на террасах, в беседках и верандах, для обустройства территории вокруг домов и бассейнов, и даже для эксплуатируемых крыш.</p>\r\n<h4>Плюсы террасной доски CM Decking</h4>\r\n<ul>\r\n<li>Выдерживает нагрузку до 300 кг/кв.см</li>\r\n<li>Рабочие температуры эксплуатации от -50С до +70С</li>\r\n<li>Влагостойкость и водостойкость</li>\r\n<li>Не коробится и не трескается</li>\r\n<li>Не требует покраски и особого ухода</li>\r\n<li>Устойчив к гниению и поражению плесенью, грибкам, насекомым</li>\r\n<li>Не выделяет формальдегида, фенола или других вредных веществ</li>\r\n<li>Сохраняет поверхность не скользкой даже в дождь</li>\r\n<li>Привлекательный внешний вид</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_DECKING\\/CM-Decking.jpg\",\"image_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\"}', 'Террасная доска из ДПК CM Decking.', 'cm decking,террасная доска,террасная доска из дпк,декинг,products', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-05 21:59:05', 421, '2019-07-24 06:30:59', 0, '*', 1),
(11, 64, 10, 15, 16, 3, 'products/terrasnaja-doska-cm-decking/cm-care', 'com_content', 'CM Care', 'cm-care', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_CARE\\/CM-Care.jpg\",\"image_alt\":\"\\u041c\\u043e\\u044e\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e CM Care\"}', 'Моющее средства CM Care', 'Моющее средства CM Care', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 16:03:29', 421, '2019-07-24 07:20:41', 0, '*', 1),
(12, 65, 9, 18, 19, 2, 'products/cm-bord', 'com_content', 'CM Bord', 'cm-bord', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_BORD\\/CM-Bord.jpg\",\"image_alt\":\"\\u0426\\u0435\\u043c\\u0435\\u043d\\u0442\\u043d\\u043e-\\u043c\\u0438\\u043d\\u0435\\u0440\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u044b\\u0435 \\u043f\\u0430\\u043d\\u0435\\u043b\\u0438\"}', '', '', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-04 13:14:25', 421, '2019-07-24 07:23:01', 0, '*', 1),
(13, 66, 9, 20, 21, 2, 'products/cm-garden', 'com_content', 'CM Garden', 'cm-garden', '', '<p>Красивый и ухоженный сад требует от своего владельца немалого труда, внимания и забот. Линейка товаров для сада CM Garden поможет вам в нелегком деле преображения загородных участков. Универсальные наборы для клумб, декоративных оградок, удобные садовые скамейки и оригинальный садовый паркет - преобразят ваш сад, сделают его красивым и функциональным.</p>\r\n<p>Клумбы и скамейки CM Garden представляют собой модули из пластиковых опор, на которых закреплены доски из древесно-полимерного композита. ДПК изготавливается из древесной муки и полимерных смол, и по внешнему виду напоминает натуральное дерево. При эксплуатации под открытым небом CM Garden не гниет и не трескается, не выцветает и не впитывает воду.</p>\r\n<p>CM Garden от COTTAGEMODE превратит любой приусадебный участок в островок спокойствия и уюта, где вы сможете отдохнуть и с удовольствием провести время со своей семьей.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_GARDEN\\/CM_GARDEN.jpg\",\"image_alt\":\"\\u0421\\u0430\\u0434\\u043e\\u0432\\u044b\\u0439 \\u043f\\u0430\\u0440\\u043a\\u0435\\u0442, \\u043a\\u043b\\u0443\\u043c\\u0431\\u044b \\u0438 \\u0441\\u043a\\u0430\\u043c\\u0435\\u0439\\u043a\\u0438 \\u0438\\u0437 \\u0414\\u041f\\u041a\"}', 'Садовый паркет из ДПК, клумбы, скамейки и оградки из ДПК CM Garden', 'cm garden,садовый паркет из дпк,клумбы из дпк,скамейки из дпк,садовые клумбы,садовые скамейки,садовый паркет,products', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 13:31:46', 421, '2019-07-24 07:14:11', 0, '*', 1),
(14, 67, 9, 22, 23, 2, 'products/cm-cladding', 'com_content', 'CM Cladding', 'cm-cladding', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_CLADDING\\/CM_CLADDING.jpg\",\"image_alt\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\"}', 'Фасадная облицовка из ДПК CM Cladding', 'cm cladding,фасадная облицовка,фасад из дпк,products', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-04 13:32:43', 421, '2019-07-24 07:23:13', 0, '*', 1),
(15, 68, 9, 24, 25, 2, 'products/cm-railing', 'com_content', 'CM Railing', 'cm-railing', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_RAILING\\/CM_RAILING.jpg\",\"image_alt\":\"\\u041f\\u0435\\u0440\\u0438\\u043b\\u0430 \\u0438 \\u043e\\u0433\\u0440\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441 \\u0438\\u0437 \\u0414\\u041f\\u041a\"}', 'Перила и ограды из ДПК CM Railing', 'cm railing,перила,ограды,дпк,перила из дпк,ограды из дпк,products', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-04 13:33:44', 421, '2019-07-24 07:23:35', 0, '*', 1),
(16, 69, 9, 26, 27, 2, 'products/cm-fencing', 'com_content', 'CM Fencing', 'cm-fencing', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_FENCING\\/CM-Fencing.jpg\",\"image_alt\":\"\\u0417\\u0430\\u0431\\u043e\\u0440\\u043d\\u044b\\u0435 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u0438 \\u0438\\u0437 \\u0414\\u041f\\u041a\"}', 'Заборы и заборные профили из ДПК CM Fencing', 'cm fencing,заборы,заборы из дпк,заборные профили из дпк,products', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-04 13:36:15', 421, '2019-07-24 07:23:44', 0, '*', 1),
(17, 70, 9, 28, 29, 2, 'products/cm-vattern', 'com_content', 'CM Vättern', 'cm-vattern', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_VATTERN\\/CM-Vattern.jpg\",\"image_alt\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\"}', 'Металлическая водосточная система CM Vattern', 'cm vattern,водостоки,металлическая водосточная система,водосток из металла,products', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-04 16:37:15', 421, '2019-07-24 07:23:53', 0, '*', 1),
(18, 71, 9, 30, 37, 2, 'products/cm-wood-natur', 'com_content', 'CM Wood Natur', 'cm-wood-natur', '', '<p>Мы предлагаем различные материалы из лиственницы для наружного и внутреннего применения:</p>\r\n<ul>\r\n<li>Террасную и палубную доску</li>\r\n<li>Вагонку и планкен для облицовки фасада</li>\r\n<li>Паркетную доску для оформления интерьеров</li>\r\n</ul>\r\n<p>Древесина CM Wood Natur не проходит никакой дополнительной обработки и не получает никаких добавок, что позволяет не только сохранить 100% натуральность, но и низкую цену. Сибирская лиственница обладает многими полезными свойствами. Ее древесина одна из самых стойких к механическим повреждениям, а по своей прочности она не уступает дубу. Будучи высушенной, лиственница не подвержена гниению, так как присутствие в ней большого объема смолы защищает древесину от порчи, гнили и насекомых-паразитов.</p>\r\n<p>Все уникальные свойства даны лиственнице самой природой. Экологическая чистота, естественный блеск, и теплые тона натурального дерева CM Wood Natur создают уют и здоровую природную атмосферу в домах с отделкой из сибирской лиственницы. Дизайнеры всего мира широко используют в своих работах отделочные материалы из лиственницы, качество и красота которой позволяют выполнить работу на высочайшем уровне.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_NATUR\\/CM-Wood-Natur.jpg\",\"image_alt\":\"\\u0414\\u0435\\u043a\\u0438\\u043d\\u0433, \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438 \\u043f\\u043e\\u043b\\u044b \\u0438\\u0437 \\u043b\\u0438\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0438\\u0446\\u044b\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 16:38:06', 421, '2019-07-24 07:21:29', 0, '*', 1),
(19, 72, 18, 31, 32, 3, 'products/cm-wood-natur/terrasnaja-doska-natur', 'com_content', 'Террасная доска', 'terrasnaja-doska-natur', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/TERRACE-BOARD.jpg\",\"image_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 22:39:21', 421, '2019-07-24 09:05:59', 0, '*', 1),
(20, 73, 18, 33, 34, 3, 'products/cm-wood-natur/fasadnaya-oblicovka-natur', 'com_content', 'Фасадная облицовка', 'fasadnaya-oblicovka-natur', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/fasad_oblicovka.jpg\",\"image_alt\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430\"}', '', '', '{\"author\":\"\",\"robots\":\"index, nofollow\"}', 421, '2019-07-05 01:39:58', 421, '2019-07-24 07:24:29', 0, '*', 1),
(21, 74, 18, 35, 36, 3, 'products/cm-wood-natur/interernye-materialy-natur', 'com_content', 'Интерьерные материалы', 'interernye-materialy-natur', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska.jpg\",\"image_alt\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 19:41:14', 421, '2019-07-24 07:24:39', 0, '*', 1),
(22, 75, 9, 38, 45, 2, 'products/cm-wood-thermo', 'com_content', 'CM Wood Thermo', 'cm-wood-thermo', '', '<p>Термодревесина — уникальный, красивый и надёжный материал. Весь секрет кроется в специальной термической обработке. Сухой пар, разогретый до температуры от 185С (серия S) или 212С (серия D) значительно улучшает свойства древесины, выводя из нее все смолы и практически всю влагу. Обработанная древесина становится легкой, прочной и устойчивой к воздействию таких неблагоприятных факторов как перепады температур, вода, насекомые-вредители, плесень и гниль. Кроме того, значительно улучшаются показатели теплопроводности, что особенно важно при использовании древесины в банях и саунах.</p>\r\n<p>CM Wood Thermo от COTTAGEMODE это экологически чистый продукт, изготовленный без использования каких-либо химикатов. При производстве используется только водяной пар и высокая температура. Такая обработка придает дереву красивый золотисто-коричневый цвет и приятную на ощупь поверхность.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_THERMO\\/CM-Wood-Thermo.jpg\",\"image_alt\":\"\\u0414\\u0435\\u043a\\u0438\\u043d\\u0433, \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438 \\u043f\\u043e\\u043b\\u044b \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b\"}', 'Термодревесина и термодерево CM Wood Thermo', 'cm wood thermo,термодерево,термодревесина,древесина для сауны,древесина для бани,products', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 19:43:10', 421, '2019-07-24 07:21:42', 0, '*', 1),
(23, 76, 22, 39, 40, 3, 'products/cm-wood-thermo/terrasnaja-doska', 'com_content', 'Террасная доска', 'terrasnaja-doska', '', '<ul>\r\n<li>100% финский продукт</li>\r\n<li>Экологически чистый продукт, в производстве используется только сухой пар</li>\r\n<li>Высокая устойчивость к перепадам температуры и влажности</li>\r\n<li>Устойчива к воздействию насекомых, плесени, грибка и гнили</li>\r\n<li>Подходит для использования в бане или сауне.</li>\r\n</ul>\r\n<p>Террасная доска из термодревесины CM Wood Thermo лучше всего подойдет для обустройства террас у воды, мест с повышенной влажностью и садовых дорожек. CM Wood Thermo, благодаря особому процессу обработки, становится стойкой к гниению и воздействию микроорганизмов. В тоже время, термодревесину не «ведет» от перепадов температур и влажности. Обработанная паром и температурой древесина не теряет свою натуральную структуру, что особенно важно с эстетической точки зрения.</p>\r\n<p>CM Wood Thermo это финский, экологически чистый и безопасный материал.</p>\r\n<p>Терраса, изготовленная из термодерева CM Wood Thermo, при правильном уходе за ней, будет радовать вас долгие годы.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CM-Wood-Themo_terrasnaya.jpg\",\"image_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\"}', 'Террасная доска из термодерева CM Wood Thermo', 'cm wood thermo,террасная доска из термодерева,термодерево,финская террасная доска,финское термодерево,термодревесина', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 16:44:03', 421, '2019-07-24 07:24:48', 0, '*', 1),
(24, 77, 22, 41, 42, 3, 'products/cm-wood-thermo/fasadnaya-oblicovka', 'com_content', 'Фасадная облицовка', 'fasadnaya-oblicovka', '', '<ul>\r\n<li>100% финский продукт</li>\r\n<li>Экологически чистый продукт, в производстве используется только сухой пар</li>\r\n<li>Высокая устойчивость к перепадам температуры и влажности</li>\r\n<li>Устойчива к воздействию насекомых, плесени, грибка и гнили</li>\r\n<li>Подходит для использования в бане или сауне</li>\r\n</ul>\r\n<p>Термодерево CM Wood Thermo — отлично подходит для фасадной отделки домов. Не требует никакой дополнительной обработки для защиты осадков, перепадов температур, гниения, вредителей и плесени. Термодерево не теряет свою форму, не растрескивается и не шелушится.</p>\r\n<p>В последние годы термодерево становится все популярнее в Европе, благодаря своим эстетическим свойствам и высокой надежности.Использование термообработанной древесины CM Wood Thermo дает вам возможность выделить фасад своего дома, придать ему особой стиль и шарм.</p>\r\n<p>Под воздействием солнечных лучей, термодревесина может утратить свой натуральный коричневый оттенок, если вы хотите этого избежать - можно покрыть фасад специальным маслом.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CM-Wood-Themo_facad.jpg\",\"image_alt\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430\"}', 'Фасадная облицовка из термодерева CM Wood Thermo', 'cm wood thermo,фасадная доска из термодерева,термодерево,финская фасадная доска,финское термодерево,термодревесина,фасадная облицовка из термодерева,фасадная облицовка термодревесина', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 13:45:05', 421, '2019-07-24 07:24:56', 0, '*', 1),
(25, 78, 22, 43, 44, 3, 'products/cm-wood-thermo/interernye-materialy', 'com_content', 'Интерьерные материалы', 'interernye-materialy', '', '<ul>\r\n<li>100% финский продукт</li>\r\n<li>Экологически чистый продукт, в производстве используется только сухой пар</li>\r\n<li>Высокая устойчивость к перепадам температуры и влажности</li>\r\n<li>Устойчива к воздействию насекомых, плесени, грибка и гнили</li>\r\n<li>Подходит для использования в бане или сауне</li>\r\n</ul>\r\n<p>Деревянные материалы для отделки интерьера – достаточно популярная и распространенная практика.</p>\r\n<p>Однако самый современный и модный тренд — внутренняя отделка с использование термодревесины. CM Wood Thermo, благодаря особому процессу обработки, становится стойким к гниению и воздействию микроорганизмов. В тоже время, термодревесина не боится перепадов температур и влажности.</p>\r\n<p>Обработанная паром и температурой древесина не теряет свою натуральную структуру, что особенно важно с эстетической точки зрения. Кроме того, благодаря тепловой обработке древесина получает приятный, коричневый цвет без применения каких-либо красителей.</p>\r\n<p>CM Wood Thermo это финский, экологически чистый и безопасный материал. Благодаря этому его можно использовать внутри любых помещений, как жилых, так и коммерческих.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"cottagemode:product\",\"image\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CM-Wood-Themo_interer.jpg\",\"image_alt\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b\"}', 'Интерьерные материалы из термодерева CM Wood Thermo', 'cm wood thermo,интерьерны материалы из термодерева,термодревесина cm wood thermo', '{\"author\":\"\",\"robots\":\"\"}', 421, '2019-07-04 13:45:46', 421, '2019-07-24 07:25:03', 0, '*', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_contact_details`
--

CREATE TABLE `hud_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_content`
--

CREATE TABLE `hud_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_content`
--

INSERT INTO `hud_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(1, 94, 'CM Decking серия Bark', 'terrasnaja-doska-cm-bark', '<p>Новая серия террасной доски CM Decking Bark обладает полностью обновленной текстурой на лицевой поверхности, напоминающую кору березы.</p>\r\n<p>Имитация древесной коры подчеркивает натуральность нашей композитной террасной доски и максимально приближает ее обладателя к дикой природе.</p>\r\n<p>Помимо новой текстуры террасная доска CM Decking серии Bark предлагается в обновленной цветовой палитре. В линейке предлагаемых цветов присутствуют три уникальных оттенка, отличающихся от расцветок предыдущих серий.</p>', '', 1, 10, '2018-07-01 21:00:00', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-07-01 21:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/BARK\\/mini\\/CM_Decking_BARK_Merbau.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0435\\u0440\\u0438\\u044f Bark\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 7, 8, 'CM_Decking', 'Террасная доска CM Decking Bark с имитацией коры березы от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(2, 95, 'CM Decking серия Robust', 'terrasnaja-doska-cm-robust', '<p>Террасная доска CM Decking серии Robust выгодно выделяется своей уникальной, утонченной текстурой древесины с неповторимым узором. За счет новой технологии производства мы смогли достичь визуального и тактильного эффекта, позволяющего максимально приблизить ощущения от дпк к натуральной древесине.</p>\r\n<p>В дополнение к обновленной текстуре мы предлагаем вам совершенно новую цветовую палитру. Натуральные оттенки экзотических пород древесины, в сочетании с улучшенной текстурой, подойдут как для обустройства классических террас, так и для организации пространства вокруг бассейнов или эксплуатируемых кровель.</p>', '', 1, 10, '2018-06-30 21:00:00', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-30 21:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/ROBUST\\/mini\\/CM_Decking_Robust-Ashwood.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 6, 7, 'CM_Decking', 'Террасная доска CM Decking серии Robust от CottageMode Scandinavia. Декинг скандинавского качества!. Натуральные оттенки экзотических пород древесины', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(3, 96, 'CM Stair Ступени', 'stupeni-cm-stair', '<p>Визитной карточкой любой террасы и дома в целом служит крыльцо.</p>\r\n<p>Ступени CM STAIR помогут выдержать единый архитектурный стиль, обеспечив при этом практичность, надежность и безупречный эстетический вид. При помощи ступеней из ДПК можно создать не только красивое и безопасное крыльцо, но и многоуровневую террасу.</p>\r\n<p>CM STAIR хорошо переносят механические нагрузки и атмосферные воздействия, приятны на ощупь и не скользят даже в дождливую погоду.</p>', '', 1, 10, '2018-06-28 13:01:13', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-28 13:01:13', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/STAIR\\/mini\\/cm-deking-stair-double-1.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0442\\u0443\\u043f\\u0435\\u043d\\u0438 CM Stair\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0421\\u0442\\u0443\\u043f\\u0435\\u043d\\u0438 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 9, 6, 'CM_Decking', 'Ступени из ДПК CM Stair', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(4, 97, 'CM Decking серия Grand', 'terrasnaja-doska-cm-decking-grand', '<p>Современный тренд оформления террас - минимализм. Благодаря малому количеству швов и виду единой поверхности серия GRAND — лучший выбор для подобного стиля.</p>\r\n<p>У террасной доски CM Decking серии GRAND две рабочих поверхности: с одной стороны — особая текстура, полученная благодаря шлифовке металлическими щетками, с другой — мелкий вельвет.</p>\r\n<p>Обе стороны обладают эффектом «Антислип». Доска не становится скользкой при намокании.</p>', '', 1, 10, '2018-06-28 13:00:59', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-28 13:00:59', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/GRAND\\/mini\\/cm-deking-grand-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0435\\u0440\\u0438\\u044f Grand\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 5, 'CM_Decking', 'Террасная доска из ДПК cерия Grand CM Decking от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(5, 98, 'CM Decking серия Vintage', 'terrasnaja-doska-cm-decking-vintage', '<p>Террасные доски серии VINTAGE — это жемчужина нашей коллекции. Серия Vintage позволит вам создать элегантную террасу, беседку или патио, а более глубокая текстура древесины добавит ей неповторимую атмосферу комфорта, уюта и единения с природой. Лицевая поверхность террасной доски дополнительно зашлифована, что придает ей эффект «Антислип» (доска не становится скользкой при намокании).</p>', '', 1, 10, '2018-06-28 13:00:47', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-28 13:00:47', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/VINTAGE\\/mini\\/cm-deking-vintage-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"Vintage\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 5, 4, 'CM_Decking', 'Террасная доска из ДПК серия Vintage CM Decking от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(6, 99, 'CM Decking серия Mix', 'terrasnaja-doska-cm-decking-mix', '<p>Благодаря деликатно подобранному слиянию нескольких цветов террасные доски CM Decking серии MIX идеально подойдут для любого дома и сада независимо от типа архитектуры и создадут ощущение экзотичности.</p>\r\n<p>Смешанный цвет позволяет с легкостью встроить вашу террасу в любой дизайн и стиль. Террасные доски серии MIX гармонично сочетаются с окружающим пространством, не выделяясь, а дополняя его.</p>\r\n<p>У террасной доски MIX две рабочих поверхности: с одной стороны - текстура брашинг, с другой - мелкий вельвет. Каждая из них зашлифована и обладает эффектом «Антислип». Благодаря этому доска не становится скользкой при намокании.</p>', '', 1, 10, '2018-06-28 13:00:36', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-28 13:00:36', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/MIX\\/mini\\/cm-deking-mix-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0441\\u0435\\u0440\\u0438\\u044f Mix\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 3, 'CM_Decking', 'Террасная доска из ДПК серия MIX CM Decking от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(7, 100, 'CM Decking серия Solid', 'terrasnaja-doska-cm-decking-solid', '<p>Террасные доски СM Decking серии SOLID — это усиленная версия серии NATUR. Классический вариант террасного настила представлен в усиленном исполнении. Данный продукт воплощает оригинальный европейский дизайн, и в то же время, позволет увеличить максимальную нагрузку на поверхность доски.</p>\r\n<p>Серия SOLID отлично подойдет для оформления парковочной зоны или любой другой поверхности, подверженной значительным нагрузкам.</p>\r\n<p>Профиль доски двухсторонний, с одной стороны — текстура натуральной древесины, с другой — мелкий вельвет. Обе стороны зашлифованы и обладают эффектом «Антислип». Доска не становится скользкой при намокании.</p>', '', 1, 10, '2018-06-28 13:00:23', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-28 13:00:23', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/SOLID\\/mini\\/cm-deking-solid-venge-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 5, 2, 'CM_Decking', 'Террасная доска из ДПК серия Solid CM Decking от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(8, 101, 'CM Decking серия Natur', 'terrasnaja-doska-cm-decking-natur', '<p>Террасные доски CM Decking серии NATUR — это классический вариант террасного настила в лучших традициях европейского ландшафтного дизайна.</p>\r\n<p>Профиль доски двухсторонний, с одной стороны — текстура натуральной древесины, с другой — мелкий вельвет. Такой подход позволяет гармонично сочетать террасу с любым архитектурным стилем.</p>\r\n<p>Обе поверхности зашлифованы и обладают эффектом «Антислип» . Доска не становится скользкой при намокании.</p>', '', 1, 10, '2018-06-15 12:21:43', 421, '', '2019-07-24 09:43:53', 421, 0, '0000-00-00 00:00:00', '2018-06-15 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/NATUR\\/mini\\/cm-deking-natur-dub-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0441\\u0435\\u0440\\u0438\\u044f Natur\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 9, 1, 'CM_Decking', 'Террасная доска из ДПК серия Natur CM Decking от CottageMode Scandinavia. Декинг скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(9, 102, 'CM Care для Террас', 'cm-care-dlja-terras', '<p>Благодаря особой формуле, разработанной специально для ухода за террасной доской из дпк, «СМ CARE Для Террас» эффективно справляется с любыми загрязнениями и, в то же время, не повреждает поверхность террасы. Чистящее средство CM Care не оставляет разводов, легко смывается водой и обладает приятным ароматом.</p>\r\n<p>Активные компоненты моющего средства позволяют без следа удалить грязь, следы насекомых, вино и многие другие загрязнения с поверхности террас из древесно-полимерного композита.</p>', '', 1, 11, '2018-07-04 09:21:39', 421, '', '2019-07-24 08:46:58', 421, 0, '0000-00-00 00:00:00', '2018-07-04 09:21:39', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_CARE\\/TERRACE\\/mini\\/cm-care-terassy-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 6, 1, 'CM_Decking', 'Моющее средство для ДПК CM Care для террас', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(10, 103, 'CM Care Универсальное', 'cm-care-universalnoe', '<p>Благодаря специальной, усиленной формуле «СМ CARE Универсальное» эффективно справляется с любыми загрязнениями, в то же время, не повреждая поверхность и не оставляя на ней пятен и разводов!</p>\r\n<p>Активные компоненты моющего средства позволяют без следа удалить грязь, масляные пятна, следы насекомых, вино и сок ягод и прочие загрязнения на каменных, металлических, пластиковых и прочих поверхностях.</p>\r\n<p>«СМ CARE Универсальное» легко и быстро возвращает первоначальную чистоту, и экономит ваше время для более приятных занятий!</p>', '', 1, 11, '2018-07-04 09:21:39', 421, '', '2019-07-24 08:46:55', 421, 0, '0000-00-00 00:00:00', '2018-07-04 09:21:39', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_CARE\\/UNIVERSAL\\/mini\\/cm-care-universal-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 10, 0, 'CM_Decking', 'Моющее средство для ДПК CM Care универсальное', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(11, 104, 'CM Bord', 'cm-bord', '<h4>Что такое CM Bord?</h4>\r\n<p>CM Bord — это высококлассная замена натуральной древесины.</p>\r\n<p>Сохраняя элегантный рисунок натурального дерева, стеновые панели CM Bord обладают при этом надежностью и прочностью бетона. Детально проработанная рельефная поверхность и оптимальная цветовая гамма гарантированно создают стильный и лаконичный дизайн.</p>\r\n<p>CM Bord изготавливается из хризотилцемента и окрашивается специальным покрытием, придающим панелям необходимый оттенок и дополнительно защищающим от внешнего воздействия.</p>\r\n<p>Следуя скандинавским традициям строительства и дизайна, стеновые панели CM Bord производятся в соответствии с самыми строгими требованиями экологической безопасности. Готовые панели — абсолютно безопасны для здоровья!</p>\r\n<p>CM Bord отлично выглядит в сочетании с другими отделочными материалами, такими как натуральное дерево, природный камень или стекло, создавая еще больше комбинаций для творчества и самовыражения.</p>\r\n<h4>Цвета CM Bord</h4>\r\n<p>Цементно-минеральные фасадные панели CM Bord производятся в 8 цветах:</p>\r\n<ul>\r\n<li>Черный</li>\r\n<li>Коричневый</li>\r\n<li>Тёмно-серый</li>\r\n<li>Золотой</li>\r\n<li>Светло-серый</li>\r\n<li>Светло-коричневый</li>\r\n<li>Красный</li>\r\n<li>Белый</li>\r\n</ul>', '', 1, 12, '2018-12-21 13:12:53', 421, '', '2019-07-24 08:47:35', 421, 0, '0000-00-00 00:00:00', '2018-12-21 13:12:53', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_BORD\\/CM-Bord.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM Bord\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0426\\u0435\\u043c\\u0435\\u043d\\u0442\\u043d\\u043e-\\u043c\\u0438\\u043d\\u0435\\u0440\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u044b\\u0435 \\u043f\\u0430\\u043d\\u0435\\u043b\\u0438\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 6, 0, 'CM_Bord', 'CM Bord — высококлассная замена натуральной древесины, которая изготавливается из хризотилцемента и окрашивается специальным покрытием', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(12, 105, 'CM Garden Клумбы', 'cm-garden-klumby', '<p>Обрамления для клумб, грядок, песочниц из дпк от COTTAGEMODE представляют собой наборы из четырех бортов-профилей из древесно-полимерного композита с пластиковыми замковыми креплениями и металлическими креплениями. Так же в комплект входят пластиковые крепления типа «гарпун» для установки в землю.</p>\r\n<p>Обрамления представляют собой удобный вариант для оформления ваших любимых клумб, грядок или безопасных детских песочниц. Почему безопасных? Потому что дети никогда не посадят занозы!</p>\r\n<p>Обрамления для клумб CM Garden просты в сборке и не требуют сложного ухода. Они прослужат вам долгие годы.</p>\r\n<h4>Цвета</h4>\r\n<p>Доступен в цвете Венге или Дуб</p>', '', 1, 13, '2018-07-03 21:00:04', 421, '', '2019-07-24 08:54:46', 421, 0, '0000-00-00 00:00:00', '2018-07-03 21:00:04', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_GARDEN\\/FLOWERBED\\/mini\\/cm-garden-flowerbed.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041a\\u043b\\u0443\\u043c\\u0431\\u044b\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041a\\u043b\\u0443\\u043c\\u0431\\u044b \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 4, 'CM_Garden', 'Сборные клумбы из ДПК CM Garden', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(13, 106, 'CM Garden Оградки', 'cm-garden-sadovye-ogradki', '<p>Садовые оградки из дпк от COTTAGEMODE — это наборы из трёх небольших, готовых к использованию ограждений с фиксатором в землю.</p>\r\n<p>Садовые оградки CM Garden идеально подойдут для обрамления клумб, садовых растений или расположения на участке вдоль дорожек и газонов.</p>\r\n<p>Они просты в установке и неприхотливы в уходе. Благодаря тому, что они изготовлены из дпк, садовые оградки CM Garden не сгниют, не потрескаются, и будут радовать вас долгие годы.</p>', '', 1, 13, '2018-07-03 21:00:03', 421, '', '2019-07-24 08:55:17', 421, 0, '0000-00-00 00:00:00', '2018-07-03 21:00:03', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/mini\\/cm-garden-garden-parquet.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0430\\u0434\\u043e\\u0432\\u044b\\u0435 \\u043e\\u0433\\u0440\\u0430\\u0434\\u043a\\u0438\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0421\\u0430\\u0434\\u043e\\u0432\\u044b\\u0435 \\u043e\\u0433\\u0440\\u0430\\u0434\\u043a\\u0438 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 3, 'CM_Garden', 'Садовые оградки из ДПК CM Garden', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(14, 107, 'CM Garden Садовый паркет', 'cm-garden-sadovyj-parket', '<p>Садовый паркет CM Garden — это универсальное решение для благоустройства вашего участка. Система фиксации «шип-паз» и оптимальный размер паркета позволяют легко и быстро обустроить садовые дорожки, проходы между клумбами, террасы вокруг бассейнов или напольный настил на балконе.</p>\r\n<p>Представлен в двух видах профиля: <strong>Classic (вельвет)</strong> и <strong>Natur (текстура древесины)</strong>, и трёх цветовых решениях. Дополнительно представлен профиль <strong>Classic Light</strong>: паркет с установленными светодиодами, автоматически включающимися в темноте.</p>\r\n<p>Садовый паркет CM Garden не требует особого ухода. Для поддержания чистоты поверхности обычно достаточно промыть поверхность водой под давлением 2-3 раза в год с использованием моющего средства для ДПК. Для удаления сильных загрязнений можно воспользоваться карчеткой.</p>\r\n<p>CM Garden укладывается на любую ровную поверхность, не требует никакого дополнительного крепежа — система соединения «шип- паз» обеспечивает быструю и надежную укладку.</p>', '', 1, 13, '2018-07-03 21:00:02', 421, '', '2019-07-24 08:55:08', 421, 0, '0000-00-00 00:00:00', '2018-07-03 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/mini\\/cm-garden-garden-fences.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0430\\u0434\\u043e\\u0432\\u044b\\u0439 \\u043f\\u0430\\u0440\\u043a\\u0435\\u0442\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0421\\u0430\\u0434\\u043e\\u0432\\u044b\\u0439 \\u043f\\u0430\\u0440\\u043a\\u0435\\u0442 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 2, 'CM_Garden', 'Садовый паркет из ДПК CM Garden', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(15, 108, 'CM Garden Скамейки', 'cm-garden-skamejki', '<p>Садовые скамьи CM Garden произведены в соответствии с европейскими традициями ландшафтного дизайна. Скамьи полностью изготавливаются из древесно-полимерного композита, представлены в трех цветовых решениях и поставляются в готовом к сборке виде.</p>\r\n<p>Садовая скамья CM Garden, оптимальный выбор для вашего приусадебного участка. В отличие от скамеек, изготовленных из простой древесины, скамья из ДПК будет радовать вас долгие годы своим безупречным внешним видом! Она крайне проста в сборке и неприхотлива в уходе, кроме того ДПК приятен на ощупь как настоящее дерево.</p>\r\n<p>Садовые скамьи от COTTAGEMODE станут финальным штрихом в вашем ландшафтном дизайне. Они надежны, долговечны и не подвержены сколам и трещинам.</p>', '', 1, 13, '2018-07-03 21:00:01', 421, '', '2019-07-24 08:54:48', 421, 0, '0000-00-00 00:00:00', '2018-07-03 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_GARDEN\\/BENCH\\/mini\\/cm-garden-bench.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u043a\\u0430\\u043c\\u0435\\u0439\\u043a\\u0438\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0421\\u043a\\u0430\\u043c\\u0435\\u0439\\u043a\\u0438 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 5, 1, 'CM_Garden', 'Скамейки из ДПК CM Garden', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(16, 109, 'CM Cladding', 'fasadnaya-oblitsovka-iz-dpk', '<p>Выбор фасадной облицовки является важным этапом отделочных работ при строительстве любого здания. К этому выбору нужно подойти ответственно, так как это во многом определяет экстерьер дома и срок его службы в первозданном виде. Фасадная доска из дпк CM Cladding - это современный облицовочный материал, сочетающий в себе экологическую чистоту натуральной древесины и практичность эксплуатации пластика.</p>\r\n<p>Сайдинг из дпк CM Cladding подходит как для отделки частных домов, так и для облицовки фасадов зданий общественного и промышленного назначения. Такая широта применения фасадных панелей CM Cladding объясняется их простотой в установке, привлекательным внешним видом и исключительной надежностью древесно-полимерного композита.</p>', '', 1, 14, '2018-07-04 10:36:55', 421, '', '2019-07-24 08:59:07', 421, 0, '0000-00-00 00:00:00', '2018-07-04 10:36:55', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_CLADDING\\/mini\\/cm-cladding-dub-double.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 7, 0, 'CM_Cladding', 'Фасадная облицовка из дпк CM Cladding от CottageMode Scandinavia. Фасадная доска из ДПК скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(17, 110, 'CM Railing', 'perila-i-ograzhdenija-cm-railing', '<p>CM Railing это гармоничное завершение архитектуры вашей террасы, беседки или балкона. Перила CM Railing шлифованы со всех сторон, что делает их особенно приятными на ощупь и придает солидный внешний вид.</p>\r\n<p>Благодаря широкому выбору комплектующих, перила CM Railing позволяют создавать уникальные ограждения с различными комбинациями элементов. Кроме того, они не боятся влаги, не растрескиваются и не выцветают под воздействием солнца.</p>\r\n<h4>Цвет</h4>\r\n<p>Перила и ограждения для террас из древесно-полимерного композита CM Railing доступны в цвете Венге.</p>', '', 1, 15, '2018-07-05 12:57:38', 421, '', '2019-07-24 08:59:41', 421, 0, '0000-00-00 00:00:00', '2019-07-05 09:37:38', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_RAILING\\/mini\\/10.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041f\\u0435\\u0440\\u0438\\u043b\\u0430 CM Railing\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041f\\u0435\\u0440\\u0438\\u043b\\u0430 \\u0438 \\u043e\\u0433\\u0440\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 6, 0, 'CM_Railing', 'Перила и ограждения для террас из дпк CM Railing от СM Scandinavia (CottageMode).', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(18, 111, 'CM Fencing', 'zabornye-paneli-cm-fencing', '<p>Популярные заборы из металла, дерева и даже из кирпича на сегодняшний день уже примелькались, и зачастую, выглядят достаточно посредственно. Кроме того их монтаж отнимает много времени и сил.</p>\r\n<p>Заборный профиль из ДПК CM Fencing - стильное и удобное в монтаже решение. CM Fencing легко устанавливается, при этом все, что потребуется, это иметь на участке для такого забора ленточное или точечное бетонирование.</p>\r\n<p>Забор из ДПК CM Fencing будет прекрасно выглядеть и сохранит свой первоначальный вид долгие годы, так как для этого материала характерны такие качества как отсутствие гниения, трещин, сколов и значительного выцветания.</p>', '', 1, 16, '2018-07-05 14:43:41', 421, '', '2019-07-24 09:00:23', 421, 0, '0000-00-00 00:00:00', '2018-07-05 14:43:41', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_FENCING\\/mini\\/cm-fencing-venge-1.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0417\\u0430\\u0431\\u043e\\u0440\\u044b \\u0438\\u0437 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0430\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0417\\u0430\\u0431\\u043e\\u0440\\u044b \\u0438\\u0437 \\u0414\\u041f\\u041a\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 9, 0, 'CM_Fencing', 'Заборы из ДПК от CottageMode Scandinavia. ДПК скандинавского качества!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(19, 112, 'CM Vattern', 'vodostochnye-sistemy-cm-vattern', '<h4 style=\"margin-top: 2rem;\">Европейские стандарты</h4>\r\n<p>Металлическая водосточная система CM Vattern от CottageMode Scandinavia AB разработана с целью стать финальным штрихом в создании законченного облика всей кровельной и фасадной системы. Название системы CM Vattern появилось благодаря мотивам, навеянным природой Швеции. Среди бескрайних просторов и пейзажей этой страны, ярким пятном виднеется озеро Веттерн — второе по величине в Швеции и самый чистый водоем в Европе. В качестве нашего вклада в заботу о защите природы, при производстве водостоков CM Vattern мы используем только безопасные и экологичные материалы. Многолетний опыт работы с металлом позволяет нам производить водосточную систему с высокими техническими характеристиками и соблюдением всех требований, необходимых для соответствия европейским стандартам EN 612 и EN 1462.</p>\r\n<p>В целях увеличения срока службы водосточной системы, на обе стороны CM Vattern мы наносим полимерное покрытие HBP (High Build Polyester), обеспечивающее оптимальные показатели устойчивости к воздействию окружающей среды и истиранию. Покрытие HBP обладает стойким блеском и сохраняет яркость цвета.</p>\r\n<p><img class=\"pull-center\" src=\"images/CM_VATTERN/CM_Vattern.png\" alt=\"CM_Vattern\" /></p>\r\n<h4>Технические характеристики</h4>\r\n<ul>\r\n<li>Водосточная система изготавливается из оцинкованной стали с толщиной покрытия не менее 275 г/м<sup>2</sup></li>\r\n<li>Трубы и желоба изготавливаются из стали DX 52, толщиной 0,57 мм, покрытые HBP толщиной 35 мкм с обеих сторон</li>\r\n<li>Аксессуары изготавливаются из стали DX 51, толщиной 1 мм и DX 54 толщиной 0,6 мм, покрытые HBP толщиной 35 мкм с обеих сторон</li>\r\n<li>Крюки изготавливаются из стали ST-22 и ST-37 с порошковым покрытием толщиной 60 мкм</li>\r\n</ul>\r\n<h4>Точность стыковки</h4>\r\n<p>CM Vattern изготавливается в двух размерах: 125/90 и 150/100. Мы также разработали большой ассортимент аксессуаров для эффективного водоотвода в течение длительного периода эксплуатации. Водостоки CM Vattern разработаны так, чтобы монтаж был простым, благодаря исключительной точность стыковки всех элементов, что значительно упрощает процесс монтажа.</p>\r\n<h4>Цвета</h4>\r\n<p>Водостоки CM Vattern поставляются в девяти разных цветах:</p>\r\n<ul>\r\n<li>Белый (RAL9002)</li>\r\n<li>Коричневый (RAL 8017)</li>\r\n<li>Тёмно-коричневый (RAL8019)</li>\r\n<li>Кирпичный (RAL8004)</li>\r\n<li>Тёмно-красный (RAL3009)</li>\r\n<li>Серебристый металлик (RAL9006)</li>\r\n<li>Графитовый металлик (RAL9007)</li>\r\n<li>Тёмно-серый (RAL7011)</li>\r\n<li>Чёрный (RAL9005)</li>\r\n</ul>', '', 1, 17, '2018-07-05 13:15:51', 421, '', '2019-07-24 09:01:20', 421, 0, '0000-00-00 00:00:00', '2018-07-05 13:15:51', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_VATTERN\\/mini\\/CM-Vattern.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u043a\\u0438 \\u0438\\u0437 \\u0448\\u0432\\u0435\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0441\\u0442\\u0430\\u043b\\u0438\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 9, 0, 'CM_Vättern', 'Металлическая водосточная система CM Vattern от СM Scandinavia (CottageMode) сочетает в себе непревзойденное шведское качество, технологии и привлекательную стоимость.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', '');
INSERT INTO `hud_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(20, 113, 'CM Wood Natur Палубная доска', 'palubnaya-doska', '<p>Открытая терраса — мечта многих владельцев загородных домов. Чаще всего, террасы строят из дерева, но возникает вопрос, на какой породе древесины остановить свой выбор? Лучший материал — натуральная сибирская лиственница CM Wood Natur. Ее древесина одна из самых стойких к механическим повреждениям, а по своей прочности она не уступает дубу. Будучи высушенной, лиственница и изделия из нее не подвержены гниению. Не стоит забывать и о том, что использование натуральной древесины, создает уют и здоровую природную атмосферу. Материалы для деревянных террас CM Wood Natur поставляются в двух вариантах исполнения: классическая террасная доска с покрытием «мелкий вельвет» и гладкая, палубная доска.</p>', '', 1, 19, '2018-07-04 21:00:02', 421, '', '2019-07-24 09:07:34', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/mini\\/palubnaya_doska.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0410\\u0412\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 1, 'Wood_Natur_Террасная_доска', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(21, 114, 'CM Wood Natur Террасная доска', 'terrasnaya-doska', '<p>Открытая терраса — мечта многих владельцев загородных домов. Чаще всего, террасы строят из дерева, но возникает вопрос, на какой породе древесины остановить свой выбор?</p>\r\n<p>Лучший материал — натуральная сибирская лиственница CM Wood Natur. Ее древесина одна из самых стойких к механическим повреждениям, а по своей прочности она не уступает дубу. Будучи высушенной, лиственница и изделия из нее не подвержены гниению. Не стоит забывать и о том, что использование натуральной древесины, создает уют и здоровую природную атмосферу.</p>\r\n<p>Материалы для деревянных террас CM Wood Natur поставляются в двух вариантах исполнения: классическая террасная доска с покрытием «мелкий вельвет» и гладкая, палубная доска.</p>', '', 1, 19, '2018-07-04 21:00:01', 421, '', '2019-07-24 09:07:25', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/mini\\/terrasnaya_doska.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0410\\u0412\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 0, 'Wood_Natur_Террасная_доска', 'Террасная доска из сибирской лиственницы CM Wood Natur', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(22, 115, 'CM Wood Natur Фасадная облицовка', 'fasadnaya-oblicovka', '<p>Фасады из натурального дерева не только красивы, но и гармонируют с окружающей природой. Кроме того, это экологически чистый материал, что очень важно в современном, урбанизированном мире. Фасадная облицовка CM Wood Natur выполняет сразу несколько функций. Помимо своих эстетических свойств, она прекрасно утепляет дом, защищает его от внешних воздействий.</p>\r\n<p>Не стоит забывать и о том, что фасадные материалы из натуральной лиственницы практичны и долговечны.<br />Модным трендом в отделке фасадов зданий стали вентилируемые фасады из натурального дерева. Такие фасады монтируются с помощью прямого или скошенного планкена. Это модный и универсальный стиль отделки, его можно использовать не только для загородных домов в классическом стиле, но и для современных домов в стиле хай-тек. Такой вариант фасада подойдет и для домов в минималистичном скандинавском стиле.</p>', '', 1, 20, '2018-07-05 08:57:31', 421, '', '2019-07-05 12:21:31', 421, 0, '0000-00-00 00:00:00', '2018-07-05 08:57:31', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/mini\\/planken.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0412\\u0430\\u0433\\u043e\\u043d\\u043a\\u0430 \\u0438 \\u043f\\u043b\\u0430\\u043d\\u043a\\u0435\\u043d\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 0, 'CM_Wood_Natur_Фасадная облицовка', 'Фасадная облицовка из сибирской лиственницы CM Wood Natur', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(23, 116, 'CM Wood Natur Штиль брашированный', 'shtil-brashirovannyy', '', '', 1, 21, '2018-07-04 21:00:03', 421, '', '2019-07-24 09:34:37', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:03', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil_brashirovannyy\\/mini\\/shtil_brashirovannyy.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041f\\u0430\\u0440\\u043a\\u0435\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 2, 'CM_Wood_Natur_Интерьерные_материалы', 'Паркетная доска из сибирской лиственницы CM Wood Natur.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(24, 117, 'CM Wood Natur Штиль', 'shtil', '', '', 1, 21, '2018-07-04 21:00:02', 421, '', '2019-07-24 09:34:24', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil\\/mini\\/shtil.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041f\\u0430\\u0440\\u043a\\u0435\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 1, 'CM_Wood_Natur_Интерьерные_материалы', 'Паркетная доска из сибирской лиственницы CM Wood Natur.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(25, 118, 'CM Wood Natur Паркетная доска', 'parketnaya-doska-natur', '<p>Несмотря на то, что на рынке постоянно появляются новые строительные материалы, а технологии строительства двигаются вперед, дерево по-прежнему остается наиболее популярным материалом для внутренней отделки.</p>\r\n<p>Лиственница CM Wood Natur — прекрасный выбор для внутренней отделки. В современном интерьере она была и остается одним из любимых материалов дизайнеров. Колоритность узора, теплые благородные оттенки и природный лоск древесины CM Wood Natur будут долгие годы радовать вас и вдохновлять. Применение натуральной древесины CM Wood Natur подчеркнет стиль и изысканность любого интерьера.</p>', '', 1, 21, '2018-07-04 21:00:01', 421, '', '2019-07-24 09:34:13', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/mini\\/parketnaja_doska.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041f\\u0430\\u0440\\u043a\\u0435\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 0, 'CM_Wood_Natur_Интерьерные_материалы', 'Паркетная доска из сибирской лиственницы CM Wood Natur', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(26, 119, 'CM Wood Thermo CMLD2 PF2', 'terrasnaja-doska-cmld2-pf2', '<p>Террасная доска из CM Wood Thermo — это материал для изготовления террас, обладающий сложным профилем: специальные канавки по всей длине доски обеспечивают отсутствие скольжения при намокании, а особый профиль нижней части доски — удобное и надежное крепление к лаге с помощью специальной клипсы. Террасная доска CM Wood Thermo рекомендуется к использованию на открытом воздухе в качестве напольного покрытия террас, пирсов, садовых дорожек, территорий около бассейнов и водоемов. Специальная термообработка древесины придает ей высокую стойкость к влаге, плесени и гниению.</p>\r\n<p>Важная особенность массивной доски из термодревесины — благодаря тому, что в процессе обработки изнутри древесины удаляется вся влага, ее размеры остаются стабильными, поэтому использование этого материала в качестве напольного покрытия позволяет избежать образование щелей в готовом полу.</p>\r\n<p>Шпунтованная напольная доска</p>', '', 1, 23, '2018-07-04 21:00:02', 421, '', '2019-07-24 09:35:13', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/mini\\/cmld.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 CM Wood Thermo\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 1, 'Wood_Thermo_Термодревесина', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(27, 120, 'CM Wood Thermo CMSHP', 'terrasnaja-doska-cmshp', '<p>Палубная доска CM Wood Thermo – это прочное напольное покрытие с гладкой поверхностью. Она отличается закругленными краями на всех кромках и отсутствием системы соединения «шип-паз». Благодаря термообработке, доска приобретает устойчивость к влаге, насекомым и грибкам. Как и прочие напольные материалы — палубная доска CM Wood Themo долгие годы остается стабильной в своих размерах, поэтому в полу не будет образовываться щелей</p>', '', 1, 23, '2018-07-04 21:00:01', 421, '', '2019-07-24 09:35:04', 421, 0, '0000-00-00 00:00:00', '2018-07-04 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/mini\\/CMSHP.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u041f\\u0430\\u043b\\u0443\\u0431\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 CM Wood Thermo\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 0, 'Wood_Thermo_Термодревесина', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(28, 121, 'CM Wood Thermo CMSHP', 'naruzhnaja-oblicovka-cmshp', '<p>Планкен CM Wood Thermo — это профилированная термообработанная доска, по внешнему виду идентична палубной, но обладает меньшей толщиной, поэтому используется в качестве стенового отделочного материала. Благодаря термообработке, древесина CM Wood Thermo становится устойчивой к неблагоприятным погодным условиям, насекомым, плесени и гнили. Поэтому планкен CM Wood Thermo рекомендуется использовать в качестве фасадной облицовки.</p>', '', 1, 24, '2019-07-04 21:00:03', 421, '', '2019-07-24 09:36:13', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:03', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/mini\\/CMSHP.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM Wood Thermo CMSHP\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 2, 'CM_Wood_Thermo_Фасадная_облицовка', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(29, 122, 'CM Wood Thermo CMUTV', 'naruzhnaja-oblicovka-cmutv', '<p>Имитация бруса СM Wood Thermo - соединяет в себе несколько ключевых качеств: с одной стороны, имитация бруса - это один из наиболее популярных видов отделки, как фасадов, так и внутреннего убранства загородных домов, с другой — благодаря обработке водяным паром и высокой температурой древесина приобретает особый, золотисто-коричневый оттенок, который при этом сохраняет природный рисунок древесины. Имитация бруса CM Wood Thermo — идеальный выбор для отделки стен в саунах и банях. Немаловажным остается и тот факт, что обработанная подобным образом древесина — это надежный и долговечный материал, который будет радовать вас долгие годы.</p>', '', 1, 24, '2018-07-05 21:00:02', 421, '', '2019-07-24 09:35:50', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/mini\\/CMUTV.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM Wood Thermo CMUTV\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 1, 'CM_Wood_Thermo_Фасадная_облицовка', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(30, 123, 'CM Wood Thermo CMVR / CMHSS', 'naruzhnaja-oblicovka-cmvr-cmhss', '<p>Солнечный экран — это новый тренд в загородном строительстве. Благодаря особой форме — солнечный экран CM Wood Thermo не мешает обзору, но при этом защищает комнату от попадания прямых солнечных лучей.</p>\r\n<p>Как и другие материалы линейки CM Wood Thermo — солнечный экран это натуральный, качественный и надежный продукт, в изготовлении которого используется только высокая температура и пар.</p>\r\n<p>Наслаждайтесь видом из окна без слепящих лучей, вместе с солнечным экраном CM Wood!</p>', '', 1, 24, '2018-07-05 21:00:01', 421, '', '2019-07-24 09:35:38', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/mini\\/cmvr-cmhss.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM Wood Thermo CMVR \\/ CMHSS\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0424\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430 \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 0, 'CM_Wood_Thermo_Фасадная_облицовка', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(31, 124, 'CM Wood Thermo CMSHP', 'interernye-materialy-cmshp', '<p>Строительная доска CM Wood Thermo — это универсальный строительный материал, обладающий отличительными преимуществами.<br />Благодаря специальной обработке водяным паром и высокой температуре из древесины выходит лишняя влага, а так же смолы и прочие вещества, присутствие которых может привести к гниению. В результате — строительная доска CM Wood Thermo приобретает особую прочность, влагостойкость и долговечность.</p>\r\n<p>Данный материал может использоваться в качестве обрешетки при монтаже напольных покрытий или отделке фасадов, а так же для сооружения различных построек.</p>', '', 1, 25, '2018-07-05 21:00:03', 421, '', '2019-07-24 09:37:09', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:03', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/mini\\/CMSHP.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0421\\u0442\\u0440\\u043e\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 CM Wood Thermo\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 2, 'CM_Wood_Thermo_Интерьерные_материалы', 'Террасная доска из термодерева', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(32, 125, 'CM Wood Thermo CMHLL', 'interernye-materialy-cmhll', '<p>Шпунтованная напольная доска CM Wood Thermo — материал, созданный специально для отделки полов. Благодаря своей толщине и термообработке, она обладает отличными термоизоляционными свойствами, кроме того, она обеспечивает хорошую шумоизоляцию. Важная особенность массивной доски из термодревесины — благодаря тому, что в процессе обработки изнутри древесины удаляется вся влага, ее размеры остаются стабильными, поэтому использование этого материала в качестве напольного покрытия позволяет избежать образование щелей в готовом полу.</p>\r\n<p>Шпунтованная напольная доска CM Wood Thermo — это надежный, долговечный, и самое главное — экологически чистый материал. Она изготавливается без использования клея и других химических компонентов, при производстве используется только водяной пар и высокая температура.</p>', '', 1, 25, '2018-07-05 21:00:02', 421, '', '2019-07-24 09:37:00', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:02', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/mini\\/CMHLL.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0428\\u043f\\u0443\\u043d\\u0442\\u043e\\u0432\\u0430\\u043d\\u043d\\u0430\\u044f \\u043d\\u0430\\u043f\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 CM Wood Thermo\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\" \\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 1, 'CM_Wood_Thermo_Интерьерные_материалы', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(33, 126, 'CM Wood Thermo CMSTP', 'interernye-materialy-smstp', '<p>Вагонка CM Wood Thermo — материал, который чаще всего применяется для отделочных работ. Может использоваться как для внутренней, так для и внешней отделки стен, постройки беседок или заборов. Обработка паром и высокой температурой, делает вагонку CM Wood Thermo прекрасным материалом для отделки бань и саун. Она плотно укладывается, не образует зазоров и щелей. Благодаря термообработке, вагонка приобретает красивый золотисто-коричневый оттенок. Кроме того, вагонка CM Wood Thermo обладает отличными теплоизоляционными качествами и высокой устойчивостью к влажности.</p>', '', 1, 25, '2018-07-05 21:00:01', 421, '', '2019-07-24 09:36:51', 421, 0, '0000-00-00 00:00:00', '2018-07-05 21:00:01', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/mini\\/CMSTP.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0412\\u0430\\u0433\\u043e\\u043d\\u043a\\u0430 CM Wood Thermo\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\" \\u0418\\u043d\\u0442\\u0435\\u0440\\u044c\\u0435\\u0440\\u043d\\u044b\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0442\\u0435\\u0440\\u043c\\u043e\\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 0, 'CM_Wood_Thermo_Интерьерные_материалы', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(34, 127, 'О компании', 'company', '<h3>Välkommen! Добро пожаловать!</h3>\r\n<p>CottageMode Scandinavia AB — это шведский концерн, по заказу которого, производятся материалы из древесно-полимерного композита, натурального дерева и металла, объединенные брендом CM Scandinavia.</p>\r\n<h4>Преимущества работы с нами:</h4>\r\n<ul>\r\n<li>Постоянное расширение ассортимента в соответствии с тенденциями рынка и пожеланиями покупателей</li>\r\n<li>Профессиональный подход</li>\r\n<li>Производство материалов в соответствии с мировыми стандартами</li>\r\n<li>Строгий контроль качества продукции</li>\r\n<li>Производство на современном оборудовании с использованием новейших технологий</li>\r\n<li>Полное маркетинговое обеспечение партнеров</li>\r\n</ul>\r\n<p>За время работы на российском рынке компания CottageMode Scandinavia AB приобрела более 300 надежных торговых партнеров по всей стране. Мы провели более 100 обучающих семинаров для более чем 700 менеджеров компаний-партнеров и гордимся нашим вкладом в развитие рынка материалов из дпк.</p>\r\n<p>Для CM Scandinavia мы выбираем только лучшие строительные товары, отвечающие нашим высоким стандартам. Наша цель предложить современную качественную продукцию по конкурентным ценам на рынке строительных материалов.</p>\r\n<p>Следуя потребностям рынка CottageMode Scandinavia AB с каждым годом расширяет ассортимент выпускаемых материалов.</p>\r\n<p class=\"popup\"><a href=\"images/PAGE/big/photo_2019-03-20_12-33-22.jpg\"><img src=\"images/PAGE/photo_2019-03-20_12-33-22.jpg\" caption=\"false\" style=\"margin: 10px 10px 10px 0;\" width=\"654\" height=\"654\" /></a> <a href=\"images/PAGE/big/CottageMode_certificate.jpg\"><img src=\"images/PAGE/CottageMode_certificate.jpg\" style=\"border: 5px solid black; border-width: 1px; margin: 10px;\" caption=\"false\" width=\"499\" height=\"651\" /></a></p>\r\n<h4>Материалы для скачивания:</h4>\r\n<p><strong><a href=\"images/PAGE/PDF/CM_Scandinavia_All_Products_(2019).pdf\" title=\"PDF Каталог\" target=\"_blank\" rel=\"noopener noreferrer\">Полный ассортимент продукции CM Scandinavia</a></strong></p>\r\n<p><strong><a href=\"images/PAGE/PDF/CM_Scandinavia_WPC_Products_(2019).pdf\" title=\"pdf буклет\" target=\"_blank\" rel=\"noopener noreferrer\">Каталог продукции из ДПК CM Scandinavia</a></strong></p>\r\n<p><strong><a href=\"images/PAGE/Logo_CM-01.jpg\" title=\"img Logo\" target=\"_blank\" rel=\"noopener noreferrer\">Логотип CM Scandinavia</a></strong></p>\r\n<p><strong><a href=\"images/PAGE/Logo_CM_Decking-01.jpg\" title=\"img Logo\" target=\"_blank\" rel=\"noopener noreferrer\">Логотип CM Decking</a></strong></p>', '', 1, 2, '2019-07-05 11:38:40', 421, '', '2019-07-22 06:26:49', 421, 0, '0000-00-00 00:00:00', '2019-07-05 11:38:40', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f | \\u0421M Scandinavia\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 10, 4, 'cm scandinavia, cottagemode, cottage mode, коттеджмод, официальный сайт cottage mode', 'CottageMode Scandinavia AB — это шведский концерн, по заказу которого производятся материалы из ДПК, натурального дерева и металла, объединенные брендом CM Scandinavia.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', '', ''),
(35, 128, 'Где купить?', 'where-buy', '<div class=\"menushow\"><a class=\"show dpk\" href=\"#wrapperTag\" shows=\"Материалы из ДПК\">Материалы из ДПК</a> <a class=\"show voda\" href=\"#wrapperTag\" shows=\"Водосточные системы\">Водосточные системы</a> <a class=\"show derevo\" href=\"#wrapperTag\" shows=\"Материалы из дерева\">Материалы из дерева</a> <a class=\"show all\" href=\"#wrapperTag\" shows=\"\">Показать все метки</a></div>\r\n<div id=\"stagimap\"></div>\r\n<span id=\"wrapperTag\"></span>', '', 1, 2, '2019-07-05 11:39:36', 421, '', '2019-07-17 07:58:45', 421, 0, '0000-00-00 00:00:00', '2019-07-05 11:39:36', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041a\\u0430\\u0440\\u0442\\u0430 \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u0432 CM Scandinavia\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 19, 3, 'купить cottagemode, купить коттеджмод, коттеджмод дилер, коттеджмод магазин', 'Карта дилеров CM Scandinavia в России.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', '', ''),
(36, 129, 'Стать дилером', 'contacts', '<p>Официальные дилеры CottageMode Scandinavia AB работают по всей России. Поскольку ассортимент и география продаж материалов под брендом CM Scandinavia постоянно расширяется, мы приглашаем к сотрудничеству новых партнеров.</p>\r\n<p>Став нашим дилером, вы получаете уникальные возможности для развития и повышения эффективности вашего бизнеса.</p>\r\n<p>Для независимых дилеров и дилерских сетей, заинтересованных в сотрудничестве, доступны такие преимущества, как: гибкая ценовая политика, отсутствие регламентированных объемов продаж, бесплатные рекламные материалы (стенды, буклеты и каталоги), а также обучение для ваших сотрудников.</p>\r\n<p>Хотите узнать больше? Заполните заявку на сотрудничество.</p>', '', 1, 2, '2019-07-05 11:40:25', 421, '', '2019-07-05 11:40:25', 0, 0, '0000-00-00 00:00:00', '2019-07-05 11:40:25', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 2, 'cm scandinavia, cottagemode, коттеджмод, стать дилером коттеджмод', 'Стать дилером CM Scandinavia, заполнить заявку на сотрудничество.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', '', ''),
(37, 130, 'Задать вопрос', 'question', '<p>У вас возникли вопросы по продукции CM Scandinavia? Задайте нам вопрос и мы обязательно ответим на него.</p>', '', 1, 2, '2019-07-05 11:40:50', 421, '', '2019-07-05 11:40:50', 0, 0, '0000-00-00 00:00:00', '2019-07-05 11:40:50', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 1, 'cm scandinavia, cottagemode, коттеджмод', 'Задать вопрос по продукции CM Scandinavia, заполнить заявку.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', '', '');
INSERT INTO `hud_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(38, 131, 'Политика в отношении обработки персональных данных', 'agreement', '<p><strong>1. ВВЕДЕНИЕ</strong></p>\r\n<p>Защита и целостность Ваших персональных данных очень важны для нас. По этой причине мы будем использовать Вашу информацию исключительно в соответствии с применимым законодательством.<br />Мы собираем, обрабатываем и используем персональные данные, которые Вы предоставляете нам, исключительно с целью возможности оказания информационной поддержки.</p>\r\n<p>Предоставляя Ваши персональные данные СП ООО «ЕТС» (далее - Компания) для обработки (включая систематизацию; накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (предоставление, доступ), обезличивание, блокирование, удаление, уничтожение персональных данных; сбор; запись; накопление; извлечение; использование, а также автоматизированные и иные способы обработки), Вы выражаете согласие с тем, что указанная информация будет использоваться Компанией исключительно с целью оказания Вам информационной поддержки (в том числе, но не ограничиваясь: предоставление информации о новых продуктах и услугах, и прочей информации, имеющей отношение к Компании). Предоставляя Ваши персональные данные, Вы подтверждаете свое согласие на обработку персональных данных в целях, изложеных в главе №3, в том числе для продвижения и совершенствования товаров и услуг, путем прямых контактов с помощью средств связи.</p>\r\n<p>Настоящий документ определяет политику Компании в отношении обработки персональных данных.</p>\r\n<p>Настоящая Политика разработана в соответствии с действующим законодательством Российской Федерации о персональных данных.</p>\r\n<p>Отмечая флажок «Я даю согласие на обработку персональных данных», Вы даете согласие на обработку своих персональных данных на неопределенный срок.</p>\r\n<p><strong>2. ПРИНЦИПЫ ОБРАБОТКИ ПЕРСОНАЛЬНЫХ ДАННЫХ</strong></p>\r\n<p><span style=\"text-decoration: underline;\">Обработка персональных данных осуществляется на основе следующих принципов: </span></p>\r\n<ol>\r\n<li>Обработка персональных данных осуществляется на законной и справедливой основе;</li>\r\n<li>Обработка персональных данных ограничивается достижением целей, изложенными в главе №3. Не допускается обработка персональных данных, несовместимая с целями сбора персональных данных;</li>\r\n<li>Не допускается объединение баз данных, содержащих персональные данные, обработка которых осуществляется в целях, несовместных между собой;</li>\r\n<li>Обработке подлежат только те персональные данные, которые отвечают целям их обработки;</li>\r\n<li>Содержание и объем обрабатываемых персональных данных соответствуют заявленным целям обработки. Обрабатываемые персональные данные не являются избыточными по отношению к заявленным целям обработки;</li>\r\n<li>При обработке персональных данных обеспечивается точность персональных данных, их достаточность, а в необходимых случаях и актуальность по отношению к заявленным целям их обработки.</li>\r\n<li>Хранение персональных данных осуществляется в форме, позволяющей определить субъекта персональных данных не дольше, чем этого требуют цели обработки персональных данных, если срок хранения персональных данных не установлен федеральным законом, договором, стороной которого, выгодоприобретателем или поручителем по которому является субъект персональных данных. Обрабатываемые персональные данные подлежат уничтожению, либо обезличиванию по достижении целей обработки или в случае утраты необходимости в достижении этих целей, если иное не предусмотрено федеральным законом.</li>\r\n</ol>\r\n<p><strong>3. ЦЕЛИ ОБРАБОТКИ ПЕРСОНАЛЬНЫХ ДАННЫХ</strong></p>\r\n<p>Компания осуществляет обработку персональных данных в следующих целях:</p>\r\n<ul>\r\n<li>проведения маркетинговых акций,</li>\r\n<li>продвижение продуктов и услуг клиентам,</li>\r\n<li>оценка качества обслуживания клиентов.</li>\r\n</ul>\r\n<p>Для целей оптимизации Компании своих веб-ресурсов, с учетом индивидуальных особенностей и предпочтения посетителей веб-сайта:</p>\r\n<ul>\r\n<li>Количество посетителей (новых посетителей) веб-сайта</li>\r\n<li>Адрес страницы и количество посещений страниц веб-сайта</li>\r\n<li>Количество визитов на веб-сайта</li>\r\n<li>Среднее время, проведенное на веб-сайта за визит</li>\r\n<li>Количество вернувшихся пользователей на веб-сайта</li>\r\n<li>Пол и возраст посетителей веб-сайта</li>\r\n<li>Интересы посетителей веб-сайта</li>\r\n<li>География: язык и местоположение посетителей веб-сайта</li>\r\n<li>Тип устройства посетителя: браузер и ОС, мобильные устройства</li>\r\n<li>Источники трафика, последний источник трафика</li>\r\n<li>Сравнение работы источников трафика</li>\r\n<li>Пути посетителей по веб-сайту</li>\r\n<li>Контент веб-сайта</li>\r\n<li>Поведение на веб-сайте</li>\r\n<li>Скорость загрузки веб-сайта</li>\r\n<li>Поиск по веб-сайта, поисковая фраза</li>\r\n<li>Статистика страницы.</li>\r\n<li>Страницы входа и выхода.</li>\r\n<li>Цели</li>\r\n<li>Многоканальные последовательности</li>\r\n<li>Атрибуция</li>\r\n<li>Отказы</li>\r\n<li>Глубина просмотра</li>\r\n</ul>\r\n<p>Компания осуществляет обработку указанных данных следующими способами: сбор, систематизация, накопление, хранение, обновление, изменение, использование.</p>\r\n<p>Согласие на обработку указанных данных может быть отозвано Вами путем направления в Компанию письменного уведомления об этом не менее, чем за один месяц до даты фактического прекращения обработки Ваших персональных данных Компанией.</p>\r\n<p><strong><span style=\"font-size: 1em;\">Cookies.</span></strong></p>\r\n<p>Компания использует cookies для отслеживания предпочтений посетителей сайта и соответствующей оптимизации его дизайна. Cookies – это файлы, сохраняющиеся на жестком диске Вашего компьютера. Они облегчают навигацию, делают посещение сайта более удобным. Cookies могут использоваться для того, чтобы установить наличие прежних выходов с Вашего компьютера на наш сайт. На вашем компьютере происходит лишь идентификация cookies. Персональные данные сохраняются в cookies только в том случае, если Вы даете на это разрешение, например, чтобы облегчить защищенный доступ в Интернет и не вводить повторно ID пользователя и пароль. Просмотры нашего сайта возможны и без cookies. В большинстве браузеров прием cookies осуществляется автоматически. Сохранению cookies на Вашем жестком диске Вы можете воспрепятствовать, заблокировав в настройках браузера опцию «прием cookies». Вы можете также в любое время удалить cookies, находящиеся на жестком диске Вашего компьютера. Блокировка приема cookies, однако, может привести к ограничению доступа к сервисам, которые предоставляются на нашем сайте.</p>\r\n<p><strong>4. УСЛОВИЯ ОБРАБОТКИ ПЕРСОНАЛЬНЫХ ДАННЫХ</strong></p>\r\n<ol>\r\n<li>Обработка персональных данных осуществляется с соблюдением принципов и правил, установленных Федеральным законом № 152-ФЗ от 27.07.2006г. «О персональных данных». Обработка персональных данных допускается в следующих случаях:\r\n<ol>\r\n<li>Обработка персональных данных осуществляется с согласия субъекта персональных данных на обработку его персональных данных;</li>\r\n<li>Обработка персональных данных необходима для осуществления правосудия, исполнения судебного акта, акта другого органа или должностного лица, подлежащих исполнению в соответствии с законодательством Российской Федерации об исполнительном производстве;</li>\r\n<li>обработка персональных данных необходима для исполнения договора, стороной которого либо выгодоприобретателем или поручителем по которому является субъект персональных данных, а также для заключения договора по инициативе субъекта персональных данных или договора, по которому субъект персональных данных будет являться выгодоприобретателем или поручителем;</li>\r\n<li>обработка персональных данных необходима для осуществления прав и законных интересов оператора или третьих лиц, либо для достижения общественно значимых целей при условии, что при этом не нарушаются права и свободы субъекта персональных данных;</li>\r\n<li>обработка персональных данных осуществляется в статистических или иных исследовательских целях, при условии обязательного обезличивания персональных данных. Исключение составляет обработка персональных данных в целях продвижения товаров, работ, услуг на рынке путем осуществления прямых контактов с потенциальным потребителем с помощью средств связи, а также в целях политической агитации;</li>\r\n<li>осуществляется обработка персональных данных, доступ неограниченного круга лиц к которым предоставлен субъектом персональных данных, либо по его просьбе (далее – персональные данные, сделанные общедоступными субъектом персональных данных);</li>\r\n<li>осуществляется обработка персональных данных, подлежащих опубликованию или обязательному раскрытию в соответствии с федеральным законом.</li>\r\n</ol>\r\n</li>\r\n<li>Биометрические персональные данные (сведения, которые характеризуют физиологические и биологические особенности человека, на основании которых можно установить его личность и которые используются оператором для установления личности субъекта персональных данных) в Компании не обрабатываются.</li>\r\n<li>Принятие на основании исключительно автоматизированной обработки персональных данных решений, порождающих юридические последствия в отношении субъекта персональных данных или иным образом затрагивающих его права и законные интересы, не осуществляется.</li>\r\n<li>Компания обязуется и обязует иные лица, получившие доступ к персональным данным, не раскрывать третьим лицам и не распространять персональные данные без согласия субъекта персональных данных, если иное не предусмотрено федеральным законом.</li>\r\n</ol>\r\n<p><strong>5. ОБЯЗАННОСТИ КОМПАНИИ</strong></p>\r\n<p>В соответствии с требованиями Федерального закона № 152-ФЗ от 27.07.2006г. «О персональных данных» Компания обязана:</p>\r\n<ul>\r\n<li>Предоставлять субъекту персональных данных по его запросу информацию, касающуюся обработки его персональных данных.</li>\r\n<li>По требованию субъекта персональных данных уточнять обрабатываемые персональные данные, блокировать или удалять, если персональных данных являются неполными, устаревшими, неточными, незаконно полученными или не являются необходимыми для заявленной цели обработки.</li>\r\n<li>Вести Журнал учета обращений субъектов персональных данных, в котором должны фиксироваться запросы субъектов персональных данных на получение персональных данных, а также факты предоставления персональных данных по этим запросам.</li>\r\n<li>В случае достижения цели обработки персональных данных незамедлительно прекратить обработку персональных данных и уничтожить соответствующие персональные данные в срок, не превышающий тридцати дней с даты достижения цели обработки персональных данных, если иное не предусмотрено договором, стороной которого, выгодоприобретателем или поручителем по которому является субъект персональных данных, иным соглашением между Компанией и субъектом персональных данных либо если Компания не вправе осуществлять обработку персональных данных без согласия субъекта персональных данных на основаниях, предусмотренных №152-ФЗ от 27.07.2006г. «О персональных данных» или другими федеральными законами.</li>\r\n<li>В случае отзыва субъектом персональных данных согласия на обработку своих персональных данных прекратить обработку персональных данных и уничтожить персональные данные в срок, не превышающий тридцати дней с даты поступления указанного отзыва, если иное не предусмотрено соглашением между Компанией и субъектом персональных данных. Об уничтожении персональных данных Компания обязана уведомить субъекта персональных данных.</li>\r\n<li>В случае поступления требования субъекта о прекращении обработки персональных данных в целях продвижения товаров, работ, услуг на рынке немедленно прекратить обработку персональных данных.</li>\r\n</ul>\r\n<p><br /><strong>6. МЕРЫ ПО ОБЕСПЕЧЕНИЮ БЕЗОПАСНОСТИ ПЕРСОНАЛЬНЫХ ДАННЫХ ПРИ ИХ ОБРАБОТКЕ</strong></p>\r\n<ol>\r\n<li>При обработке персональных данных Компания принимает необходимые правовые, организационные и технические меры для защиты персональных данных от неправомерного или случайного доступа к ним, уничтожения, изменения, блокирования, копирования, предоставления, распространения персональных данных, а также от иных неправомерных действий в отношении персональных данных.</li>\r\n<li>Обеспечение безопасности персональных данных достигается, в частности:\r\n<ul>\r\n<li>определением угроз безопасности персональных данных при их обработке в информационных системах персональных данных;</li>\r\n<li>применением организационных и технических мер по обеспечению безопасности персональных данных при их обработке в информационных системах персональных данных, необходимых для выполнения требований к защите персональных данных, исполнение которых обеспечивает установленные Правительством Российской Федерации уровни защищенности персональных данных;</li>\r\n<li>применением прошедших в установленном порядке процедуру оценки соответствия средств защиты информации;</li>\r\n<li>оценкой эффективности принимаемых мер по обеспечению безопасности персональных данных до ввода в эксплуатацию информационной системы персональных данных;</li>\r\n<li>учетом машинных носителей персональных данных;</li>\r\n<li>обнаружением фактов несанкционированного доступа к персональным данным и принятием мер;</li>\r\n<li>восстановлением персональных данных, модифицированных или уничтоженных вследствие несанкционированного доступа к ним;</li>\r\n<li>установлением правил доступа к персональным данным, обрабатываемым в информационной системе персональных данных, а также обеспечением регистрации и учета всех действий, совершаемых с персональными данными в информационной системе персональных данных;</li>\r\n<li>контролем за принимаемыми мерами по обеспечению безопасности персональных данных и уровня защищенности информационных систем персональных данных.</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p><strong>7. СОГЛАСИЕ НА ОБРАБОТКУ ПЕРСОНАЛЬНЫХ ДАННЫХ ДЛЯ ПОСЕТИТЕЛЕЙ САЙТА</strong></p>\r\n<p>Настоящим, выражаю свое согласие СП ООО «ЕТС» (почтовый адрес: 198216, Санкт-Петербург, Ленинский пр-кт, дом 140, лит. Л) на автоматизированную и не автоматизированную обработку моих персональных данных в соответствии со следующим перечнем:</p>\r\n<ul>\r\n<li>Мои запросы, как посетителя сайта;</li>\r\n<li>Системная информация, данные из моего браузера;</li>\r\n<li>Файлы cookie;</li>\r\n<li>Мой IP-адрес;</li>\r\n<li>Установленные на моем устройстве операционные системы;</li>\r\n<li>Установленные на моем устройстве типы браузеров;</li>\r\n<li>Установленные на моем устройстве расширения и настройки цвета экрана;</li>\r\n<li>Установленные и используемые на моем устройстве языки;</li>\r\n<li>Версии Flash и поддержка JavaScript;</li>\r\n<li>Типы мобильных устройств, используемых мной, если применимо;</li>\r\n<li>Географическое положение;</li>\r\n<li>Количество посещений сайта и просмотров страниц;</li>\r\n<li>Длительность пребывания на сайте;</li>\r\n<li>Запросы, использованные мной при переходе на сайт;</li>\r\n<li>Страницы, с которых были совершены переходы.</li>\r\n</ul>\r\n<p>Для целей оптимизации оператором своих web-ресурсов, с учетом моих индивидуальных особенностей и предпочтений. Оператор вправе осуществлять обработку моих персональных данных следующими способами: сбор, систематизация, накопление, хранение, обновление, изменение, использование.</p>\r\n<p>Настоящее согласие вступает в силу с момента моей отметки флажка «Я даю согласие на обработку персональных данных» на сайте оператора и действует до момента его отзыва. Согласие на обработку персональных данных может быть отозвано мною путем направления в Компанию письменного уведомления об этом не менее чем за один месяц до даты фактического прекращения обработки моих персональных данных Компанией.</p>\r\n<p><strong>8. ОБРАТНАЯ СВЯЗЬ</strong></p>\r\n<p>Компания предпринимает разумные меры для поддержания точности и актуальности имеющихся персональных данных, а также удаления персональных данных в случаях, если они являются устаревшими, недостоверными или излишними, либо если достигнуты цели их обработки.</p>\r\n<p>Субъекты персональных данных несут ответственность за предоставление Компании достоверных сведений, а также за своевременное обновление предоставленных данных в случае каких-либо изменений.</p>\r\n<p>При этом в некоторых случаях (например, если вы хотите удалить Ваши персональные данные или прекратить их обработку) такое обращение также может означать, что Компания больше не сможет предоставлять Вам услуги.</p>\r\n<p>Ваше согласие может быть в любое время отозвано путем уведомления Компании по адресу: 198216, Санкт-Петербург, Ленинский пр-кт, дом 140, лит. Л, либо по телефону +78123895555.</p>\r\n<p><strong>С политикой СП ООО «ЕТС» в отношении обработки персональных данных ознакомлен.</strong></p>', '', 1, 2, '2019-07-05 11:41:22', 421, '', '2019-07-05 11:41:22', 0, 0, '0000-00-00 00:00:00', '2019-07-05 11:41:22', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 0, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', '', ''),
(39, 132, 'Новый дизайн сайта COTTAGEMODE', 'novyj-dizajn-sajta-cottagemode', '<p>Уважаемые клиенты и партнеры, мы рады приветствовать вас на обновленном сайте COTTAGEMODE! Мы постарались учесть все ваши пожелания и сделать наш сайт максимально комфортным для использования и поиска нужной информации по продуктам CM Scandinavia.</p>\r\n', '\r\n<p> Все линейки нашей продукции разделены по соответствующим разделам, которые содержат подробную информацию по цветам, размерам, весу, чертежи и схемы монтажа. В разделе CM Decking вы можете ознакомиться с нашей террасной доской из дпк, в CM Cladding - с фасадной облицовкой из дпк, CM Vattern - металлическая водосточная система, CM Railing - перила и ограждения для террас из дпк, CM Fencing - заборные профили из дпк, CM Garden - садовый паркет, клумбы и скамейки из дпк, CM Care - чистящее средство для дпк, CM Wood Natur - декинг, фасадная облицовка и полы из сибирской лиственницы, CM Wood Thermo - декинг, фасадная облицовка и полы из термодревесины.</p>\r\n<p>Для вашего удобства в разделе \"Где купить\" по заданным параметрам вы можете на карте найти ближайшего дилера CM Scandinavia.</p>\r\n<p>Если у вас есть дополнительные вопросы по нашей продукции или вы хотите стать нашим дилером, вы можете \"Связаться с нами\" через форму обратной связи.</p>', 1, 8, '2017-10-04 12:21:43', 421, '', '2019-07-11 06:48:44', 421, 0, '0000-00-00 00:00:00', '2017-10-04 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2017\\/Logo-CM.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2017\\/Logo-CM.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 16, '', 'Уважаемые клиенты и партнеры, мы рады приветствовать вас на обновленном сайте COTTAGEMODE! Мы постарались учесть все ваши пожелания и сделать наш сайт максимально комфортным для использования и поиска нужной информации по продуктам CM Scandinavia. Все линейки нашей продукции разделены по соответствующим разделам,', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(40, 133, 'CM Scandinavia на выставках в Новосибирске и Краснодаре', 'cm-scandinavia-at-exhibitions-in-novosibirsk-and-krasnodar', '<p>Приглашаем вас посетить стенд официального дистрибьютора CM Scandinavia в России (Группы компаний \"ЕТС\") на строительных выставках в Новосибирске и Краснодаре.</p>\r\n', '\r\n<p> </p>\r\n<p>Выставка WorldBuild Siberia/SibBuild состоится 13 - 16 февраля 2018 в Новосибирске.</p>\r\n<p>Выставка WorldBuild Krasnodar/YugBuild состоится 27 февраля - 2 марта 2018 в Краснодаре.</p>\r\n<p>На стендах будут представлены наши решения для террас, фасадов, водосточной системы и весь спектр материалов из древесно-полимерного композита. Вы сможете получить профессиональные консультации по всем нашим продуктам, обсудить дилерские условия и лично убедиться в качестве CM Scandinavia. Также мы покажем ряд новинок в нашем ассортименте на строительный сезон 2018.</p>\r\n<p>До встречи на выставках!</p>', 1, 8, '2018-01-12 12:21:43', 421, '', '2019-07-05 11:53:48', 421, 0, '0000-00-00 00:00:00', '2018-01-12 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/15.06\\/2.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/15.06\\/2.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"CM Scandinavia \\u043d\\u0430 \\u0432\\u044b\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\\u0445 \\u0432 \\u041d\\u043e\\u0432\\u043e\\u0441\\u0438\\u0431\\u0438\\u0440\\u0441\\u043a\\u0435 \\u0438 \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0435\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 15, 'cm scandinavia, cottagemode, sibbild, yugbild, новосибирск, краснодар, коттеджмод, news', 'Приглашаем вас посетить стенд CM Scandinavia в России выставках в SibBuild (Новосибирск) и YugBuild (Краснодар)', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(41, 134, 'Результаты выставок SibBuild и YugBuild', 'sibbuild-yugbuild', '', '', 1, 8, '2018-03-01 12:21:43', 421, '', '2019-07-05 11:53:37', 0, 0, '0000-00-00 00:00:00', '2018-03-01 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/18.06\\/SibBuild_YugBuild_2018_4.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/18.06\\/SibBuild_YugBuild_2018_4.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0420\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442\\u044b \\u0432\\u044b\\u0441\\u0442\\u0430\\u0432\\u043e\\u043a SibBuild \\u0438 YugBuild\\u201d \\u0437\\u0430\\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0430\\t\\u0420\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442\\u044b \\u0432\\u044b\\u0441\\u0442\\u0430\\u0432\\u043e\\u043a SibBuild \\u0438 YugBuild\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 14, '', 'CottageMode Scandinavia AB, приняла участие в крупнейших строительных выставках СФО и ЮФО — SibBuild и YugBuild 2018 совместно с компанией «ЕТС-Строительные системы», эксклюзивным дистрибьютором бренда CM Scandinavia. Обновление ассортимента затронуло и категорию фасадных материалов. Если ранее, в нашей линейке', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(42, 135, 'Приглашаем посетить наш стенд на выставке MosBuild-2018', 'mosbuild-2018', '<p><strong>Уважаемые партнеры, приглашаем вас посетить наш стенд на самой крупной в России выставке строительных и отделочных материалов WorldBuild Moscow/MosBuild!</strong></p>\r\n', '\r\n<p>Выставка состоится с 3 по 6 апреля 2018 года в Москве в ЦВК «Экспоцентр», метро «Выставочная». </p>\r\n<p>На стенде компании вы получите возможность ознакомиться с продукцией шведского концерна CottageMode Scandinavia AB, обсудить условия сотрудничества, задать интересующие вопросы и получить исчерпывающие ответы.</p>\r\n<p>Используя промокод wbm18eCTCE, вы сможете бесплатно получить электронный билет на сайте worldbuild-moscow.ru. Без использования промокода посещение выставки – платное.</p>\r\n<p>Вы сможете увидеть и протестировать такие продукты как: террасная доска из ДПК CM Decking, фасадные панели из ДПК CM Cladding, различные материалы из термодерева или натуральной древесины CM Wood, водосточные системы CMVattern, а так же - новинку этого сезона — фасадные панели из фиброцемента CM Bord.</p>\r\n<p>Получите бесплатный билет на выставку MosBuild/WorldBuild Moscow!</p>\r\n<p>До встречи на выставке!</p>\r\n<p>С любовью из Швеции, CottageMode.</p>', 1, 8, '2018-03-26 12:21:43', 421, '', '2019-07-05 11:54:50', 0, 0, '0000-00-00 00:00:00', '2018-03-26 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/17.06\\/logo_mb_1600.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/17.06\\/logo_mb_1600.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041f\\u0440\\u0438\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u043c \\u043f\\u043e\\u0441\\u0435\\u0442\\u0438\\u0442\\u044c \\u043d\\u0430\\u0448 \\u0441\\u0442\\u0435\\u043d\\u0434 \\u043d\\u0430 \\u0432\\u044b\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435 MosBuild-2018\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 13, '', 'Уважаемые партнеры, приглашаем вас посетить наш стенд на самой крупной в России выставке строительных и отделочных материалов WorldBuild Moscow/MosBuild! Выставка состоится с 3 по 6 апреля 2018 года в Москве в ЦВК «Экспоцентр», метро «Выставочная». На стенде компании вы получите возможность ознакомиться с продукцией', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(43, 136, 'CM Scandinavia — Подарки к каждой террасе', 'cm-scandinavia-gifts-for-each-terrace', '<p>Дорогие друзья, концерн CottageMode Scandinavia AB запускает новую акцию.</p>\r\n<p><strong>Только в июне, вы можете получить ценные подарки при покупке террасы из любой серии CM Decking!</strong></p>\r\n', '\r\n<p>Условия акции:</p>\r\n<ol>\r\n<li>При покупке каждых 30 кв.м. террасной доски CM Decking Natur «Рябина» или «Дуб» - вы получаете 1 (одну) коробку садовых оградок CM Garden, превосходно дополняющих любой ландшафтный дизайн.</li>\r\n<li>При покупке каждых 20 кв.м. террасной доски CM Decking Vintage, Mix или Grand — вы получаете 1 (одну) упаковку моющего средства CM Care «Для Террас», объемом 1 литр, разработанного специально для ухода за террасной доской из ДПК. Не знаете, чем очистить пятна на террасной доске? Вам поможет CM Care! Новый состав помогает бережно удалить пятна с поверхности ДПК, не повреждая саму террасную доску.</li>\r\n<li>При покупке каждых 100 кв.м. террасной доски CM Decking любой серии — вы получаете 1 (одну) садовую скамью из ДПК CM Garden. Садовая скамья CM Garden станет финальным штрихом в архитектурном ансамбле вашей террасы. Вы можете не переживать за ее сохранность, ведь эта скамья из ДПК, а значит она не боится осадков и заморозков, так же как и террасы CM Decking.</li>\r\n</ol>\r\n<p><em>Давно сомневались, какую же купить террасную доску из ДПК?<br /></em>Подарки от CottageMode - сильный аргумент в пользу CM Decking!<br /><a href=\"index.php?option=com_content&amp;view=article&amp;id=2&amp;Itemid=137\">Сделайте свой выбор уже сегодня!</a></p>\r\n<p>Акция действует до 30 июня 2018 во всех регионах РФ.<br />Подробности уточняйте у авторизованных дилеров CM Scandinavia.</p>', 1, 8, '2018-06-22 12:21:43', 421, '', '2019-07-11 06:55:15', 421, 0, '0000-00-00 00:00:00', '2018-06-22 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/23.06\\/mini\\/present.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/23.06\\/present.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 12, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(44, 137, '«Нордический характер»: новинка в CM Cladding', 'nordic-character-new-in-the-series-of-cm-cladding', '<p>CM Scandinavia с гордостью представляет новинку в линейке фасадной облицовки CM Cladding — цвет Ebony (Эбен).</p>\r\n', '\r\n<p>Новый, темно-серый оттенок CM Cladding создан, чтобы подчеркнуть ваш статус и утонченный вкус.</p>\r\n<p>CM Cladding Ebony — это квинтэссенция знаменитого скандинавского стиля, сочетающего в себе суровую красоту северной природы, надежность и силу.</p>\r\n<p>В основе скандинавского стиля — осознанность и практичность. Эти черты отлично характеризуют фасадную облицовку из ДПК CM Cladding: она устойчива к неблагоприятным воздействиям внешней среды, легком монтируется и прекрасно выглядит!</p>\r\n<p>Оцените красоту и преимущества фасадной облицовки из ДПК уже сегодня!</p>', 1, 8, '2018-06-25 12:21:43', 421, '', '2019-07-05 11:56:45', 0, 0, '0000-00-00 00:00:00', '2018-06-25 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/24.06\\/mini\\/cladding.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/24.06\\/mini\\/cladding.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430 \\u0432 \\u0441\\u0435\\u0440\\u0438\\u0438 CM Cladding - \\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 11, '', 'Новый, темно-серый оттенок CM Cladding Эбен создан, чтобы подчеркнуть ваш статус и утонченный вкус.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(45, 138, 'Новая акция в гипермаркетах Вимос!', 'new-action-in-vimos-hypermarkets', '<p>Строительный сезон в самом разгаре и, мы, CM Scandinavia готовы подлить масла в огонь распродаж: встречайте нашу новую акцию во всех гипермаркетах <a href=\"https://www.vimos.ru/brand/cottadge_mode\" target=\"_blank\" rel=\"noopener noreferrer\">Вимос</a>!</p>\r\n', '\r\n<p>В акции участвуют:</p>\r\n<ol>\r\n<li><strong>CM Decking NATUR, знаменитая террасная доска из ДПК, в цвете «Дуб» и «Рябина». Ваша выгода — 30%.<br /></strong>Классическая серия двусторонней террасной доски из ДПК в самых популярных цветах этого сезона. Позволяет создать надежную и красивую террасу, которая прослужит вам долгие годы.Все еще сомневаетесь, какую террасную доску из ДПК выбрать для дачи в Санкт-Петербурге и Ленинградской области? \r\n<p>Специальная <ins>скидка 30%</ins> будет серьезным аргументом в пользу CM Decking!</p>\r\n</li>\r\n<li><strong>CM Care «Для Террас», средство по уходу за изделиями из ДПК. Ваша выгода — 35%.</strong><br />У вас давно есть терраса из ДПК, но с годами она запачкалась и стала выглядеть хуже? Или может быть вы недавно закончили монтаж, и необходимо убрать грязные следы от обуви рабочих? Совершенно неважно, новая ли у вас терраса, или старая, моющее средство для террас CM Care, легко и быстро удалит с поверхности ДПК любую грязь, а так же различные свежие и въевшиеся пятна*.<br />\r\n<p>Только в гипермаркетах Вимос — дополнительная скидка 35% на любую фасовку шампуня CM Care для террас из ДПК.</p>\r\n<p><em>*при соблюдении рекомендаций по применению</em></p>\r\n</li>\r\n<li><strong>CM Wood Natur Планкен и Палубная доска из лиственницы. Ваша выгода — 10%.</strong><br />Натуральные материалы из древесины — лучший способ стать еще ближе к природе. Все материалы в линейке CM Wood Natur изготавливаются из лиственницы, добытой в самом сердце Сибири. Место произрастания исходного сырья CM Wood Natur максимально удалено от мегаполисов, это гарантирует 100% экологическую чистоту и безопасность материалов из лиственницы в линейке продуктов CM Wood Natur.<br />\r\n<p>Только для клиентов гипермаркетов Вимос, дополнительная скидка 10% на планкен и палубную доску из лиственницы CM Wood Natur.</p>\r\n<p>Планкен CM Wood Natur — это фасадная облицовка из натуральной сибирской лиственницы.Использование планкена при отделке фасада любого загородного дома, позволяет создать лаконичный и строгий дизайн, который выглядит одновременно просто и стильно. Последние годы все больше дизайнеров применяют планкен в интерьерах, причем не только загородных домов, но и квартир. Стоит отметить, что планкен из лиственницы CM Wood Natur отлично подходит для квартир в скандинавском стиле.</p>\r\n<p><em>Размер планкена CM Wood Natur: 4000х90х20мм. Упаковка: 5шт.</em></p>\r\n<p>Палубная Доска CM Wood Natur — это натуральный материал для изготовления террас. Он отлично подойдет тем, кто хочет создать террасу из чистого дерева, но предпочитает естественный вид доски, без дополнительных канавок на поверхности, характерных для классического профиля террасной доски.</p>\r\n<p><em>Размер палубной доски CM Wood Natur : 3000х120х20мм. Упаковка: 4 шт.</em></p>\r\n</li>\r\n</ol>\r\n<p><strong>Обновите свою дачу и участок материалами от CottageMode Scandinavia AB!</strong></p>\r\n<p>До скорой встречи!</p>', 1, 8, '2018-06-26 12:21:43', 421, '', '2019-07-05 11:57:48', 0, 0, '0000-00-00 00:00:00', '2018-06-26 12:21:43', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/25.06\\/mini\\/LOGO_VIMOS.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/25.06\\/mini\\/LOGO_VIMOS.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0410\\u043a\\u0446\\u0438\\u044f \\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u044b CottageMode \\u0432 \\u0412\\u0438\\u043c\\u043e\\u0441!\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 10, '', ' CM Decking NATUR, знаменитая террасная доска из ДПК, в цвете «Дуб» и «Рябина». Ваша выгода — 30%! CM Care «Для Террас», средство по уходу за изделиями из ДПК. Ваша выгода — 35%! CM Wood Natur Планкен и Палубная доска из лиственницы. Ваша выгода — 10%!', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(46, 139, 'Новая акция начинается, а старая — продолжается!', 'novaya-aktsiya-nachinaetsya-a-staraya-prodolzhaetsya', '<p>Дорогие друзья, у нас для вас есть отличные новости!</p>\r\n<p>Мы продлеваем акцию<strong> «Подарки к каждой террасе»</strong> на прежних условиях и запускаем новую распродажу ограждений для клумб CM Garden!</p>\r\n', '\r\n<p> В акции участвуют:</p>\r\n<ol>\r\n<li>\r\n<p><em>Комплект клумбы 450x450x140мм</em></p>\r\n<p style=\"margin-bottom: 0cm; line-height: 100%;\"><span style=\"color: #000000;\"><strong>Цена по акции: 585 руб./комплект</strong><br /></span><span style=\"color: #000000;\">Старая цена: 990 руб./комплект<br /></span><strong><span style=\"color: #000000;\">Ваша выгода: 405 руб.!</span></strong></p>\r\n</li>\r\n<li>\r\n<p><em>Комплект клумбы 600x600x140мм</em></p>\r\n<p><strong>Цена по акции: 715 руб./комплект</strong><br />Старая цена: 1 100 руб./комплект<br /><strong>Ваша выгода: 385 руб.!</strong></p>\r\n</li>\r\n</ol>\r\n<p><em>Условия проведения акции:</em></p>\r\n<p>Акция действует на территории СЗФО.<br />Срок проведения акции: с 10 июля до 31 августа.</p>\r\n<p>Внимание, акция ограничена количеством комплектов на складе!<br />Не упустите выгодный шанс, красиво и недорого оформить ваши любимые клумбы!</p>\r\n<p>Сделайте свой выбор уже сегодня!</p>', 1, 8, '2018-07-09 10:34:49', 421, '', '2019-07-05 11:58:55', 0, 0, '0000-00-00 00:00:00', '2018-07-09 10:34:49', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/09.07\\/mini\\/veranda-2.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/09.07\\/veranda-2.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0410\\u043a\\u0446\\u0438\\u044f \\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044e CM Garden\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 9, '', 'Распродажа ограждений для клумб CM Garden с 10 июля до 31 августа 2018г.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(47, 140, 'Летняя распродажа CM Decking серии Vintage и MIX в ЦФО', 'rasprodazha-cm-decking-vintage-i-mix-v-tsfo', '<p>Дорогие друзья,</p>\r\n<p>с 16 июля 2018 г. на всей территории ЦФО стартует летняя распродажа террасной доски из ДПК CM Decking серии Vintage, в цвет Blackwood и CM Decking серии MIX.</p>\r\n<p><strong>Акция продлится до 31 августа 2018 г.</strong></p>\r\n', '\r\n<p>Подробности акции, актуальные цены и скидки уточняйте у официальных дилеров CM Scandinavia.</p>\r\n<p>Не упустите свой шанс купить террасную доску из ДПК в Москве и Московской области по выгодной цене!</p>\r\n<p>Сделайте свой выбор сегодня!</p>', 1, 8, '2018-07-16 12:21:57', 421, '', '2019-07-05 12:00:01', 0, 0, '0000-00-00 00:00:00', '2018-07-16 12:21:57', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/16.07\\/Vintage-1.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM Decking Vintage\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/16.07\\/Vintage-1.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"CM Decking Vintage\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 8, '', 'Летняя распродажа террасной доски из ДПК в Москве и Московской области. В распродаже участвуют: CM Decking серии Vintage, в цвете Blackwood и CM Decking серии MIX. Акция продлится до 31 августа 2018 г.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(48, 141, 'Летняя распродажа CM Cladding в СЗФО', 'letnyaya-rasprodazha-cm-cladding-2-2m-na-vsej-territorii-szfo', '<p>Дорогие друзья,</p>\r\n<p>с 10 июля 2018 г. на всей территории СЗФО стартует распродажа фасадной облицовки из ДПК CM Cladding, длиной 2200 мм.</p>\r\n<p><strong>Акция продлится до 31 августа 2018 г.</strong></p>\r\n', '\r\n<p>Подробности акции, актуальные цены и скидки уточняйте у официальных дилеров CM Scandinavia.</p>\r\n<p>Не упустите свой шанс купить фасадную доску из ДПК в Санкт-Петербурге и Ленинградской области по выгодной цене!</p>\r\n<p>Сделайте свой выбор сегодня!</p>', 1, 8, '2018-07-10 13:04:38', 421, '', '2019-07-11 06:54:34', 421, 0, '0000-00-00 00:00:00', '2018-07-10 13:04:38', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_3.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"CM-Cladding\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_3.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"CM-Cladding\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 7, '', 'Летняя распродажа CM Cladding в Санкт-Петербурге и Ленинградской области с 10 июля по 31 августа 2018 г. В распродаже участвует фасадная облицовка из ДПК CM Cladding длиной 2200 мм.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', '');
INSERT INTO `hud_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(49, 142, 'ПОСЛЕДНИЙ МЕСЯЦ ЛЕТА - НОВАЯ АКЦИЯ ДЛЯ СЗФО ', 'poslednij-mesyats-leta-novaya-aktsiya-dlya-szfo', '<p>Дорогие друзья, близится конец лета, но наша совместная акция в СЗФО совместно со строительными гипермаркетами Вимос продолжается!</p>\r\n', '\r\n<p>В августе, в акции участвуют сразу пять наших продуктов:</p>\r\n<ul>\r\n<li>\r\n<p>CM Garden - ограждения для клумб из ДПК</p>\r\n<p><strong>Ваша выгода — 50%<br /></strong><em>Спешите! Количество товара ограничено.</em><strong><br /></strong></p>\r\n</li>\r\n<li>\r\n<p>CM Decking NATUR - террасная доска из ДПК</p>\r\n<p><strong>Ваша выгода — 30%</strong><br /><em>Цвет: «Дуб» и «Рябина»</em></p>\r\n</li>\r\n<li>\r\n<p>CM Care - Для Террас - средство по уходу за изделиями из ДПК</p>\r\n<p><strong>Ваша выгода — 35%</strong></p>\r\n</li>\r\n<li>\r\n<p>CM Wood Natur - планкен и палубная доска из лиственницы</p>\r\n<p><strong>Ваша выгода — 10%</strong></p>\r\n</li>\r\n<li>\r\n<p>CM Wood Natur - террасная доска из лиственницы</p>\r\n<p><strong>Ваша выгода — 10%</strong></p>\r\n</li>\r\n</ul>\r\n<p><span style=\"text-decoration: underline;\">CM Scandinavia AB - лучшие материалы для загородного дома и дачи</span></p>', 1, 8, '2018-08-09 09:33:57', 421, '', '2019-07-05 12:02:13', 0, 0, '0000-00-00 00:00:00', '2018-08-09 09:33:57', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/25.06\\/mini\\/LOGO_VIMOS.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/25.06\\/LOGO_VIMOS.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 6, 'АКЦИЯ, СЗФО', 'НОВАЯ АКЦИЯ ДЛЯ СЗФО ', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(50, 143, 'Осенние скидки на ДПК!', 'osennie-skidki', '<p>Дорогие друзья, несмотря на то, что лето закончилось и строительный сезон плавно подходит к концу, мы предлагаем вам использовать оставшиеся теплые дни максимально полезно!</p>\r\n', '\r\n<p>С 1 сентября мы запускаем новую акцию на террасные доски, фасадную облицовку и заборные профили из ДПК. Кроме того, мы начинаем распродажу материалов для благоустройства сада и заборных панелей из ДПК. Все подробности - у наших дилеров. </p>\r\n<p>Не упустите свой шанс украсить ваш загородный дом!</p>\r\n<p>Акция действует на всей территории Российской Федерации.</p>\r\n<p>Срок действия акции - до конца сентября (или до окончания материалов на складе).</p>', 1, 8, '2018-09-01 09:41:45', 421, '', '2019-07-05 12:03:06', 0, 0, '0000-00-00 00:00:00', '2018-09-01 09:41:45', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/07.09\\/mini\\/maple_leaf.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/07.09\\/maple_leaf.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 5, 'новая акция террасные доски фасадную облицовку заборные профили из ДПК', 'новая акция на террасные доски, фасадную облицовку и заборные профили из ДПК', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(51, 144, 'Новый строительный сезон - новый фасадный материал!', 'newfacade', '<p>Встречайте первую новинку 2019 года в ассортименте CM Scandinavia - цементно-минеральные панели CM Bord!</p>\r\n', '\r\n<p>Дорогие друзья, поздравляем вас с новым, 2019-м годом! Пусть он принесет вам много радости, счастья и возможностей!</p>\r\n<p>Мы рады представить вам первую новинку нашего ассортимента в этом году - цементно-минеральные панели CM Bord!</p>\r\n<p>CM Bord - это высококлассная замена древесины. Фасадные панели изготавливаются из цемента с добавлением минеральных волокон, придающих панелям дополнительную прочность. На завершающем этапе все панели покрываются специальным грунтом и особым защитно-декоративным покрытием, защищающим их от воздействия агрессивной внешней среды.</p>\r\n<p>Основное применение CM Bord - облицовка фасадов как частных коттеджей и дач, так и промышленных или коммерческих зданий. Фасадные панели CM Bord долговечны, просто в монтаже, экологически безопасны и не поддерживают горение.</p>\r\n<p>Однако главное преимущество CM Bord - возможность использования панелей для укрытия цоколей, так как специальное защитное покрытие гарантирует отсутствие высолов - главной проблемы прочих материалов для укрытия цоколя, таких как фиброцемент или кирпич.</p>\r\n<p>Прекрасный набор характеристик, не правда ли?</p>\r\n<p>Материал поступит в продажу в марте-апреле 2019г., но вы уже сейчас можете получить свой бесплатный образец.</p>\r\n<p>Просто оставьте нам заявку через форму обратной связи на сайте!</p>', 1, 8, '2019-01-15 09:33:57', 421, '', '2019-07-05 12:03:59', 0, 0, '0000-00-00 00:00:00', '2019-01-15 09:33:57', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2019\\/01.16\\/Houseterrace-mini.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2019\\/01.16\\/Houseterrace.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 4, 'ФАСАД, ФИБРОЦЕМЕНТ, ЦОКОЛЬ, ВЫСОЛ, ВЫСОЛЫ, МАТЕРИАЛ, ДОМ, ДАЧА, КОТТЕДЖ, ВЕНТИЛИРУЕМЫЙ ФАСАД, НЕГОРЮЧИЙ, ЗАЩИТА, ЦВЕТ, САЙДИНГ, МЕТАЛЛ, ДЕРЕВО', 'CM Bord - новый фасадный материал их фиброцемента среди продуктов CottageMode Scandinavia', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(52, 145, 'Приглашаем на MosBuild-2019!', 'mosbuild-2019', '<p>Приглашаем вас посетить наш стенд на самой крупной в России выставке строительных и отделочных материалов - MosBuild!</p>\r\n', '\r\n<p>Выставка состоится со 2 по 5 апреля 2019 года в Москве в МВЦ \"Крокус Экспо\", метро \"Мякинино\"</p>\r\n<p> </p>\r\n<p>Используя наш промокод: - <span style=\"text-decoration: underline;\"><strong>mbw19eANSA</strong></span> , вы можете бесплатно получить электронный билет на сайте Mosbuild.com.</p>\r\n<p>Обратите внимание - без нашего промокода посещение выставки - платное.</p>\r\n<p> </p>\r\n<p>На нашем стенде вас ждут новинки сезона 2019:</p>\r\n<p>1. Новые серии CM Decking - знаменитой террасной доски из ДПК.</p>\r\n<p>2. Перила CM Railing в элегантном белом цвете.</p>\r\n<p>3. Абсолютно новые и уникальные фасадные панели CM Bord!</p>\r\n<p> </p>\r\n<p>Кроме того вы сможете ознакомиться с уже известными вам сериями террасной доски CM Decking, фасадными панелями CM Cladding, различными материалами из натуральной, термообработанной или окрашенной в заводских условиях древесины CM Wood, металлической водосточной системой CM Vattern, а так же композитной черепицей Gerard.</p>\r\n<p> </p>\r\n<p>Наш стенд очень просто найти - он будет находиться в павильоне №2, зал 11. Номер стенда - Н323.</p>\r\n<p> </p>\r\n<p>Приходите, мы ждем вас!</p>\r\n<p>До скорой встречи на выставке MosBuild-2019!</p>', 1, 8, '2019-03-24 08:00:00', 421, '', '2019-07-11 06:54:03', 421, 0, '0000-00-00 00:00:00', '2019-03-24 08:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2018\\/17.06\\/logo_mb_1600.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2018\\/17.06\\/logo_mb_1600.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 3, 'ФАСАД, ФИБРОЦЕМЕНТ, ЦОКОЛЬ, ВЫСОЛ, ВЫСОЛЫ, МАТЕРИАЛ, ДОМ, ДАЧА, КОТТЕДЖ, ВЕНТИЛИРУЕМЫЙ ФАСАД, НЕГОРЮЧИЙ, ЗАЩИТА, ЦВЕТ, САЙДИНГ, МЕТАЛЛ, ДЕРЕВО', 'ВЫСТАВКА СТРОИТЕЛЬНЫЕ МАТЕРИАЛЫ', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(53, 146, 'Итоги выставки MosBuild-2019', 'mosbuild-finished', '<p>Дорогие друзья, вот и завершилась крупнейшая в РФ выставка строительных материалов MosBuild-2019, настало время подводить итоги.</p>\r\n', '\r\n<p>В этом году выставка MosBuild-2019 побила все возможные рекорды: более 70 000 посетителей, 1200 участников и 240 спикеров.</p>\r\n<p>Мы тоже не остались в стороне и представили рекордное количество новинок: две новые серии террасной доски CM Decking, абсолютно новые фасадные панели CM Bord, новый цвет перил CM Railing и фасада CM Cladding, а так же новейший кровельный материал.</p>\r\n<p>Уже совсем скоро эти новинки поступят в продажу и гармонично дополнят нашу линейку продуктов для загородного домостроения!</p>\r\n<p>Команда CM Scandinavia гордится тем, что смогла стать частью столь важного и масштабного мероприятия.</p>\r\n<p>Мы были рады видеть вас на нашем стенде и искренне надеемся на новую встречу в грядущем году.</p>\r\n<p>До скорой встречи на выставке MosBuild-2020!</p>\r\n<p> </p>\r\n<p>p.s. На самом деле мы сможем увидеться немного раньше...хотите узнать больше? Следите за новостями на нашем сайте!</p>', 1, 8, '2019-04-08 08:00:00', 421, '', '2019-07-05 12:05:31', 0, 0, '0000-00-00 00:00:00', '2019-04-08 08:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2019\\/04.08\\/mosbuild2019-mini2.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2019\\/04.08\\/mosbuild2019-main.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 2, 'ФАСАД, ФИБРОЦЕМЕНТ, ЦОКОЛЬ, ВЫСОЛ, ВЫСОЛЫ, МАТЕРИАЛ, ДОМ, ДАЧА, КОТТЕДЖ, ВЕНТИЛИРУЕМЫЙ ФАСАД, НЕГОРЮЧИЙ, ЗАЩИТА, ЦВЕТ, САЙДИНГ, МЕТАЛЛ, ДЕРЕВО', 'ВЫСТАВКА СТРОИТЕЛЬНЫЕ МАТЕРИАЛЫ', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(54, 147, 'CM Scandinavia в Татарстане: выставка ВолгаСтройЭкспо-2019', 'mosbuild-finished-2', '<p>Компания CM Scandinavia AB приняла участие в выставка ВолгаСтройЭкспо-2019 в г. Казань.</p>\r\n', '\r\n<p>Мероприятие состоялось при поддержке нашего официального дистрибьютора на территории РФ и СНГ - компании ЕТС-Строительные системы.</p>\r\n<p>За время работы выставки наш стенд привлек немало внимания, среди посетителей отметились как простые горожане, так и представители крупнейшего бизнеса и администрации Казани. Особое внимание нам уделил и заместитель министра по строительству Республики Татарстан. Мы в подробностях рассказали ему обо всех наших материалах и вкратце о современных тенденция загородного строительства.</p>\r\n<p>ВолгаСтройЭкспо - очень активная выставка: за время ее работы, мы провели множество консультаций и переговорили с тысячами людей!</p>\r\n<p>Были рады побывать в гостях в Казани, надеемся, вам тоже понравилось на нашем стенде.</p>\r\n<p>До новых встреч, дорогие друзья!</p>\r\n<p>С уважением, команда CM Scandinavia AB</p>\r\n<p> </p>', 1, 8, '2019-04-29 08:00:00', 421, '', '2019-07-05 12:06:23', 0, 0, '0000-00-00 00:00:00', '2019-04-29 08:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/NEWS\\/2019\\/04.29\\/VolgaStroyExpo2019-mini.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/NEWS\\/2019\\/04.29\\/VolgaStroyExpo2019-main.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 1, 'ФАСАД, ФИБРОЦЕМЕНТ, ЦОКОЛЬ, ВЫСОЛ, ВЫСОЛЫ, МАТЕРИАЛ, ДОМ, ДАЧА, КОТТЕДЖ, ВЕНТИЛИРУЕМЫЙ ФАСАД, НЕГОРЮЧИЙ, ЗАЩИТА, ЦВЕТ, САЙДИНГ, МЕТАЛЛ, ДЕРЕВО', 'CM Scandinavia на выставке ВолгаСтройЭкспо в Казани, Республика Татарстан', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(55, 148, 'Новые серии CM Decking уже в России!', 'new-deck', '<p>Дорогие друзья, сообщаем вам радостную новость!</p>\r\n', '\r\n<p>Наши новые серии террасной доски из ДПК: CM Decking Bark и CM Decking Robust поступили на склад официального дилера CM Scandinavia в РФ.</p>\r\n<p>Не откладывайте оформление вашей террасы, выберите ближайшего дилера, и сделайте заказ уже сегодня!</p>', 1, 8, '2019-06-13 08:00:00', 421, '', '2019-07-11 08:52:57', 421, 0, '0000-00-00 00:00:00', '2019-06-13 08:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/CM_DECKING\\/BARK\\/mini\\/CM_Decking_BARK_Ashwood.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/CM_DECKING\\/BARK\\/CM_Decking_BARK_Ashwood.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 0, 'ФАСАД, ФИБРОЦЕМЕНТ, ЦОКОЛЬ, ВЫСОЛ, ВЫСОЛЫ, МАТЕРИАЛ, ДОМ, ДАЧА, КОТТЕДЖ, ВЕНТИЛИРУЕМЫЙ ФАСАД, НЕГОРЮЧИЙ, ЗАЩИТА, ЦВЕТ, САЙДИНГ, МЕТАЛЛ, ДЕРЕВО', 'ВЫСТАВКА СТРОИТЕЛЬНЫЕ МАТЕРИАЛЫ', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(56, 168, 'Аксессуары CM Cladding', 'cm-cladding-accessories', '', '', 1, 9, '2019-07-18 13:25:22', 421, '', '2019-07-26 08:16:07', 421, 0, '0000-00-00 00:00:00', '2019-07-18 13:25:22', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/AKS\\/accesories.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0410\\u043a\\u0441\\u0435\\u0441\\u0441\\u0443\\u0430\\u0440\\u044b CM Cladding\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\\u0434\\u043b\\u044f \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u043e\\u0439 \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0438\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 16, 3, 'CM_Cladding', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(57, 170, 'Аксессуары CM Railing', 'cm-railing-accessories', '', '', 1, 9, '2019-07-19 09:40:38', 421, '', '2019-07-26 08:16:04', 421, 0, '0000-00-00 00:00:00', '2019-07-19 09:40:38', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/AKS\\/accesories.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0410\\u043a\\u0441\\u0435\\u0441\\u0441\\u0443\\u0430\\u0440\\u044b CM Railing\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 2, 'CM_Railing', 'Аксессуары для перил и ограждений из ДПК CM Railing от CottageMode Scandinavia AB.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(58, 171, 'Аксессуары CM Fencing', 'cm-fencing-accessories', '', '', 1, 9, '2019-07-19 10:11:19', 421, '', '2019-07-26 08:16:00', 421, 0, '0000-00-00 00:00:00', '2019-07-19 10:11:19', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/AKS\\/accesories.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0410\\u043a\\u0441\\u0435\\u0441\\u0441\\u0443\\u0430\\u0440\\u044b CM Fencing\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 1, 'CM_Fencing', 'Аксессуары для заборов из ДПК CM Fencing от CottageMode Scandinavia AB.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(59, 172, 'Элементы и аксессуары CM Vattern', 'cm-vattern-accessories', '', '', 1, 9, '2019-07-19 10:38:50', 421, '', '2019-07-26 08:15:57', 421, 0, '0000-00-00 00:00:00', '2019-07-19 10:38:50', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/AKS\\/accesories.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"A\\u043a\\u0441\\u0435\\u0441\\u0441\\u0443\\u0430\\u0440\\u044b CM Vattern\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 0, 'CM_Vättern', 'Акссессуары для металлической водосточной системы CM Vattern от CottageMode Scandinavia AB.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', ''),
(60, 173, 'Аксессуары CM Decking', 'cm-decking-accessories', '', '', 1, 10, '2019-07-19 11:45:37', 421, '', '2019-07-26 08:15:54', 421, 0, '0000-00-00 00:00:00', '2019-07-19 11:45:37', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/AKS\\/accesories.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"\\u0410\\u043a\\u0441\\u0435\\u0441\\u0441\\u0443\\u0430\\u0440\\u044b CM Decking\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 5, 9, 'CM_Decking', 'Аксессуары для террасной доски из ДПК CM Decking от CottageMode Scandinavia AB.', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_contentitem_tag_map`
--

CREATE TABLE `hud_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Структура таблицы `hud_content_frontpage`
--

CREATE TABLE `hud_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_content_frontpage`
--

INSERT INTO `hud_content_frontpage` (`content_id`, `ordering`) VALUES
(34, 1),
(35, 2),
(36, 3),
(37, 4),
(38, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_content_rating`
--

CREATE TABLE `hud_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_content_types`
--

CREATE TABLE `hud_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_content_types`
--

INSERT INTO `hud_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_core_log_searches`
--

CREATE TABLE `hud_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_extensions`
--

CREATE TABLE `hud_extensions` (
  `extension_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_extensions`
--

INSERT INTO `hud_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 0, 1, 0, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 0, 1, 0, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_jed_info\":\"0\",\"cachetimeout\":\"24\",\"minimum_stability\":\"4\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"ru-RU\",\"site\":\"ru-RU\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_extensions\":\"svg,bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,svg\",\"ignore_extensions\":\"js,php\",\"upload_mime\":\"image\\/svg+xml,image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 0, 1, 0, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 0, 1, 0, '{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}', '{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"2\",\"image_formats\":\"gif,bmp,jpg,jpeg,png,webp,svg\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf,eot,svg\",\"compressed_formats\":\"zip\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"0\",\"readmore_limit\":\"100\",\"show_tags\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"record_hits\":\"0\",\"show_noauth\":\"1\",\"urls_position\":\"0\",\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"0\",\"history_limit\":10,\"show_urls_images_frontend\":\"1\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"none\",\"float_fulltext\":\"none\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"0\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"0\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"0\",\"show_subcat_desc\":\"0\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"0\",\"show_base_description\":\"0\",\"maxLevelcat\":\"0\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"0\",\"show_cat_num_articles_cat\":\"0\",\"num_leading_articles\":\"9\",\"num_intro_articles\":\"0\",\"num_columns\":\"1\",\"num_links\":\"0\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"0\",\"filter_field\":\"hide\",\"show_headings\":\"0\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"0\",\"list_show_author\":\"0\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"0\",\"show_featured\":\"show\",\"show_feed_link\":\"0\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_advanced\":1,\"sef_ids\":1,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"0\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"domains\":[],\"reset_count\":\"3\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"minimum_lowercase\":\"0\",\"save_history\":\"0\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\",\"debugUsers\":\"0\",\"debugGroups\":\"0\",\"sef_advanced\":1,\"custom_fields_enable\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 0, 0, 0, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"0\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"c.core_title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"min_term_length\":\"3\",\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"ru-RU\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_pagination\":\"2\",\"show_pagination_results\":\"0\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 0, 1, 0, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 0, 1, 0, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"January 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(35, 0, 'com_privacy', 'component', 'com_privacy', '', 1, 1, 1, 1, '{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(36, 0, 'com_actionlogs', 'component', 'com_actionlogs', '', 1, 1, 1, 1, '{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_categories\",\"com_content\",\"com_media\",\"com_modules\",\"com_installer\",\"com_menus\",\"com_tags\",\"com_redirect\",\"com_plugins\",\"com_users\",\"com_templates\",\"com_messages\"]}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"mediaversion\":\"2efc4ee033540bbcbb25cf77ceb1fca3\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 0, 1, 0, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 0, 1, 0, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 0, 1, 0, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 0, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 0, 1, 0, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 0, 1, 0, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 0, 1, 0, '{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 0, 1, 0, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 0, 1, 0, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 0, 1, 0, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 0, 0, 0, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 0, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 0, 1, 0, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 0, 1, 0, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(319, 0, 'mod_latestactions', 'module', 'mod_latestactions', '', 1, 1, 1, 0, '{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(320, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', '', 1, 1, 1, 0, '{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `hud_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 0, 1, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.40.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2019\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"4.5.11\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"0\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"1\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"450\",\"html_width\":\"750\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', '', 0, '0000-00-00 00:00:00', 11, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', 0, '0000-00-00 00:00:00', 12, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', 0, '0000-00-00 00:00:00', 20, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 14, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', '', 0, '0000-00-00 00:00:00', 15, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', '', 0, '0000-00-00 00:00:00', 13, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', '', 0, '0000-00-00 00:00:00', 18, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', '', 0, '0000-00-00 00:00:00', 19, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', '', 0, '0000-00-00 00:00:00', 16, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', '', 0, '0000-00-00 00:00:00', 21, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', '', 0, '0000-00-00 00:00:00', 17, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1562155847}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"069131caeea10d2424fc151dd59ee4c34b8e12db\",\"interval\":12}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 0, 1, 1, '{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 0, 1, 1, '{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 0, 1, 0, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 0, 1, 0, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 0, 1, 0, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 0, 1, 0, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(480, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(481, 0, 'plg_fields_repeatable', 'plugin', 'repeatable', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_repeatable\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_FIELDS_REPEATABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"repeatable\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(482, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(483, 0, 'PLG_SYSTEM_ACTIONLOGS', 'plugin', 'actionlogs', 'system', 0, 1, 1, 0, '{\"name\":\"PLG_SYSTEM_ACTIONLOGS\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{\"logDeletePeriod\":14,\"lastrun\":1567069130}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(484, 0, 'PLG_ACTIONLOG_JOOMLA', 'plugin', 'joomla', 'actionlog', 0, 0, 1, 0, '{\"name\":\"PLG_ACTIONLOG_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(485, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(486, 0, 'plg_system_logrotation', 'plugin', 'logrotation', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}', '{\"cachetimeout\":14,\"logstokeep\":1,\"lastrun\":1566570519}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(487, 0, 'plg_privacy_user', 'plugin', 'user', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `hud_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(488, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', 'quickicon', 0, 1, 1, 0, '{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(489, 0, 'plg_user_terms', 'plugin', 'terms', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(490, 0, 'plg_privacy_contact', 'plugin', 'contact', 'privacy', 0, 0, 1, 0, '{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(491, 0, 'plg_privacy_content', 'plugin', 'content', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(492, 0, 'plg_privacy_message', 'plugin', 'message', 'privacy', 0, 0, 1, 0, '{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(493, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', 'privacy', 0, 0, 1, 0, '{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(494, 0, 'plg_captcha_recaptcha_invisible', 'plugin', 'recaptcha_invisible', 'captcha', 0, 1, 1, 0, '{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"November 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}', '{\"public_key\":\"6LcR4aYUAAAAAHBszJG8jh7yu1y412LsS3yCH0OC\",\"private_key\":\"6LcR4aYUAAAAACzCFs7e4gDXHq8-ho_thLdI2vfg\",\"badge\":\"bottomright\",\"tabindex\":0,\"callback\":\"\",\"expired_callback\":\"\",\"error_callback\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(495, 0, 'plg_privacy_consents', 'plugin', 'consents', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.11\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.11\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"August 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2019 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.11\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"August 2019\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.11.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 10002, 'Russian', 'language', 'ru-RU', '', 0, 1, 0, 0, '{\"name\":\"Russian\",\"type\":\"language\",\"creationDate\":\"2019-06-17\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"www.joomlaportal.ru\",\"version\":\"3.9.8.1\",\"description\":\"Russian language pack (site) for Joomla! 3.9.8\",\"group\":\"\",\"filename\":\"install\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 10002, 'ru-RU', 'language', 'ru-RU', '', 1, 1, 0, 0, '{\"name\":\"\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439 (ru-RU)\",\"type\":\"language\",\"creationDate\":\"2019-06-17\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters. All rights reserved.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"www.joomlaportal.ru\",\"version\":\"3.9.8.1\",\"description\":\"Russian language pack (administrator) for Joomla! 3.9.8\",\"group\":\"\",\"filename\":\"install\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 0, 'Russian (ru-RU) Language Pack', 'package', 'pkg_ru-RU', '', 0, 1, 1, 0, '{\"name\":\"Russian (ru-RU) Language Pack\",\"type\":\"package\",\"creationDate\":\"2019-06-17\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"www.joomlaportal.ru\",\"version\":\"3.9.8.1\",\"description\":\"Joomla 3.9 Russian Language Package\",\"group\":\"\",\"filename\":\"pkg_ru-RU\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 0, 'cottagemode', 'template', 'cottagemode', '', 0, 1, 1, 0, '{\"name\":\"cottagemode\",\"type\":\"template\",\"creationDate\":\"01.07.2019\",\"author\":\"Oleg Orlov\",\"copyright\":\"\\u00a9 Oleg Orlov 2019, LLC. All rights reserved.\",\"authorEmail\":\"civilitys@gmail.com\",\"authorUrl\":\"\",\"version\":\"3.9\",\"description\":\"TEMP_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 0, 'com_rsform', 'component', 'com_rsform', '', 1, 1, 0, 0, '{\"name\":\"com_rsform\",\"type\":\"component\",\"creationDate\":\"March 2019\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2007-2019 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"2.2.0\",\"description\":\"COM_RSFORM_INSTALL_DESC\",\"group\":\"\",\"filename\":\"rsform\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 0, 'TCPDF', 'library', 'tcpdf', '', 0, 1, 1, 0, '{\"name\":\"TCPDF\",\"type\":\"library\",\"creationDate\":\"28 January 2011\",\"author\":\"Nicola Asuni\",\"copyright\":\"http:\\/\\/www.tcpdf.org\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.tcpdf.org\",\"version\":\"2.5.0\",\"description\":\"Class for generating PDF files on-the-fly without requiring external extensions.\",\"group\":\"\",\"filename\":\"tcpdf\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 0, 'plg_installer_rsform', 'plugin', 'rsform', 'installer', 0, 1, 1, 0, '{\"name\":\"plg_installer_rsform\",\"type\":\"plugin\",\"creationDate\":\"July 2015\",\"author\":\"RSJoomla!\",\"copyright\":\"(c) 2015 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"https:\\/\\/www.rsjoomla.com\",\"version\":\"1.0.0\",\"description\":\"PLG_INSTALLER_RSFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rsform\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 0, 'System - RSForm! Pro Delete Submissions', 'plugin', 'rsformdeletesubmissions', 'system', 0, 1, 1, 0, '{\"name\":\"System - RSForm! Pro Delete Submissions\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2007-2018 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.0.0\",\"description\":\"PLG_SYSTEM_RSFORMDELETESUBMISSIONS_DESC\",\"group\":\"\",\"filename\":\"rsformdeletesubmissions\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(10010, 0, 'System - RSForm! Pro reCAPTCHA v2', 'plugin', 'rsfprecaptchav2', 'system', 0, 1, 1, 0, '{\"name\":\"System - RSForm! Pro reCAPTCHA v2\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2014-2018 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.52.1\",\"description\":\"PLG_SYSTEM_RSFPRECAPTCHAV2_DESC\",\"group\":\"\",\"filename\":\"rsfprecaptchav2\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(10011, 0, 'RSForm! Pro Module', 'module', 'mod_rsform', '', 0, 1, 0, 0, '{\"name\":\"RSForm! Pro Module\",\"type\":\"module\",\"creationDate\":\"November 2012\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2007-2015 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.51.1\",\"description\":\"MOD_RSFORM_DESC\",\"group\":\"\",\"filename\":\"mod_rsform\"}', '{\"formId\":\"1\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 0, 'RSForm!Pro Russian Language Pack', 'file', 'RSForm!Pro_ru_RU25', '', 0, 1, 0, 0, '{\"name\":\"RSForm!Pro Russian Language Pack\",\"type\":\"file\",\"creationDate\":\"23 April 2015\",\"author\":\"RSJoomla!\",\"copyright\":\"Copyright (C) 2013. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1.50.x\",\"description\":\"RSForm!Pro Russian Language Pack by RSJoomla!\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 0, 'Content - RSForm! Pro', 'plugin', 'rsform', 'content', 0, 1, 1, 0, '{\"name\":\"Content - RSForm! Pro\",\"type\":\"plugin\",\"creationDate\":\"June 2015\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2007-2017 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.51.1\",\"description\":\"PLG_CONTENT_RSFORM_DESC\",\"group\":\"\",\"filename\":\"rsform\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 0, 'COM_OSMAP', 'component', 'com_osmap', '', 1, 1, 0, 0, '{\"name\":\"COM_OSMAP\",\"type\":\"component\",\"creationDate\":\"April 08 2019\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016-2017 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"https:\\/\\/www.joomlashack.com\",\"version\":\"4.2.20\",\"description\":\"COM_OSMAP_DESCRIPTION\",\"group\":\"\",\"filename\":\"osmap\"}', '{}', '{\"author\":\"Joomlashack\"}', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 0, 'Joomlashack Framework', 'library', 'allediaframework', '', 0, 1, 1, 0, '{\"name\":\"Joomlashack Framework\",\"type\":\"library\",\"creationDate\":\"November 09 2018\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016-2018 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"help@joomlashack.co\",\"authorUrl\":\"https:\\/\\/www.joomlashack.com\",\"version\":\"1.6.4\",\"description\":\"Shared library for Joomlashack extensions\",\"group\":\"\",\"filename\":\"allediaframework\"}', '{}', '{\"author\":\"Joomlashack\"}', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 0, 'plg_system_ossystem', 'plugin', 'ossystem', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_ossystem\",\"type\":\"plugin\",\"creationDate\":\"October 02 2017\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"http:\\/\\/www.joomlashack.com\",\"version\":\"1.3.0\",\"description\":\"PLG_SYSTEM_OSSYSTEM_DESCRIPTION\",\"group\":\"\",\"filename\":\"ossystem\"}', '[]', '{\"author\":\"Joomlashack\"}', '', 0, '0000-00-00 00:00:00', 1, 0),
(10017, 0, 'PLG_OSMAP_JOOMLA', 'plugin', 'joomla', 'osmap', 0, 1, 1, 0, '{\"name\":\"PLG_OSMAP_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"April 08 2019\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016-2017 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"https:\\/\\/www.joomlashack.com\",\"version\":\"4.2.20\",\"description\":\"PLG_OSMAP_JOOMLA_PLUGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"expand_categories\":\"1\",\"expand_featured\":\"1\",\"max_category_level\":\"all\",\"include_archived\":\"2\",\"show_unauth\":\"0\",\"add_pagebreaks\":\"1\",\"max_art\":\"0\",\"article_order\":\"0\",\"article_orderdir\":\"0\",\"add_images\":\"1\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"-1\",\"art_priority\":\"-1\",\"art_changefreq\":\"-1\",\"keywords\":\"metakey\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 0, 'FL Yandex Turbo', 'plugin', 'flyandexturbo', 'ajax', 0, 1, 1, 0, '{\"name\":\"FL Yandex Turbo\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"\\u0412\\u0430\\u0441\\u044e\\u043a\\u043e\\u0432 \\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439\",\"copyright\":\"Copyright 2018 FictionLabs. All rights reserved\",\"authorEmail\":\"info@fictionlabs.ru\",\"authorUrl\":\"https:\\/\\/fictionlabs.ru\",\"version\":\"3.0.3\",\"description\":\"PLG_FLYANDEXTURBO_DESC\",\"group\":\"\",\"filename\":\"flyandexturbo\"}', '{\"channel_code\":\"68e1646294ab7d35\",\"channel_title\":\"CottageMode\",\"channel_description\":\"CM Scandinavia (CottageMode): \\u0434\\u043f\\u043a, \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u044b, \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u043a\\u0438\",\"channel_language\":\"\",\"items_author\":\"2\",\"items_author_name\":\"\",\"items_date\":\"0\",\"items_tags\":[\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h6\",\"p\",\"a\",\"img\",\"table\",\"tr\",\"th\",\"td\",\"figure\",\"ul\",\"li\",\"strong\",\"small\",\"dl\",\"dd\",\"dt\"],\"items_social\":\"1\",\"items_social_options\":[\"facebook\",\"vkontakte\"],\"items_analitics\":\"1\",\"items_analitics_options\":{\"items_analitics_options0\":{\"items_analitics_type\":\"Yandex\",\"items_analitics_id\":\"46266303\",\"items_analitics_liveinternet_params\":\"CottageMode\"}},\"items_advertisement\":\"0\",\"items_advertisement_options\":{\"items_advertisement_options0\":{\"items_advertisement_type\":\"Yandex\",\"items_advertisement_id\":\"\",\"items_advertisement_attr\":\"\"}},\"items_callback\":\"0\",\"items_callback_stick\":\"left\",\"items_callback_title\":\"\",\"items_callback_options\":{\"items_callback_options0\":{\"items_callback_type\":\"call\",\"items_callback_url\":\"\",\"items_callback_email\":\"\",\"items_callback_company\":\"\",\"items_callback_link\":\"\"}},\"items_form\":\"0\",\"items_form_type\":\"item\",\"items_form_email\":\"\",\"items_form_company\":\"\",\"items_form_link\":\"\",\"items_form_bgcolor\":\"\",\"items_form_color\":\"\",\"items_form_text\":\"\",\"items_form_bold\":\"0\",\"enable_figcaption\":\"1\",\"enable_clean\":\"1\",\"enable_utm\":\"0\",\"utm_tags\":\"utm_source=flyandexturbo\",\"enable_cache\":\"1\",\"cache_time\":\"1440\",\"enable_plugins\":\"1\",\"enable_random\":\"0\",\"disable_feed\":\"0\",\"content_options\":{\"enable\":\"1\",\"content_catid\":[\"10\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"22\"],\"content_show_featured\":\"\",\"content_add_image\":\"1\",\"content_count\":\"500\",\"enable_categories\":\"0\",\"content_categories_catid\":[\"10\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"22\"],\"content_categories_add_image\":\"1\",\"content_categories_add_items\":\"1\",\"content_categories_items_count\":\"30\"},\"custom_options\":{\"enable\":\"0\",\"enable_categories\":\"0\",\"items\":{\"items0\":{\"title\":\"\",\"link\":\"\",\"author\":\"\",\"image\":\"\",\"date\":\"\",\"content\":\"\"}}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 0, 'MOD_COLLECTOR', 'module', 'mod_collector', '', 0, 1, 0, 0, '{\"name\":\"MOD_COLLECTOR\",\"type\":\"module\",\"creationDate\":\"27.08.2019\",\"author\":\"O.Orlov\",\"copyright\":\"Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"netses@rmbler.ru\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"MOD_COLLECTOR_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_collector\"}', '{\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_fields`
--

CREATE TABLE `hud_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_fields`
--

INSERT INTO `hud_fields` (`id`, `asset_id`, `context`, `group_id`, `title`, `name`, `label`, `default_value`, `type`, `note`, `description`, `state`, `required`, `checked_out`, `checked_out_time`, `ordering`, `params`, `fieldparams`, `language`, `created_time`, `created_user_id`, `modified_time`, `modified_by`, `access`) VALUES
(1, 80, 'com_content.article', 0, 'Бренд', 'brend', 'Бренд', '', 'media', '', '', -2, 0, 0, '0000-00-00 00:00:00', 14, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"1\",\"label_render_class\":\"\",\"display\":\"3\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"directory\":\"\",\"preview\":\"true\",\"image_class\":\"\"}', '*', '2019-07-04 07:51:43', 421, '0000-00-00 00:00:00', 0, 1),
(2, 83, 'com_content.article', 2, 'Преимущество', 'points', 'Преимущество', '', 'repeatable', '', '', 1, 0, 0, '0000-00-00 00:00:00', 6, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"text\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 07:56:20', 421, '2019-07-24 08:25:03', 421, 1),
(3, 84, 'com_content.article', 2, 'Чертеж', 'drafts', 'Чертеж', '', 'repeatable', '', '', 1, 0, 0, '0000-00-00 00:00:00', 5, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"mini\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"},\"fields1\":{\"fieldname\":\"big\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 07:57:30', 421, '2019-07-24 08:25:14', 421, 1),
(4, 85, 'com_content.article', 2, 'Документы', 'pdf', 'Документы', '', 'repeatable', '', '', 1, 0, 0, '0000-00-00 00:00:00', 4, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"title\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"},\"fields1\":{\"fieldname\":\"link\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 07:58:41', 421, '2019-07-24 08:25:35', 421, 1),
(5, 86, 'com_content.article', 2, 'Иконки', 'icon', 'Иконки', '', 'checkboxes', '', '', 1, 0, 0, '0000-00-00 00:00:00', 7, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"options\":{\"options0\":{\"name\":\"\\u0418\\u043c\\u0435\\u044e\\u0442 \\u043d\\u0435 \\u0441\\u043a\\u043e\\u043b\\u044c\\u0437\\u044f\\u0449\\u0443\\u044e \\u043f\\u043e\\u0432\\u0435\\u0440\\u0445\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438, \\u0432 \\u043e\\u0442\\u043b\\u0438\\u0447\\u0438\\u0435 \\u043e\\u0442 \\u043d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b, \\u043d\\u0438\\u043a\\u043e\\u0433\\u0434\\u0430 \\u043d\\u0435 \\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442 \\u0437\\u0430\\u043d\\u043e\\u0437, \\u0447\\u0442\\u043e \\u0434\\u0435\\u043b\\u0430\\u0435\\u0442 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0414\\u041f\\u041a \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u044b\\u043c\\u0438.\",\"value\":\"plus.svg\"},\"options1\":{\"name\":\"\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u0435\\u0434\\u0435\\u043d\\u043e \\u0448\\u0432\\u0435\\u0434\\u0441\\u043a\\u0438\\u043c \\u043a\\u043e\\u043d\\u0446\\u0435\\u0440\\u043d\\u043e\\u043c CottageMode Scandinavia \\u0441 \\u0432\\u044b\\u0441\\u043e\\u043a\\u0438\\u043c\\u0438 \\u0442\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u043c\\u0438 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0430\\u043c\\u0438 \\u0438 \\u0441\\u043e\\u0431\\u043b\\u044e\\u0434\\u0435\\u043d\\u0438\\u0435\\u043c \\u0432\\u0441\\u0435\\u0445 \\u0442\\u0440\\u0435\\u0431\\u043e\\u0432\\u0430\\u043d\\u0438\\u0439 \\u0434\\u043b\\u044f \\u0441\\u043e\\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0435\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u043c \\u0441\\u0442\\u0430\\u043d\\u0434\\u0430\\u0440\\u0442\\u0430\\u043c.\",\"value\":\"crowns.svg\"},\"options2\":{\"name\":\"\\u041e\\u0431\\u043b\\u0430\\u0434\\u0430\\u0435\\u0442 \\u0432\\u044b\\u0441\\u043e\\u043a\\u043e\\u0439 \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c\\u044e \\u043a \\u0430\\u0442\\u043c\\u043e\\u0441\\u0444\\u0435\\u0440\\u043d\\u044b\\u043c \\u0432\\u043e\\u0437\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u044f\\u043c, \\u0442\\u0430\\u043a\\u0438\\u043c \\u043a\\u0430\\u043a \\u0434\\u043e\\u0436\\u0434\\u044c, \\u0441\\u043e\\u043b\\u043d\\u0446\\u0435 \\u0438 \\u043f\\u0435\\u0440\\u0435\\u043f\\u0430\\u0434\\u044b \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440. \\u0423\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e \\u043a \\u0432\\u043e\\u0437\\u043d\\u0438\\u043a\\u043d\\u043e\\u0432\\u0435\\u043d\\u0438\\u044e \\u0433\\u0440\\u0438\\u0431\\u043a\\u043e\\u0432, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438 \\u0438 \\u0433\\u043d\\u0438\\u0435\\u043d\\u0438\\u044f.\",\"value\":\"shield.svg\"},\"options3\":{\"name\":\"\\u0420\\u0430\\u0437\\u043d\\u043e\\u043e\\u0431\\u0440\\u0430\\u0437\\u043d\\u0430\\u044f \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432\\u0430\\u044f \\u0433\\u0430\\u043c\\u043c\\u0430 \\u0438 \\u0442\\u0435\\u043a\\u0441\\u0442\\u0443\\u0440\\u044b, \\u043f\\u0440\\u0438\\u0431\\u043b\\u0438\\u0436\\u0435\\u043d\\u043d\\u044b\\u0435 \\u043a \\u043d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u0435. \\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u043d\\u043e, \\u043d\\u0435 \\u0432\\u044b\\u0434\\u0435\\u043b\\u044f\\u0435\\u0442 \\u0432 \\u0430\\u0442\\u043c\\u043e\\u0441\\u0444\\u0435\\u0440\\u0443 \\u043b\\u0435\\u0442\\u0443\\u0447\\u0438\\u0435 \\u0432\\u0435\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0438 \\u043d\\u0435 \\u0438\\u043c\\u0435\\u0435\\u0442 \\u043d\\u0435\\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0437\\u0430\\u043f\\u0430\\u0445\\u0430.\",\"value\":\"timber.svg\"},\"options4\":{\"name\":\"\\u041c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u043d\\u0435 \\u043d\\u0443\\u0436\\u0434\\u0430\\u044e\\u0442\\u0441\\u044f \\u0432 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0435 \\u043b\\u0430\\u043a\\u0430\\u043c\\u0438 \\u0438 \\u043a\\u0440\\u0430\\u0441\\u043a\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u0432\\u0441\\u0435\\u0433\\u043e \\u0441\\u0440\\u043e\\u043a\\u0430 \\u044d\\u043a\\u0441\\u043f\\u043b\\u0443\\u0430\\u0442\\u0430\\u0446\\u0438\\u0438, \\u0442\\u0430\\u043a \\u043a\\u0430\\u043a \\u043e\\u043a\\u0440\\u0430\\u0448\\u0435\\u043d\\u044b \\u0432 \\u043c\\u0430\\u0441\\u0441\\u0435 \\u0438 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u0442 \\u0432 \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u0435 \\u0423\\u0424-\\u0444\\u0438\\u043b\\u044c\\u0442\\u0440\\u044b.\",\"value\":\"brush.svg\"},\"options5\":{\"name\":\"\\u041a\\u043e\\u043d\\u0446\\u0435\\u0440\\u043d CottageMode Scandinavia \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442 10-\\u043b\\u0435\\u0442\\u043d\\u044e\\u044e \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u044e \\u043d\\u0430 \\u0432\\u0441\\u044e \\u043b\\u0438\\u043d\\u0435\\u0439\\u043a\\u0443 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u043e\\u0432 \\u0438\\u0437 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u043d\\u043e-\\u043f\\u043e\\u043b\\u0438\\u043c\\u0435\\u0440\\u043d\\u043e\\u0433\\u043e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0442\\u0430.\",\"value\":\"years.svg\"}}}', '*', '2019-07-04 08:00:06', 421, '2019-07-24 07:37:58', 421, 1),
(6, 87, 'com_content.article', 2, 'Слайдер', 'slider', 'Слайдер', '', 'repeatable', '', '', 1, 0, 0, '0000-00-00 00:00:00', 2, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"mini\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"},\"fields1\":{\"fieldname\":\"big\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"},\"fields2\":{\"fieldname\":\"title\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"},\"fields3\":{\"fieldname\":\"alt\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 08:32:18', 421, '2019-07-24 08:26:01', 421, 1),
(7, 88, 'com_content.article', 2, 'Вариации цветов', 'imgcolors', 'Вариации цветов', '', 'repeatable', '', '', 1, 0, 0, '0000-00-00 00:00:00', 3, '{\"hint\":\"\",\"class\":\"btn-group\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"mini\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"},\"fields1\":{\"fieldname\":\"big\",\"fieldtype\":\"media\",\"fieldfilter\":\"0\"},\"fields2\":{\"fieldname\":\"title\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"},\"fields3\":{\"fieldname\":\"alt\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 08:33:35', 421, '2019-07-24 08:25:46', 421, 1),
(8, 89, 'com_content.article', 3, 'Размер', 'sizes', 'Размер', '', 'repeatable', '', '135×25×3000', 1, 0, 0, '0000-00-00 00:00:00', 8, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"size\",\"fieldtype\":\"text\",\"fieldfilter\":\"0\"}}}', '*', '2019-07-04 08:42:36', 421, '2019-07-24 08:24:24', 421, 1),
(9, 90, 'com_content.article', 3, 'Упаковка', 'packing', 'Упаковка', '', 'radio', '', '', 1, 0, 0, '0000-00-00 00:00:00', 9, '{\"hint\":\"\",\"class\":\"btn-group\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"1\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"options\":{\"options0\":{\"name\":\"\\u041f\\u043e\\u0448\\u0442\\u0443\\u0447\\u043d\\u043e\",\"value\":\"one\"},\"options1\":{\"name\":\"2 \\u0448\\u0442.\",\"value\":\"2\"},\"options2\":{\"name\":\"3 \\u0448\\u0442.\",\"value\":\"3\"},\"options3\":{\"name\":\"4 \\u0448\\u0442.\",\"value\":\"4\"},\"options4\":{\"name\":\"5 \\u0448\\u0442.\",\"value\":\"5\"},\"options5\":{\"name\":\"6 \\u0448\\u0442.\",\"value\":\"6\"},\"options6\":{\"name\":\"11 \\u0448\\u0442.\",\"value\":\"11\"},\"options7\":{\"name\":\"\\u0412 \\u0437\\u0430\\u0432\\u0438\\u0441\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043e\\u0442 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442\\u0430\\u0446\\u0438\\u0438\",\"value\":\"all\"}}}', '*', '2019-07-04 08:48:22', 421, '2019-07-24 08:23:53', 421, 1),
(10, 91, 'com_content.article', 3, 'Профиль', 'profile', 'Профиль', '', 'radio', '', '', 1, 0, 0, '0000-00-00 00:00:00', 10, '{\"hint\":\"\",\"class\":\"btn-group\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"1\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"options\":{\"options0\":{\"name\":\"\\u041e\\u0434\\u043d\\u043e\\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u043d\\u0438\\u0439\",\"value\":\"1\"},\"options1\":{\"name\":\"\\u0414\\u0432\\u0443\\u0445\\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u043d\\u0438\\u0439\",\"value\":\"2\"}}}', '*', '2019-07-04 08:49:49', 421, '2019-07-24 08:22:53', 421, 1),
(11, 92, 'com_content.article', 3, 'Текстуры', 'texture', 'Текстуры', '', 'text', '', '', 1, 0, 0, '0000-00-00 00:00:00', 11, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"1\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"filter\":\"safehtml\",\"maxlength\":50}', '*', '2019-07-04 08:50:54', 421, '2019-07-24 08:22:20', 421, 1),
(12, 93, 'com_content.article', 3, 'Термообработка', 'thermo', 'Термообработка', '', 'radio', '', '', 1, 0, 0, '0000-00-00 00:00:00', 12, '{\"hint\":\"\",\"class\":\"btn-group\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"1\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"options\":{\"options0\":{\"name\":\"S\",\"value\":\"1\"},\"options1\":{\"name\":\"D\",\"value\":\"2\"}}}', '*', '2019-07-04 08:53:17', 421, '2019-07-24 08:21:56', 421, 1),
(13, 149, 'com_content.categories', 1, 'Заголовок H1', 'titleh1', 'Заголовок H1', '', 'text', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"filter\":\"\",\"maxlength\":\"\"}', '*', '2019-07-08 09:15:05', 421, '2019-07-15 09:55:42', 421, 1),
(14, 150, 'com_content.categories', 1, 'Заголовок H2', 'titleh2', 'Заголовок H2', '', 'text', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"filter\":\"\",\"maxlength\":\"\"}', '*', '2019-07-08 09:15:41', 421, '2019-07-15 09:55:49', 421, 1),
(15, 161, 'com_content.article', 2, 'Заголовок H2', 'headerh2', 'Заголовок H2', '', 'text', '', '', 1, 0, 0, '0000-00-00 00:00:00', 1, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"0\"}', '{\"filter\":\"\",\"maxlength\":\"\"}', '*', '2019-07-16 10:33:11', 421, '2019-07-24 08:26:20', 421, 1),
(16, 162, 'com_content.categories', 1, 'Бренд', 'catbrand', 'Бренд', '', 'media', '', '', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"directory\":\"\",\"preview\":\"\",\"image_class\":\"\"}', '*', '2019-07-16 10:35:40', 421, '2019-07-16 12:38:52', 421, 1),
(17, 163, 'com_content.article', 2, 'Бренд', 'brand', 'Бренд', '', 'media', '', '', 1, 0, 0, '0000-00-00 00:00:00', 13, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"directory\":\"\",\"preview\":\"\",\"image_class\":\"\"}', '*', '2019-07-16 10:36:32', 421, '2019-07-18 14:43:42', 421, 1),
(18, 169, 'com_content.article', 3, 'Аксессуар', 'accessory', 'Аксессуар', '', 'repeatable', '', 'Аксессуары', 1, 0, 0, '0000-00-00 00:00:00', 0, '{\"hint\":\"\",\"class\":\"\",\"label_class\":\"\",\"show_on\":\"\",\"render_class\":\"\",\"showlabel\":\"0\",\"label_render_class\":\"\",\"display\":\"0\",\"layout\":\"\",\"display_readonly\":\"2\"}', '{\"fields\":{\"fields0\":{\"fieldname\":\"img\",\"fieldtype\":\"media\"},\"fields1\":{\"fieldname\":\"name\",\"fieldtype\":\"text\"},\"fields2\":{\"fieldname\":\"size\",\"fieldtype\":\"text\"},\"fields3\":{\"fieldname\":\"width\",\"fieldtype\":\"text\"},\"fields4\":{\"fieldname\":\"weight\",\"fieldtype\":\"text\"},\"fields5\":{\"fieldname\":\"amount\",\"fieldtype\":\"number\"},\"fields6\":{\"fieldname\":\"diameter\",\"fieldtype\":\"text\"},\"fields7\":{\"fieldname\":\"angle\",\"fieldtype\":\"text\"},\"fields8\":{\"fieldname\":\"text\",\"fieldtype\":\"text\"}}}', '*', '2019-07-18 15:00:08', 421, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_fields_categories`
--

CREATE TABLE `hud_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_fields_categories`
--

INSERT INTO `hud_fields_categories` (`field_id`, `category_id`) VALUES
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 19),
(2, 20),
(2, 21),
(2, 23),
(2, 24),
(2, 25),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 19),
(3, 20),
(3, 21),
(3, 23),
(3, 24),
(3, 25),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 19),
(4, 20),
(4, 21),
(4, 23),
(4, 24),
(4, 25),
(5, 10),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 19),
(6, 20),
(6, 21),
(6, 23),
(6, 24),
(6, 25),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 19),
(7, 20),
(7, 21),
(7, 23),
(7, 24),
(7, 25),
(8, 10),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 16),
(8, 19),
(8, 20),
(8, 21),
(8, 23),
(8, 24),
(8, 25),
(9, 10),
(9, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16),
(9, 19),
(9, 20),
(9, 21),
(9, 23),
(9, 24),
(9, 25),
(10, 10),
(10, 12),
(10, 13),
(10, 14),
(10, 16),
(11, 10),
(11, 12),
(11, 13),
(11, 14),
(11, 15),
(11, 16),
(12, 24),
(12, 25),
(13, 9),
(13, 10),
(13, 11),
(13, 12),
(13, 13),
(13, 14),
(13, 15),
(13, 16),
(13, 17),
(13, 18),
(13, 19),
(13, 20),
(13, 21),
(13, 22),
(13, 23),
(13, 24),
(13, 25),
(14, 9),
(14, 10),
(14, 11),
(14, 12),
(14, 13),
(14, 14),
(14, 15),
(14, 16),
(14, 17),
(14, 18),
(14, 19),
(14, 20),
(14, 21),
(14, 22),
(14, 23),
(14, 24),
(14, 25),
(15, 9),
(15, 10),
(15, 11),
(15, 12),
(15, 13),
(15, 14),
(15, 15),
(15, 16),
(15, 17),
(15, 19),
(15, 20),
(15, 21),
(15, 23),
(15, 24),
(15, 25),
(16, 9),
(16, 10),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(16, 15),
(16, 16),
(16, 17),
(16, 18),
(16, 19),
(16, 20),
(16, 21),
(16, 22),
(16, 23),
(16, 24),
(16, 25),
(17, 9),
(17, 10),
(17, 11),
(17, 12),
(17, 13),
(17, 14),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 19),
(17, 20),
(17, 21),
(17, 22),
(17, 23),
(17, 24),
(17, 25),
(18, 9),
(18, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_fields_groups`
--

CREATE TABLE `hud_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_fields_groups`
--

INSERT INTO `hud_fields_groups` (`id`, `asset_id`, `context`, `title`, `note`, `description`, `state`, `checked_out`, `checked_out_time`, `ordering`, `params`, `language`, `created`, `created_by`, `modified`, `modified_by`, `access`) VALUES
(1, 79, 'com_content.categories', 'SEO', '', '', 1, 0, '0000-00-00 00:00:00', 0, '{\"display_readonly\":\"1\"}', '*', '2019-07-04 07:48:21', 421, '2019-07-08 09:11:22', 421, 1),
(2, 81, 'com_content.article', 'Дополнительно', '', '', 1, 0, '0000-00-00 00:00:00', 0, '{\"display_readonly\":\"1\"}', '*', '2019-07-04 07:52:27', 421, '0000-00-00 00:00:00', 0, 1),
(3, 82, 'com_content.article', 'Таблица', '', '', 1, 0, '0000-00-00 00:00:00', 0, '{\"display_readonly\":\"1\"}', '*', '2019-07-04 07:52:58', 421, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_fields_values`
--

CREATE TABLE `hud_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_fields_values`
--

INSERT INTO `hud_fields_values` (`field_id`, `item_id`, `value`) VALUES
(8, '1', '{\"sizes0\":{\"size\":\"140\\u00d725\\u00d73000\"}}'),
(9, '1', '3'),
(10, '1', '2'),
(11, '1', 'Новая текстура древесины / Широкий вельвет'),
(2, '1', '{\"points0\":{\"text\":\"\\u041d\\u043e\\u0432\\u044b\\u0439 \\u0442\\u0438\\u043f \\u0442\\u0435\\u043a\\u0441\\u0442\\u0443\\u0440\\u044b - \\u0438\\u043c\\u0438\\u0442\\u0430\\u0446\\u0438\\u044f \\u043a\\u043e\\u0440\\u044b \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b\"},\"points1\":{\"text\":\"\\u041d\\u043e\\u0432\\u0430\\u044f \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432\\u0430\\u044f \\u043b\\u0438\\u043d\\u0435\\u0439\\u043a\\u0430\"},\"points2\":{\"text\":\"\\u041f\\u043e\\u0432\\u044b\\u0448\\u0435\\u043d\\u043d\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0438\\u0441\\u0442\\u0438\\u0440\\u0430\\u043d\\u0438\\u044e\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(4, '1', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf3\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf4\":{\"title\":\"\\u041e\\u0442\\u043a\\u0430\\u0437\\u043d\\u043e\\u0435 \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\",\"link\":\"images\\/CM_DECKING\\/PDF\\/otkaznoe-pismo.pdf\"},\"pdf5\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf6\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(6, '1', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/BARK\\/slider\\/mini\\/Burk.jpg\",\"big\":\"images\\/CM_DECKING\\/BARK\\/slider\\/Burk.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(7, '1', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/BARK\\/mini\\/CM_Decking_BARK_Ashwood.jpg\",\"big\":\"images\\/CM_DECKING\\/BARK\\/CM_Decking_BARK_Ashwood.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u042f\\u0441\\u0435\\u043d\\u044c\",\"alt\":\"Ashwood\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/BARK\\/mini\\/CM_Decking_BARK_Merbau.jpg\",\"big\":\"images\\/CM_DECKING\\/BARK\\/CM_Decking_BARK_Merbau.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u041c\\u0435\\u0440\\u0431\\u0430\\u0443\",\"alt\":\"Merbau\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/BARK\\/mini\\/CM_Decking_BARK_Teak.jpg\",\"big\":\"images\\/CM_DECKING\\/BARK\\/CM_Decking_BARK_Teak.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0422\\u0438\\u043a\",\"alt\":\"Teak\"}}'),
(8, '2', '{\"sizes0\":{\"size\":\"140\\u00d725\\u00d73000\"}}'),
(9, '2', '3'),
(10, '2', '2'),
(11, '2', 'Новая текстура древесины / Широкий вельвет'),
(2, '2', '{\"points0\":{\"text\":\"\\u041d\\u043e\\u0432\\u044b\\u0439 \\u0440\\u0438\\u0441\\u0443\\u043d\\u043e\\u043a \\u0442\\u0435\\u043a\\u0441\\u0442\\u0443\\u0440\\u044b \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b\"},\"points1\":{\"text\":\"\\u041d\\u043e\\u0432\\u0430\\u044f \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432\\u0430\\u044f \\u043b\\u0438\\u043d\\u0435\\u0439\\u043a\\u0430\"},\"points2\":{\"text\":\"\\u0414\\u0432\\u0443x\\u0446\\u0432\\u0435\\u0442\\u043d\\u044b\\u0439 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d: \\u0432\\u043a\\u0440\\u0430\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f \\u0447\\u0435\\u0440\\u043d\\u043e\\u0433\\u043e \\u0446\\u0432\\u0435\\u0442\\u0430 \\u0432 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u043e\\u0439 \\u043c\\u0430\\u0441\\u0441\\u0435\"},\"points3\":{\"text\":\"\\u041f\\u043e\\u0432\\u044b\\u0448\\u0435\\u043d\\u043d\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0438\\u0441\\u0442\\u0438\\u0440\\u0430\\u043d\\u0438\\u044e\"},\"points4\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(4, '2', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-uhodu-za-terrasnoj-doskoj-dpk-cm-decking.pdf\"},\"pdf3\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf4\":{\"title\":\"\\u041e\\u0442\\u043a\\u0430\\u0437\\u043d\\u043e\\u0435 \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\",\"link\":\"images\\/CM_DECKING\\/PDF\\/otkaznoe-pismo.pdf\"},\"pdf5\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf6\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(6, '2', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/ROBUST\\/slider\\/mini\\/Robust.jpg\",\"big\":\"images\\/CM_DECKING\\/ROBUST\\/slider\\/Robust.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(7, '2', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/ROBUST\\/mini\\/CM_Decking_ROBUST_Ashwood.jpg\",\"big\":\"images\\/CM_DECKING\\/ROBUST\\/CM_Decking_ROBUST_Ashwood_1024.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u042f\\u0441\\u0435\\u043d\\u044c\",\"alt\":\"Ashwood\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/ROBUST\\/mini\\/CM_Decking_ROBUST_Merbau.jpg\",\"big\":\"images\\/CM_DECKING\\/ROBUST\\/CM_Decking_ROBUST_Merbau_1024.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u041c\\u0435\\u0440\\u0431\\u0430\\u0443\",\"alt\":\"Merbau\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/ROBUST\\/mini\\/CM_Decking_ROBUST_Teak_.jpg\",\"big\":\"images\\/CM_DECKING\\/ROBUST\\/CM_Decking_ROBUST_Teak_1024.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0422\\u0438\\u043a\",\"alt\":\"Teak\"}}'),
(7, '3', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/mini\\/cm-deking-stair-dark-wood-double.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/cm-deking-stair-dark-wood-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0427\\u0435\\u0440\\u043d\\u043e\\u0435 \\u0414\\u0435\\u0440\\u0435\\u0432\\u043e\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0427\\u0435\\u0440\\u043d\\u043e\\u0435 \\u0414\\u0435\\u0440\\u0435\\u0432\\u043e\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/mini\\/cm-deking-stair-dub-double.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/cm-deking-stair-dub-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/mini\\/cm-deking-stair-eben-double.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/cm-deking-stair-eben-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\"},\"imgcolors3\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/mini\\/cm-deking-stair-venge-double.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/cm-deking-stair-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(8, '3', '{\"sizes0\":{\"size\":\"345\\u00d725\\/35\\u00d73000\"}}'),
(6, '3', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/slider\\/mini\\/CM_STAIR-1.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/slider\\/CM_STAIR-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/slider\\/mini\\/CM_STAIR-2.jpg\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/slider\\/CM_STAIR-2.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '3', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/STAIR\\/PDF\\/instrukcija-po-uhodu-za-terrasnoj-doskoj-dpk-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/STAIR\\/PDF\\/cm-stair_montazh.pdf\"},\"pdf3\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/STAIR\\/PDF\\/instrukcija-po-montazhu-cm-stair.pdf\"}}'),
(2, '3', '{\"points0\":{\"text\":\"\\u0412\\u044b\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u044e\\u0442 \\u0432\\u044b\\u0441\\u043e\\u043a\\u0438\\u0435 \\u043c\\u0435\\u0445\\u0430\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u043d\\u0430\\u0433\\u0440\\u0443\\u0437\\u043a\\u0438\"},\"points1\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u0432 \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points2\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(9, '3', 'one'),
(10, '3', '1'),
(11, '3', 'Мелкий вельвет'),
(3, '3', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/STAIR\\/draft\\/stair.png\",\"big\":\"images\\/CM_DECKING\\/STAIR\\/draft\\/stair-big.png\"}}'),
(7, '4', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/mini\\/cm-deking-grand-double.jpg\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/cm-deking-grand-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '4', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/mini\\/Grand-1.jpg\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/Grand-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/mini\\/Grand-2.jpg\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/Grand-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/mini\\/Grand-3.jpg\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/Grand-3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/mini\\/Grand-4.jpg\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/slider\\/Grand-4.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '4', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf3\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf4\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf5\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(3, '4', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/GRAND\\/draft\\/Grand.png\",\"big\":\"images\\/CM_DECKING\\/GRAND\\/draft\\/Grand-big.png\"}}'),
(8, '4', '{\"sizes0\":{\"size\":\"190\\u00d725\\u00d74000\"}}'),
(9, '4', '2'),
(10, '4', '2'),
(11, '4', 'Брашинг / Мелкий брашированный вельвет'),
(7, '5', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/mini\\/cm-deking-vintage-double.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/cm-deking-vintage-double1.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0427\\u0435\\u0440\\u043d\\u043e\\u0435 \\u0414\\u0435\\u0440\\u0435\\u0432\\u043e\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0427\\u0435\\u0440\\u043d\\u043e\\u0435 \\u0414\\u0435\\u0440\\u0435\\u0432\\u043e\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/mini\\/cm-deking-vintage-dub-double.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/cm-deking-vintage-dub-double1.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/mini\\/cm-deking-vintage-eben-double.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/cm-deking-vintage-eben-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\"},\"imgcolors3\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/mini\\/cm-deking-vintage-venge-double.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/cm-deking-vintage-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '5', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/slider\\/mini\\/Vintage-2.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/slider\\/Vintage-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/slider\\/mini\\/Vintage-1.jpg\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/slider\\/Vintage-1.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '5', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf3\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf4\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf5\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(3, '5', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/VINTAGE\\/draft\\/Vintage.png\",\"big\":\"images\\/CM_DECKING\\/VINTAGE\\/draft\\/Vintage-big.png\"}}'),
(2, '5', '{\"points0\":{\"text\":\"\\u041e\\u0431\\u044a\\u0435\\u043c\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u0430 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b\"},\"points1\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u0432 \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points2\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '5', '{\"sizes0\":{\"size\":\"140\\u00d725\\u00d74000\"}}'),
(9, '5', '2'),
(10, '5', '1'),
(11, '5', 'Объемная текстура древесины'),
(7, '6', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/mini\\/cm-deking-mix-double.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/cm-deking-mix-double.jpg\",\"title\":\"\\u041c\\u0438\\u043a\\u0441\",\"alt\":\"\\u041c\\u0438\\u043a\\u0441\"}}'),
(6, '6', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/slider\\/mini\\/CM-Decking-MIX_1.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/slider\\/CM-Decking-MIX_1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/slider\\/mini\\/CM-Decking-MIX_2.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/slider\\/CM-Decking-MIX_2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/slider\\/mini\\/CM-Decking-MIX_3.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/slider\\/CM-Decking-MIX_3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/slider\\/mini\\/CM-Decking-MIX_4.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/slider\\/CM-Decking-MIX_4.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider4\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/slider\\/mini\\/CM-Decking-MIX_5.jpg\",\"big\":\"images\\/CM_DECKING\\/MIX\\/slider\\/CM-Decking-MIX_5.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '6', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf3\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf4\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf5\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(3, '6', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/MIX\\/draft\\/MIX.png\",\"big\":\"images\\/CM_DECKING\\/MIX\\/draft\\/MIX-big.png\"}}'),
(2, '6', '{\"points0\":{\"text\":\"\\u0423\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d \\u0441\\u043e\\u0447\\u0435\\u0442\\u0430\\u044e\\u0449\\u0438\\u0439 \\u0434\\u0432\\u0430 \\u0440\\u0430\\u0437\\u043d\\u044b\\u0445 \\u0446\\u0432\\u0435\\u0442\\u0430\"},\"points1\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u0432 \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points2\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '6', '{\"sizes0\":{\"size\":\"135\\u00d725\\u00d73000\"}}'),
(9, '6', '3'),
(10, '6', '2'),
(11, '6', 'Брашинг / Мелкий вельвет'),
(7, '7', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/mini\\/cm-deking-solid-dub-double.jpg\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/cm-deking-solid-dub-double.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/mini\\/cm-deking-solid-ryabina-double.jpg\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/cm-deking-solid-ryabina-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/mini\\/cm-deking-solid-venge-double.jpg\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/cm-deking-solid-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '7', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/slider\\/mini\\/1.jpg\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/slider\\/1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/slider\\/mini\\/2.jpg\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/slider\\/2.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '7', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf3\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf4\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(3, '7', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/SOLID\\/draft\\/SOLID.png\",\"big\":\"images\\/CM_DECKING\\/SOLID\\/draft\\/SOLID-big.png\"}}'),
(2, '7', '{\"points0\":{\"text\":\"\\u041a\\u043b\\u0430\\u0441\\u0441\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\"},\"points1\":{\"text\":\"\\u041f\\u043e\\u043b\\u043d\\u043e\\u0442\\u0435\\u043b\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c \\u0432\\u044b\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u0435\\u0442 \\u043d\\u0430\\u0433\\u0440\\u0443\\u0437\\u043a\\u0438 \\u0434\\u043e 2 \\u0442\\u043e\\u043d\\u043d \\u043d\\u0430 1 \\u043c2\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '7', '{\"sizes0\":{\"size\":\"140\\u00d722\\u00d73000\"}}'),
(9, '7', 'one'),
(10, '7', '2'),
(11, '7', 'Натуральная древесина / Мелкий вельвет'),
(7, '8', '{\"imgcolors0\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/mini\\/cm-deking-natur-dub-double.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/cm-deking-natur-dub-double.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/mini\\/cm-deking-natur-rjabina-double.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/cm-deking-natur-rjabina-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"imgcolors2\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/mini\\/cm-deking-natur-venge-double.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/cm-deking-natur-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '8', '{\"slider0\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/mini\\/Decking-NATUR-1.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/Decking-NATUR-1.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"slider1\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/mini\\/Decking-NATUR-2.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/Decking-NATUR-2.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"},\"slider2\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/mini\\/Decking-NATUR-3.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/Decking-NATUR-3.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"slider3\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/mini\\/Decking-NATUR-4.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/Decking-NATUR-4.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"},\"slider4\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/mini\\/Decking-NATUR-5.jpg\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/slider\\/Decking-NATUR-5.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"}}'),
(4, '8', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0422\\u0435\\u0445\\u043d\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438\",\"link\":\"images\\/CM_DECKING\\/PDF\\/tehnicheskie-harakteristiki-cm-decking.pdf\"},\"pdf2\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_DECKING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf3\":{\"title\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e \\u0443\\u0445\\u043e\\u0434\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/rekomendatsii-po-uhodu-cm-decking.pdf\"},\"pdf4\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/instrukcija-po-montazhu-cm-decking.pdf\"},\"pdf5\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_DECKING\\/PDF\\/montazh-cm-decking.pdf\"}}'),
(3, '8', '{\"drafts0\":{\"mini\":\"images\\/CM_DECKING\\/NATUR\\/draft\\/NATUR.png\",\"big\":\"images\\/CM_DECKING\\/NATUR\\/draft\\/NATUR-big.png\"}}'),
(2, '8', '{\"points0\":{\"text\":\"\\u041a\\u043b\\u0430\\u0441\\u0441\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\"},\"points1\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u0432 \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points2\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points3\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '8', '{\"sizes0\":{\"size\":\"135\\u00d725\\u00d73000\"}}'),
(9, '8', '3'),
(10, '8', '2'),
(11, '8', 'Натуральная древесина / Мелкий вельвет'),
(6, '9', '{\"slider0\":{\"mini\":\"images\\/CM_CARE\\/TERRACE\\/slider\\/mini\\/cm-care-terassy-double.jpg\",\"big\":\"images\\/CM_CARE\\/TERRACE\\/slider\\/cm-care-terassy-double.jpg\",\"title\":\"\\u0414\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\",\"alt\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\"}}'),
(4, '9', '{\"pdf0\":{\"title\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a CM Care\",\"link\":\"images\\/CM_CARE\\/PDF\\/cm_care_instruction.pdf\"}}'),
(2, '9', '{\"points0\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u043e\\u0435 \\u043f\\u0435\\u043d\\u043e\\u043e\\u0431\\u0440\\u0430\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0441\\u0438\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0447\\u0438\\u0441\\u0442\\u044f\\u0449\\u0438\\u0439 \\u044d\\u0444\\u0444\\u0435\\u043a\\u0442\"},\"points1\":{\"text\":\"\\u0411\\u0435\\u0437 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c \\u0443\\u0434\\u0430\\u043b\\u044f\\u0435\\u0442 \\u0441\\u0430\\u043c\\u044b\\u0435 \\u0441\\u0442\\u043e\\u0439\\u043a\\u0438\\u0435 \\u0437\\u0430\\u0433\\u0440\\u044f\\u0437\\u043d\\u0435\\u043d\\u0438\\u044f\"},\"points2\":{\"text\":\"\\u041b\\u0435\\u0433\\u043a\\u043e \\u0441\\u043c\\u044b\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u0432\\u043e\\u0434\\u043e\\u0439, \\u043d\\u0435 \\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442 \\u043f\\u044f\\u0442\\u0435\\u043d \\u0438 \\u0440\\u0430\\u0437\\u0432\\u043e\\u0434\\u043e\\u0432\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043d\\u043e\\u043c\\u0438\\u0447\\u043d\\u043e \\u0432 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u0438 \\u0438 \\u043e\\u0431\\u043b\\u0430\\u0434\\u0430\\u0435\\u0442 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u0430\\u0440\\u043e\\u043c\\u0430\\u0442\\u043e\\u043c\"},\"points4\":{\"text\":\"\\u041f\\u0440\\u0435\\u0434\\u043b\\u0430\\u0433\\u0430\\u0435\\u0442\\u0441\\u044f \\u0432 \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442\\u0430\\u0445 5\\u043b \\u0438 1\\u043b\"}}'),
(6, '10', '{\"slider0\":{\"mini\":\"images\\/CM_CARE\\/UNIVERSAL\\/slider\\/mini\\/cm-care-universal-double.jpg\",\"big\":\"images\\/CM_CARE\\/UNIVERSAL\\/slider\\/cm-care-universal-double.jpg\",\"title\":\"\\u0423\\u043d\\u0438\\u0432\\u0435\\u0440\\u0441\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435\",\"alt\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a\"}}'),
(4, '10', '{\"pdf0\":{\"title\":\"\\u0427\\u0438\\u0441\\u0442\\u044f\\u0449\\u0435\\u0435 \\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e \\u0434\\u043b\\u044f \\u0414\\u041f\\u041a CM Care\",\"link\":\"images\\/CM_CARE\\/PDF\\/cm_care_instruction.pdf\"}}'),
(2, '10', '{\"points0\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u043e\\u0435 \\u043f\\u0435\\u043d\\u043e\\u043e\\u0431\\u0440\\u0430\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0441\\u0438\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0447\\u0438\\u0441\\u0442\\u044f\\u0449\\u0438\\u0439 \\u044d\\u0444\\u0444\\u0435\\u043a\\u0442\"},\"points1\":{\"text\":\"\\u0411\\u0435\\u0437 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c \\u0443\\u0434\\u0430\\u043b\\u044f\\u0435\\u0442 \\u0441\\u0430\\u043c\\u044b\\u0435 \\u0441\\u0442\\u043e\\u0439\\u043a\\u0438\\u0435 \\u0437\\u0430\\u0433\\u0440\\u044f\\u0437\\u043d\\u0435\\u043d\\u0438\\u044f\"},\"points2\":{\"text\":\"\\u041b\\u0435\\u0433\\u043a\\u043e \\u0441\\u043c\\u044b\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u0432\\u043e\\u0434\\u043e\\u0439\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043d\\u043e\\u043c\\u0438\\u0447\\u043d\\u043e \\u0432 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u0438\"},\"points4\":{\"text\":\"\\u041e\\u0431\\u043b\\u0430\\u0434\\u0430\\u0435\\u0442 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u0430\\u0440\\u043e\\u043c\\u0430\\u0442\\u043e\\u043c\"},\"points5\":{\"text\":\"\\u041f\\u0440\\u0435\\u0434\\u043b\\u0430\\u0433\\u0430\\u0435\\u0442\\u0441\\u044f \\u0432 \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442\\u0430\\u0445 5\\u043b \\u0438 1\\u043b\"}}'),
(7, '11', '{\"imgcolors0\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_black.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_black.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0447\\u0451\\u0440\\u043d\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0447\\u0451\\u0440\\u043d\\u044b\\u0439\"},\"imgcolors1\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_brow.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_brow.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439\"},\"imgcolors2\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_dark-grey.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_dark grey.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0442\\u0435\\u043c\\u043d\\u043e-\\u0441\\u0435\\u0440\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0442\\u0435\\u043c\\u043d\\u043e-\\u0441\\u0435\\u0440\\u044b\\u0439\"},\"imgcolors3\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_gold.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_gold.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0437\\u043e\\u043b\\u043e\\u0442\\u043e\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0437\\u043e\\u043b\\u043e\\u0442\\u043e\\u0439\"},\"imgcolors4\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_light-gray.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_gold.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0441\\u0432\\u0435\\u0442\\u043b\\u043e-\\u0441\\u0435\\u0440\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0441\\u0432\\u0435\\u0442\\u043b\\u043e-\\u0441\\u0435\\u0440\\u044b\\u0439\"},\"imgcolors5\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_light_brown.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_light_brown.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0441\\u0432\\u0435\\u0442\\u043b\\u043e-\\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0441\\u0432\\u0435\\u0442\\u043b\\u043e-\\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439\"},\"imgcolors6\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_red.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_red.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439\"},\"imgcolors7\":{\"mini\":\"images\\/CM_BORD\\/mini\\/CM_Bord_white.jpg\",\"big\":\"images\\/CM_BORD\\/CM_Bord_white.jpg\",\"title\":\"\\u0446\\u0432\\u0435\\u0442 \\u0431\\u0435\\u043b\\u044b\\u0439\",\"alt\":\"\\u0446\\u0432\\u0435\\u0442 \\u0431\\u0435\\u043b\\u044b\\u0439\"}}'),
(6, '11', '{\"slider0\":{\"mini\":\"images\\/CM_BORD\\/slider\\/mini\\/CM-Bord.jpg\",\"big\":\"images\\/CM_BORD\\/slider\\/CM-Bord.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(2, '11', '{\"points0\":{\"text\":\"\\u0411\\u044b\\u0441\\u0442\\u0440\\u044b\\u0439 \\u0438 \\u043b\\u0435\\u0433\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\"},\"points1\":{\"text\":\"\\u041d\\u0435\\u0433\\u043e\\u0440\\u044e\\u0447\\u0438\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points2\":{\"text\":\"\\u041e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0432\\u044b\\u0441\\u043e\\u043b\\u043e\\u0432 \\u043d\\u0430 \\u043f\\u043e\\u0432\\u0435\\u0440\\u0445\\u043d\\u043e\\u0441\\u0442\\u0438\"},\"points3\":{\"text\":\"\\u0414\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u0438 \\u044d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '11', '{\"sizes0\":{\"size\":\"190\\u00d76\\u00d73600\"}}'),
(9, '11', '6'),
(10, '11', '1'),
(11, '11', 'Натуральная древесина'),
(7, '12', '{\"imgcolors0\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/rectangular.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/rectangular.jpg\",\"title\":\"\",\"alt\":\"rectangular\"},\"imgcolors1\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/star-1.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/star-1.jpg\",\"title\":\"\",\"alt\":\"star 1\"},\"imgcolors2\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/star-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/star-2.jpg\",\"title\":\"\",\"alt\":\"star 2\"},\"imgcolors3\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/star-3.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/star-3.jpg\",\"title\":\"\",\"alt\":\"star 3\"},\"imgcolors4\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/triangular.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/triangular.jpg\",\"title\":\"\",\"alt\":\"triangular\"},\"imgcolors5\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/mini\\/two-tiered.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/variant\\/two-tiered.jpg\",\"title\":\"\",\"alt\":\"two tiered\"}}'),
(6, '12', '{\"slider0\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/mini\\/cm-garden-parket-photo-3.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/cm-garden-parket-photo-3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/mini\\/cm-garden-parket-photo-1.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/cm-garden-parket-photo-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/mini\\/cm-garden-parket-photo-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/FLOWERBED\\/slider\\/cm-garden-parket-photo-3.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '12', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"}}'),
(2, '12', '{\"points0\":{\"text\":\"\\u0411\\u044b\\u0441\\u0442\\u0440\\u0430\\u044f \\u0441\\u0431\\u043e\\u0440\\u043a\\u0430\"},\"points1\":{\"text\":\"\\u041d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u044e\\u0442 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0445\\u043e\\u0434\\u0430\"},\"points2\":{\"text\":\"\\u0421\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430 \\u0444\\u0438\\u043a\\u0441\\u0430\\u0446\\u0438\\u0438 \\u043f\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0435\\u0442 \\u0441\\u043e\\u0437\\u0434\\u0430\\u0432\\u0430\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u043c\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043b\\u044e\\u0431\\u043e\\u0439 \\u0444\\u043e\\u0440\\u043c\\u044b\"},\"points3\":{\"text\":\"\\u0420\\u0430\\u0437\\u043d\\u044b\\u0435 \\u0446\\u0432\\u0435\\u0442\\u0430 \\u0438 \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u044b \\u043d\\u0430 \\u043b\\u044e\\u0431\\u043e\\u0439 \\u0432\\u043a\\u0443\\u0441\"}}'),
(8, '12', '{\"sizes0\":{\"size\":\"600\\u00d7600\"},\"sizes1\":{\"size\":\"900\\u00d7900\"}}'),
(9, '12', 'one'),
(10, '12', '1'),
(11, '12', 'Шлифовка'),
(7, '13', '{\"imgcolors0\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/mini\\/cm-garden-ogradka-dub.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/cm-garden-ogradka-dub.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/mini\\/cm-garden-ogradka-ryabina.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/cm-garden-ogradka-ryabina.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"imgcolors2\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/mini\\/cm-garden-ogradka-venge.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/cm-garden-ogradka-venge.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '13', '{\"slider0\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/mini\\/cm-garden-garden-parquet-1.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/cm-garden-garden-parquet-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/mini\\/cm-garden-garden-parquet-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/cm-garden-garden-parquet-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/mini\\/cm-garden-garden-parquet-3.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_PARQUET\\/slider\\/cm-garden-garden-parquet-3.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '13', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"}}'),
(2, '13', '{\"points0\":{\"text\":\"3 \\u0448\\u0442\\u0443\\u043a\\u0438 \\u0432 \\u043d\\u0430\\u0431\\u043e\\u0440\\u0435!\"},\"points1\":{\"text\":\"\\u0423\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u044b \\u043a \\u043f\\u0435\\u0440\\u0435\\u043f\\u0430\\u0434\\u0430\\u043c \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440\\u044b \\u0438 \\u0432\\u043b\\u0430\\u0436\\u043d\\u043e\\u0441\\u0442\\u0438\"},\"points2\":{\"text\":\"\\u0423\\u043d\\u0438\\u0432\\u0435\\u0440\\u0441\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0440\\u0430\\u043c\\u043b\\u0435\\u043d\\u0438\\u044f \\u0433\\u0430\\u0437\\u043e\\u043d\\u043e\\u0432 \\u0438\\u043b\\u0438 \\u0434\\u043e\\u0440\\u043e\\u0436\\u0435\\u043a\"},\"points3\":{\"text\":\"\\u041f\\u0440\\u043e\\u0441\\u0442\\u0430\\u044f \\u0443\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0430\"}}'),
(8, '13', '{\"sizes0\":{\"size\":\"12x500x600\"}}'),
(9, '13', '3'),
(10, '13', '2'),
(11, '13', 'Шлифовка / Мелкий вельвет'),
(7, '14', '{\"imgcolors0\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/mini\\/cm-garden-parket-dub-double.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/cm-garden-parket-dub-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/mini\\/cm-garden-parket-ryabina-double.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/cm-garden-parket-ryabina-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"imgcolors2\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/mini\\/cm-garden-parket-venge-double.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/cm-garden-parket-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '14', '{\"slider0\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/slider\\/mini\\/cm-garden-parket-photo3.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/slider\\/cm-garden-parket-photo3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/slider\\/mini\\/cm-garden-parket-photo1.jpg\",\"big\":\"images\\/CM_GARDEN\\/GARDEN_FENCES\\/slider\\/cm-garden-parket-photo1.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '14', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"}}');
INSERT INTO `hud_fields_values` (`field_id`, `item_id`, `value`) VALUES
(2, '14', '{\"points0\":{\"text\":\"\\u0423\\u0434\\u043e\\u0431\\u043d\\u044b\\u0439 \\u0438 \\u043b\\u0435\\u0433\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\"},\"points1\":{\"text\":\"\\u041f\\u0440\\u043e\\u0441\\u0442 \\u0432 \\u0443\\u0445\\u043e\\u0434\\u0435\"},\"points2\":{\"text\":\"\\u0423\\u043d\\u0438\\u0432\\u0435\\u0440\\u0441\\u0430\\u043b\\u0435\\u043d: \\u043f\\u043e\\u0434\\u0445\\u043e\\u0434\\u0438\\u0442 \\u0434\\u043b\\u044f \\u0443\\u043a\\u043b\\u0430\\u0434\\u043a\\u0438 \\u043d\\u0430 \\u0443\\u043b\\u0438\\u0446\\u0435, \\u043d\\u0430 \\u0431\\u0430\\u043b\\u043a\\u043e\\u043d\\u0435, \\u0432\\u043e\\u043a\\u0440\\u0443\\u0433 \\u0431\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d\\u043e\\u0432 \\u0438\\u043b\\u0438 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u043d\\u0430\\u0441\\u0442\\u0438\\u043b\\u0430\"},\"points3\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043e\\u0437\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u044e \\u0432\\u043e\\u0434\\u044b \\u0438 \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438\"}}'),
(8, '14', '{\"sizes0\":{\"size\":\"300\\u00d7300\\u00d725\"}}'),
(9, '14', '11'),
(10, '14', '1'),
(11, '14', 'Мелкий вельвет / Текстура древесины'),
(7, '15', '{\"imgcolors0\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/mini\\/cm-garden-skameyka-dub-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/cm-garden-skameyka-venge-2.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/mini\\/cm-garden-skameyka-ryabina-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/cm-garden-skameyka-dub-2.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0420\\u044f\\u0431\\u0438\\u043d\\u0430\"},\"imgcolors2\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/mini\\/cm-garden-skameyka-venge-2.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/cm-garden-skameyka-venge-2.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"}}'),
(6, '15', '{\"slider0\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/mini\\/cm-garden-skameyka-photo1.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/cm-garden-skameyka-photo1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/mini\\/cm-garden-skameyka-photo2.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/cm-garden-skameyka-photo2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/mini\\/cm-garden-skameyka-photo4.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/cm-garden-skameyka-photo4.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/mini\\/cm-garden-skameyka-photo5.jpg\",\"big\":\"images\\/CM_GARDEN\\/BENCH\\/slider\\/cm-garden-skameyka-photo5.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '15', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_GARDEN\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"}}'),
(2, '15', '{\"points0\":{\"text\":\"\\u041f\\u0440\\u043e\\u0441\\u0442\\u044b \\u0438 \\u0443\\u0434\\u043e\\u0431\\u043d\\u044b \\u0432 \\u0443\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0435\"},\"points1\":{\"text\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u0435\\u0434\\u0435\\u043d\\u044b \\u0438\\u0437 \\u043d\\u0430\\u0434\\u0435\\u0436\\u043d\\u043e\\u0433\\u043e \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u0430\"},\"points2\":{\"text\":\"\\u041d\\u0435 \\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u044e\\u0442 \\u0437\\u0430\\u043d\\u043e\\u0437\"},\"points3\":{\"text\":\"\\u041d\\u0435 \\u0431\\u043e\\u044f\\u0442\\u0441\\u044f \\u043f\\u0435\\u0440\\u0435\\u043f\\u0430\\u0434\\u043e\\u0432 \\u0442\\u0435\\u043c\\u043f\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440\\u044b \\u0438 \\u043f\\u043e\\u0433\\u043e\\u0434\\u044b\"},\"points4\":{\"text\":\"\\u0418\\u0434\\u0435\\u0430\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e\\u0434\\u0445\\u043e\\u0434\\u044f\\u0442 \\u0434\\u043b\\u044f \\u043d\\u0430\\u0440\\u0443\\u0436\\u043d\\u043e\\u0433\\u043e \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\"}}'),
(8, '15', '{\"sizes0\":{\"size\":\"600\\u00d7460\\u00d71500\"}}'),
(9, '15', 'one'),
(11, '15', 'Шлифовка'),
(7, '16', '{\"imgcolors0\":{\"mini\":\"images\\/CM_CLADDING\\/mini\\/cm-cladding-dub-double.jpg\",\"big\":\"images\\/CM_CLADDING\\/cm-cladding-dub-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0414\\u0443\\u0431\"},\"imgcolors1\":{\"mini\":\"images\\/CM_CLADDING\\/mini\\/cm-cladding-venge-double.jpg\",\"big\":\"images\\/CM_CLADDING\\/cm-cladding-venge-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u0412\\u0435\\u043d\\u0433\\u0435\"},\"imgcolors2\":{\"mini\":\"images\\/CM_CLADDING\\/mini\\/cm-cladding-eben-double.jpg\",\"big\":\"images\\/CM_CLADDING\\/cm-cladding-eben-double.jpg\",\"title\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\",\"alt\":\"\\u0426\\u0432\\u0435\\u0442 \\u042d\\u0431\\u0435\\u043d\"}}'),
(6, '16', '{\"slider0\":{\"mini\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_1.jpg\",\"big\":\"images\\/CM_CLADDING\\/slider\\/CM-Cladding_1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_2.jpg\",\"big\":\"images\\/CM_CLADDING\\/slider\\/CM-Cladding_2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_3.jpg\",\"big\":\"images\\/CM_CLADDING\\/slider\\/CM-Cladding_3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_CLADDING\\/slider\\/mini\\/CM-Cladding_4.jpg\",\"big\":\"images\\/CM_CLADDING\\/slider\\/CM-Cladding_4.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '16', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_CLADDING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_CLADDING\\/PDF\\/cm-cladding-instrukcija-po-montazhu-fasadnoj-oblicovki.pdf\"},\"pdf2\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_CLADDING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf3\":{\"title\":\"\\u041a\\u0440\\u0430\\u0442\\u043a\\u0430\\u044f \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_CLADDING\\/PDF\\/cm-cladding_montazh.pdf\"}}'),
(3, '16', '{\"drafts0\":{\"mini\":\"images\\/CM_CLADDING\\/draft\\/cm-cladding.png\",\"big\":\"images\\/CM_CLADDING\\/draft\\/cm-cladding-big.png\"}}'),
(2, '16', '{\"points0\":{\"text\":\"\\u0411\\u044b\\u0441\\u0442\\u0440\\u044b\\u0439 \\u0438 \\u043b\\u0435\\u0433\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\"},\"points1\":{\"text\":\"\\u0423\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0430 \\u043f\\u043e \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0435 \\u0441\\u043a\\u0440\\u044b\\u0442\\u043e\\u0433\\u043e \\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f\"},\"points2\":{\"text\":\"\\u041e\\u043f\\u0442\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432\\u044b\\u0435 \\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f \\u0434\\u043b\\u044f \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u0438\\u044f \\u0443\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0444\\u0430\\u0441\\u0430\\u0434\\u0430\"},\"points3\":{\"text\":\"\\u0414\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u0438 \\u044d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '16', '{\"sizes0\":{\"size\":\"152\\u00d712\\u00d73000\"}}'),
(9, '16', '3'),
(10, '16', '1'),
(11, '16', 'Натуральная древесина'),
(7, '17', '{\"imgcolors0\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/1.jpg\",\"big\":\"images\\/CM_RAILING\\/1.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors1\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/2.jpg\",\"big\":\"images\\/CM_RAILING\\/2.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors2\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/3.jpg\",\"big\":\"images\\/CM_RAILING\\/3.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors3\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/4.jpg\",\"big\":\"images\\/CM_RAILING\\/4.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors4\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/5.jpg\",\"big\":\"images\\/CM_RAILING\\/5.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors5\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/6.jpg\",\"big\":\"images\\/CM_RAILING\\/6.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors6\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/7.jpg\",\"big\":\"images\\/CM_RAILING\\/7.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors7\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/8.jpg\",\"big\":\"images\\/CM_RAILING\\/8.jpg\",\"title\":\"\",\"alt\":\"\"},\"imgcolors8\":{\"mini\":\"images\\/CM_RAILING\\/mini\\/9.jpg\",\"big\":\"images\\/CM_RAILING\\/9.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '17', '{\"slider0\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-3.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-5.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-5.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-2.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-1.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider4\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-4.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-4.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider5\":{\"mini\":\"images\\/CM_RAILING\\/slider\\/mini\\/cmrailing-6.jpg\",\"big\":\"images\\/CM_RAILING\\/slider\\/cmrailing-6.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '17', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_RAILING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_RAILING\\/PDF\\/railling-installation.pdf\"},\"pdf2\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_RAILING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"},\"pdf3\":{\"title\":\"\\u0421\\u0445\\u0435\\u043c\\u044b \\u0441\\u0431\\u043e\\u0440\\u043a\\u0438\",\"link\":\"images\\/CM_RAILING\\/PDF\\/varianty-sborki.pdf\"}}'),
(2, '17', '{\"points0\":{\"text\":\"\\u041c\\u043d\\u043e\\u0436\\u0435\\u0441\\u0442\\u0432\\u043e \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442\\u043e\\u0432 \\u0441\\u0431\\u043e\\u0440\\u043a\\u0438\"},\"points1\":{\"text\":\"\\u0421\\u043e\\u043b\\u0438\\u0434\\u043d\\u044b\\u0439 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439 \\u0432\\u0438\\u0434 \\u0438 \\u0432\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u043f\\u0440\\u043e\\u0447\\u043d\\u043e\\u0441\\u0442\\u044c\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u041d\\u0430\\u0434\\u0435\\u0436\\u043d\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '17', '{\"sizes0\":{\"size\":\"\\u0421\\u0435\\u043a\\u0446\\u0438\\u044f \\u0434\\u043e 3240\"}}'),
(9, '17', 'all'),
(11, '17', 'Шлифовка'),
(7, '18', '{\"imgcolors0\":{\"mini\":\"images\\/CM_FENCING\\/mini\\/cm-fencing-venge.jpg\",\"big\":\"images\\/CM_FENCING\\/cm-fencing-venge.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '18', '{\"slider0\":{\"mini\":\"images\\/CM_FENCING\\/slider\\/mini\\/cmfencing3.jpg\",\"big\":\"images\\/CM_FENCING\\/slider\\/cmfencing3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_FENCING\\/slider\\/mini\\/cmfencing1.jpg\",\"big\":\"images\\/CM_FENCING\\/slider\\/cmfencing1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_FENCING\\/slider\\/mini\\/cmfencing2.jpg\",\"big\":\"images\\/CM_FENCING\\/slider\\/cmfencing2.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(4, '18', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_FENCING\\/PDF\\/garantijnyj-sertifikat.pdf\"},\"pdf1\":{\"title\":\"\\u041f\\u043e\\u0436\\u0430\\u0440\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_FENCING\\/PDF\\/sertifikat-pozharnoj-bezopasnosti.pdf\"}}'),
(3, '18', '{\"drafts0\":{\"mini\":\"images\\/CM_FENCING\\/draft\\/cm-fencing.png\",\"big\":\"images\\/CM_FENCING\\/draft\\/cm-fencing-big.png\"}}'),
(2, '18', '{\"points0\":{\"text\":\"\\u0412\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439 \\u0432\\u0438\\u0434 \\u043d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u0438\\u043d\\u044b\"},\"points1\":{\"text\":\"\\u0421\\u0442\\u0438\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\"},\"points2\":{\"text\":\"\\u041f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0439 \\u0438 \\u0443\\u0434\\u043e\\u0431\\u043d\\u044b\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\"},\"points3\":{\"text\":\"\\u041c\\u0438\\u043d\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0445\\u043e\\u0434\"},\"points4\":{\"text\":\"\\u041e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0433\\u043d\\u0438\\u0435\\u043d\\u0438\\u044f, \\u0441\\u043a\\u043e\\u043b\\u043e\\u0432, \\u0442\\u0440\\u0435\\u0449\\u0438\\u043d \\u0438 \\u0432\\u044b\\u0446\\u0432\\u0435\\u0442\\u0430\\u043d\\u0438\\u044f\"},\"points5\":{\"text\":\"10 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"}}'),
(8, '18', '{\"sizes0\":{\"size\":\"150\\u00d720\\u00d72800\"}}'),
(9, '18', 'one'),
(10, '18', '2'),
(11, '18', 'Широкий вельвет / Брашинг'),
(7, '19', '{\"imgcolors0\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral9002.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral9002.jpg\",\"title\":\"\\u0411\\u0435\\u043b\\u044b\\u0439 (RAL9002)\",\"alt\":\"RAL9002\"},\"imgcolors1\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral8017.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral8017.jpg\",\"title\":\"\\u041a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439 (RAL8017)\",\"alt\":\"RAL8017\"},\"imgcolors2\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral8019.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral8019.jpg\",\"title\":\"\\u0422\\u0451\\u043c\\u043d\\u043e-\\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439 (RAL8019)\",\"alt\":\"RAL8019\"},\"imgcolors3\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral8004.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral8004.jpg\",\"title\":\"\\u041a\\u0438\\u0440\\u043f\\u0438\\u0447\\u043d\\u044b\\u0439 (RAL8004)\",\"alt\":\"RAL8004\"},\"imgcolors4\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral3009.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral3009.jpg\",\"title\":\"\\u0422\\u0451\\u043c\\u043d\\u043e-\\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0439 (RAL3009)\",\"alt\":\"RAL3009\"},\"imgcolors5\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral9006.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral9006.jpg\",\"title\":\"\\u0421\\u0435\\u0440\\u0435\\u0431\\u0440\\u0438\\u0441\\u0442\\u044b\\u0439 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u043a (RAL9006)\",\"alt\":\"RAL9006\"},\"imgcolors6\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral9007.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral9007.jpg\",\"title\":\"\\u0413\\u0440\\u0430\\u0444\\u0438\\u0442\\u043e\\u0432\\u044b\\u0439 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u043a (RAL9007)\",\"alt\":\"RAL9007\"},\"imgcolors7\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral7011.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral7011.jpg\",\"title\":\"\\u0422\\u0451\\u043c\\u043d\\u043e-\\u0441\\u0435\\u0440\\u044b\\u0439 (RAL7011)\",\"alt\":\"RAL7011\"},\"imgcolors8\":{\"mini\":\"images\\/CM_VATTERN\\/color\\/mini\\/ral9005.jpg\",\"big\":\"images\\/CM_VATTERN\\/color\\/ral9005.jpg\",\"title\":\"\\u0427\\u0451\\u0440\\u043d\\u044b\\u0439 (RAL9005)\",\"alt\":\"ral9005\"}}'),
(6, '19', '{\"slider0\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/1_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/1_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/2_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/2_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/3_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/3_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/4_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/4_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"},\"slider4\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/5_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/5_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"},\"slider5\":{\"mini\":\"images\\/CM_VATTERN\\/slider\\/mini\\/6_CM_VATTERN.jpg\",\"big\":\"images\\/CM_VATTERN\\/slider\\/6_CM_VATTERN.jpg\",\"title\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430\",\"alt\":\"\"}}'),
(4, '19', '{\"pdf0\":{\"title\":\"\\u0413\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439\\u043d\\u044b\\u0439 \\u0441\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\",\"link\":\"images\\/CM_VATTERN\\/PDF\\/garantijnyj-sertifikat-cm-vattern.pdf\"},\"pdf1\":{\"title\":\"\\u0418\\u043d\\u0441\\u0442\\u0440\\u0443\\u043a\\u0446\\u0438\\u044f \\u043f\\u043e \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0443\",\"link\":\"images\\/CM_VATTERN\\/PDF\\/CM_Vattern_Instruction_(2019).pdf\"},\"pdf2\":{\"title\":\"\\u041e\\u0442\\u043a\\u0430\\u0437\\u043d\\u043e\\u0435 \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\",\"link\":\"images\\/CM_VATTERN\\/PDF\\/otkaznoe-po-pozharke.pdf\"},\"pdf3\":{\"title\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 CM Vattern\",\"link\":\"images\\/CM_VATTERN\\/PDF\\/CM_Vattern_Product_Catalogue_(2019).pdf\"},\"pdf4\":{\"title\":\"\\u0421\\u0445\\u0435\\u043c\\u0430 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 CM Vattern\",\"link\":\"images\\/CM_VATTERN\\/PDF\\/cm-vattern_scheme.pdf\"}}'),
(2, '19', '{\"points0\":{\"text\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u043e \\u2014 \\u0428\\u0432\\u0435\\u0446\\u0438\\u044f\"},\"points1\":{\"text\":\"25 \\u043b\\u0435\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0438\"},\"points2\":{\"text\":\"\\u0411\\u043e\\u0433\\u0430\\u0442\\u0430\\u044f \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432\\u0430\\u044f \\u043f\\u0430\\u043b\\u0438\\u0442\\u0440\\u0430\"},\"points3\":{\"text\":\"\\u0414\\u0432\\u0443\\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u043d\\u0435\\u0435 \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u0435 HBP\"},\"points4\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u043f\\u0440\\u043e\\u0447\\u043d\\u043e\\u0441\\u0442\\u044c, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u0441\\u0442\\u0430\\u043b\\u0438 SSAB\"},\"points5\":{\"text\":\"\\u0418\\u0441\\u043a\\u043b\\u044e\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0442\\u043e\\u0447\\u043d\\u043e\\u0441\\u0442\\u044c \\u0441\\u0442\\u044b\\u043a\\u043e\\u0432\\u043a\\u0438 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432\"},\"points6\":{\"text\":\"\\u041f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0442\\u0430 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0430\"},\"points7\":{\"text\":\"\\u0421\\u043e\\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0435\\u0432\\u0440\\u043e\\u043f\\u0435\\u0439\\u0441\\u043a\\u0438\\u043c \\u0441\\u0442\\u0430\\u043d\\u0434\\u0430\\u0440\\u0442\\u0430\\u043c EN 612 \\u0438 EN 1462\"},\"points8\":{\"text\":\"\\u041d\\u0430\\u0441\\u0442\\u043e\\u044f\\u0449\\u0435\\u0435 \\u0441\\u043a\\u0430\\u043d\\u0434\\u0438\\u043d\\u0430\\u0432\\u0441\\u043a\\u043e\\u0435 \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e \\u043f\\u043e \\u0440\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0438\\u043c \\u0446\\u0435\\u043d\\u0430\\u043c\"}}'),
(7, '20', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/mini\\/palubnaya_doska.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/palubnaya_doska.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '20', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_1.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_2.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_3.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_4.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_4.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider4\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_5.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_5.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider5\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_6.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_6.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider6\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_8.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_8.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider7\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_9.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_9.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider8\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/mini\\/palubnaya_doska_10.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/slider\\/palubnaya_doska_10.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(3, '20', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/draft\\/wood-natur-palubnaya-doska.png\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/palubnaya_doska\\/draft\\/wood-natur-palubnaya-doska-big.png\"}}'),
(2, '20', '{\"points0\":{\"text\":\"\\u0414\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438 \\u043f\\u043e\\u0433\\u043e\\u0434\\u043d\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c\"},\"points1\":{\"text\":\"\\u0427\\u0438\\u0441\\u0442\\u044b\\u0439 \\u043f\\u0440\\u0438\\u0440\\u043e\\u0434\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points2\":{\"text\":\"\\u0411\\u043e\\u0433\\u0430\\u0442\\u0441\\u0442\\u0432\\u043e \\u043e\\u0442\\u0442\\u0435\\u043d\\u043a\\u043e\\u0432\"},\"points3\":{\"text\":\"\\u041d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0438\\u0431\\u0438\\u0440\\u0441\\u043a\\u0430\\u044f \\u043b\\u0438\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0438\\u0446\\u0430\"},\"points4\":{\"text\":\"\\u0414\\u043b\\u044f \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u043d\\u0435\\u0433\\u043e \\u0438 \\u043d\\u0430\\u0440\\u0443\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f\"}}'),
(8, '20', '{\"sizes0\":{\"size\":\"28\\u00d7120\\u00d72000\\/3000\"}}'),
(9, '20', '4'),
(7, '21', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/mini\\/terrasnaya_doska.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/terrasnaya_doska.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '21', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/terrasnaya_doska.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/terrasnaya_doska.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/mini\\/terrasnaya_doska-1.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/terrasnaya_doska-1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/mini\\/terrasnaya_doska-2.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/terrasnaya_doska-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/mini\\/terrasnaya_doska-3.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/slider\\/terrasnaya_doska-3.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(3, '21', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/draft\\/wood-natur-terrasnaya-doska-ab.png\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/draft\\/wood-natur-terrasnaya-doska-ab-big.png\"},\"drafts1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/draft\\/wood-natur-terrasnaya-doska-prima.png\",\"big\":\"images\\/CM_WOOD_NATUR\\/TERRACE_BOARD\\/terrasnaya_prima_doska\\/draft\\/wood-natur-terrasnaya-doska-prima-big.png\"}}'),
(8, '21', '{\"sizes0\":{\"size\":\"27\\u00d7142\\u00d72000\\/3000\\/4000\"},\"sizes1\":{\"size\":\"28\\u00d7142\\u00d72000\\/3000\\/4000\"}}'),
(9, '21', '4'),
(7, '22', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/mini\\/planken.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/planken.jpg\",\"title\":\"\\u041f\\u043b\\u0430\\u043d\\u043a\\u0435\\u043d\",\"alt\":\"\\u041f\\u043b\\u0430\\u043d\\u043a\\u0435\\u043d\"}}'),
(6, '22', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/mini\\/fasad_oblicovka_2.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/fasad_oblicovka_2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/mini\\/fasad_oblicovka_1.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/fasad_oblicovka_1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/mini\\/fasad_oblicovka_3.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/slider\\/fasad_oblicovka_3.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(3, '22', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/draft\\/planken-140-20.png\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/draft\\/planken-140-20-big.png\"},\"drafts1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/draft\\/planken-90-20.png\",\"big\":\"images\\/CM_WOOD_NATUR\\/FACADE_FACING\\/draft\\/planken-90-20-big.png\"}}'),
(8, '22', '{\"sizes0\":{\"size\":\"20\\u00d7140\\u00d72000\\/3000\\/4000\"},\"sizes1\":{\"size\":\"20\\u00d790\\u00d72000\\/3000\\/4000\"}}'),
(9, '22', '5'),
(7, '23', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil_brashirovannyy\\/mini\\/shtil_brashirovannyy.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil_brashirovannyy\\/shtil_brashirovannyy.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(9, '23', 'all'),
(7, '24', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil\\/mini\\/shtil.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/shtil\\/shtil.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(9, '24', 'all'),
(7, '25', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/mini\\/parketnaja_doska.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/parketnaja_doska.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '25', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/mini\\/parketnaja_doska_1.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/parketnaja_doska_1.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/mini\\/parketnaja_doska_2.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/parketnaja_doska_2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider2\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/mini\\/parketnaja_doska_3.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/parketnaja_doska_3.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider3\":{\"mini\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/mini\\/parketnaja_doska_4.jpg\",\"big\":\"images\\/CM_WOOD_NATUR\\/INTERIOR_MATERIALS\\/parketnaja_doska\\/slider\\/parketnaja_doska_4.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(2, '25', '{\"points0\":{\"text\":\"\\u0411\\u043b\\u0430\\u0433\\u043e\\u0434\\u0430\\u0440\\u044f \\u043f\\u0440\\u0438\\u0440\\u043e\\u0434\\u043d\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0447\\u043d\\u043e\\u0441\\u0442\\u0438 \\u043f\\u043e\\u043b\\u044b \\u0438\\u0437 \\u043b\\u0438\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0438\\u0446\\u044b \\u043f\\u0440\\u043e\\u0441\\u043b\\u0443\\u0436\\u0430\\u0442 \\u0434\\u043e\\u043b\\u0433\\u043e \\u0438 \\u0431\\u0443\\u0434\\u0443\\u0442 \\u0440\\u0430\\u0434\\u043e\\u0432\\u0430\\u0442\\u044c \\u0441\\u0432\\u043e\\u0438\\u043c \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u043c \\u0432\\u0438\\u0434\\u043e\\u043c.\"}}'),
(8, '25', '{\"sizes0\":{\"size\":\"670\\/940\\u00d7134\\u00d719\"},\"sizes1\":{\"size\":\"940\\/2010\\u00d7134\\u00d719\"}}'),
(9, '25', '5'),
(7, '26', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/mini\\/cmld.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/cmld.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '26', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/slider\\/mini\\/cmld2-pf2-2.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/slider\\/cmld2-pf2-2.jpg\",\"title\":\"\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/slider\\/mini\\/cmld2-pf2-1.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/slider\\/cmld2-pf2-1.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(3, '26', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/draft\\/cmld2-pf2-2.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMLD2_PF2\\/draft\\/cmld2-pf2-2-big.png\"}}'),
(2, '26', '{\"points0\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points1\":{\"text\":\"\\u041e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441\\u043c\\u043e\\u043b\\u044b\"},\"points2\":{\"text\":\"\\u0418\\u0434\\u0435\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u044b\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"\\u0421\\u0442\\u0430\\u0431\\u0438\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u043e\\u0432\"}}'),
(8, '26', '{\"sizes0\":{\"size\":\"117\\u00d726\\u00d72400\\/3000;\"},\"sizes1\":{\"size\":\" 92\\u00d726\\u00d73000\"}}'),
(9, '26', 'one'),
(7, '27', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/mini\\/CMSHP.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/CMSHP.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '27', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/slider\\/mini\\/CMSHP-photo-1.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/slider\\/CMSHP-photo-1.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(3, '27', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/draft\\/cmshp.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/TERRACE_BOARD\\/CMSHP\\/draft\\/cmshp-big.png\"}}'),
(2, '27', '{\"points0\":{\"text\":\"\\u041d\\u0430\\u0434\\u0435\\u0436\\u043d\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points1\":{\"text\":\"\\u0418\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u043e \\u0431\\u0435\\u0437 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0445\\u0438\\u043c\\u0438\\u043a\\u0430\\u0442\\u043e\\u0432\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u0421\\u0442\\u0430\\u0431\\u0438\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u043e\\u0432\"},\"points4\":{\"text\":\"\\u041f\\u0440\\u0438\\u0432\\u043b\\u0435\\u043a\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439 \\u0432\\u0438\\u0434\"}}'),
(8, '27', '{\"sizes0\":{\"size\":\"92\\u00d726\\u00d72100\\/3000\"}}'),
(9, '27', 'one'),
(7, '28', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/mini\\/CMSHP.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/CMSHP.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '28', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/slider\\/mini\\/Casa-em.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/slider\\/Casa-em.jpg\",\"title\":\"\\u041f\\u043b\\u0430\\u043d\\u043a\\u0435\\u043d CM Wood Thermo\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/slider\\/mini\\/Exterior-cladding-and-balcony.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/slider\\/Exterior-cladding-and-balcony.jpg\",\"title\":\"\\u041f\\u043b\\u0430\\u043d\\u043a\\u0435\\u043d CM Wood Thermo\",\"alt\":\"\"}}'),
(3, '28', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/draft\\/cmshp-1.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/draft\\/cmshp-1-big.png\"},\"drafts1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/draft\\/cmshp-2.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMSHP\\/draft\\/cmshp-2-big.png\"}}'),
(2, '28', '{\"points0\":{\"text\":\"\\u041d\\u0430\\u0434\\u0435\\u0436\\u043d\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points1\":{\"text\":\"\\u0418\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u043e \\u0431\\u0435\\u0437 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0445\\u0438\\u043c\\u0438\\u043a\\u0430\\u0442\\u043e\\u0432\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u0421\\u0442\\u0430\\u0431\\u0438\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u043e\\u0432\"},\"points4\":{\"text\":\"\\u041f\\u0440\\u0438\\u0432\\u043b\\u0435\\u043a\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439 \\u0432\\u0438\\u0434\"}}'),
(8, '28', '{\"sizes0\":{\"size\":\"92\\u00d719\\u00d72700\\/3000;\"},\"sizes1\":{\"size\":\"117\\u00d719\\u00d73000\"}}'),
(9, '28', 'one'),
(12, '28', '2'),
(7, '29', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/mini\\/CMUTV.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/CMUTV.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '29', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/slider\\/mini\\/Exterior-cladding2.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/slider\\/Exterior-cladding2.jpg\",\"title\":\"\\u0418\\u043c\\u0438\\u0442\\u0430\\u0446\\u0438\\u044f \\u0431\\u0440\\u0443\\u0441\\u0430 \\u0421M Wood Thermo\",\"alt\":\"\"}}'),
(3, '29', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/draft\\/cmutv-1.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/draft\\/cmutv-1-big.png\"},\"drafts1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/draft\\/cmutv-2.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMUTV\\/draft\\/cmutv-2-big.png\"}}'),
(2, '29', '{\"points0\":{\"text\":\"\\u041d\\u0430\\u0434\\u0435\\u0436\\u043d\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points1\":{\"text\":\"\\u041d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"\\u0421\\u0442\\u0430\\u0431\\u0438\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u043e\\u0432\"}}'),
(8, '29', '{\"sizes0\":{\"size\":\"92\\u00d719\\u00d72700\\/3000\"},\"sizes1\":{\"size\":\"117\\u00d719\\u00d73000\"}}'),
(9, '29', 'one'),
(12, '29', '2'),
(7, '30', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/mini\\/cmvr-cmhss.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/cmvr-cmhss.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '30', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/slider\\/mini\\/CM-Wood-Themo-new.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/slider\\/CM-Wood-Themo-new.jpg\",\"title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0435 \\u0434\\u043e\\u0441\\u043a\\u0438 CM Wood Thermo\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/slider\\/mini\\/CM-Wood-Themo_facad.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/slider\\/CM-Wood-Themo_facad.jpg\",\"title\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0435 \\u0434\\u043e\\u0441\\u043a\\u0438 CM Wood Thermo\",\"alt\":\"\"}}'),
(3, '30', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/draft\\/cmvr-cmhss.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/FACADE_FACING\\/CMVR_CMHSS\\/draft\\/cmvr-cmhss-big.png\"}}'),
(2, '30', '{\"points0\":{\"text\":\"\\u0423\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\"},\"points1\":{\"text\":\"\\u0418\\u0434\\u0435\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u0438\\u044f \\u00ab\\u0441\\u043e\\u043b\\u043d\\u0435\\u0447\\u043d\\u044b\\u0445 \\u044d\\u043a\\u0440\\u0430\\u043d\\u043e\\u0432\\u00bb\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points4\":{\"text\":\"\\u041d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438\"}}'),
(8, '30', '{\"sizes0\":{\"size\":\"28\\/42\\u00d742\\u00d73000\"}}'),
(9, '30', 'one'),
(12, '30', '2'),
(7, '31', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/mini\\/CMSHP.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/CMSHP.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '31', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/slider\\/mini\\/LunaThermo-S.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/slider\\/LunaThermo-S.jpg\",\"title\":\"\\u0421\\u0442\\u0440\\u043e\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 CM Wood Thermo\",\"alt\":\"\"}}'),
(3, '31', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/draft\\/cmshp-1-1.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/draft\\/cmshp-1-1-big.png\"},\"drafts1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/draft\\/cmshp-2-1.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSHP\\/draft\\/cmshp-2-1-big.png\"}}'),
(2, '31', '{\"points0\":{\"text\":\"\\u0421\\u0442\\u0430\\u0431\\u0438\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u043e\\u0432\"},\"points1\":{\"text\":\"\\u041e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441\\u043c\\u043e\\u043b\\u044b\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"}}'),
(8, '31', '{\"sizes0\":{\"size\":\"185\\u00d726\\u00d73000\\/4200\"},\"sizes1\":{\"size\":\"92\\u00d726\\u00d72100\\/3000\"}}'),
(9, '31', 'one'),
(12, '31', '2'),
(7, '32', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/mini\\/CMHLL.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/CMSTP.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '32', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/slider\\/mini\\/HLL_L_26x118_LunaThermoD.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/slider\\/HLL_L_26x118_LunaThermoD.jpg\",\"title\":\"\\u0428\\u043f\\u0443\\u043d\\u0442\\u043e\\u0432\\u0430\\u043d\\u043d\\u0430\\u044f \\u043d\\u0430\\u043f\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\",\"alt\":\"\"},\"slider1\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/slider\\/mini\\/HLL_26x92_Pine_LunaThermoS.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/slider\\/HLL_26x92_Pine_LunaThermoS.jpg\",\"title\":\"\\u0428\\u043f\\u0443\\u043d\\u0442\\u043e\\u0432\\u0430\\u043d\\u043d\\u0430\\u044f \\u043d\\u0430\\u043f\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430\",\"alt\":\"\"}}'),
(3, '32', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/draft\\/CMHLL.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMHLL\\/draft\\/CMHLL-big.jpg\"}}');
INSERT INTO `hud_fields_values` (`field_id`, `item_id`, `value`) VALUES
(2, '32', '{\"points0\":{\"text\":\"\\u041f\\u0440\\u0438\\u0432\\u043b\\u0435\\u043a\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439 \\u0432\\u0438\\u0434\"},\"points1\":{\"text\":\"\\u0418\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u043e \\u0431\\u0435\\u0437 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0445\\u0438\\u043c\\u0438\\u043a\\u0430\\u0442\\u043e\\u0432\"},\"points2\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points3\":{\"text\":\"\\u041d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438\"},\"points4\":{\"text\":\"\\u0414\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0440\\u043e\\u043a \\u0441\\u043b\\u0443\\u0436\\u0431\\u044b\"}}'),
(8, '32', '{\"sizes0\":{\"size\":\"92\\u00d726\\u00d73000\"}}'),
(9, '32', 'one'),
(12, '32', '1'),
(7, '33', '{\"imgcolors0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/mini\\/CMSTP.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/CMSTP.jpg\",\"title\":\"\",\"alt\":\"\"}}'),
(6, '33', '{\"slider0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/slider\\/mini\\/Ruislaine.jpg\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/slider\\/Ruislaine.jpg\",\"title\":\"\\u0412\\u0430\\u0433\\u043e\\u043d\\u043a\\u0430 CM Wood Thermo\",\"alt\":\"\"}}'),
(3, '33', '{\"drafts0\":{\"mini\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/draft\\/cmstp.png\",\"big\":\"images\\/CM_WOOD_THERMO\\/INTERIOR_MATERIALS\\/CMSTP\\/draft\\/cmstp-big.png\"}}'),
(2, '33', '{\"points0\":{\"text\":\"\\u041d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438\"},\"points1\":{\"text\":\"\\u0412\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f \\u0443\\u0441\\u0442\\u043e\\u0439\\u0447\\u0438\\u0432\\u043e\\u0441\\u0442\\u044c \\u043a \\u0432\\u043b\\u0430\\u0433\\u0435, \\u043f\\u043b\\u0435\\u0441\\u0435\\u043d\\u0438, \\u0433\\u043d\\u0438\\u043b\\u0438\"},\"points2\":{\"text\":\"\\u042d\\u043a\\u043e\\u043b\\u043e\\u0433\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e\\u0432\\u0435\\u0447\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"},\"points3\":{\"text\":\"\\u041d\\u0435 \\u0432\\u044b\\u0434\\u0435\\u043b\\u044f\\u0435\\u0442 \\u0441\\u043c\\u043e\\u043b\\u0443\"}}'),
(8, '33', '{\"sizes0\":{\"size\":\"92\\u00d715\\u00d73000\"}}'),
(9, '33', 'one'),
(12, '33', '2'),
(4, '22', '[]'),
(2, '22', '[]'),
(13, '10', 'CM Decking'),
(14, '10', 'Террасная доска из ДПК'),
(16, '10', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(15, '8', 'Террасная доска из ДПК'),
(17, '8', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(6, '56', '[]'),
(7, '56', '[]'),
(4, '56', '[]'),
(3, '56', '[]'),
(2, '56', '[]'),
(8, '56', '[]'),
(18, '56', '{\"accessory0\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-Nesushhaja-laga.jpg\",\"name\":\"\\u041d\\u0435\\u0441\\u0443\\u0449\\u0430\\u044f \\u043b\\u0430\\u0433\\u0430\",\"size\":\"50\\u00d728\",\"width\":\"2000\",\"weight\":\"3,04\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory1\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-Metalicheskij-montazhnyj-nabor-dlja-fasadnyh-panelej.jpg\",\"name\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u044b\\u0445 \\u043f\\u0430\\u043d\\u0435\\u043b\\u0435\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,25\",\"amount\":\"40\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory2\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-uglovoy-profil-venge.jpg\",\"name\":\"\\u0423\\u0433\\u043b\\u043e\\u0432\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"size\":\"70\\u00d770\",\"width\":\"2000\",\"weight\":\"2,5\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory3\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-Osnova-vneshnego-ugla-aljuminievaja.jpg\",\"name\":\"\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0435\\u0433\\u043e \\u0443\\u0433\\u043b\\u0430 \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u0430\\u044f\",\"size\":\"27\\u00d727\",\"width\":\"2000\",\"weight\":\"0,6\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory4\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-kryshka-vneshnego-ugla-alljuminievaja.jpg\",\"name\":\"\\u041a\\u0440\\u044b\\u0448\\u043a\\u0430 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0435\\u0433\\u043e \\u0443\\u0433\\u043b\\u0430 \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u0430\\u044f\",\"size\":\"42\\u00d742\",\"width\":\"2000\",\"weight\":\"0,96\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory5\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-osnova-N-profilja-aljuminievaja.jpg\",\"name\":\"\\u041d\\u0435\\u0441\\u0443\\u0449\\u0430\\u044f \\u043b\\u0430\\u0433\\u0430\",\"size\":\"44,5\\u00d713\",\"width\":\"2000\",\"weight\":\"0,5\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory6\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-kryshka-N-profilja-aljuminievaja.jpg\",\"name\":\"\\u041a\\u0440\\u044b\\u0448\\u043a\\u0430 \\u041d-\\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044f \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u0430\\u044f\",\"size\":\"45\\u00d711,5\",\"width\":\"2000\",\"weight\":\"0,56\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory7\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-osnova-startovogo-profilja-aljuminievaja.jpg\",\"name\":\"\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430 \\u0441\\u0442\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044f \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u0430\\u044f\",\"size\":\"26,1\\u00d713\",\"width\":\"2000\",\"weight\":\"0,35\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory8\":{\"img\":\"images\\/CM_CLADDING\\/AKS\\/cm-cladding-accesories-Kryshka-startovogo-profilja-aljuminievaja.jpg\",\"name\":\"\\u041a\\u0440\\u044b\\u0448\\u043a\\u0430 \\u0441\\u0442\\u0430\\u0440\\u0442\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044f \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u0430\\u044f\",\"size\":\"43\\u00d753\\u00d716\",\"width\":\"2000\",\"weight\":\"0,86\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"}}'),
(17, '56', 'images/CM_CLADDING/Logo_CM_Cladding.svg'),
(18, '57', '{\"accessory0\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-opornyi-profil.jpg\",\"name\":\"\\u041e\\u043f\\u043e\\u0440\\u043d\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"size\":\"120\\u00d7120\",\"width\":\"3000\",\"weight\":\"19,5\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory1\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Podderzhivajushhij-profil2.jpg\",\"name\":\"\\u041f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"size\":\"90\\u00d790\",\"width\":\"3000\",\"weight\":\"13,2\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory2\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Profil-peril.jpg\",\"name\":\"\\u041f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c \\u043f\\u0435\\u0440\\u0438\\u043b\",\"size\":\"90\\u00d745\",\"width\":\"3000\",\"weight\":\"8,1\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory3\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Podderzhivajushhij-profil.jpg\",\"name\":\"\\u041f\\u0440\\u043e\\u043c\\u0435\\u0436\\u0443\\u0442\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"size\":\"40\\u00d740\",\"width\":\"3000\",\"weight\":\"2,9\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory4\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-krysha-stolba-dpk.jpg\",\"name\":\"\\u041a\\u0440\\u044b\\u0448\\u043a\\u0430 \\u0441\\u0442\\u043e\\u043b\\u0431\\u0430 \\u0414\\u041f\\u041a\",\"size\":\"120\\u00d7120\",\"width\":\"\",\"weight\":\"0,76\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory5\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Soedinitel-dlja-peril-prjamoj.jpg\",\"name\":\"\\u0421\\u043e\\u0435\\u0434\\u0438\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c \\u0434\\u043b\\u044f \\u043f\\u0435\\u0440\\u0438\\u043b \\u043f\\u0440\\u044f\\u043c\\u043e\\u0439\\/\\u0441 \\u0448\\u0430\\u0440\\u043d\\u0438\\u0440\\u043e\\u043c\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,2\\/0,25\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory6\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-usilenie-stolba.jpg\",\"name\":\"\\u0423\\u0441\\u0438\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0441\\u0442\\u043e\\u043b\\u0431\\u0430\",\"size\":\"\",\"width\":\"\",\"weight\":\"3\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory7\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Nejlonovyj-nizhnij-kant.jpg\",\"name\":\"\\u041d\\u0435\\u0439\\u043b\\u043e\\u043d\\u043e\\u0432\\u044b\\u0439 \\u043d\\u0438\\u0436\\u043d\\u0438\\u0439 \\u043a\\u0430\\u043d\\u0442\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,21\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory8\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-stalnoj-ugolok.jpg\",\"name\":\"\\u0421\\u0442\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0443\\u0433\\u043e\\u043b\\u043e\\u043a\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,02\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory9\":{\"img\":\"images\\/CM_RAILING\\/AKS\\/cm-railing-accesories-Fiksator-promezhutochnogo-tipa.jpg\",\"name\":\"\\u0424\\u0438\\u043a\\u0441\\u0430\\u0442\\u043e\\u0440 \\u043f\\u0440\\u043e\\u043c\\u0435\\u0436\\u0443\\u0442\\u043e\\u0447\\u043d\\u043e\\u0433\\u043e \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044f 45-90 \\u0433\\u0440\\u0430\\u0434\\u0443\\u0441\\u043e\\u0432\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,02\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"}}'),
(17, '57', 'images/CM_RAILING/Logo_CM_Railing.svg'),
(18, '58', '{\"accessory0\":{\"img\":\"images\\/CM_FENCING\\/AKS\\/cm-fencing-accesories-U-profil-aljuminevyj.jpg\",\"name\":\"U-\\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c \\u0430\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0435\\u0432\\u044b\\u0439\",\"size\":\"40\\u00d730\",\"width\":\"2000\",\"weight\":\"0,94\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory1\":{\"img\":\"images\\/CM_FENCING\\/AKS\\/cm-fencing-accesories-usilenie-stolba-metalicheskoe.jpg\",\"name\":\"\\u0423\\u0441\\u0438\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0441\\u0442\\u043e\\u043b\\u0431\\u0430 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u043e\\u0435\",\"size\":\"\",\"width\":\"1500\",\"weight\":\"9\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory2\":{\"img\":\"images\\/CM_FENCING\\/AKS\\/cm-fencing-accesories-stolb-zabornyj-s-kryshkoj.jpg\",\"name\":\"\\u0421\\u0442\\u043e\\u043b\\u0431 \\u0437\\u0430\\u0431\\u043e\\u0440\\u043d\\u044b\\u0439 \\u0441 \\u043a\\u0440\\u044b\\u0448\\u043a\\u043e\\u0439\",\"size\":\"90\\u00d790\",\"width\":\"1900\",\"weight\":\"17,3\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"}}'),
(17, '58', 'images/CM_FENCING/Logo_CM_Fencing.svg'),
(18, '59', '{\"accessory0\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/zheloba-polukruglyj.jpg\",\"name\":\"\\u0416\\u0435\\u043b\\u043e\\u0431 \\u043f\\u043e\\u043b\\u0443\\u043a\\u0440\\u0443\\u0433\\u043b\\u044b\\u0439\",\"size\":\"\",\"width\":\"3000\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"\",\"text\":\"\"},\"accessory1\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/ugol-polukruglogo-zheloba-vnutrennij.jpg\",\"name\":\"\\u0423\\u0433\\u043e\\u043b \\u043f\\u043e\\u043b\\u0443\\u043a\\u0440\\u0443\\u0433\\u043b\\u043e\\u0433\\u043e \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0432\\u043d\\u0443\\u0442\\u0440\\u0435\\u043d\\u043d\\u0438\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"90,135\",\"text\":\"\"},\"accessory2\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/soedinitel-zheloba-s-uplotnitelem.jpg\",\"name\":\"\\u0421\\u043e\\u0435\\u0434\\u0438\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0441 \\u0443\\u043f\\u043b\\u043e\\u0442\\u043d\\u0435\\u043d\\u0438\\u0435\\u043c\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"\",\"text\":\"\"},\"accessory3\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/ugol-polukruglogo-zheloba-vneshnij.jpg\",\"name\":\"\\u0423\\u0433\\u043e\\u043b \\u043f\\u043e\\u043b\\u0443\\u043a\\u0440\\u0443\\u0433\\u043b\\u043e\\u0433\\u043e \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0432\\u043d\\u0435\\u0448\\u043d\\u0438\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"90,135\",\"text\":\"\"},\"accessory4\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/krjuk-kreplenija-zheloba.jpg\",\"name\":\"\\u041a\\u0440\\u044e\\u043a \\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430\",\"size\":\"\",\"width\":\"70\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"\",\"text\":\"\"},\"accessory5\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/krjuk-kreplenija-zheloba.-zashhelkivajushhijsja.jpg\",\"name\":\"\\u041a\\u0440\\u044e\\u043a \\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0437\\u0430\\u0449\\u0435\\u043b\\u043a\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0439\\u0441\\u044f\",\"size\":\"\",\"width\":\"196,310\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"\",\"text\":\"\"},\"accessory6\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/krjuk-kreplenija-zheloba-karniznyj.jpg\",\"name\":\"\\u041a\\u0440\\u044e\\u043a \\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u043a\\u0430\\u0440\\u043d\\u0438\\u0437\\u043d\\u044b\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125\",\"angle\":\"\",\"text\":\"\"},\"accessory7\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/krjuk-kreplenija-zheloba-reguliruemyj.jpg\",\"name\":\"\\u041a\\u0440\\u044e\\u043a \\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0440\\u0435\\u0433\\u0443\\u043b\\u0438\\u0440\\u0443\\u0435\\u043c\\u044b\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125 \",\"angle\":\"\",\"text\":\"\"},\"accessory8\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/zaglushka-zheloba-malaja-universalnaja.jpg\",\"name\":\"\\u0417\\u0430\\u0433\\u043b\\u0443\\u0448\\u043a\\u0430 \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u043c\\u0430\\u043b\\u0430\\u044f \\u0443\\u043d\\u0438\\u0432\\u0435\\u0440\\u0441\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125\",\"angle\":\"\",\"text\":\"\"},\"accessory9\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/zaglushka-zheloba-bolshaja-universalnaja.jpg\",\"name\":\"\\u0417\\u0430\\u0433\\u043b\\u0443\\u0448\\u043a\\u0430 \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0430\\u044f \\u0443\\u043d\\u0438\\u0432\\u0435\\u0440\\u0441\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"150\",\"angle\":\"\",\"text\":\"\"},\"accessory10\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/podderzhivajushhij-krjuk-zheloba.jpg\",\"name\":\"\\u041f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0439 \\u043a\\u0440\\u044e\\u043a \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430\",\"size\":\"\",\"width\":\"280\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory11\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/priemna-voronka.jpg\",\"name\":\"\\u041f\\u0440\\u0438\\u0435\\u043c\\u043d\\u0430\\u044f \\u0432\\u043e\\u0440\\u043e\\u043d\\u043a\\u0430\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125\\/90, 150\\/100\",\"angle\":\"\",\"text\":\"\"},\"accessory12\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/ogranichitel-pereliva-zheloba-uglovoj.jpg\",\"name\":\"\\u041e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c \\u043f\\u0435\\u0440\\u0435\\u043b\\u0438\\u0432\\u0430 \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\\u0423\\u0433\\u043b\\u043e\\u0432\\u043e\\u0439\"},\"accessory13\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/ogranichitel-pereliva-zheloba-prjamoj.jpg\",\"name\":\"\\u041e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c \\u043f\\u0435\\u0440\\u0435\\u043b\\u0438\\u0432\\u0430 \\u0436\\u0435\\u043b\\u043e\\u0431\\u0430\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\\u041f\\u0440\\u044f\\u043c\\u043e\\u0439\"},\"accessory14\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/koleno-truby.jpg\",\"name\":\"\\u041a\\u043e\\u043b\\u0435\\u043d\\u043e \\u0442\\u0440\\u0443\\u0431\\u044b\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"70\",\"text\":\"\"},\"accessory15\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/soedinitelnaja-truba.jpg\",\"name\":\"\\u0421\\u043e\\u0435\\u0434\\u0438\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0442\\u0440\\u0443\\u0431\\u0430\",\"size\":\"\",\"width\":\"1000\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory16\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/koleno-truby-soedinitelnoe.jpg\",\"name\":\"\\u041a\\u043e\\u043b\\u0435\\u043d\\u043e \\u0442\\u0440\\u0443\\u0431\\u044b \\u0441\\u043e\\u0435\\u0434\\u0438\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0435\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory17\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/kreplenie-truby-dlja-derevjannoj-steny.jpg\",\"name\":\"\\u041a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0442\\u0440\\u0443\\u0431\\u044b (\\u0434\\u043b\\u044f \\u0434\\u0435\\u0440\\u0435\\u0432\\u044f\\u043d\\u043d\\u043e\\u0439 \\u0441\\u0442\\u0435\\u043d\\u044b)\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory18\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/drenazhnyj-otvod-truby.jpg\",\"name\":\"\\u0414\\u0440\\u0435\\u043d\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043e\\u0442\\u0432\\u043e\\u0434 \\u0442\\u0440\\u0443\\u0431\\u044b\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"125,150\",\"angle\":\"\",\"text\":\"\"},\"accessory19\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/kreplenie-truby-dlja-kirpichnoj-steny.jpg\",\"name\":\"\\u041a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0442\\u0440\\u0443\\u0431\\u044b (\\u0434\\u043b\\u044f \\u043a\\u0438\\u0440\\u043f\\u0438\\u0447\\u043d\\u043e\\u0439 \\u0441\\u0442\\u0435\\u043d\\u044b)\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory20\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/trojnik-truby.jpg\",\"name\":\"\\u0416\\u0435\\u043b\\u043e\\u0431 \\u043f\\u043e\\u043b\\u0443\\u043a\\u0440\\u0443\\u0433\\u043b\\u044b\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory21\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/truba-s-vodootvodom.jpg\",\"name\":\"\\u0422\\u0440\\u0443\\u0431\\u0430 \\u0441 \\u0432\\u043e\\u0434\\u043e\\u043e\\u0442\\u0432\\u043e\\u0434\\u043e\\u043c\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory22\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/zaglushka-drenaz-trap.jpg\",\"name\":\"\\u0421\\u0430\\u043c\\u043e\\u043e\\u0447\\u0438\\u0449\\u0430\\u044e\\u0449\\u0438\\u0439\\u0441\\u044f \\u0434\\u0440\\u0435\\u043d\\u0430\\u0436\\u043d\\u044b\\u0439 \\u0442\\u0440\\u0430\\u043f (\\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a)\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory23\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/voronka-vodosbornaja.jpg\",\"name\":\"\\u0412\\u043e\\u0440\\u043e\\u043d\\u043a\\u0430 \\u0432\\u043e\\u0434\\u043e\\u0441\\u0431\\u043e\\u0440\\u043d\\u0430\\u044f\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory24\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/ship.jpg\",\"name\":\"\\u0428\\u0438\\u043f \\u043e\\u0446\\u0438\\u043d\\u043a\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0439\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"175\",\"angle\":\"\",\"text\":\"\"},\"accessory25\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/soedinitel-drenazhnogo-trapa.jpg\",\"name\":\"\\u0421\\u043e\\u0435\\u0434\\u0438\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c \\u0434\\u0440\\u0435\\u043d\\u0430\\u0436\\u043d\\u043e\\u0433\\u043e \\u0442\\u0440\\u0430\\u043f\\u0430 (\\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a)\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory26\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/drenazhnyj-trap.jpg\",\"name\":\"\\u0414\\u0440\\u0435\\u043d\\u0430\\u0436\\u043d\\u044b\\u0439 \\u0442\\u0440\\u0430\\u043f (\\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a)\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"},\"accessory27\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/vyvodnoe-koleno-truby.jpg\",\"name\":\"\\u0412\\u044b\\u0432\\u043e\\u0434\\u043d\\u043e\\u0435 \\u043a\\u043e\\u043b\\u0435\\u043d\\u043e \\u0442\\u0440\\u0443\\u0431\\u044b\",\"size\":\"\",\"width\":\"\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"70\",\"text\":\"\"},\"accessory28\":{\"img\":\"images\\/CM_VATTERN\\/AKS\\/truba-vodostock.jpg\",\"name\":\"\\u0422\\u0440\\u0443\\u0431\\u0430 \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f\",\"size\":\"\",\"width\":\"3000\",\"weight\":\"\",\"amount\":\"\",\"diameter\":\"90,100\",\"angle\":\"\",\"text\":\"\"}}'),
(17, '59', 'images/CM_VATTERN/Logo_CM_Vattern.svg'),
(8, '19', '[]'),
(17, '18', 'images/CM_FENCING/Logo_CM_Fencing.svg'),
(18, '60', '{\"accessory0\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Nesushhaja-laga-40x25.jpg\",\"name\":\"\\u041d\\u0435\\u0441\\u0443\\u0449\\u0430\\u044f \\u043b\\u0430\\u0433\\u0430\",\"size\":\"40x25\",\"width\":\"2000\",\"weight\":\"2,04\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory1\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-cladding-accesories-Nesushhaja-laga.jpg\",\"name\":\"\\u041d\\u0435\\u0441\\u0443\\u0449\\u0430\\u044f \\u043b\\u0430\\u0433\\u0430\",\"size\":\"50x28\",\"width\":\"2000\",\"weight\":\"3,04\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory2\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Plastikovyj-montazhnyj-nabor-dlja-terrasnyh-dosok-NATUR-i-MIX.jpg\",\"name\":\"\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0434\\u043e\\u0441\\u043e\\u043a NATUR \\u0438 MIX\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,2\",\"amount\":\"100\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory3\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Plastikovyj-montazhnyj-nabor-dlja-terrasnyh-dosok-VINTAGE-i-PRO.jpg\",\"name\":\"\\u041f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u043e\\u0432\\u044b\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0434\\u043e\\u0441\\u043e\\u043a Vintage\",\"size\":\"\",\"width\":\"\",\"weight\":\"0,2\",\"amount\":\"100\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory4\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Metallicheskij-montazhnyj-nabor-dlja-terrasnyh-dosok-NATUR-i-MIX.jpg\",\"name\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0434\\u043e\\u0441\\u043e\\u043a NATUR \\u0438 MIX\",\"size\":\"\",\"width\":\"1,2\",\"weight\":\"\",\"amount\":\"100\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory5\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Metallicheskij-montazhnyj-nabor-dlja-terrasnyh-dosok-VINTAGE-GRAND-i-PRO.jpg\",\"name\":\"\\u041c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0434\\u043e\\u0441\\u043e\\u043a VINTAGE \\u0438 GRAND\",\"size\":\"\",\"width\":\"1,2\",\"weight\":\"\",\"amount\":\"100\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory6\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Startovyj-nabor.jpg\",\"name\":\"\\u0421\\u0442\\u0430\\u0440\\u0442\\u043e\\u0432\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440\",\"size\":\"\",\"width\":\"0,045\",\"weight\":\"\",\"amount\":\"10\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory7\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Montazhnyj-nabor-dlja-lag.jpg\",\"name\":\"\\u041c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u043b\\u0430\\u0433 50x28\",\"size\":\"\",\"width\":\"0,12\",\"weight\":\"\",\"amount\":\"5\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory8\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-torcevaja-doska-s-teksturoj.jpg\",\"name\":\"\\u0422\\u043e\\u0440\\u0446\\u0435\\u0432\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0441 \\u0442\\u0435\\u043a\\u0441\\u0442\\u0443\\u0440\\u043e\\u0439\",\"size\":\"50x10\",\"width\":\"2000\",\"weight\":\"1,4\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory9\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-uglovoj-profil-50x38.jpg\",\"name\":\"\\u0423\\u0433\\u043b\\u043e\\u0432\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"size\":\"58x38x8\",\"width\":\"2000\",\"weight\":\"1,7\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"},\"accessory10\":{\"img\":\"images\\/CM_DECKING\\/AKS\\/cm-deking-accesories-Torcevaja-zaglushka-dlja-serij-NATUR-i-MIX.jpg\",\"name\":\"\\u0422\\u043e\\u0440\\u0446\\u0435\\u0432\\u0430\\u044f \\u0437\\u0430\\u0433\\u043b\\u0443\\u0448\\u043a\\u0430 \\u0434\\u043b\\u044f \\u0441\\u0435\\u0440\\u0438\\u0439 NATUR \\u0438 MIX\",\"size\":\"25x135\",\"width\":\"\",\"weight\":\"\",\"amount\":\"1\",\"diameter\":\"\",\"angle\":\"\",\"text\":\"\"}}'),
(14, '18', 'Декинг, фасадная облицовка и полы из лиственницы'),
(14, '22', 'Декинг, фасадная облицовка и полы из термодревесины'),
(14, '13', 'Садовый паркет, клумбы и скамейки из ДПК'),
(16, '13', 'images/CM_GARDEN/Logo_CM_Garden.svg'),
(13, '11', 'Моющее средство для дпк CM Care'),
(14, '11', 'Моющее средство CM Care'),
(16, '11', 'images/CM_CARE/Logo_CM_Care.svg'),
(16, '18', 'images/CM_WOOD_NATUR/Logo_CM_Wood_natur.svg'),
(16, '22', 'images/CM_WOOD_THERMO/Logo_CM_Wood_thermor.svg'),
(16, '12', 'images/CM_BORD/Logo_CM_Bord.svg'),
(16, '14', 'images/CM_CLADDING/Logo_CM_Cladding.svg'),
(16, '15', 'images/CM_RAILING/Logo_CM_Railing.svg'),
(16, '16', 'images/CM_FENCING/Logo_CM_Fencing.svg'),
(16, '17', 'images/CM_VATTERN/Logo_CM_Vattern.svg'),
(16, '19', 'images/CM_WOOD_NATUR/Logo_CM_Wood_natur.svg'),
(16, '20', 'images/CM_WOOD_NATUR/Logo_CM_Wood_natur.svg'),
(16, '21', 'images/CM_WOOD_NATUR/Logo_CM_Wood_natur.svg'),
(16, '23', 'images/CM_WOOD_THERMO/Logo_CM_Wood_thermor.svg'),
(16, '24', 'images/CM_WOOD_THERMO/Logo_CM_Wood_thermor.svg'),
(16, '25', 'images/CM_WOOD_THERMO/Logo_CM_Wood_thermor.svg'),
(17, '60', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(5, '7', 'plus.svg'),
(5, '7', 'crowns.svg'),
(5, '7', 'shield.svg'),
(5, '7', 'timber.svg'),
(5, '7', 'brush.svg'),
(5, '7', 'years.svg'),
(17, '7', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '7', '[]'),
(5, '6', 'plus.svg'),
(5, '6', 'crowns.svg'),
(5, '6', 'shield.svg'),
(5, '6', 'timber.svg'),
(5, '6', 'brush.svg'),
(5, '6', 'years.svg'),
(17, '6', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '6', '[]'),
(5, '5', 'plus.svg'),
(5, '5', 'crowns.svg'),
(5, '5', 'shield.svg'),
(5, '5', 'timber.svg'),
(5, '5', 'brush.svg'),
(5, '5', 'years.svg'),
(17, '5', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '5', '[]'),
(5, '4', 'plus.svg'),
(5, '4', 'crowns.svg'),
(5, '4', 'shield.svg'),
(5, '4', 'timber.svg'),
(5, '4', 'brush.svg'),
(5, '4', 'years.svg'),
(17, '4', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '4', '[]'),
(2, '4', '[]'),
(5, '3', 'plus.svg'),
(5, '3', 'crowns.svg'),
(5, '3', 'shield.svg'),
(5, '3', 'timber.svg'),
(5, '3', 'brush.svg'),
(5, '3', 'years.svg'),
(17, '3', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '3', '[]'),
(5, '2', 'plus.svg'),
(5, '2', 'crowns.svg'),
(5, '2', 'shield.svg'),
(5, '2', 'timber.svg'),
(5, '2', 'brush.svg'),
(5, '2', 'years.svg'),
(17, '2', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '2', '[]'),
(3, '2', '[]'),
(5, '1', 'plus.svg'),
(5, '1', 'crowns.svg'),
(5, '1', 'shield.svg'),
(5, '1', 'timber.svg'),
(5, '1', 'brush.svg'),
(5, '1', 'years.svg'),
(17, '1', 'images/CM_DECKING/Logo_CM_Decking.svg'),
(18, '1', '[]'),
(3, '1', '[]'),
(17, '10', 'images/CM_CARE/Logo_CM_Care.svg'),
(17, '9', 'images/CM_CARE/Logo_CM_Care.svg'),
(17, '11', 'images/CM_BORD/Logo_CM_Bord.svg'),
(17, '12', 'images/CM_GARDEN/Logo_CM_Garden.svg'),
(17, '13', 'images/CM_GARDEN/Logo_CM_Garden.svg'),
(17, '14', 'images/CM_GARDEN/Logo_CM_Garden.svg'),
(17, '15', 'images/CM_GARDEN/Logo_CM_Garden.svg'),
(17, '16', 'images/CM_CLADDING/Logo_CM_Cladding.svg'),
(17, '17', 'images/CM_RAILING/Logo_CM_Railing.svg'),
(17, '19', 'images/CM_VATTERN/Logo_CM_Vattern.svg'),
(5, '8', 'plus.svg'),
(5, '8', 'crowns.svg'),
(5, '8', 'shield.svg'),
(5, '8', 'timber.svg'),
(5, '8', 'brush.svg'),
(5, '8', 'years.svg'),
(18, '8', '[]'),
(15, '10', 'Чистящее средство для ДПК'),
(18, '10', '[]'),
(7, '10', '[]'),
(3, '10', '[]'),
(8, '10', '[]'),
(15, '9', 'Чистящее средство для ДПК'),
(18, '9', '[]'),
(7, '9', '[]'),
(3, '9', '[]'),
(8, '9', '[]'),
(15, '11', 'Цементно-минеральные фасадные панели'),
(18, '11', '[]'),
(4, '11', '[]'),
(3, '11', '[]'),
(18, '12', '[]'),
(3, '12', '[]'),
(18, '15', '[]'),
(3, '15', '[]'),
(18, '14', '[]'),
(3, '14', '[]'),
(18, '13', '[]'),
(3, '13', '[]'),
(15, '16', 'Фасадная облицовка из ДПК'),
(18, '16', '[]'),
(15, '17', 'Перила и ограждения из ДПК'),
(18, '17', '[]'),
(3, '17', '[]'),
(15, '18', 'Заборы из ДПК'),
(18, '18', '[]'),
(15, '19', 'Металлические водостоки из шведской стали'),
(18, '19', '[]'),
(3, '19', '[]'),
(18, '21', '[]'),
(4, '21', '[]'),
(2, '21', '[]'),
(18, '20', '[]'),
(4, '20', '[]'),
(18, '25', '[]'),
(4, '25', '[]'),
(3, '25', '[]'),
(18, '24', '[]'),
(6, '24', '[]'),
(4, '24', '[]'),
(3, '24', '[]'),
(2, '24', '[]'),
(8, '24', '[]'),
(18, '23', '[]'),
(6, '23', '[]'),
(4, '23', '[]'),
(3, '23', '[]'),
(2, '23', '[]'),
(8, '23', '[]'),
(18, '27', '[]'),
(4, '27', '[]'),
(18, '26', '[]'),
(4, '26', '[]'),
(18, '30', '[]'),
(4, '30', '[]'),
(18, '29', '[]'),
(4, '29', '[]'),
(18, '28', '[]'),
(4, '28', '[]'),
(18, '33', '[]'),
(4, '33', '[]'),
(18, '32', '[]'),
(4, '32', '[]'),
(18, '31', '[]'),
(4, '31', '[]'),
(6, '60', '[]'),
(7, '60', '[]'),
(4, '60', '[]'),
(3, '60', '[]'),
(2, '60', '[]'),
(8, '60', '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_filters`
--

CREATE TABLE `hud_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links`
--

CREATE TABLE `hud_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms0`
--

CREATE TABLE `hud_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms1`
--

CREATE TABLE `hud_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms2`
--

CREATE TABLE `hud_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms3`
--

CREATE TABLE `hud_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms4`
--

CREATE TABLE `hud_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms5`
--

CREATE TABLE `hud_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms6`
--

CREATE TABLE `hud_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms7`
--

CREATE TABLE `hud_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms8`
--

CREATE TABLE `hud_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_terms9`
--

CREATE TABLE `hud_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termsa`
--

CREATE TABLE `hud_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termsb`
--

CREATE TABLE `hud_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termsc`
--

CREATE TABLE `hud_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termsd`
--

CREATE TABLE `hud_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termse`
--

CREATE TABLE `hud_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_links_termsf`
--

CREATE TABLE `hud_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_taxonomy`
--

CREATE TABLE `hud_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hud_finder_taxonomy`
--

INSERT INTO `hud_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_taxonomy_map`
--

CREATE TABLE `hud_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_terms`
--

CREATE TABLE `hud_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_terms_common`
--

CREATE TABLE `hud_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hud_finder_terms_common`
--

INSERT INTO `hud_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('any', 'en'),
('are', 'en'),
('aren\'t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn\'t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_tokens`
--

CREATE TABLE `hud_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_tokens_aggregate`
--

CREATE TABLE `hud_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_finder_types`
--

CREATE TABLE `hud_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_languages`
--

CREATE TABLE `hud_languages` (
  `lang_id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_languages`
--

INSERT INTO `hud_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 2),
(2, 60, 'ru-RU', 'Русский (Россия)', 'Russian (Russia)', 'ru', 'ru_ru', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_menu`
--

CREATE TABLE `hud_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_menu`
--

INSERT INTO `hud_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 77, 0, '*', 0),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 20, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 21, 26, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 22, 23, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 24, 25, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 27, 28, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 33, 34, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 35, 36, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 37, 38, 0, '*', 1),
(22, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 0, 'class:associations', 0, '', 39, 40, 0, '*', 1),
(101, 'menu', 'Главная', 'main', '', 'main', 'index.php?option=com_content&view=categories&layout=cottagemode:products&id=9', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_base_description\":\"\",\"categories_description\":\"\",\"maxLevelcat\":\"1\",\"show_empty_categories_cat\":\"\",\"show_subcat_desc_cat\":\"\",\"show_cat_num_articles_cat\":\"\",\"show_category_title\":\"\",\"show_description\":\"0\",\"show_description_image\":\"1\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"date\",\"order_date\":\"\",\"show_pagination_limit\":\"\",\"filter_field\":\"\",\"show_headings\":\"\",\"list_show_date\":\"\",\"date_format\":\"\",\"list_show_hits\":\"\",\"list_show_author\":\"\",\"display_num\":\"0\",\"show_pagination\":\"2\",\"show_pagination_results\":\"0\",\"article_layout\":\"_:default\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"cottagemode\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"images\\/logo.svg\",\"menu_image_css\":\"logo\",\"menu_text\":0,\"menu_show\":1,\"page_title\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c \\u0434\\u0435\\u043a\\u0438\\u043d\\u0433\\u0430 \\u0438 \\u0414\\u041f\\u041a - CottageMode Scandinavia\",\"show_page_heading\":\"\",\"page_heading\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c \\u0434\\u0435\\u043a\\u0438\\u043d\\u0433\\u0430 \\u0438 \\u0414\\u041f\\u041a - CottageMode Scandinavia\",\"pageclass_sfx\":\"-home\",\"menu-meta_description\":\"\\u0421\\u043e\\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0440\\u0435\\u0448\\u0435\\u043d\\u0438\\u044f \\u0434\\u043b\\u044f \\u0437\\u0430\\u0433\\u043e\\u0440\\u043e\\u0434\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u043c\\u043e\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u0438\\u044f \\u0438\\u0437 \\u0434\\u0440\\u0435\\u0432\\u0435\\u0441\\u043d\\u043e-\\u043f\\u043e\\u043b\\u0438\\u043c\\u0435\\u0440\\u043d\\u043e\\u0433\\u043e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0442\\u0430 \\u043e\\u0442 CM Scandinavia by CottageMode. \\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430, \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430, \\u0441\\u0430\\u0434\\u043e\\u0432\\u044b\\u0439 \\u043f\\u0430\\u0440\\u043a\\u0435\\u0442, \\u0437\\u0430\\u0431\\u043e\\u0440\\u044b, \\u043f\\u0435\\u0440\\u0438\\u043b\\u0430 \\u0438 \\u043e\\u0433\\u0440\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f.\",\"menu-meta_keywords\":\"cm decking, cm vattern, cm cladding, cm care, cm railing, cm fencing, cm wood natur, cm wood thermo, cm garden, cottagemode, cottage mode, \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434, \\u0434\\u0435\\u043a\\u0438\\u043d\\u0433, \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0434\\u043f\\u043a, \\u0442\\u0435\\u0440\\u0440\\u0430\\u0441\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u043a\\u0430 \\u0438\\u0437 \\u0434\\u043f\\u043a, \\u0444\\u0430\\u0441\\u0430\\u0434\\u043d\\u0430\\u044f \\u043e\\u0431\\u043b\\u0438\\u0446\\u043e\\u0432\\u043a\\u0430, \\u0441\\u0430\\u0434\\u043e\\u0432\\u044b\\u0439 \\u043f\\u0430\\u0440\\u043a\\u0435\\u0442, \\u0437\\u0430\\u0431\\u043e\\u0440 \\u0438\\u0437 \\u0434\\u043f\\u043a, \\u043f\\u0435\\u0440\\u0438\\u043b\\u0430 \\u0438\\u0437 \\u0434\\u043f\\u043a, \\u0432\\u043e\\u0434\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430, \\u0441\\u0430\\u0439\\u0434\\u0438\\u043d\\u0433 \\u0438\\u0437 \\u0434\\u043f\\u043a, \\u0441\\u043c \\u0434\\u0435\\u043a\\u0438\\u043d\\u0433\",\"robots\":\"\",\"secure\":0}', 41, 42, 1, '*', 0),
(102, 'menu', 'О нас', 'company', '', 'company', 'index.php?option=com_content&view=article&id=34', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"CottageMode Scandinavia - \\u043e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438\",\"show_page_heading\":\"1\",\"page_heading\":\"CottageMode Scandinavia\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"CottageMode Scandinavia AB \\u2014 \\u044d\\u0442\\u043e \\u0448\\u0432\\u0435\\u0434\\u0441\\u043a\\u0438\\u0439 \\u043a\\u043e\\u043d\\u0446\\u0435\\u0440\\u043d, \\u043f\\u043e \\u0437\\u0430\\u043a\\u0430\\u0437\\u0443 \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0433\\u043e \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u044f\\u0442\\u0441\\u044f \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b \\u0438\\u0437 \\u0414\\u041f\\u041a, \\u043d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430 \\u0438 \\u043c\\u0435\\u0442\\u0430\\u043b\\u043b\\u0430 \\u0432 \\u0428\\u0432\\u0435\\u0446\\u0438\\u0438, \\u0424\\u0438\\u043d\\u043b\\u044f\\u043d\\u0434\\u0438\\u0438 \\u0438 \\u0420\\u043e\\u0441\\u0441\\u0438\\u0438.\",\"menu-meta_keywords\":\"cm scandinavia,cottagemode,cottage mode,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434,\\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 cottage mode\",\"robots\":\"\",\"secure\":0}', 43, 44, 0, '*', 0),
(103, 'menu', 'Новости', 'news', '', 'news', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"article_layout\":\"cottagemode:media\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438 CM Scandinavia (CottageMode)\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"-media\",\"menu-meta_description\":\"\\u0421\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438 \\u043e\\u0442 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438 CM Scandinavia (CottageMode): \\u0430\\u043a\\u0446\\u0438\\u0438, \\u043d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438, \\u0440\\u0430\\u0441\\u043f\\u0440\\u043e\\u0434\\u0430\\u0436\\u0438.\",\"menu-meta_keywords\":\"cm scandinavia,cottagemode,cottage mode,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434\",\"robots\":\"\",\"secure\":0}', 45, 46, 0, '*', 0),
(104, 'menu', 'Продукция', 'products', '', 'products', 'index.php?option=com_content&view=category&layout=cottagemode:product&id=9', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"12\",\"num_intro_articles\":\"0\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"1\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"order\",\"order_date\":\"\",\"show_pagination\":\"0\",\"show_pagination_results\":\"0\",\"show_featured\":\"\",\"article_layout\":\"cottagemode:product\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438 \\u0438\\u0437 \\u0434\\u043f\\u043a \\u0438 \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"show_page_heading\":\"\",\"page_heading\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438 \\u0438\\u0437 \\u0434\\u043f\\u043a \\u0438 \\u0434\\u0435\\u0440\\u0435\\u0432\\u0430\",\"pageclass_sfx\":\"-products\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"cm scandinavia, cottagemode, cottage mode, \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434, cm decking, cm vattern, cm railing,cm fencing,cm care,cm garden, cm wood natur, cm wood thermo, \\u0441\\u043c \\u0434\\u0435\\u043a\\u0438\\u043d\\u0433, \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434, cottage mode, \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438\",\"robots\":\"\",\"secure\":0}', 47, 48, 0, '*', 0),
(105, 'menu', 'Где купить?', 'where-buy', '', 'where-buy', 'index.php?option=com_content&view=article&id=35', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\\u0413\\u0434\\u0435 \\u043a\\u0443\\u043f\\u0438\\u0442\\u044c CM Scandinavia (CottageMode)\",\"show_page_heading\":\"1\",\"page_heading\":\"\\u0413\\u0434\\u0435 \\u043a\\u0443\\u043f\\u0438\\u0442\\u044c?\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\\u0421\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u043a\\u0430\\u0440\\u0442\\u0443 \\u0441\\u043e \\u0441\\u043f\\u0438\\u0441\\u043a\\u043e\\u043c \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u0432 CM Scandinavia (CottageMode) \\u0432 \\u0420\\u043e\\u0441\\u0441\\u0438\\u0438\",\"menu-meta_keywords\":\"\\u043a\\u0443\\u043f\\u0438\\u0442\\u044c cottagemode,\\u043a\\u0443\\u043f\\u0438\\u0442\\u044c \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434 \\u0434\\u0438\\u043b\\u0435\\u0440,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434 \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\",\"robots\":\"\",\"secure\":0}', 49, 50, 0, '*', 0),
(106, 'menu', 'Стать дилером', 'contacts', '', 'contacts', 'index.php?option=com_content&view=article&id=36', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\\u0421\\u0442\\u0430\\u0442\\u044c \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u043c\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\\u0421\\u0442\\u0430\\u0442\\u044c \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u043c CM Scandinavia \\u043e\\u0442 CottageMode\",\"menu-meta_keywords\":\"cm scandinavia,cottagemode,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434,\\u0441\\u0442\\u0430\\u0442\\u044c \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u043c \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434\",\"robots\":\"\",\"secure\":0}', 51, 52, 0, '*', 0),
(107, 'menu', 'Задать вопрос', 'question', '', 'question', 'index.php?option=com_content&view=article&id=37', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\\u0417\\u0430\\u0434\\u0430\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\\u0421\\u0442\\u0430\\u0442\\u044c \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u043c CM Scandinavia \\u043e\\u0442 CottageMode\",\"menu-meta_keywords\":\"cm scandinavia,cottagemode,\\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434,\\u0441\\u0442\\u0430\\u0442\\u044c \\u0434\\u0438\\u043b\\u0435\\u0440\\u043e\\u043c \\u043a\\u043e\\u0442\\u0442\\u0435\\u0434\\u0436\\u043c\\u043e\\u0434\",\"robots\":\"\",\"secure\":0}', 53, 54, 0, '*', 0),
(108, 'menu', 'Политика в отношении обработки персональных данных', 'agreement', '', 'agreement', 'index.php?option=com_content&view=article&id=38', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 55, 56, 0, '*', 0),
(109, 'social', 'vk', 'vk', '', 'vk', 'https://vk.com/cottage_mode?from=groups', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, ' ', 0, '{\"menu-anchor_title\":\"cottagemode VK\",\"menu-anchor_css\":\"nav-link fa fa-vk fa-lg\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":0,\"menu_show\":1}', 57, 58, 0, '*', 0),
(110, 'social', 'facebook', 'facebook', '', 'facebook', 'https://facebook.com/cottagemode', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link fa fa-facebook-f fa-lg\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1}', 59, 60, 0, '*', 0),
(111, 'social', 'instagram', 'instagram', '', 'instagram', 'https://instagram.com/cottagemode?utm_source=ig_profile_share&igshid=1jylmvaj8spzm', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"nav-link fa fa-instagram fa-lg\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1}', 61, 62, 0, '*', 0),
(112, 'main', 'RSFormPro', 'rsformpro', '', 'rsformpro', 'index.php?option=com_rsform', 'component', 1, 1, 1, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 63, 74, 0, '', 1),
(113, 'main', 'COM_RSFORM_MANAGE_FORMS', 'com-rsform-manage-forms', '', 'rsformpro/com-rsform-manage-forms', 'index.php?option=com_rsform&view=forms', 'component', 1, 112, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1),
(114, 'main', 'COM_RSFORM_MANAGE_SUBMISSIONS', 'com-rsform-manage-submissions', '', 'rsformpro/com-rsform-manage-submissions', 'index.php?option=com_rsform&view=submissions', 'component', 1, 112, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 66, 67, 0, '', 1),
(115, 'main', 'COM_RSFORM_MANAGE_DIRECTORY_SUBMISSIONS', 'com-rsform-manage-directory-submissions', '', 'rsformpro/com-rsform-manage-directory-submissions', 'index.php?option=com_rsform&view=directory', 'component', 1, 112, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 68, 69, 0, '', 1),
(116, 'main', 'COM_RSFORM_CONFIGURATION', 'com-rsform-configuration', '', 'rsformpro/com-rsform-configuration', 'index.php?option=com_rsform&view=configuration', 'component', 1, 112, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 70, 71, 0, '', 1),
(117, 'main', 'COM_RSFORM_BACKUP_RESTORE', 'com-rsform-backup-restore', '', 'rsformpro/com-rsform-backup-restore', 'index.php?option=com_rsform&view=backuprestore', 'component', 1, 112, 2, 10006, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 72, 73, 0, '', 1),
(118, 'main', 'COM_OSMAP_TITLE', 'com-osmap-title', '', 'com-osmap-title', 'index.php?option=com_osmap', 'component', 1, 1, 1, 10014, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 75, 76, 0, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_menu_types`
--

CREATE TABLE `hud_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_menu_types`
--

INSERT INTO `hud_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 54, 'menu', 'Меню', 'Cottagemode menu', 0),
(2, 151, 'social', 'Социальные сети', 'Социальные сети cottagemode', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_messages`
--

CREATE TABLE `hud_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_messages_cfg`
--

CREATE TABLE `hud_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_modules`
--

CREATE TABLE `hud_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_modules`
--

INSERT INTO `hud_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Главное меню', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"menu\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"-main\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(2, 40, 'Форма авторизации', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{\"usesecure\":0,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(3, 41, 'Популярные статьи', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{\"count\":5,\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"automatic_title\":0,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(4, 42, 'Последние новости', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{\"count\":5,\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"automatic_title\":0,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(8, 43, 'Панель инструментов', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(9, 44, 'Панель быстрого доступа', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_quickicon', 3, 1, '{\"context\":\"mod_quickicon\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(10, 45, 'Авторизованные пользователи', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{\"count\":5,\"name\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"automatic_title\":0,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(12, 46, 'Меню панели управления', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{\"menutype\":\"*\",\"preset\":\"joomla\",\"check\":1,\"shownew\":0,\"showhelp\":0,\"forum_url\":false,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(13, 47, 'Подменю панели управления', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(14, 48, 'Статус пользователя', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '{\"show_viewsite\":1,\"show_viewadmin\":0,\"show_loggedin_users\":1,\"show_loggedin_users_admin\":1,\"show_messages\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(15, 49, 'Заголовок', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(79, 52, 'Мультиязычность', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(86, 53, 'Версия Joomla!', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_version', 3, 1, '{\"format\":\"short\",\"product\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(88, 58, 'Лог действий - последние', '', '', 1, 'cpanel', 0, '0000-00-00 00:00:00', '2019-07-29 06:25:03', '0000-00-00 00:00:00', 1, 'mod_latestactions', 6, 1, '{\"count\":5,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"automatic_title\":0,\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(89, 59, 'Панель управления персональными данными', '', '', 1, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_privacy_dashboard', 6, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(90, 152, 'Социальные сети', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '2019-07-08 13:19:43', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"social\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"-social\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(91, 153, 'CM Scandinavia: Террасы, Фасады, Водостоки', '', '<h2>Добро пожаловать на официальный сайт CottageMode</h2>\r\n<p>CottageMode Scandinavia AB это предприятие со шведскими корнями и многолетним опытом разработки и производства строительных материалов. Вся наша продукция изготавливается в соответствии с концепцией скандинавского дизайна и современными технологиями. Помимо собственных продуктов, мы реализуем ряд тщательно подобранных товаров, произведенных в соответствии с нашими строгими требованиями, тем самым предлагая нашим клиентам эффективные комплексные решения от одного поставщика под брендом CM Scandinavia.</p>\r\n<p>Мы «одеваем» дома, создавая особую эстетику, ведь интерьеры и фасады домов в северных странах отличаются простыми линиями и конструкциями в сочетании с передовыми технологиями и экологически чистыми, природными материалами. На сегодняшний день, мы предлагаем широкий спектр декинга, террасной и фасадной доски, материалов из древесно-полимерного композита для загородного дома, интерьерных и фасадных материалов из натуральной древесины и финского термодерева, а так же металлическую водосточную систему из настоящей шведской стали.</p>\r\n<h4>Вся продукция CottageMode для вашего удобства разделена на товарные группы под собственными названиями:</h4>\r\n<ul>\r\n<li>CM Decking - террасная доска из дпк</li>\r\n<li>CM Cladding - фасадная доска из дпк (сайдинг из дпк)</li>\r\n<li>CM Railing - перила и ограждения из дпк</li>\r\n<li>CM Fencing - заборы из дпк</li>\r\n<li>CM Garden - клумбы, скамейки и оградки из дпк</li>\r\n<li>CM Care - моющие средства для дпк</li>\r\n<li>CM Vattern - водостоки из металла</li>\r\n<li>CM Wood Natur - материалы из натуральной древесины</li>\r\n<li>CM Wood Thermo - материалы из термодерева</li>\r\n</ul>\r\n<h4>Выбирайте скандинавский дизайн, выбирайте CM Scandinavia!</h4>', 1, 'events', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":0,\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h1\",\"header_class\":\"page-header-title\",\"style\":\"0\"}', 0, '*'),
(92, 154, 'Слайдер', '', '<p><img src=\"images/slider/1.jpg\" alt=\"1\" /><img src=\"images/slider/2.jpg\" alt=\"2\" /><img src=\"images/slider/3.jpg\" alt=\"3\" /><img src=\"images/slider/4.jpg\" alt=\"4\" /></p>', 1, 'events', 0, '0000-00-00 00:00:00', '2019-08-27 06:37:40', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{\"prepare_content\":0,\"backgroundimage\":\"\",\"layout\":\"cottagemode:slider\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"section\",\"bootstrap_size\":\"12\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(93, 155, 'Новость', '', '', 1, 'aside', 0, '0000-00-00 00:00:00', '2019-07-10 06:41:29', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 0, '{\"catid\":[8],\"count\":1,\"show_featured\":\"\",\"ordering\":\"p_dsc\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(94, 156, 'Новость', '', '', 1, 'aside', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 0, '{\"mode\":\"normal\",\"show_on_article_page\":1,\"count\":1,\"show_front\":\"show\",\"category_filtering_type\":1,\"catid\":[8],\"show_child_category_articles\":0,\"levels\":1,\"author_filtering_type\":1,\"author_alias_filtering_type\":1,\"excluded_articles\":\"\",\"date_filtering\":\"off\",\"date_field\":\"a.created\",\"start_date_range\":\"\",\"end_date_range\":\"\",\"relative_date\":30,\"article_ordering\":\"publish_up\",\"article_ordering_direction\":\"DESC\",\"article_grouping\":\"none\",\"date_grouping_field\":\"created\",\"month_year_format\":\"F Y\",\"article_grouping_direction\":\"ksort\",\"link_titles\":1,\"show_date\":0,\"show_date_field\":\"created\",\"show_date_format\":\"Y-m-d H:i:s\",\"show_category\":0,\"show_hits\":0,\"show_author\":0,\"show_tags\":0,\"show_introtext\":1,\"introtext_limit\":200,\"show_readmore\":1,\"show_readmore_title\":0,\"readmore_limit\":15,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":1,\"cache_time\":900,\"module_tag\":\"article\",\"bootstrap_size\":\"6\",\"header_tag\":\"h4\",\"header_class\":\"title\",\"style\":\"0\"}', 0, '*'),
(95, 157, 'Последние новости', '', '', 1, 'aside', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 1, '{\"mode\":\"normal\",\"show_on_article_page\":1,\"count\":3,\"show_front\":\"show\",\"category_filtering_type\":1,\"catid\":[8],\"show_child_category_articles\":0,\"levels\":1,\"author_filtering_type\":1,\"author_alias_filtering_type\":1,\"excluded_articles\":\"\",\"date_filtering\":\"off\",\"date_field\":\"a.created\",\"start_date_range\":\"\",\"end_date_range\":\"\",\"relative_date\":30,\"article_ordering\":\"publish_up\",\"article_ordering_direction\":\"DESC\",\"article_grouping\":\"none\",\"date_grouping_field\":\"created\",\"month_year_format\":\"F Y\",\"article_grouping_direction\":\"ksort\",\"link_titles\":1,\"show_date\":1,\"show_date_field\":\"publish_up\",\"show_date_format\":\"d.m.Y\",\"show_category\":0,\"show_hits\":0,\"show_author\":0,\"show_tags\":0,\"show_introtext\":0,\"introtext_limit\":100,\"show_readmore\":0,\"show_readmore_title\":1,\"readmore_limit\":15,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":1,\"cache_time\":900,\"module_tag\":\"article\",\"bootstrap_size\":\"6\",\"header_tag\":\"h4\",\"header_class\":\"title\",\"style\":\"0\"}', 0, '*'),
(96, 159, 'Стать дилером', '', '', 1, 'events', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_rsform', 1, 0, '{\"formId\":\"1\",\"moduleclass_sfx\":\"dealer\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(97, 160, 'Задать вопрос', '', '', 1, 'events', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_rsform', 1, 0, '{\"formId\":\"3\",\"moduleclass_sfx\":\"question\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"6\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(98, 164, 'Другие продукты', '', '', 1, 'events', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_related_items', 1, 0, '{\"showDate\":0,\"maximum\":12,\"layout\":\"_:default\",\"moduleclass_sfx\":\"others\",\"owncache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h4\",\"header_class\":\"page-title\",\"style\":\"0\"}', 0, '*'),
(99, 165, 'Задать вопрос', '', '{rsform 1}', 1, 'modal', 0, '0000-00-00 00:00:00', '2019-07-18 10:20:36', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{\"prepare_content\":1,\"backgroundimage\":\"\",\"layout\":\"cottagemode:modal\",\"moduleclass_sfx\":\"-question\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h5\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(100, 166, 'Задать вопрос', '', '', 1, 'modal', 0, '0000-00-00 00:00:00', '2019-07-18 10:21:21', '0000-00-00 00:00:00', -2, 'mod_rsform', 1, 0, '{\"formId\":\"3\",\"moduleclass_sfx\":\"-question\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h4\",\"header_class\":\"page-header\",\"style\":\"0\"}', 0, '*'),
(101, 167, 'Заказать образец', '', '{rsform 3}', 1, 'dialog', 0, '0000-00-00 00:00:00', '2019-07-18 10:20:36', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{\"prepare_content\":1,\"backgroundimage\":\"\",\"layout\":\"cottagemode:modal\",\"moduleclass_sfx\":\"-commenting\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h5\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(102, 177, 'Слайдер', '', '', 1, 'events', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_collector', 1, 0, '{\"collectors\":{\"collectors0\":{\"imgbig\":\"images\\/slider\\/1.jpg\",\"imgmini\":\"images\\/slider\\/mini\\/1.jpg\",\"alt\":\"\",\"title\":\"\",\"header\":\"\",\"text\":\"\",\"url\":\"\",\"texturl\":\"\"},\"collectors1\":{\"imgbig\":\"images\\/slider\\/2.jpg\",\"imgmini\":\"images\\/slider\\/mini\\/2.jpg\",\"alt\":\"\",\"title\":\"\",\"header\":\"\",\"text\":\"\",\"url\":\"\",\"texturl\":\"\"},\"collectors2\":{\"imgbig\":\"images\\/slider\\/3.jpg\",\"imgmini\":\"images\\/slider\\/mini\\/3.jpg\",\"alt\":\"\",\"title\":\"\",\"header\":\"\",\"text\":\"\",\"url\":\"\",\"texturl\":\"\"},\"collectors3\":{\"imgbig\":\"images\\/slider\\/4.jpg\",\"imgmini\":\"images\\/slider\\/mini\\/4.jpg\",\"alt\":\"\",\"title\":\"\",\"header\":\"\",\"text\":\"\",\"url\":\"\",\"texturl\":\"\"}},\"source\":768,\"popup\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"slider\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"section\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_modules_menu`
--

CREATE TABLE `hud_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_modules_menu`
--

INSERT INTO `hud_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(79, 0),
(86, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 101),
(92, 101),
(93, 101),
(94, 101),
(95, 101),
(96, 106),
(97, 107),
(98, 104),
(99, 104),
(99, 105),
(100, 104),
(100, 105),
(101, 103),
(101, 104),
(102, 101);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_newsfeeds`
--

CREATE TABLE `hud_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_osmap_items_settings`
--

CREATE TABLE `hud_osmap_items_settings` (
  `sitemap_id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(100) NOT NULL DEFAULT '',
  `settings_hash` char(32) NOT NULL,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'weekly',
  `priority` float NOT NULL DEFAULT '0.5',
  `format` tinyint(1) UNSIGNED DEFAULT '2' COMMENT 'Format of the setting: 1) Legacy Mode - UID Only; 2) Based on menu ID and UID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_osmap_sitemaps`
--

CREATE TABLE `hud_osmap_sitemaps` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `params` text,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `links_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_osmap_sitemaps`
--

INSERT INTO `hud_osmap_sitemaps` (`id`, `name`, `params`, `is_default`, `published`, `created_on`, `links_count`) VALUES
(1, 'Default Sitemap', NULL, 1, 1, '2019-07-22 07:16:04', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_osmap_sitemap_menus`
--

CREATE TABLE `hud_osmap_sitemap_menus` (
  `sitemap_id` int(11) UNSIGNED NOT NULL,
  `menutype_id` int(11) NOT NULL,
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'weekly',
  `priority` float NOT NULL DEFAULT '0.5',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_osmap_sitemap_menus`
--

INSERT INTO `hud_osmap_sitemap_menus` (`sitemap_id`, `menutype_id`, `changefreq`, `priority`, `ordering`) VALUES
(1, 1, 'weekly', 0.5, 0),
(1, 2, 'weekly', 0.5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_overrider`
--

CREATE TABLE `hud_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_postinstall_messages`
--

CREATE TABLE `hud_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_postinstall_messages`
--

INSERT INTO `hud_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 0),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 0),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 0),
(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 0),
(5, 700, 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE', 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/joomla40checks.php', 'admin_postinstall_joomla40checks_condition', '3.7.0', 0),
(6, 700, 'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE', 'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY', 'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION', 'tpl_hathor', 1, 'action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_condition', '3.7.0', 0),
(7, 700, 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION', 'plg_captcha_recaptcha', 1, 'action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_condition', '3.8.6', 0),
(8, 700, 'COM_ACTIONLOGS_POSTINSTALL_TITLE', 'COM_ACTIONLOGS_POSTINSTALL_BODY', '', 'com_actionlogs', 1, 'message', '', '', '', '', '3.9.0', 0),
(9, 700, 'COM_PRIVACY_POSTINSTALL_TITLE', 'COM_PRIVACY_POSTINSTALL_BODY', '', 'com_privacy', 1, 'message', '', '', '', '', '3.9.0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_privacy_consents`
--

CREATE TABLE `hud_privacy_consents` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` int(10) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_privacy_requests`
--

CREATE TABLE `hud_privacy_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_redirect_links`
--

CREATE TABLE `hud_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_calculations`
--

CREATE TABLE `hud_rsform_calculations` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `expression` text NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_components`
--

CREATE TABLE `hud_rsform_components` (
  `ComponentId` int(11) NOT NULL,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `Order` int(11) NOT NULL DEFAULT '0',
  `Published` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_components`
--

INSERT INTO `hud_rsform_components` (`ComponentId`, `FormId`, `ComponentTypeId`, `Order`, `Published`) VALUES
(1, 1, 1, 5, 1),
(2, 1, 1, 8, 1),
(3, 1, 13, 13, 1),
(4, 1, 1, 7, 1),
(5, 1, 1, 3, 1),
(6, 1, 2, 9, 1),
(7, 1, 4, 11, 1),
(8, 1, 8, 10, 0),
(9, 1, 5, 0, 0),
(10, 1, 1, 1, 1),
(11, 1, 2424, 12, 1),
(12, 1, 1, 2, 1),
(13, 1, 1, 4, 1),
(14, 1, 1, 6, 1),
(15, 1, 10, 14, 1),
(16, 1, 0, 15, 0),
(17, 2, 5, 0, 1),
(18, 2, 1, 1, 1),
(19, 2, 1, 2, 1),
(20, 2, 1, 3, 1),
(21, 2, 1, 4, 1),
(22, 2, 1, 5, 1),
(23, 2, 2, 6, 1),
(24, 2, 8, 7, 0),
(25, 2, 4, 8, 1),
(26, 2, 13, 10, 1),
(27, 2, 2424, 9, 1),
(28, 2, 10, 11, 1),
(29, 3, 5, 1, 0),
(30, 3, 1, 2, 0),
(31, 3, 1, 3, 1),
(32, 3, 1, 4, 1),
(33, 3, 2, 6, 1),
(34, 3, 8, 7, 0),
(35, 3, 4, 8, 1),
(36, 3, 2424, 9, 1),
(37, 3, 13, 10, 1),
(38, 3, 10, 0, 1),
(39, 3, 3, 5, 1),
(40, 3, 10, 11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_component_types`
--

CREATE TABLE `hud_rsform_component_types` (
  `ComponentTypeId` int(11) NOT NULL,
  `ComponentTypeName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_component_types`
--

INSERT INTO `hud_rsform_component_types` (`ComponentTypeId`, `ComponentTypeName`) VALUES
(1, 'textBox'),
(2, 'textArea'),
(3, 'selectList'),
(4, 'checkboxGroup'),
(5, 'radioGroup'),
(6, 'calendar'),
(7, 'button'),
(8, 'captcha'),
(9, 'fileUpload'),
(10, 'freeText'),
(11, 'hidden'),
(13, 'submitButton'),
(14, 'password'),
(15, 'ticket'),
(41, 'pageBreak'),
(211, 'birthDay'),
(212, 'gmaps'),
(355, 'rangeSlider'),
(411, 'jQueryCalendar'),
(2424, 'recaptchav2');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_component_type_fields`
--

CREATE TABLE `hud_rsform_component_type_fields` (
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldType` varchar(32) NOT NULL DEFAULT 'hidden',
  `FieldValues` text NOT NULL,
  `Properties` text NOT NULL,
  `Ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_component_type_fields`
--

INSERT INTO `hud_rsform_component_type_fields` (`ComponentTypeId`, `FieldName`, `FieldType`, `FieldValues`, `Properties`, `Ordering`) VALUES
(1, 'NAME', 'textbox', '', '', 1),
(1, 'CAPTION', 'textbox', '', '', 2),
(1, 'REQUIRED', 'select', 'NO\r\nYES', '', 3),
(1, 'SIZE', 'textbox', '20', 'numeric', 4),
(1, 'MAXSIZE', 'textbox', '', 'numeric', 5),
(1, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSFormProHelper::getValidationRules();\r\n//</code>', '', 6),
(1, 'VALIDATIONMULTIPLE', 'selectmultiple', '//<code>\r\nreturn RSFormProHelper::getValidationRules(false, true);\r\n//</code>', '', 6),
(1, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 7),
(1, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 8),
(1, 'DEFAULTVALUE', 'textarea', '', '', 9),
(1, 'PLACEHOLDER', 'textbox', '', '', 10),
(1, 'DESCRIPTION', 'textarea', '', '', 11),
(1, 'INPUTTYPE', 'select', 'text\r\nemail\r\ntel\r\nnumber\r\nrange\r\nurl', '{\"case\":{\"number\":{\"show\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"],\"hide\":[\"MAXSIZE\"]},\"range\":{\"show\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"],\"hide\":[\"MAXSIZE\"]},\"text\":{\"show\":[\"MAXSIZE\"],\"hide\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"]},\"email\":{\"show\":[\"MAXSIZE\"],\"hide\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"]},\"tel\":{\"show\":[\"MAXSIZE\"],\"hide\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"]},\"url\":{\"show\":[\"MAXSIZE\"],\"hide\":[\"ATTRMIN\",\"ATTRMAX\",\"ATTRSTEP\"]}}}', 0),
(1, 'ATTRMIN', 'textbox', '', 'float', 1),
(1, 'ATTRMAX', 'textbox', '', 'float', 2),
(1, 'ATTRSTEP', 'textbox', '1', 'float', 2),
(1, 'COMPONENTTYPE', 'hidden', '1', '', 15),
(1, 'VALIDATIONEXTRA', 'textbox', '', '', 6),
(2, 'NAME', 'textbox', '', '', 1),
(2, 'CAPTION', 'textbox', '', '', 2),
(2, 'REQUIRED', 'select', 'NO\r\nYES', '', 3),
(2, 'COLS', 'textbox', '50', 'numeric', 4),
(2, 'ROWS', 'textbox', '5', 'numeric', 5),
(2, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSFormProHelper::getValidationRules();\r\n//</code>', '', 6),
(2, 'VALIDATIONMULTIPLE', 'selectmultiple', '//<code>\r\nreturn RSFormProHelper::getValidationRules(false, true);\r\n//</code>', '', 6),
(2, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 7),
(2, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 8),
(2, 'DEFAULTVALUE', 'textarea', '', '', 9),
(2, 'DESCRIPTION', 'textarea', '', '', 10),
(2, 'COMPONENTTYPE', 'hidden', '2', '', 10),
(2, 'PLACEHOLDER', 'textbox', '', '', 10),
(2, 'WYSIWYG', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"WYSIWYGBUTTONS\"],\"hide\":[\"MAXSIZE\",\"SHOW_CHAR_COUNT\"]},\"NO\":{\"show\":[\"MAXSIZE\",\"SHOW_CHAR_COUNT\"],\"hide\":[\"WYSIWYGBUTTONS\"]}}}', 11),
(2, 'WYSIWYGBUTTONS', 'select', 'NO\r\nYES', '', 12),
(2, 'MAXSIZE', 'textbox', '', 'numeric', 13),
(2, 'SHOW_CHAR_COUNT', 'select', 'NO\r\nYES', '', 14),
(2, 'VALIDATIONEXTRA', 'textbox', '', '', 6),
(3, 'NAME', 'textbox', '', '', 1),
(3, 'CAPTION', 'textbox', '', '', 2),
(3, 'SIZE', 'textbox', '', 'numeric', 3),
(3, 'MULTIPLE', 'select', 'NO\r\nYES', '', 4),
(3, 'ITEMS', 'textarea', '', '', 5),
(3, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 6),
(3, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 7),
(3, 'DESCRIPTION', 'textarea', '', '', 8),
(3, 'COMPONENTTYPE', 'hidden', '3', '', 10),
(3, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(4, 'NAME', 'textbox', '', '', 1),
(4, 'CAPTION', 'textbox', '', '', 2),
(4, 'ITEMS', 'textarea', '', '', 3),
(4, 'FLOW', 'select', 'HORIZONTAL\r\nVERTICAL\r\nVERTICAL2COLUMNS\r\nVERTICAL3COlUMNS\r\nVERTICAL4COLUMNS\r\nVERTICAL6COLUMNS', '', 4),
(4, 'MAXSELECTIONS', 'textbox', '0', '', 5),
(4, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 5),
(4, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 6),
(4, 'DESCRIPTION', 'textarea', '', '', 6),
(4, 'COMPONENTTYPE', 'hidden', '4', '', 7),
(4, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(5, 'NAME', 'textbox', '', '', 1),
(5, 'CAPTION', 'textbox', '', '', 2),
(5, 'ITEMS', 'textarea', '', '', 3),
(5, 'FLOW', 'select', 'HORIZONTAL\r\nVERTICAL\r\nVERTICAL2COLUMNS\r\nVERTICAL3COlUMNS\r\nVERTICAL4COLUMNS\r\nVERTICAL6COLUMNS', '', 4),
(5, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 5),
(5, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 6),
(5, 'DESCRIPTION', 'textarea', '', '', 6),
(5, 'COMPONENTTYPE', 'hidden', '5', '', 7),
(5, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(6, 'NAME', 'textbox', '', '', 1),
(6, 'CAPTION', 'textbox', '', '', 2),
(6, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 3),
(6, 'VALIDATIONCALENDAR', 'select', '//<code>\r\nreturn RSFormProHelper::getOtherCalendars(6);\r\n//</code>', '', 4),
(6, 'VALIDATIONDATE', 'select', 'YES\r\nNO', '', 8),
(6, 'DATEFORMAT', 'textbox', 'd/m/Y', '', 4),
(6, 'CALENDARLAYOUT', 'select', 'FLAT\r\nPOPUP', '{\"case\":{\"POPUP\":{\"show\":[\"READONLY\", \"POPUPLABEL\"],\"hide\":[]},\"FLAT\":{\"show\":[],\"hide\":[\"READONLY\", \"POPUPLABEL\"]}}}', 5),
(6, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 6),
(6, 'DESCRIPTION', 'textarea', '', '', 7),
(6, 'COMPONENTTYPE', 'hidden', '6', '', 8),
(6, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(6, 'READONLY', 'select', 'NO\r\nYES', '', 6),
(6, 'POPUPLABEL', 'textbox', '...', '', 6),
(6, 'MINDATE', 'textarea', '', '', 5),
(6, 'MAXDATE', 'textarea', '', '', 5),
(6, 'DEFAULTVALUE', 'textarea', '', '', 2),
(7, 'NAME', 'textbox', '', '', 1),
(7, 'CAPTION', 'textbox', '', '', 3),
(7, 'LABEL', 'textbox', '', '', 2),
(7, 'RESET', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"RESETLABEL\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"RESETLABEL\"]}}}', 4),
(7, 'RESETLABEL', 'textbox', '', '', 5),
(7, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 6),
(7, 'DESCRIPTION', 'textarea', '', '', 7),
(7, 'COMPONENTTYPE', 'hidden', '7', '', 8),
(7, 'BUTTONTYPE', 'select', 'TYPEBUTTON\nTYPEINPUT', '', 6),
(8, 'NAME', 'textbox', '', '', 1),
(8, 'CAPTION', 'textbox', '', '', 2),
(8, 'LENGTH', 'textbox', '4', '', 3),
(8, 'BACKGROUNDCOLOR', 'textbox', '#FFFFFF', '', 4),
(8, 'TEXTCOLOR', 'textbox', '#000000', '', 5),
(8, 'TYPE', 'select', 'ALPHA\r\nNUMERIC\r\nALPHANUMERIC', '', 6),
(8, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 7),
(8, 'DESCRIPTION', 'textarea', '', '', 9),
(8, 'COMPONENTTYPE', 'hidden', '8', '', 9),
(8, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(8, 'FLOW', 'select', 'VERTICAL\r\nHORIZONTAL', '', 7),
(8, 'SHOWREFRESH', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"REFRESHTEXT\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"REFRESHTEXT\"]}}}', 8),
(8, 'REFRESHTEXT', 'textbox', 'REFRESH', '', 11),
(8, 'SIZE', 'textbox', '15', 'numeric', 12),
(8, 'IMAGETYPE', 'select', 'FREETYPE\r\nNOFREETYPE\r\nINVISIBLE', '{\"case\":{\"FREETYPE\":{\"show\":[\"BACKGROUNDCOLOR\",\"TEXTCOLOR\",\"TYPE\",\"FLOW\",\"LENGTH\",\"SHOWREFRESH\",\"REFRESHTEXT\",\"SIZE\"],\"hide\":[]},\"NOFREETYPE\":{\"show\":[\"BACKGROUNDCOLOR\",\"TEXTCOLOR\",\"TYPE\",\"FLOW\",\"LENGTH\",\"SHOWREFRESH\",\"REFRESHTEXT\",\"SIZE\"],\"hide\":[]},\"INVISIBLE\":{\"show\":[],\"hide\":[\"BACKGROUNDCOLOR\",\"TEXTCOLOR\",\"TYPE\",\"FLOW\",\"LENGTH\",\"SHOWREFRESH\",\"REFRESHTEXT\",\"SIZE\"]}}}', 3),
(9, 'NAME', 'textbox', '', '', 1),
(9, 'CAPTION', 'textbox', '', '', 2),
(9, 'FILESIZE', 'textbox', '', 'numeric', 3),
(9, 'REQUIRED', 'select', 'NO\r\nYES', '', 4),
(9, 'ACCEPTEDFILES', 'textarea', '', 'oneperline', 5),
(9, 'ACCEPTEDFILESIMAGES', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"THUMBSIZE\",\"THUMBQUALITY\"],\"hide\":[\"ACCEPTEDFILES\"]},\"NO\":{\"show\":[\"ACCEPTEDFILES\"],\"hide\":[\"THUMBSIZE\",\"THUMBQUALITY\"]}}}', 5),
(9, 'THUMBSIZE', 'textbox', '220', 'numeric', 5),
(9, 'THUMBQUALITY', 'textbox', '75', 'numeric', 5),
(9, 'DESTINATION', 'textbox', '//<code>\r\nreturn \'components/com_rsform/uploads/\';\r\n//</code>', '', 6),
(9, 'SANITIZEFILENAME', 'select', 'NO\r\nYES', '', 8),
(9, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 7),
(9, 'DESCRIPTION', 'textarea', '', '', 8),
(9, 'COMPONENTTYPE', 'hidden', '9', '', 9),
(9, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(9, 'PREFIX', 'textarea', '', '', 6),
(9, 'EMAILATTACH', 'selectmultiple', '//<code>\r\nreturn RSFormProHelper::getEmailAttachOptions();\r\n//</code>', '', 102),
(10, 'NAME', 'textbox', '', '', 1),
(10, 'TEXT', 'textarea', '', '', 1),
(10, 'COMPONENTTYPE', 'hidden', '10', '', 9),
(11, 'NAME', 'textbox', '', '', 1),
(11, 'DEFAULTVALUE', 'textarea', '', '', 1),
(11, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 1),
(11, 'COMPONENTTYPE', 'hidden', '11', '', 9),
(13, 'NAME', 'textbox', '', '', 1),
(13, 'CAPTION', 'textbox', '', '', 3),
(13, 'LABEL', 'textbox', '', '', 2),
(13, 'RESET', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"RESETLABEL\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"RESETLABEL\"]}}}', 6),
(13, 'RESETLABEL', 'textbox', '', '', 7),
(13, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 9),
(13, 'COMPONENTTYPE', 'hidden', '13', '', 12),
(13, 'BUTTONTYPE', 'select', 'TYPEBUTTON\nTYPEINPUT', '', 11),
(13, 'PREVBUTTON', 'textbox', '< Prev', '', 8),
(13, 'DISPLAYPROGRESS', 'select', 'NO\r\nAUTO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"DISPLAYPROGRESSMSG\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"DISPLAYPROGRESSMSG\"]}, \"AUTO\":{\"show\":[],\"hide\":[\"DISPLAYPROGRESSMSG\"]}}}', 9),
(13, 'DISPLAYPROGRESSMSG', 'textarea', '<div>\r\n <p><em>Page <strong>{page}</strong> of {total}</em></p>\r\n <div class=\"rsformProgressContainer\">\r\n  <div class=\"rsformProgressBar\" style=\"width: {percent}%;\"></div>\r\n </div>\r\n</div>', '', 10),
(14, 'NAME', 'textbox', '', '', 1),
(14, 'CAPTION', 'textbox', '', '', 2),
(14, 'REQUIRED', 'select', 'NO\r\nYES', '', 3),
(14, 'SIZE', 'textbox', '', 'numeric', 4),
(14, 'MAXSIZE', 'textbox', '', 'numeric', 5),
(14, 'DEFAULTVALUE', 'textarea', '', '', 6),
(14, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 7),
(14, 'COMPONENTTYPE', 'hidden', '14', '', 8),
(14, 'DESCRIPTION', 'textarea', '', '', 100),
(14, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 100),
(14, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSFormProHelper::getValidationRules();\r\n//</code>', '', 9),
(14, 'VALIDATIONMULTIPLE', 'selectmultiple', '//<code>\r\nreturn RSFormProHelper::getValidationRules(false, true);\r\n//</code>', '', 9),
(14, 'PLACEHOLDER', 'textbox', '', '', 10),
(14, 'VALIDATIONEXTRA', 'textbox', '', '', 6),
(15, 'NAME', 'textbox', '', '', 1),
(15, 'LENGTH', 'textbox', '8', '', 4),
(15, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 7),
(15, 'COMPONENTTYPE', 'hidden', '15', '', 8),
(15, 'CHARACTERS', 'select', 'ALPHANUMERIC\r\nALPHA\r\nNUMERIC', '', 3),
(15, 'TICKETTYPE', 'select', 'RANDOM\r\nSEQUENTIAL', '{\"case\":{\"RANDOM\":{\"show\":[\"CHARACTERS\", \"LENGTH\"],\"hide\":[\"LEADINGZEROLENGTH\"]},\"SEQUENTIAL\":{\"show\":[\"LEADINGZEROLENGTH\"],\"hide\":[\"CHARACTERS\", \"LENGTH\"]}}}', 2),
(15, 'LEADINGZEROLENGTH', 'select', '0\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10', '', 5),
(41, 'NAME', 'textbox', '', '', 1),
(41, 'COMPONENTTYPE', 'hidden', '41', '', 5),
(41, 'NEXTBUTTON', 'textbox', 'Next >', '', 2),
(41, 'PREVBUTTON', 'textbox', '< Prev', '', 3),
(41, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 4),
(41, 'VALIDATENEXTPAGE', 'select', 'NO\r\nYES', '', 5),
(41, 'DISPLAYPROGRESS', 'select', 'NO\r\nAUTO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"DISPLAYPROGRESSMSG\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"DISPLAYPROGRESSMSG\"]}, \"AUTO\":{\"show\":[],\"hide\":[\"DISPLAYPROGRESSMSG\"]}}}', 6),
(41, 'DISPLAYPROGRESSMSG', 'textarea', '<div>\r\n <p><em>Page <strong>{page}</strong> of {total}</em></p>\r\n <div class=\"rsformProgressContainer\">\r\n  <div class=\"rsformProgressBar\" style=\"width: {percent}%;\"></div>\r\n </div>\r\n</div>', '', 7),
(41, 'BUTTONTYPE', 'select', 'TYPEBUTTON\nTYPEINPUT', '', 8),
(211, 'VALIDATION_ALLOW_INCORRECT_DATE', 'select', 'NO\r\nYES', '', 0),
(211, 'NAME', 'textbox', '', '', 1),
(211, 'VALIDATIONRULE_DATE', 'select', '//<code>\r\nreturn RSFormProHelper::getDateValidationRules();\r\n//</code>', '', 1),
(211, 'CAPTION', 'textbox', '', '', 2),
(211, 'DESCRIPTION', 'textarea', '', '', 3),
(211, 'REQUIRED', 'select', 'NO\r\nYES', '', 4),
(211, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 5),
(211, 'DATEORDERING', 'select', 'DMY\r\nMDY\r\nYMD\r\nYDM\r\nMYD\r\nDYM', '', 6),
(211, 'DATESEPARATOR', 'textbox', ' / ', '', 7),
(211, 'SHOWDAY', 'select', 'YES\r\nNO', '{\"case\":{\"YES\":{\"show\":[\"SHOWDAYPLEASE\" ,\"SHOWDAYTYPE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"SHOWDAYPLEASE\" ,\"SHOWDAYTYPE\"]}}}', 8),
(211, 'SHOWDAYPLEASE', 'textbox', 'Day', '', 9),
(211, 'SHOWDAYTYPE', 'select', 'DAY_TYPE_01\r\nDAY_TYPE_1', '', 10),
(211, 'SHOWMONTH', 'select', 'YES\r\nNO', '{\"case\":{\"YES\":{\"show\":[\"SHOWMONTHPLEASE\" ,\"SHOWMONTHTYPE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"SHOWMONTHPLEASE\" ,\"SHOWMONTHTYPE\"]}}}', 11),
(211, 'SHOWMONTHPLEASE', 'textbox', 'Month', '', 12),
(211, 'SHOWMONTHTYPE', 'select', 'MONTH_TYPE_01\r\nMONTH_TYPE_1\r\nMONTH_TYPE_TEXT_SHORT\r\nMONTH_TYPE_TEXT_LONG', '', 13),
(211, 'SHOWYEAR', 'select', 'YES\r\nNO', '{\"case\":{\"YES\":{\"show\":[\"SHOWYEARPLEASE\" ,\"STARTYEAR\", \"ENDYEAR\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"SHOWYEARPLEASE\" ,\"STARTYEAR\", \"ENDYEAR\"]}}}', 14),
(211, 'SHOWYEARPLEASE', 'textbox', 'Year', '', 15),
(211, 'STARTYEAR', 'textbox', '1960', '', 16),
(211, 'ENDYEAR', 'textbox', '2013', '', 17),
(211, 'STORELEADINGZERO', 'select', 'NO\r\nYES', '', 18),
(211, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 18),
(211, 'COMPONENTTYPE', 'hidden', '211', '', 19),
(212, 'NAME', 'textbox', '', '', 0),
(212, 'CAPTION', 'textbox', '', '', 1),
(212, 'DESCRIPTION', 'textarea', '', '', 3),
(212, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 4),
(212, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 5),
(212, 'DEFAULTVALUE', 'textarea', '', '', 2),
(212, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 6),
(212, 'MAPWIDTH', 'textbox', '450px', '', 7),
(212, 'MAPHEIGHT', 'textbox', '300px', '', 8),
(212, 'MAPCENTER', 'textbox', '39.5500507,-105.7820674', '', 9),
(212, 'COMPONENTTYPE', 'hidden', '212', '', 12),
(212, 'SIZE', 'textbox', '20', 'numeric', 13),
(212, 'MAPZOOM', 'textbox', '10', 'numeric', 10),
(212, 'MAPRESULT', 'select', 'ADDRESS\r\nCOORDINATES', '', 12),
(212, 'MAPTYPE', 'select', 'ROADMAP\r\nSATELLITE\r\nHYBRID\r\nTERRAIN', '', 13),
(212, 'GEOLOCATION', 'select', 'NO\r\nYES', '', 11),
(411, 'NAME', 'textbox', '', '', 1),
(411, 'CAPTION', 'textbox', '', '', 2),
(411, 'DEFAULTVALUE', 'textarea', '', '', 3),
(411, 'DESCRIPTION', 'textarea', '', '', 4),
(411, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 5),
(411, 'VALIDATIONCALENDAR', 'select', '//<code>\nreturn RSFormProHelper::getOtherCalendars(411);\n//</code>', '', 6),
(411, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 7),
(411, 'VALIDATIONDATE', 'select', 'YES\r\nNO', '', 8),
(411, 'DATEFORMAT', 'textbox', 'd/m/Y H:i', '', 8),
(411, 'MINDATEJQ', 'textarea', '', '', 9),
(411, 'MAXDATEJQ', 'textarea', '', '', 10),
(411, 'ALLOWDATERE', 'textbox', '', '', 11),
(411, 'ALLOWDATES', 'textarea', '', '', 12),
(411, 'TIMEPICKER', 'select', 'YES\r\nNO', '{\"case\":{\"YES\":{\"show\":[\"TIMEPICKERFORMAT\", \"TIMESTEP\",\"MINTIMEJQ\", \"MAXTIMEJQ\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"TIMEPICKERFORMAT\", \"TIMESTEP\",\"MINTIMEJQ\", \"MAXTIMEJQ\"]}}}', 13),
(411, 'TIMEPICKERFORMAT', 'textbox', 'H:i', '', 14),
(411, 'TIMESTEP', 'textbox', '30', '', 15),
(411, 'MINTIMEJQ', 'textarea', '', '', 16),
(411, 'MAXTIMEJQ', 'textarea', '', '', 17),
(411, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 18),
(411, 'CALENDARLAYOUT', 'select', 'FLAT\r\nPOPUP', '{\"case\":{\"POPUP\":{\"show\":[\"READONLY\", \"POPUPLABEL\"],\"hide\":[]},\"FLAT\":{\"show\":[],\"hide\":[\"READONLY\", \"POPUPLABEL\"]}}}', 19),
(411, 'READONLY', 'select', 'NO\r\nYES', '', 20),
(411, 'POPUPLABEL', 'textbox', '...', '', 21),
(411, 'THEME', 'select', 'DEFAULT\r\nDARK', '', 22),
(411, 'COMPONENTTYPE', 'hidden', '411', '', 200),
(355, 'NAME', 'textbox', '', '', 1),
(355, 'CAPTION', 'textbox', '', '', 2),
(355, 'DEFAULTVALUE', 'textarea', '', '', 3),
(355, 'DESCRIPTION', 'textarea', '', '', 4),
(355, 'REQUIRED', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALIDATIONMESSAGE\"],\"hide\":[]},\"NO\":{\"show\":[],\"hide\":[\"VALIDATIONMESSAGE\"]}}}', 5),
(355, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 6),
(355, 'SLIDERTYPE', 'select', 'SINGLE\r\nDOUBLE', '{\"case\":{\"SINGLE\":{\"show\":[],\"hide\":[\"FROMFIXED\",\"TOFIXED\"]},\"DOUBLE\":{\"show\":[\"FROMFIXED\",\"TOFIXED\"],\"hide\":[]}}}', 7),
(355, 'SKIN', 'select', 'FLAT\r\nHTML5\r\nMODERN\r\nNICE\r\nSIMPLE', '', 8),
(355, 'USEVALUES', 'select', 'NO\r\nYES', '{\"case\":{\"YES\":{\"show\":[\"VALUES\"],\"hide\":[\"MINVALUE\", \"MAXVALUE\", \"GRIDSNAP\", \"GRIDSTEP\"]},\"NO\":{\"show\":[\"MINVALUE\", \"MAXVALUE\", \"GRIDSNAP\", \"GRIDSTEP\"],\"hide\":[\"VALUES\"]}}}', 9),
(355, 'VALUES', 'textarea', '', '', 10),
(355, 'MINVALUE', 'textbox', '0', 'numeric', 11),
(355, 'MAXVALUE', 'textbox', '100', 'numeric', 12),
(355, 'GRID', 'select', 'YES\r\nNO', '', 13),
(355, 'GRIDSNAP', 'select', 'NO\r\nYES', '', 14),
(355, 'GRIDSTEP', 'textbox', '10', 'numeric', 15),
(355, 'FORCEEDGES', 'select', 'YES\r\nNO', '', 16),
(355, 'FROMFIXED', 'select', 'NO\r\nYES', '', 17),
(355, 'TOFIXED', 'select', 'NO\r\nYES', '', 18),
(355, 'KEYBOARD', 'select', 'NO\r\nYES', '', 19),
(355, 'READONLY', 'select', 'NO\r\nYES', '', 20),
(355, 'COMPONENTTYPE', 'hidden', '355', '', 21),
(2424, 'NAME', 'textbox', '', '', 0),
(2424, 'CAPTION', 'textbox', '', '', 1),
(2424, 'ADDITIONALATTRIBUTES', 'textarea', '', '', 2),
(2424, 'DESCRIPTION', 'textarea', '', '', 3),
(2424, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', '', 4),
(2424, 'THEME', 'select', 'LIGHT\r\nDARK', '', 5),
(2424, 'TYPE', 'select', 'IMAGE\r\nAUDIO', '', 6),
(2424, 'SIZE', 'select', 'NORMAL\r\nCOMPACT\r\nINVISIBLE', '', 7),
(2424, 'COMPONENTTYPE', 'hidden', '2424', '', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_conditions`
--

CREATE TABLE `hud_rsform_conditions` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `action` varchar(16) NOT NULL,
  `block` tinyint(1) NOT NULL,
  `component_id` int(11) NOT NULL,
  `condition` varchar(16) NOT NULL,
  `lang_code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_conditions`
--

INSERT INTO `hud_rsform_conditions` (`id`, `form_id`, `action`, `block`, `component_id`, `condition`, `lang_code`) VALUES
(1, 1, 'show', 1, 10, 'all', 'ru-RU'),
(2, 2, 'show', 1, 18, 'all', 'ru-RU'),
(3, 3, 'show', 1, 30, 'all', 'ru-RU');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_condition_details`
--

CREATE TABLE `hud_rsform_condition_details` (
  `id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `operator` varchar(16) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_condition_details`
--

INSERT INTO `hud_rsform_condition_details` (`id`, `condition_id`, `component_id`, `operator`, `value`) VALUES
(1, 1, 9, 'is', 'Компания'),
(2, 2, 17, 'is', 'Компания'),
(3, 3, 29, 'is', 'Компания');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_config`
--

CREATE TABLE `hud_rsform_config` (
  `SettingName` varchar(64) NOT NULL DEFAULT '',
  `SettingValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_config`
--

INSERT INTO `hud_rsform_config` (`SettingName`, `SettingValue`) VALUES
('allow_unsafe', '0'),
('backup.mask', 'backup-{domain}-{date}'),
('calculations.decimal', '.'),
('calculations.nodecimals', '2'),
('calculations.thousands', ','),
('deleteafter.interval', '10'),
('deleteafter.last_run', '1567081445'),
('global.codemirror', '0'),
('global.date_mask', 'Y-m-d H:i:s'),
('global.default_layout', 'bootstrap4'),
('global.default_load_layout_framework', '0'),
('global.disable_multilanguage', '0'),
('global.filtering', 'joomla'),
('global.grid_show_previews', '1'),
('global.register.code', ''),
('google.api_key', ''),
('recaptchav2.asyncdefer', '0'),
('recaptchav2.language', 'site'),
('recaptchav2.noscript', '1'),
('recaptchav2.secret.key', '6LcR4aYUAAAAACzCFs7e4gDXHq8-ho_thLdI2vfg'),
('recaptchav2.site.key', '6LcR4aYUAAAAAHBszJG8jh7yu1y412LsS3yCH0OC'),
('request_timeout', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_directory`
--

CREATE TABLE `hud_rsform_directory` (
  `formId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL DEFAULT 'export.pdf',
  `enablepdf` tinyint(1) NOT NULL,
  `enablecsv` tinyint(1) NOT NULL,
  `ViewLayout` longtext NOT NULL,
  `ViewLayoutName` text NOT NULL,
  `ViewLayoutAutogenerate` tinyint(1) NOT NULL,
  `CSS` text NOT NULL,
  `JS` text NOT NULL,
  `ListScript` text NOT NULL,
  `DetailsScript` text NOT NULL,
  `EmailsScript` text NOT NULL,
  `EmailsCreatedScript` text NOT NULL,
  `groups` text NOT NULL,
  `DeletionGroups` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_directory_fields`
--

CREATE TABLE `hud_rsform_directory_fields` (
  `formId` int(11) NOT NULL,
  `componentId` int(11) NOT NULL,
  `viewable` tinyint(1) NOT NULL,
  `searchable` tinyint(1) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `indetails` tinyint(1) NOT NULL,
  `incsv` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_emails`
--

CREATE TABLE `hud_rsform_emails` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `replyto` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_forms`
--

CREATE TABLE `hud_rsform_forms` (
  `FormId` int(11) NOT NULL,
  `FormName` text NOT NULL,
  `FormLayout` longtext NOT NULL,
  `GridLayout` mediumtext NOT NULL,
  `FormLayoutName` text NOT NULL,
  `LoadFormLayoutFramework` tinyint(1) NOT NULL DEFAULT '1',
  `FormLayoutAutogenerate` tinyint(1) NOT NULL DEFAULT '1',
  `FormLayoutFlow` tinyint(1) NOT NULL DEFAULT '0',
  `DisableSubmitButton` tinyint(1) NOT NULL DEFAULT '0',
  `RemoveCaptchaLogged` tinyint(1) NOT NULL DEFAULT '0',
  `CSS` text NOT NULL,
  `JS` text NOT NULL,
  `FormTitle` text NOT NULL,
  `ShowFormTitle` tinyint(1) NOT NULL DEFAULT '1',
  `Published` tinyint(1) NOT NULL DEFAULT '1',
  `Lang` varchar(255) NOT NULL DEFAULT '',
  `ReturnUrl` text NOT NULL,
  `ShowSystemMessage` tinyint(1) NOT NULL DEFAULT '1',
  `ShowThankyou` tinyint(1) NOT NULL DEFAULT '1',
  `ScrollToThankYou` tinyint(1) NOT NULL DEFAULT '0',
  `ThankYouMessagePopUp` tinyint(1) NOT NULL DEFAULT '0',
  `Thankyou` text NOT NULL,
  `ShowContinue` tinyint(1) NOT NULL DEFAULT '1',
  `UserEmailText` text NOT NULL,
  `UserEmailTo` text NOT NULL,
  `UserEmailCC` varchar(255) NOT NULL,
  `UserEmailBCC` varchar(255) NOT NULL,
  `UserEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `UserEmailReplyTo` varchar(255) NOT NULL,
  `UserEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `UserEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `UserEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `UserEmailAttach` tinyint(4) NOT NULL,
  `UserEmailAttachFile` varchar(255) NOT NULL,
  `AdminEmailText` text NOT NULL,
  `AdminEmailTo` text NOT NULL,
  `AdminEmailCC` varchar(255) NOT NULL,
  `AdminEmailBCC` varchar(255) NOT NULL,
  `AdminEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailReplyTo` varchar(255) NOT NULL,
  `AdminEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `DeletionEmailText` text NOT NULL,
  `DeletionEmailTo` text NOT NULL,
  `DeletionEmailCC` varchar(255) NOT NULL,
  `DeletionEmailBCC` varchar(255) NOT NULL,
  `DeletionEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `DeletionEmailReplyTo` varchar(255) NOT NULL,
  `DeletionEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `DeletionEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `DeletionEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `ScriptProcess` text NOT NULL,
  `ScriptProcess2` text NOT NULL,
  `ScriptBeforeDisplay` text NOT NULL,
  `ScriptBeforeValidation` text NOT NULL,
  `ScriptDisplay` text NOT NULL,
  `UserEmailScript` text NOT NULL,
  `AdminEmailScript` text NOT NULL,
  `AdditionalEmailsScript` text NOT NULL,
  `MetaTitle` tinyint(1) NOT NULL,
  `MetaDesc` text NOT NULL,
  `MetaKeywords` text NOT NULL,
  `Required` varchar(255) NOT NULL DEFAULT '(*)',
  `ErrorMessage` text NOT NULL,
  `MultipleSeparator` varchar(64) NOT NULL DEFAULT '\\n',
  `TextareaNewLines` tinyint(1) NOT NULL DEFAULT '1',
  `CSSClass` varchar(255) NOT NULL,
  `CSSId` varchar(255) NOT NULL DEFAULT 'userForm',
  `CSSName` varchar(255) NOT NULL,
  `CSSAction` text NOT NULL,
  `CSSAdditionalAttributes` text NOT NULL,
  `AjaxValidation` tinyint(1) NOT NULL,
  `ScrollToError` tinyint(1) NOT NULL,
  `Keepdata` tinyint(1) NOT NULL DEFAULT '1',
  `KeepIP` tinyint(1) NOT NULL DEFAULT '1',
  `DeleteSubmissionsAfter` int(11) NOT NULL DEFAULT '0',
  `Backendmenu` tinyint(1) NOT NULL,
  `ConfirmSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `Access` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_forms`
--

INSERT INTO `hud_rsform_forms` (`FormId`, `FormName`, `FormLayout`, `GridLayout`, `FormLayoutName`, `LoadFormLayoutFramework`, `FormLayoutAutogenerate`, `FormLayoutFlow`, `DisableSubmitButton`, `RemoveCaptchaLogged`, `CSS`, `JS`, `FormTitle`, `ShowFormTitle`, `Published`, `Lang`, `ReturnUrl`, `ShowSystemMessage`, `ShowThankyou`, `ScrollToThankYou`, `ThankYouMessagePopUp`, `Thankyou`, `ShowContinue`, `UserEmailText`, `UserEmailTo`, `UserEmailCC`, `UserEmailBCC`, `UserEmailFrom`, `UserEmailReplyTo`, `UserEmailFromName`, `UserEmailSubject`, `UserEmailMode`, `UserEmailAttach`, `UserEmailAttachFile`, `AdminEmailText`, `AdminEmailTo`, `AdminEmailCC`, `AdminEmailBCC`, `AdminEmailFrom`, `AdminEmailReplyTo`, `AdminEmailFromName`, `AdminEmailSubject`, `AdminEmailMode`, `DeletionEmailText`, `DeletionEmailTo`, `DeletionEmailCC`, `DeletionEmailBCC`, `DeletionEmailFrom`, `DeletionEmailReplyTo`, `DeletionEmailFromName`, `DeletionEmailSubject`, `DeletionEmailMode`, `ScriptProcess`, `ScriptProcess2`, `ScriptBeforeDisplay`, `ScriptBeforeValidation`, `ScriptDisplay`, `UserEmailScript`, `AdminEmailScript`, `AdditionalEmailsScript`, `MetaTitle`, `MetaDesc`, `MetaKeywords`, `Required`, `ErrorMessage`, `MultipleSeparator`, `TextareaNewLines`, `CSSClass`, `CSSId`, `CSSName`, `CSSAction`, `CSSAdditionalAttributes`, `AjaxValidation`, `ScrollToError`, `Keepdata`, `KeepIP`, `DeleteSubmissionsAfter`, `Backendmenu`, `ConfirmSubmission`, `Access`) VALUES
(1, 'obratnaya-svyaz', '{error}\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<fieldset class=\"formContainer\" id=\"rsform_{global:formid}_page_0\">\n	<div class=\"form-row\">\n		<div class=\"col-12\">\n			<div class=\"form-group rsform-block rsform-block-company{Company:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Company:description}\" for=\"Company\">{Company:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{Company:body}\n					<div><span class=\"formValidation\">{Company:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-site-comp{Site_comp:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Site_comp:description}\" for=\"Site_comp\">{Site_comp:caption}</label>\n				<div class=\"formControls\">\n					{Site_comp:body}\n					<div><span class=\"formValidation\">{Site_comp:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-city{City:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{City:description}\" for=\"City\">{City:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{City:body}\n					<div><span class=\"formValidation\">{City:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-address-comp{Address_comp:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Address_comp:description}\" for=\"Address_comp\">{Address_comp:caption}</label>\n				<div class=\"formControls\">\n					{Address_comp:body}\n					<div><span class=\"formValidation\">{Address_comp:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-fullname{FullName:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{FullName:description}\" for=\"FullName\">{FullName:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{FullName:body}\n					<div><span class=\"formValidation\">{FullName:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-position-comp{Position_comp:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Position_comp:description}\" for=\"Position_comp\">{Position_comp:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{Position_comp:body}\n					<div><span class=\"formValidation\">{Position_comp:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-phone{Phone:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Phone:description}\" for=\"Phone\">{Phone:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{Phone:body}\n					<div><span class=\"formValidation\">{Phone:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-email{Email:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Email:description}\" for=\"Email\">{Email:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{Email:body}\n					<div><span class=\"formValidation\">{Email:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-message{Message:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Message:description}\" for=\"Message\">{Message:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{Message:body}\n					<div><span class=\"formValidation\">{Message:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-personaldata{PersonalData:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{PersonalData:description}\">{PersonalData:caption}<strong class=\"formRequired\">*</strong></label>\n				<div class=\"formControls\">\n					{PersonalData:body}\n					<div><span class=\"formValidation\">{PersonalData:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-recaptcha{reCAPTCHA:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{reCAPTCHA:description}\" for=\"reCAPTCHA\">{reCAPTCHA:caption}</label>\n				<div class=\"formControls\">\n					{reCAPTCHA:body}\n					<div><span class=\"formValidation\">{reCAPTCHA:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-submit{Submit:errorClass}\">\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Submit:description}\" for=\"Submit\">{Submit:caption}</label>\n				<div class=\"formControls\">\n					{Submit:body}\n					<div><span class=\"formValidation\">{Submit:validation}</span></div>\n				</div>\n			</div>\n			<div class=\"form-group rsform-block rsform-block-agreement{agreement:errorClass}\">\n					{agreement:body}\n			</div>\n		</div>\n	</div>\n</fieldset>', '[[{\"columns\":[[\"9\",\"10\",\"12\",\"5\",\"13\",\"1\",\"14\",\"4\",\"2\",\"6\",\"8\",\"7\",\"11\",\"3\",\"15\",\"16\"]],\"sizes\":[\"12\"]}],[]]', 'bootstrap4', 0, 1, 1, 0, 0, '', '', 'RSForm! Pro example', 0, 1, 'en-GB', '', 1, 1, 1, 1, '<p>Dear {FullName:value},</p><p> thank you for your submission. One of our staff members will contact you by  {ContactBy:value} as soon as possible.</p>', 1, '<p>Dear {FullName:value},</p><p> we received your contact request. Someone will get back to you by {ContactBy:value} soon. </p>', '{Email:value}', '', '', 'info@cottagemode.ru', '', '{global:fromname}', 'Contact confirmation', 1, 0, '', '<p>Customize this e-mail also. You will receive it as administrator. </p><p>{FullName:caption}:{FullName:value}<br />\n{Email:caption}:{Email:value}<br />\n{CompanySize:caption}:{CompanySize:value}<br />\n{Position:caption}:{Position:value}<br />\n{ContactBy:caption}:{ContactBy:value}<br />\n{ContactWhen:caption}:{ContactWhen:value}</p>', 'info@cottagemode.ru', 'roman.korytin@utsrus.com,platon.baskov@utsrus.com', '', '{Email:value}', '', '{FullName:value}', 'Contact', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', '', '', '', 0, '', '', '*', '', '\\n', 1, 'miForm', 'dealerForm', '', '', 'onsubmit=\"ga(\'send\', \'event\', \'dealerForm\', \'submit\'); yaCounter46266303.reachGoal(\'dealerForm\'); return true;\"', 1, 0, 1, 1, 0, 0, 0, ''),
(2, 'orderForm', '<h2>{global:formtitle}</h2>\r\n{error}\r\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\r\n<fieldset class=\"formContainer\" id=\"rsform_{global:formid}_page_0\">\r\n	<div class=\"form-row\">\r\n		<div class=\"col-12\">\r\n			<div class=\"form-group rsform-block rsform-block-radiobutton{Radiobutton:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Radiobutton:description}\">{Radiobutton:caption}</label>\r\n				<div class=\"formControls\">\r\n					{Radiobutton:body}\r\n					<div><span class=\"formValidation\">{Radiobutton:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-company{Company:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Company:description}\" for=\"Company\">{Company:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Company:body}\r\n					<div><span class=\"formValidation\">{Company:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-fullname{FullName:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{FullName:description}\" for=\"FullName\">{FullName:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{FullName:body}\r\n					<div><span class=\"formValidation\">{FullName:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-phone{Phone:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Phone:description}\" for=\"Phone\">{Phone:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Phone:body}\r\n					<div><span class=\"formValidation\">{Phone:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-email{Email:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Email:description}\" for=\"Email\">{Email:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Email:body}\r\n					<div><span class=\"formValidation\">{Email:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-city{City:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{City:description}\" for=\"City\">{City:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{City:body}\r\n					<div><span class=\"formValidation\">{City:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-message{Message:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Message:description}\" for=\"Message\">{Message:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Message:body}\r\n					<div><span class=\"formValidation\">{Message:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-personaldata{PersonalData:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{PersonalData:description}\">{PersonalData:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{PersonalData:body}\r\n					<div><span class=\"formValidation\">{PersonalData:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-recaptcha{reCAPTCHA:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{reCAPTCHA:description}\" for=\"reCAPTCHA\">{reCAPTCHA:caption}</label>\r\n				<div class=\"formControls\">\r\n					{reCAPTCHA:body}\r\n					<div><span class=\"formValidation\">{reCAPTCHA:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-submit{Submit:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Submit:description}\" for=\"Submit\">{Submit:caption}</label>\r\n				<div class=\"formControls\">\r\n					{Submit:body}\r\n					<div><span class=\"formValidation\">{Submit:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-agreement{agreement:errorClass}\">\r\n					{agreement:body}\r\n			</div>\r\n		</div>\r\n	</div>\r\n</fieldset>', '[[{\"columns\":[[\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"27\",\"26\",\"28\"]],\"sizes\":[\"12\"]}],[]]', 'bootstrap4', 0, 1, 1, 0, 0, '', '', 'RSForm! Pro example copy', 1, 1, 'en-GB', '', 1, 1, 1, 0, '<p>Dear {FullName:value},</p><p> thank you for your submission. One of our staff members will contact you by  {ContactBy:value} as soon as possible.</p>', 1, '<p>Dear {FullName:value},</p><p> we received your contact request. Someone will get back to you by {ContactBy:value} soon. </p>', '{Email:value}', '', '', 'info@cottagemode.ru', '', '{global:fromname}', 'Contact confirmation', 1, 0, '', '<p>Customize this e-mail also. You will receive it as administrator. </p><p>{FullName:caption}:{FullName:value}<br />\n{Email:caption}:{Email:value}<br />\n{CompanySize:caption}:{CompanySize:value}<br />\n{Position:caption}:{Position:value}<br />\n{ContactBy:caption}:{ContactBy:value}<br />\n{ContactWhen:caption}:{ContactWhen:value}</p>', 'info@cottagemode.ru', 'roman.korytin@utsrus.com,platon.baskov@utsrus.com', '', '{Email:value}', '', '{FullName:value}', 'Contact', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', '', '', '', 0, '', '', '*', '', '\\n', 1, 'miForm', 'orderForm', '', '', 'onsubmit=\"ga(\'send\', \'event\', \'orderForm\', \'submit\'); yaCounter46266303.reachGoal(\'orderForm\'); return true;\"', 1, 0, 1, 1, 0, 0, 0, ''),
(3, 'ask-question', '<h2>{global:formtitle}</h2>\r\n{error}\r\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\r\n<fieldset class=\"formContainer\" id=\"rsform_{global:formid}_page_0\">\r\n	<div class=\"form-row\">\r\n		<div class=\"col-12\">\r\n			<div class=\"form-group rsform-block rsform-block-text{Text:errorClass}\">\r\n					{Text:body}\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-fullname{FullName:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{FullName:description}\" for=\"FullName\">{FullName:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{FullName:body}\r\n					<div><span class=\"formValidation\">{FullName:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-email{Email:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Email:description}\" for=\"Email\">{Email:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Email:body}\r\n					<div><span class=\"formValidation\">{Email:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-category{Category:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Category:description}\" for=\"Category\">{Category:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Category:body}\r\n					<div><span class=\"formValidation\">{Category:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-message{Message:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Message:description}\" for=\"Message\">{Message:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{Message:body}\r\n					<div><span class=\"formValidation\">{Message:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-personaldata{PersonalData:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{PersonalData:description}\">{PersonalData:caption}<strong class=\"formRequired\">*</strong></label>\r\n				<div class=\"formControls\">\r\n					{PersonalData:body}\r\n					<div><span class=\"formValidation\">{PersonalData:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-recaptcha{reCAPTCHA:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{reCAPTCHA:description}\" for=\"reCAPTCHA\">{reCAPTCHA:caption}</label>\r\n				<div class=\"formControls\">\r\n					{reCAPTCHA:body}\r\n					<div><span class=\"formValidation\">{reCAPTCHA:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-submit{Submit:errorClass}\">\r\n				<label class=\"control-label formControlLabel\" data-toggle=\"tooltip\" title=\"{Submit:description}\" for=\"Submit\">{Submit:caption}</label>\r\n				<div class=\"formControls\">\r\n					{Submit:body}\r\n					<div><span class=\"formValidation\">{Submit:validation}</span></div>\r\n				</div>\r\n			</div>\r\n			<div class=\"form-group rsform-block rsform-block-agreement{agreement:errorClass}\">\r\n					{agreement:body}\r\n			</div>\r\n		</div>\r\n	</div>\r\n</fieldset>', '[[{\"columns\":[[\"38\",\"29\",\"30\",\"31\",\"32\",\"39\",\"33\",\"34\",\"35\",\"36\",\"37\",\"40\"]],\"sizes\":[\"12\"]}],[]]', 'bootstrap4', 0, 1, 1, 0, 0, '', '', 'RSForm! Pro example copy', 1, 1, 'en-GB', '', 1, 1, 1, 0, '<p>Dear {FullName:value},</p><p> thank you for your submission. One of our staff members will contact you by  {ContactBy:value} as soon as possible.</p>', 1, '<p>Dear {FullName:value},</p><p> we received your contact request. Someone will get back to you by {ContactBy:value} soon. </p>', '{Email:value}', '', '', 'info@cottagemode.ru', '', '{global:fromname}', 'Contact confirmation', 1, 0, '', '<p>Customize this e-mail also. You will receive it as administrator. </p><p>{FullName:caption}:{FullName:value}<br />\n{Email:caption}:{Email:value}<br />\n{CompanySize:caption}:{CompanySize:value}<br />\n{Position:caption}:{Position:value}<br />\n{ContactBy:caption}:{ContactBy:value}<br />\n{ContactWhen:caption}:{ContactWhen:value}</p>', 'info@cottagemode.ru', 'roman.korytin@utsrus.com,platon.baskov@utsrus.com', '', '{Email:value}', '', '{FullName:value}', 'Contact', 1, '', '', '', '', '', '', '', '', 1, '', '', '', '', '', '', '', '', 0, '', '', '*', '', '\\n', 1, 'miForm', 'questionForm', '', '', 'onsubmit=\"ga(\'send\', \'event\', \'questionForm\', \'submit\'); yaCounter46266303.reachGoal(\'questionForm\'); return true;\"', 1, 0, 1, 1, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_mappings`
--

CREATE TABLE `hud_rsform_mappings` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `connection` tinyint(1) NOT NULL,
  `host` varchar(255) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `port` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `method` tinyint(1) NOT NULL,
  `table` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `wheredata` text NOT NULL,
  `extra` text NOT NULL,
  `andor` text NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_posts`
--

CREATE TABLE `hud_rsform_posts` (
  `form_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `method` tinyint(1) NOT NULL,
  `fields` mediumtext NOT NULL,
  `silent` tinyint(1) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_posts`
--

INSERT INTO `hud_rsform_posts` (`form_id`, `enabled`, `method`, `fields`, `silent`, `url`) VALUES
(1, 0, 1, '[]', 1, 'http://'),
(2, 0, 1, '[]', 1, 'http://'),
(3, 0, 1, '[]', 1, 'http://');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_properties`
--

CREATE TABLE `hud_rsform_properties` (
  `PropertyId` int(11) NOT NULL,
  `ComponentId` int(11) NOT NULL DEFAULT '0',
  `PropertyName` text NOT NULL,
  `PropertyValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_properties`
--

INSERT INTO `hud_rsform_properties` (`PropertyId`, `ComponentId`, `PropertyName`, `PropertyValue`) VALUES
(1, 1, 'NAME', 'FullName'),
(2, 1, 'CAPTION', 'Full Name'),
(3, 1, 'REQUIRED', 'YES'),
(4, 1, 'SIZE', '35'),
(5, 1, 'MAXSIZE', ''),
(6, 1, 'VALIDATIONRULE', 'regex'),
(7, 1, 'VALIDATIONMESSAGE', 'Please type your full name.'),
(8, 1, 'ADDITIONALATTRIBUTES', ''),
(9, 1, 'DEFAULTVALUE', ''),
(10, 1, 'DESCRIPTION', ''),
(11, 1, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(12, 1, 'INPUTTYPE', 'text'),
(13, 1, 'ATTRMIN', ''),
(14, 1, 'ATTRMAX', ''),
(15, 1, 'ATTRSTEP', ''),
(16, 1, 'EMAILATTACH', ''),
(17, 1, 'PLACEHOLDER', ''),
(18, 2, 'NAME', 'Email'),
(19, 2, 'CAPTION', 'E-mail'),
(20, 2, 'REQUIRED', 'YES'),
(21, 2, 'SIZE', '20'),
(22, 2, 'MAXSIZE', ''),
(23, 2, 'VALIDATIONRULE', 'email'),
(24, 2, 'VALIDATIONMESSAGE', 'Invalid email address.'),
(25, 2, 'ADDITIONALATTRIBUTES', ''),
(26, 2, 'DEFAULTVALUE', ''),
(27, 2, 'DESCRIPTION', ''),
(28, 2, 'VALIDATIONEXTRA', ''),
(29, 2, 'INPUTTYPE', 'email'),
(30, 2, 'ATTRMIN', ''),
(31, 2, 'ATTRMAX', ''),
(32, 2, 'ATTRSTEP', ''),
(33, 2, 'EMAILATTACH', ''),
(34, 2, 'PLACEHOLDER', 'Пожалуйста, введите свой e-mail'),
(35, 3, 'NAME', 'Submit'),
(36, 3, 'LABEL', 'Submit'),
(37, 3, 'CAPTION', ''),
(38, 3, 'RESET', 'NO'),
(39, 3, 'RESETLABEL', 'Reset'),
(40, 3, 'ADDITIONALATTRIBUTES', 'onclick=\"ym(46266303, \'reachGoal\', \'ZOLOTO\'); return true;\" disabled'),
(41, 3, 'DISPLAYPROGRESS', 'AUTO'),
(42, 3, 'BUTTONTYPE', 'TYPEBUTTON'),
(43, 3, 'EMAILATTACH', ''),
(44, 4, 'NAME', 'Phone'),
(45, 4, 'CAPTION', 'Телефон'),
(46, 4, 'DEFAULTVALUE', ''),
(47, 4, 'DESCRIPTION', ''),
(48, 4, 'REQUIRED', 'YES'),
(49, 4, 'VALIDATIONEXTRA', '+,(,),-, ,'),
(50, 4, 'VALIDATIONRULE', 'numeric'),
(51, 4, 'VALIDATIONMESSAGE', 'Введите номер телефона'),
(52, 4, 'INPUTTYPE', 'tel'),
(53, 4, 'ATTRMIN', ''),
(54, 4, 'ATTRMAX', ''),
(55, 4, 'ATTRSTEP', '1'),
(56, 4, 'SIZE', ''),
(57, 4, 'MAXSIZE', '32'),
(58, 4, 'PLACEHOLDER', ''),
(59, 4, 'ADDITIONALATTRIBUTES', ''),
(60, 4, 'EMAILATTACH', ''),
(61, 5, 'NAME', 'City'),
(62, 5, 'CAPTION', 'Ваш город'),
(63, 5, 'DEFAULTVALUE', ''),
(64, 5, 'DESCRIPTION', ''),
(65, 5, 'REQUIRED', 'YES'),
(66, 5, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(67, 5, 'VALIDATIONRULE', 'regex'),
(68, 5, 'VALIDATIONMESSAGE', 'Укажите город'),
(69, 5, 'INPUTTYPE', 'text'),
(70, 5, 'ATTRMIN', ''),
(71, 5, 'ATTRMAX', ''),
(72, 5, 'ATTRSTEP', '1'),
(73, 5, 'SIZE', '32'),
(74, 5, 'MAXSIZE', ''),
(75, 5, 'PLACEHOLDER', 'Пожалуйста, введите Ваш город'),
(76, 5, 'ADDITIONALATTRIBUTES', ''),
(77, 5, 'EMAILATTACH', ''),
(78, 6, 'NAME', 'Message'),
(79, 6, 'CAPTION', 'Ваше сообщение'),
(80, 6, 'DEFAULTVALUE', ''),
(81, 6, 'DESCRIPTION', ''),
(82, 6, 'REQUIRED', 'YES'),
(83, 6, 'VALIDATIONRULE', 'regex'),
(84, 6, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\\"\\­«\\»\\\'\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(85, 6, 'VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(86, 6, 'COLS', '50'),
(87, 6, 'ROWS', '10'),
(88, 6, 'PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(89, 6, 'WYSIWYG', 'NO'),
(90, 6, 'WYSIWYGBUTTONS', 'NO'),
(91, 6, 'MAXSIZE', ''),
(92, 6, 'SHOW_CHAR_COUNT', 'NO'),
(93, 6, 'ADDITIONALATTRIBUTES', ''),
(94, 6, 'EMAILATTACH', ''),
(95, 7, 'NAME', 'PersonalData'),
(96, 7, 'CAPTION', 'Я даю согласие на обработку персональных данных'),
(97, 7, 'ITEMS', 'Да'),
(98, 7, 'DESCRIPTION', ''),
(99, 7, 'REQUIRED', 'YES'),
(100, 7, 'VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(101, 7, 'FLOW', 'HORIZONTAL'),
(102, 7, 'ADDITIONALATTRIBUTES', 'onchange=\"document.getElementById(\'Submit\').disabled = !this.checked\" class=\"custom-control-labels\"'),
(103, 7, 'EMAILATTACH', ''),
(104, 8, 'NAME', 'Captcha'),
(105, 8, 'CAPTION', ''),
(106, 8, 'DESCRIPTION', ''),
(107, 8, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(108, 8, 'LENGTH', '4'),
(109, 8, 'IMAGETYPE', 'INVISIBLE'),
(110, 8, 'BACKGROUNDCOLOR', '#FFFFFF'),
(111, 8, 'TEXTCOLOR', '#000000'),
(112, 8, 'TYPE', 'ALPHA'),
(113, 8, 'FLOW', 'VERTICAL'),
(114, 8, 'SHOWREFRESH', 'YES'),
(115, 8, 'REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(116, 8, 'SIZE', '15'),
(117, 8, 'ADDITIONALATTRIBUTES', ''),
(118, 8, 'EMAILATTACH', ''),
(119, 9, 'NAME', 'Radiobutton'),
(120, 9, 'CAPTION', ''),
(121, 9, 'ITEMS', 'Частное лицо\nКомпания'),
(122, 9, 'DESCRIPTION', ''),
(123, 9, 'REQUIRED', 'NO'),
(124, 9, 'VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(125, 9, 'FLOW', 'VERTICAL'),
(126, 9, 'ADDITIONALATTRIBUTES', ''),
(127, 9, 'EMAILATTACH', ''),
(128, 10, 'NAME', 'Company'),
(129, 10, 'CAPTION', 'Компания'),
(130, 10, 'DEFAULTVALUE', ''),
(131, 10, 'DESCRIPTION', ''),
(132, 10, 'REQUIRED', 'YES'),
(133, 10, 'VALIDATIONEXTRA', ''),
(134, 10, 'VALIDATIONRULE', 'alphanumericaccented'),
(135, 10, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(136, 10, 'INPUTTYPE', 'text'),
(137, 10, 'ATTRMIN', ''),
(138, 10, 'ATTRMAX', ''),
(139, 10, 'ATTRSTEP', '1'),
(140, 10, 'SIZE', '20'),
(141, 10, 'MAXSIZE', '20'),
(142, 10, 'PLACEHOLDER', 'Пожалуйста, введите название компании'),
(143, 10, 'ADDITIONALATTRIBUTES', ''),
(144, 10, 'EMAILATTACH', ''),
(145, 11, 'NAME', 'reCAPTCHA'),
(146, 11, 'CAPTION', ''),
(147, 11, 'DESCRIPTION', ''),
(148, 11, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(149, 11, 'THEME', 'DARK'),
(150, 11, 'TYPE', 'IMAGE'),
(151, 11, 'SIZE', 'INVISIBLE'),
(152, 11, 'ADDITIONALATTRIBUTES', ''),
(153, 11, 'EMAILATTACH', ''),
(154, 12, 'NAME', 'Site_comp'),
(155, 12, 'CAPTION', 'Сайт компании'),
(156, 12, 'DEFAULTVALUE', ''),
(157, 12, 'DESCRIPTION', ''),
(158, 12, 'REQUIRED', 'NO'),
(159, 12, 'VALIDATIONEXTRA', ''),
(160, 12, 'VALIDATIONRULE', 'none'),
(161, 12, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(162, 12, 'INPUTTYPE', 'text'),
(163, 12, 'ATTRMIN', ''),
(164, 12, 'ATTRMAX', ''),
(165, 12, 'ATTRSTEP', '1'),
(166, 12, 'SIZE', '20'),
(167, 12, 'MAXSIZE', '50'),
(168, 12, 'PLACEHOLDER', ''),
(169, 12, 'ADDITIONALATTRIBUTES', ''),
(170, 12, 'EMAILATTACH', ''),
(171, 13, 'NAME', 'Address_comp'),
(172, 13, 'CAPTION', 'Адрес Компании'),
(173, 13, 'DEFAULTVALUE', ''),
(174, 13, 'DESCRIPTION', ''),
(175, 13, 'REQUIRED', 'NO'),
(176, 13, 'VALIDATIONEXTRA', ''),
(177, 13, 'VALIDATIONRULE', 'none'),
(178, 13, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(179, 13, 'INPUTTYPE', 'text'),
(180, 13, 'ATTRMIN', ''),
(181, 13, 'ATTRMAX', ''),
(182, 13, 'ATTRSTEP', '1'),
(183, 13, 'SIZE', '20'),
(184, 13, 'MAXSIZE', '50'),
(185, 13, 'PLACEHOLDER', ''),
(186, 13, 'ADDITIONALATTRIBUTES', ''),
(187, 13, 'EMAILATTACH', ''),
(188, 14, 'NAME', 'Position_comp'),
(189, 14, 'CAPTION', 'должность'),
(190, 14, 'DEFAULTVALUE', ''),
(191, 14, 'DESCRIPTION', ''),
(192, 14, 'REQUIRED', 'YES'),
(193, 14, 'VALIDATIONEXTRA', ''),
(194, 14, 'VALIDATIONRULE', 'alphaaccented'),
(195, 14, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(196, 14, 'INPUTTYPE', 'text'),
(197, 14, 'ATTRMIN', ''),
(198, 14, 'ATTRMAX', ''),
(199, 14, 'ATTRSTEP', '1'),
(200, 14, 'SIZE', '20'),
(201, 14, 'MAXSIZE', '100'),
(202, 14, 'PLACEHOLDER', ''),
(203, 14, 'ADDITIONALATTRIBUTES', ''),
(204, 14, 'EMAILATTACH', ''),
(205, 15, 'NAME', 'agreement'),
(206, 15, 'TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>'),
(207, 15, 'EMAILATTACH', ''),
(208, 17, 'NAME', 'Radiobutton'),
(209, 17, 'CAPTION', ''),
(210, 17, 'ITEMS', 'Частное лицо\nКомпания'),
(211, 17, 'DESCRIPTION', ''),
(212, 17, 'REQUIRED', 'NO'),
(213, 17, 'VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(214, 17, 'FLOW', 'VERTICAL'),
(215, 17, 'ADDITIONALATTRIBUTES', ''),
(216, 17, 'EMAILATTACH', ''),
(217, 18, 'NAME', 'Company'),
(218, 18, 'CAPTION', 'Компания'),
(219, 18, 'DEFAULTVALUE', ''),
(220, 18, 'DESCRIPTION', ''),
(221, 18, 'REQUIRED', 'YES'),
(222, 18, 'VALIDATIONEXTRA', ''),
(223, 18, 'VALIDATIONRULE', 'alphanumericaccented'),
(224, 18, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(225, 18, 'INPUTTYPE', 'text'),
(226, 18, 'ATTRMIN', ''),
(227, 18, 'ATTRMAX', ''),
(228, 18, 'ATTRSTEP', '1'),
(229, 18, 'SIZE', '20'),
(230, 18, 'MAXSIZE', '20'),
(231, 18, 'PLACEHOLDER', 'Пожалуйста, введите название компании'),
(232, 18, 'ADDITIONALATTRIBUTES', ''),
(233, 18, 'EMAILATTACH', ''),
(234, 19, 'NAME', 'FullName'),
(235, 19, 'CAPTION', 'Full Name'),
(236, 19, 'REQUIRED', 'YES'),
(237, 19, 'SIZE', '35'),
(238, 19, 'MAXSIZE', ''),
(239, 19, 'VALIDATIONRULE', 'regex'),
(240, 19, 'VALIDATIONMESSAGE', 'Please type your full name.'),
(241, 19, 'ADDITIONALATTRIBUTES', 'placeholder=\"Пожалуйста, введите Ваше имя\"'),
(242, 19, 'DEFAULTVALUE', ''),
(243, 19, 'DESCRIPTION', ''),
(244, 19, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(245, 19, 'INPUTTYPE', 'text'),
(246, 19, 'ATTRMIN', ''),
(247, 19, 'ATTRMAX', ''),
(248, 19, 'ATTRSTEP', ''),
(249, 19, 'EMAILATTACH', ''),
(250, 20, 'NAME', 'Phone'),
(251, 20, 'CAPTION', 'Телефон'),
(252, 20, 'DEFAULTVALUE', ''),
(253, 20, 'DESCRIPTION', ''),
(254, 20, 'REQUIRED', 'YES'),
(255, 20, 'VALIDATIONEXTRA', '+,(,),-, ,'),
(256, 20, 'VALIDATIONRULE', 'numeric'),
(257, 20, 'VALIDATIONMESSAGE', 'Введите номер телефона'),
(258, 20, 'INPUTTYPE', 'tel'),
(259, 20, 'ATTRMIN', ''),
(260, 20, 'ATTRMAX', ''),
(261, 20, 'ATTRSTEP', '1'),
(262, 20, 'SIZE', ''),
(263, 20, 'MAXSIZE', '32'),
(264, 20, 'PLACEHOLDER', ''),
(265, 20, 'ADDITIONALATTRIBUTES', ''),
(266, 20, 'EMAILATTACH', ''),
(267, 21, 'NAME', 'Email'),
(268, 21, 'CAPTION', 'E-mail'),
(269, 21, 'REQUIRED', 'YES'),
(270, 21, 'SIZE', '20'),
(271, 21, 'MAXSIZE', ''),
(272, 21, 'VALIDATIONRULE', 'email'),
(273, 21, 'VALIDATIONMESSAGE', 'Invalid email address.'),
(274, 21, 'ADDITIONALATTRIBUTES', 'placeholder=\"Пожалуйста, введите свой e-mail\"'),
(275, 21, 'DEFAULTVALUE', ''),
(276, 21, 'DESCRIPTION', ''),
(277, 21, 'VALIDATIONEXTRA', ''),
(278, 21, 'INPUTTYPE', 'email'),
(279, 21, 'ATTRMIN', ''),
(280, 21, 'ATTRMAX', ''),
(281, 21, 'ATTRSTEP', ''),
(282, 21, 'EMAILATTACH', ''),
(283, 22, 'NAME', 'City'),
(284, 22, 'CAPTION', 'Ваш город'),
(285, 22, 'DEFAULTVALUE', ''),
(286, 22, 'DESCRIPTION', ''),
(287, 22, 'REQUIRED', 'YES'),
(288, 22, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(289, 22, 'VALIDATIONRULE', 'regex'),
(290, 22, 'VALIDATIONMESSAGE', 'Укажите город'),
(291, 22, 'INPUTTYPE', 'text'),
(292, 22, 'ATTRMIN', ''),
(293, 22, 'ATTRMAX', ''),
(294, 22, 'ATTRSTEP', '1'),
(295, 22, 'SIZE', '32'),
(296, 22, 'MAXSIZE', ''),
(297, 22, 'PLACEHOLDER', 'Пожалуйста, введите Ваш город'),
(298, 22, 'ADDITIONALATTRIBUTES', ''),
(299, 22, 'EMAILATTACH', ''),
(300, 23, 'NAME', 'Message'),
(301, 23, 'CAPTION', 'Ваше сообщение'),
(302, 23, 'DEFAULTVALUE', ''),
(303, 23, 'DESCRIPTION', ''),
(304, 23, 'REQUIRED', 'YES'),
(305, 23, 'VALIDATIONRULE', 'regex'),
(306, 23, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\\"\\­«\\»\\\'\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(307, 23, 'VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(308, 23, 'COLS', '50'),
(309, 23, 'ROWS', '10'),
(310, 23, 'PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(311, 23, 'WYSIWYG', 'NO'),
(312, 23, 'WYSIWYGBUTTONS', 'NO'),
(313, 23, 'MAXSIZE', ''),
(314, 23, 'SHOW_CHAR_COUNT', 'NO'),
(315, 23, 'ADDITIONALATTRIBUTES', ''),
(316, 23, 'EMAILATTACH', ''),
(317, 24, 'NAME', 'Captcha'),
(318, 24, 'CAPTION', ''),
(319, 24, 'DESCRIPTION', ''),
(320, 24, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(321, 24, 'LENGTH', '4'),
(322, 24, 'IMAGETYPE', 'INVISIBLE'),
(323, 24, 'BACKGROUNDCOLOR', '#FFFFFF'),
(324, 24, 'TEXTCOLOR', '#000000'),
(325, 24, 'TYPE', 'ALPHA'),
(326, 24, 'FLOW', 'VERTICAL'),
(327, 24, 'SHOWREFRESH', 'YES'),
(328, 24, 'REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(329, 24, 'SIZE', '15'),
(330, 24, 'ADDITIONALATTRIBUTES', ''),
(331, 24, 'EMAILATTACH', ''),
(332, 25, 'NAME', 'PersonalData'),
(333, 25, 'CAPTION', 'Я даю согласие на обработку персональных данных'),
(334, 25, 'ITEMS', 'Да'),
(335, 25, 'DESCRIPTION', ''),
(336, 25, 'REQUIRED', 'YES'),
(337, 25, 'VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(338, 25, 'FLOW', 'HORIZONTAL'),
(339, 25, 'ADDITIONALATTRIBUTES', 'onchange=\"document.getElementById(\'Submit\').disabled = !this.checked\"'),
(340, 25, 'EMAILATTACH', ''),
(341, 25, 'MAXSELECTIONS', ''),
(342, 26, 'NAME', 'Submit'),
(343, 26, 'LABEL', 'Submit'),
(344, 26, 'CAPTION', ''),
(345, 26, 'RESET', 'NO'),
(346, 26, 'RESETLABEL', 'Reset'),
(347, 26, 'ADDITIONALATTRIBUTES', 'disabled'),
(348, 26, 'DISPLAYPROGRESS', 'AUTO'),
(349, 26, 'BUTTONTYPE', 'TYPEBUTTON'),
(350, 26, 'EMAILATTACH', ''),
(351, 27, 'NAME', 'reCAPTCHA'),
(352, 27, 'CAPTION', ''),
(353, 27, 'DESCRIPTION', ''),
(354, 27, 'VALIDATIONMESSAGE', 'Неверный ввод капчи'),
(355, 27, 'THEME', 'DARK'),
(356, 27, 'TYPE', 'IMAGE'),
(357, 27, 'SIZE', 'INVISIBLE'),
(358, 27, 'ADDITIONALATTRIBUTES', ''),
(359, 27, 'EMAILATTACH', ''),
(360, 28, 'NAME', 'agreement'),
(361, 28, 'TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>'),
(362, 28, 'EMAILATTACH', ''),
(363, 29, 'NAME', 'Radiobutton'),
(364, 29, 'CAPTION', ''),
(365, 29, 'ITEMS', 'Частное лицо\nКомпания'),
(366, 29, 'DESCRIPTION', ''),
(367, 29, 'REQUIRED', 'NO'),
(368, 29, 'VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(369, 29, 'FLOW', 'VERTICAL'),
(370, 29, 'ADDITIONALATTRIBUTES', ''),
(371, 29, 'EMAILATTACH', ''),
(372, 30, 'NAME', 'Company'),
(373, 30, 'CAPTION', 'Компания'),
(374, 30, 'DEFAULTVALUE', ''),
(375, 30, 'DESCRIPTION', ''),
(376, 30, 'REQUIRED', 'YES'),
(377, 30, 'VALIDATIONEXTRA', ''),
(378, 30, 'VALIDATIONRULE', 'alphanumericaccented'),
(379, 30, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(380, 30, 'INPUTTYPE', 'text'),
(381, 30, 'ATTRMIN', ''),
(382, 30, 'ATTRMAX', ''),
(383, 30, 'ATTRSTEP', '1'),
(384, 30, 'SIZE', '20'),
(385, 30, 'MAXSIZE', '20'),
(386, 30, 'PLACEHOLDER', 'Пожалуйста, введите название компании'),
(387, 30, 'ADDITIONALATTRIBUTES', ''),
(388, 30, 'EMAILATTACH', ''),
(389, 31, 'NAME', 'FullName'),
(390, 31, 'CAPTION', 'Full Name'),
(391, 31, 'REQUIRED', 'YES'),
(392, 31, 'SIZE', '35'),
(393, 31, 'MAXSIZE', ''),
(394, 31, 'VALIDATIONRULE', 'regex'),
(395, 31, 'VALIDATIONMESSAGE', 'Please type your full name.'),
(396, 31, 'ADDITIONALATTRIBUTES', 'placeholder=\"Пожалуйста, введите Ваше имя\"'),
(397, 31, 'DEFAULTVALUE', ''),
(398, 31, 'DESCRIPTION', ''),
(399, 31, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(400, 31, 'INPUTTYPE', 'text'),
(401, 31, 'ATTRMIN', ''),
(402, 31, 'ATTRMAX', ''),
(403, 31, 'ATTRSTEP', ''),
(404, 31, 'EMAILATTACH', ''),
(405, 32, 'NAME', 'Email'),
(406, 32, 'CAPTION', 'E-mail'),
(407, 32, 'REQUIRED', 'YES'),
(408, 32, 'SIZE', '20'),
(409, 32, 'MAXSIZE', ''),
(410, 32, 'VALIDATIONRULE', 'email'),
(411, 32, 'VALIDATIONMESSAGE', 'Invalid email address.'),
(412, 32, 'ADDITIONALATTRIBUTES', 'placeholder=\"Пожалуйста, введите свой e-mail\"'),
(413, 32, 'DEFAULTVALUE', ''),
(414, 32, 'DESCRIPTION', ''),
(415, 32, 'VALIDATIONEXTRA', ''),
(416, 32, 'INPUTTYPE', 'email'),
(417, 32, 'ATTRMIN', ''),
(418, 32, 'ATTRMAX', ''),
(419, 32, 'ATTRSTEP', ''),
(420, 32, 'EMAILATTACH', ''),
(421, 33, 'NAME', 'Message'),
(422, 33, 'CAPTION', 'Ваше сообщение'),
(423, 33, 'DEFAULTVALUE', ''),
(424, 33, 'DESCRIPTION', ''),
(425, 33, 'REQUIRED', 'YES'),
(426, 33, 'VALIDATIONRULE', 'regex'),
(427, 33, 'VALIDATIONEXTRA', '/^[а-яА-ЯёЁa-zA-Z\\d\\!\\?\\\"\\­«\\»\\\'\\;\\:\\№\\$\\(\\)\\+\\-\\*\\,\\.\\s]++$/ui'),
(428, 33, 'VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(429, 33, 'COLS', '50'),
(430, 33, 'ROWS', '10'),
(431, 33, 'PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(432, 33, 'WYSIWYG', 'NO'),
(433, 33, 'WYSIWYGBUTTONS', 'NO'),
(434, 33, 'MAXSIZE', ''),
(435, 33, 'SHOW_CHAR_COUNT', 'NO'),
(436, 33, 'ADDITIONALATTRIBUTES', ''),
(437, 33, 'EMAILATTACH', ''),
(438, 34, 'NAME', 'Captcha'),
(439, 34, 'CAPTION', ''),
(440, 34, 'DESCRIPTION', ''),
(441, 34, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(442, 34, 'LENGTH', '4'),
(443, 34, 'IMAGETYPE', 'INVISIBLE'),
(444, 34, 'BACKGROUNDCOLOR', '#FFFFFF'),
(445, 34, 'TEXTCOLOR', '#000000'),
(446, 34, 'TYPE', 'ALPHA'),
(447, 34, 'FLOW', 'VERTICAL'),
(448, 34, 'SHOWREFRESH', 'YES'),
(449, 34, 'REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(450, 34, 'SIZE', '15'),
(451, 34, 'ADDITIONALATTRIBUTES', ''),
(452, 34, 'EMAILATTACH', ''),
(453, 35, 'NAME', 'PersonalData'),
(454, 35, 'CAPTION', 'Я даю согласие на обработку персональных данных'),
(455, 35, 'ITEMS', 'Да'),
(456, 35, 'DESCRIPTION', ''),
(457, 35, 'REQUIRED', 'YES'),
(458, 35, 'VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(459, 35, 'FLOW', 'HORIZONTAL'),
(460, 35, 'ADDITIONALATTRIBUTES', 'onchange=\"document.getElementById(\'Submit\').disabled = !this.checked\" class=\"custom-control-labels\"'),
(461, 35, 'EMAILATTACH', ''),
(462, 36, 'NAME', 'reCAPTCHA'),
(463, 36, 'CAPTION', ''),
(464, 36, 'DESCRIPTION', ''),
(465, 36, 'VALIDATIONMESSAGE', 'Неверный ввод'),
(466, 36, 'THEME', 'DARK'),
(467, 36, 'TYPE', 'IMAGE'),
(468, 36, 'SIZE', 'INVISIBLE'),
(469, 36, 'ADDITIONALATTRIBUTES', ''),
(470, 36, 'EMAILATTACH', ''),
(471, 37, 'NAME', 'Submit'),
(472, 37, 'LABEL', 'Submit'),
(473, 37, 'CAPTION', ''),
(474, 37, 'RESET', 'NO'),
(475, 37, 'RESETLABEL', 'Reset'),
(476, 37, 'ADDITIONALATTRIBUTES', 'onclick=\"ga(\'send\', \'event\', \'questionForm\', \'onclick\');\" disabled'),
(477, 37, 'DISPLAYPROGRESS', 'AUTO'),
(478, 37, 'BUTTONTYPE', 'TYPEBUTTON'),
(479, 37, 'EMAILATTACH', ''),
(480, 37, 'PREVBUTTON', ''),
(481, 37, 'DISPLAYPROGRESSMSG', ''),
(482, 38, 'NAME', 'Text'),
(483, 38, 'TEXT', ''),
(484, 38, 'EMAILATTACH', ''),
(485, 39, 'NAME', 'Category'),
(486, 39, 'CAPTION', 'Категория товара'),
(487, 39, 'ITEMS', 'Категория не выбрана[c][d]\nCM Decking\nCM Bord\nCM Garden\nCM Cladding\nCM Railing\nCM Fencing\nCM Vattern\nCM Wood Natur\nCM Wood Thermo'),
(488, 39, 'DESCRIPTION', ''),
(489, 39, 'REQUIRED', 'YES'),
(490, 39, 'VALIDATIONMESSAGE', 'Нужно выбрать категорию'),
(491, 39, 'SIZE', ''),
(492, 39, 'MULTIPLE', 'NO'),
(493, 39, 'ADDITIONALATTRIBUTES', ''),
(494, 39, 'EMAILATTACH', ''),
(495, 40, 'NAME', 'agreement'),
(496, 40, 'TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>'),
(497, 40, 'EMAILATTACH', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_submissions`
--

CREATE TABLE `hud_rsform_submissions` (
  `SubmissionId` int(11) NOT NULL,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `DateSubmitted` datetime NOT NULL,
  `UserIp` varchar(255) NOT NULL DEFAULT '',
  `Username` varchar(255) NOT NULL DEFAULT '',
  `UserId` text NOT NULL,
  `Lang` varchar(255) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `SubmissionHash` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_submissions`
--

INSERT INTO `hud_rsform_submissions` (`SubmissionId`, `FormId`, `DateSubmitted`, `UserIp`, `Username`, `UserId`, `Lang`, `confirmed`, `SubmissionHash`) VALUES
(1, 1, '2018-07-14 13:11:15', '46.160.32.211', '', '0', 'ru-RU', 1, 'e104754b9728f129ce1be644242fd541'),
(2, 1, '2018-07-16 12:19:13', '91.215.123.65', '', '0', 'ru-RU', 1, 'e54c6c37dc7a45231d735f3e79714950'),
(3, 1, '2018-07-16 14:20:54', '2.94.181.217', '', '0', 'ru-RU', 1, 'b740e29cb27d61f6745a94dc87ff61bf'),
(4, 1, '2018-07-16 14:33:13', '37.16.81.134', '', '0', 'ru-RU', 1, 'c32457bc1344bf01373a61006ccaaee5'),
(5, 1, '2018-08-01 05:16:37', '213.87.225.176', '', '0', 'ru-RU', 1, '1e90707c24eb8b6bcdd70efc631542ea'),
(6, 1, '2018-08-06 08:44:52', '85.235.196.146', '', '0', 'ru-RU', 1, '51ab8f7c8852ccc85bfe7c3b450ddd66'),
(7, 1, '2018-08-06 17:52:01', '188.226.9.218', '', '0', 'ru-RU', 1, 'd8a9d4bc925e073cfe3d879869879bd9'),
(8, 1, '2018-08-07 00:16:13', '213.5.19.127', '', '0', 'ru-RU', 1, '3ff91051b654059ebaffe2bc28188e88'),
(9, 1, '2018-08-07 07:01:36', '93.185.27.143', '', '0', 'ru-RU', 1, 'dabffe4e0edf0106d87b2f9c3b97d828'),
(10, 1, '2018-08-07 13:26:07', '46.187.39.16', '', '0', 'ru-RU', 1, 'f7e5fd63bddbb19bc33cc6cb4e68f7dd'),
(11, 1, '2018-08-08 08:07:43', '5.18.235.9', '', '0', 'ru-RU', 1, '2d02fa3a6ee89702f5ea030733167973'),
(12, 1, '2018-08-08 09:06:28', '93.185.17.65', '', '0', 'ru-RU', 1, '89e84a08d5ffcc8e8188e990b3cde6cd'),
(13, 1, '2018-08-08 10:17:20', '176.59.19.208', '', '0', 'ru-RU', 1, '3323901af46344a1ed90454c4391eaa4'),
(14, 1, '2018-08-08 14:45:44', '85.140.78.51', '', '0', 'ru-RU', 1, '99af9a47efb2485962b80aeb1960f570'),
(15, 1, '2018-08-08 15:56:01', '82.142.137.102', '', '0', 'ru-RU', 1, 'a4a60de282f33dcd547f4f63e8be512a'),
(16, 1, '2018-08-09 06:37:06', '78.110.155.207', '', '0', 'ru-RU', 1, '7e64055f4acfa49a21e3e2426fd848d8'),
(17, 1, '2018-08-09 08:41:45', '87.103.234.27', '', '0', 'ru-RU', 1, 'a8d4f25defb687e89855dd3e05235b2b'),
(18, 1, '2018-08-10 07:00:43', '88.135.115.67', '', '0', 'ru-RU', 1, '56635408c0a04fa034e4dc5f68e8a6fc'),
(19, 1, '2018-08-10 10:53:31', '178.238.31.82', '', '0', 'ru-RU', 1, '52715bde375bbad0fa58dbfda254499b'),
(20, 1, '2018-08-10 13:22:45', '46.216.153.234', '', '0', 'ru-RU', 1, 'b35f53bcf9de26370ecdb49493f0e521'),
(21, 1, '2018-08-10 13:46:03', '178.238.31.82', '', '0', 'ru-RU', 1, 'f740fd5a97d6bcff8bc3e11d2c666e2a'),
(22, 1, '2018-08-13 04:04:40', '46.0.13.73', '', '0', 'ru-RU', 1, 'bcf90b4d9b74202788dd0edec2f92a45'),
(23, 1, '2018-08-13 09:14:55', '178.238.31.82', '', '0', 'ru-RU', 1, '9a9f9c8109583dc12e4b13f10e9b156b'),
(24, 1, '2018-08-13 15:16:47', '178.19.245.74', '', '0', 'ru-RU', 1, 'ad11e141c72abd5bd10af6f320780080'),
(25, 1, '2018-08-14 08:31:04', '87.245.159.184', '', '0', 'ru-RU', 1, 'cb4ebdfae5973b1ec5a02aa87d6aa1fd'),
(26, 1, '2018-08-14 10:30:13', '94.198.199.34', '', '0', 'ru-RU', 1, '387f9bda67a5ca4c1c9f356aa3dbde4b'),
(27, 1, '2018-08-14 12:42:35', '178.19.245.74', '', '0', 'ru-RU', 1, '22b4190766a2c3633f6545fb1688b66b'),
(28, 1, '2018-08-15 13:48:42', '10.0.1.34', '', '0', 'ru-RU', 1, 'e749009e663e01e2cfab4e81f3886dfd'),
(29, 1, '2018-08-15 17:41:39', '178.176.113.69', '', '0', 'ru-RU', 1, 'bde012c2982d3e51cf8e7cd1e465b269'),
(30, 1, '2018-08-16 08:29:04', '188.234.219.144', '', '0', 'ru-RU', 1, '7bc66dff0203a79c352b6deb60a28c22'),
(31, 1, '2018-08-18 09:30:47', '178.204.204.79', '', '0', 'ru-RU', 1, 'b1ef8b3ce1df66518894bccc962c3df4'),
(32, 1, '2018-08-20 05:29:13', '188.128.88.54', '', '0', 'ru-RU', 1, '48768e7907bec32da25ed39df517642c'),
(33, 1, '2018-08-20 08:08:53', '217.66.156.130', '', '0', 'ru-RU', 1, '117c131cc4e634cad01927c273217a91'),
(34, 1, '2018-08-20 22:51:04', '176.100.46.14', '', '0', 'ru-RU', 1, 'ea5db62bcd99bc03c1bdbfb10ce41a58'),
(35, 1, '2018-08-21 06:08:59', '82.145.223.87', '', '0', 'ru-RU', 1, '6e94b72441f93019ef92e72147579bb0'),
(36, 1, '2018-08-21 09:31:57', '91.231.198.1', '', '0', 'ru-RU', 1, '09a6006e7d6a6e0249d79e7e4c9867d8'),
(37, 1, '2018-08-22 03:23:35', '151.252.70.46', '', '0', 'ru-RU', 1, 'e9880cf86a812a4840029e8c317d50b9'),
(38, 1, '2018-08-22 06:19:30', '85.140.5.228', '', '0', 'ru-RU', 1, '6387799550d6fd8d36b6c89147cb49c3'),
(39, 1, '2018-08-23 04:44:16', '81.200.248.106', '', '0', 'ru-RU', 1, '7dce6c3c4d4e06ba037b059fae155c12'),
(40, 1, '2018-08-23 07:19:22', '88.81.39.67', '', '0', 'ru-RU', 1, '08fda8d3cc317b7dac6f175b6d6b8e21'),
(41, 1, '2018-08-23 07:49:11', '83.220.237.109', '', '0', 'ru-RU', 1, 'e58267ed4eb593714c349a8f21fabe16'),
(42, 1, '2018-08-23 12:47:51', '5.227.7.14', '', '0', 'ru-RU', 1, '151353b519d779e602c573f9b4c4e140'),
(43, 1, '2018-08-23 16:02:01', '95.189.139.2', '', '0', 'ru-RU', 1, '2461a0f64cfe12ec945309d8f8be17a9'),
(44, 1, '2018-08-24 11:48:14', '83.220.237.109', '', '0', 'ru-RU', 1, 'dae441db618f6d1ebb63ad7b618eb3a0'),
(45, 1, '2018-08-24 15:30:20', '46.38.44.118', '', '0', 'ru-RU', 1, 'd129759bd372116d78d315d21822e270'),
(46, 1, '2018-08-26 04:54:46', '176.59.147.251', '', '0', 'ru-RU', 1, '184f6105890dac5e2f7ff398c2b7dd34'),
(47, 1, '2018-08-27 12:44:51', '194.84.255.41', '', '0', 'ru-RU', 1, 'a302ddf254ba0d6db41c68e665bc88cc'),
(48, 1, '2018-08-28 08:49:24', '37.79.251.95', '', '0', 'ru-RU', 1, 'cf43d43436b6b4a71f4e2b91823c379a'),
(49, 1, '2018-08-30 06:50:34', '94.73.195.217', '', '0', 'ru-RU', 1, 'a2f0cf28df5d2e121aab55d11b9766fd'),
(50, 1, '2018-08-30 09:07:00', '46.146.204.242', '', '0', 'ru-RU', 1, '4cd7665a46e433e9bd4e40a7fe3ade5e'),
(51, 1, '2018-08-30 10:12:03', '94.25.170.220', '', '0', 'ru-RU', 1, '0b7364c672ff23422562346940d8946f'),
(52, 1, '2018-08-30 17:41:01', '85.26.165.37', '', '0', 'ru-RU', 1, 'f85755b1f6de61e8564186930b2b6af6'),
(53, 1, '2018-09-04 09:16:40', '95.174.100.103', '', '0', 'ru-RU', 1, 'b9e13bcc99cc433d88be4b7143bf6aed'),
(54, 1, '2018-09-05 09:30:13', '83.220.238.117', '', '0', 'ru-RU', 1, '2b008308b1d02e24e38e0ef1c458cc44'),
(55, 1, '2018-09-05 13:04:57', '93.171.244.100', '', '0', 'ru-RU', 1, '5df4a076f339509fb10af21b56a55e44'),
(56, 1, '2018-09-07 12:50:15', '213.87.148.255', '', '0', 'ru-RU', 1, '1159f489a886e78075b7f2e9dad15a4c'),
(57, 1, '2018-09-17 11:20:17', '82.147.82.228', '', '0', 'ru-RU', 1, '634d884a455c7158defd9513a5b2b796'),
(58, 1, '2018-09-19 12:58:40', '109.252.206.192', '', '0', 'ru-RU', 1, '17275ec090c58668e17acb7f03250978'),
(59, 1, '2018-09-20 11:40:17', '188.134.67.163', '', '0', 'ru-RU', 1, '90039d1aa29e265c331e8f7f735bfc51'),
(60, 1, '2018-09-20 13:30:57', '94.159.68.2', '', '0', 'ru-RU', 1, 'f25a46b08a28e7295049646504fa43bd'),
(61, 1, '2018-09-20 19:31:17', '109.60.206.53', '', '0', 'ru-RU', 1, 'c2cb645749b49fd41a1871f65f5a1d78'),
(62, 1, '2018-09-21 07:57:35', '95.71.123.215', '', '0', 'ru-RU', 1, '3f3bc1269285c08f54dd43523feb8571'),
(63, 1, '2018-09-24 07:04:17', '188.170.192.17', '', '0', 'ru-RU', 1, '21bb612aac22ef6a5a19bafbc5aa571f'),
(64, 1, '2018-09-24 07:45:46', '176.59.33.150', '', '0', 'ru-RU', 1, 'd254fd5f9c1c78ac8b17b58f7859d034'),
(65, 1, '2018-09-25 13:53:29', '85.140.2.103', '', '0', 'ru-RU', 1, '1b8cdd01e1daa4932955919ad34fd6ed'),
(66, 1, '2018-09-26 15:48:26', '80.89.203.163', '', '0', 'ru-RU', 1, 'cd67db04a00a00151e2a056c222e886b'),
(67, 1, '2018-10-01 07:28:23', '212.248.39.131', '', '0', 'ru-RU', 1, 'f6603ab4191ad7b49e8b4e51b6fdc23a'),
(68, 1, '2018-10-02 23:33:15', '80.83.238.62', '', '0', 'ru-RU', 1, '55cc1f6588f91359a9370fd5014e2718'),
(69, 1, '2018-10-04 07:33:41', '185.135.149.253', '', '0', 'ru-RU', 1, '49f5105b9b4853572c496d4d15f359fa'),
(70, 1, '2018-10-12 12:45:37', '176.115.193.28', '', '0', 'ru-RU', 1, '1d3754c3a0ad696abf55c90a233e6398'),
(71, 1, '2018-10-13 16:14:50', '81.92.206.116', '', '0', 'ru-RU', 1, 'adfc52cfa9c589d6e9e52cd7ca97920b'),
(72, 1, '2018-10-15 12:05:24', '85.115.224.154', '', '0', 'ru-RU', 1, '35634f8f3102c4feacc1093b4003e5fd'),
(73, 1, '2018-10-16 12:38:29', '213.59.130.209', '', '0', 'ru-RU', 1, 'ceb9aec4d96ff1b39f75d34543a9e5b5'),
(74, 1, '2018-10-16 13:17:11', '5.187.40.199', '', '0', 'ru-RU', 1, '682cd5b79291a89fac2e677848f195a8'),
(75, 1, '2018-10-17 04:02:23', '2.75.209.154', '', '0', 'ru-RU', 1, 'ba95e8bccb2dd19f756d906f37a43cca'),
(76, 1, '2018-10-18 12:02:51', '217.118.95.68', '', '0', 'ru-RU', 1, '8ea9b1013602aca2c5cf761eda6355e0'),
(77, 1, '2018-10-19 08:43:15', '77.94.195.75', '', '0', 'ru-RU', 1, '6c77e196b13dab5b13b4f76467666a29'),
(78, 1, '2018-10-19 10:30:33', '31.181.199.180', '', '0', 'ru-RU', 1, '79f93d2ef396a59663443761b9794399'),
(79, 1, '2018-10-20 06:22:00', '5.189.68.48', '', '0', 'ru-RU', 1, '3985d48ffd78cc117e81d824b7408f64'),
(80, 1, '2018-10-23 14:00:59', '217.118.78.103', '', '0', 'ru-RU', 1, 'acab485c15fd6e71b90418f1d8bda722'),
(81, 1, '2018-10-24 06:54:30', '188.235.107.102', '', '0', 'ru-RU', 1, 'd61838983dd4e5c15448defb43c00f9e'),
(82, 1, '2018-10-24 12:06:17', '93.84.15.160', '', '0', 'ru-RU', 1, 'dc26e5904cf5ddec59905e6f7db16fa8'),
(83, 1, '2018-10-25 05:30:56', '188.18.157.252', '', '0', 'ru-RU', 1, '24cb4d7b390b0d406cb04302b632b404'),
(84, 1, '2018-10-25 09:26:40', '217.118.95.89', '', '0', 'ru-RU', 1, 'a76788087c1badc3625a9e198efab292'),
(85, 1, '2018-10-28 15:04:24', '81.163.54.91', '', '0', 'ru-RU', 1, '5aa7b311b743a6b7ab9901ff3c5a60cf'),
(86, 1, '2018-11-01 05:25:28', '80.244.37.143', '', '0', 'ru-RU', 1, '6fb781ab1a4a0aba185772c7055c65c3'),
(87, 1, '2018-11-03 12:51:16', '92.38.138.97', '', '0', 'ru-RU', 1, '6c7b22e27e4a9cca54d9053678a7b2da'),
(88, 1, '2018-11-06 19:24:07', '85.91.207.220', '', '0', 'ru-RU', 1, 'ba0fdae9e322cbf08435fb5b7c2633c1'),
(89, 1, '2018-11-07 14:27:14', '176.114.144.125', '', '0', 'ru-RU', 1, '44fff6e5753cc17dff4daf24b1bf8c22'),
(90, 1, '2018-11-08 07:38:09', '91.203.208.182', '', '0', 'ru-RU', 1, '635bee2db4411786161e9612540f5672'),
(91, 1, '2018-11-09 13:04:15', '188.170.73.206', '', '0', 'ru-RU', 1, 'd4057e18ea5ad09ee139031fdd61da22'),
(92, 1, '2018-11-12 07:51:30', '62.141.78.162', '', '0', 'ru-RU', 1, 'ed70912c44e4090a5305433a1363078c'),
(93, 1, '2018-11-14 10:02:37', '213.221.37.46', '', '0', 'ru-RU', 1, '28b5bc0001232635bb6c5984d27166aa'),
(94, 1, '2018-11-14 17:33:18', '176.193.124.31', '', '0', 'ru-RU', 1, '7cd4608e49855ff909a179376bc95fad'),
(95, 1, '2018-11-17 08:11:50', '176.59.213.48', '', '0', 'ru-RU', 1, '7dcd1d9b8af2f120e1b47d61be77d9d9'),
(96, 1, '2018-11-19 09:13:30', '176.112.64.221', '', '0', 'ru-RU', 1, 'da63b0cc7d9935bcb1bd7d47b3c7f408'),
(97, 1, '2018-11-19 10:57:27', '176.212.220.119', '', '0', 'ru-RU', 1, 'f220a56780f69f7f8b3de43f0a23ca94'),
(98, 1, '2018-11-21 09:38:22', '93.94.177.163', '', '0', 'ru-RU', 1, 'facafac84cac38799ff495290cb35d5d'),
(99, 1, '2018-11-22 14:07:02', '109.206.155.219', '', '0', 'ru-RU', 1, '54b8ef7bd030dc7eab8b651abf2a31da'),
(100, 1, '2018-11-22 18:16:16', '83.102.222.212', '', '0', 'ru-RU', 1, '75d551db5ea6a12b51419379ad5568d1'),
(101, 1, '2018-11-28 07:58:25', '217.118.95.100', '', '0', 'ru-RU', 1, '7d31fa3f18b8d0e34d8c8195ba382ff5'),
(102, 1, '2018-12-01 08:22:25', '188.162.145.69', '', '0', 'ru-RU', 1, 'dec0c3fa99d3fec81416216623291bd9'),
(103, 1, '2018-12-01 10:41:35', '46.245.134.141', '', '0', 'ru-RU', 1, 'ce999a3db6279bb5f249bb09bd0a7664'),
(104, 1, '2018-12-09 09:39:13', '31.40.99.197', '', '0', 'ru-RU', 1, '99afbf06f346ea85552b39b396cea26e'),
(105, 1, '2018-12-10 12:51:07', '188.143.149.50', '', '0', 'ru-RU', 1, 'e449bdd408719e54074988933ddaa41a'),
(106, 1, '2018-12-11 06:15:14', '80.76.107.197', '', '0', 'ru-RU', 1, '1cefd778eaaa58a03e5e89d856415421'),
(107, 1, '2018-12-14 08:11:09', '195.218.145.6', '', '0', 'ru-RU', 1, '1af39825bff93a4b48c7898ba58618c2'),
(108, 1, '2018-12-17 10:38:56', '217.118.78.103', '', '0', 'ru-RU', 1, 'e33dd98146f504f959a643f0dea1f25f'),
(109, 1, '2018-12-19 10:01:16', '213.221.61.34', '', '0', 'ru-RU', 1, 'e6d825f8aae47fde601a687e8fd19f72'),
(110, 1, '2018-12-21 12:21:34', '213.221.61.34', '', '0', 'ru-RU', 1, 'b8fa41214b9b38cca38dc3be27fb355a'),
(111, 1, '2018-12-27 07:14:00', '91.209.147.226', '', '0', 'ru-RU', 1, 'dee22f36dfce3ec79d0bce2ec74a4bac'),
(112, 1, '2018-12-29 10:27:56', '212.109.6.166', '', '0', 'ru-RU', 1, '8ffe8cbad75c3f3116b2479310e2dbe4'),
(113, 1, '2018-12-30 00:51:39', '193.169.62.130', '', '0', 'ru-RU', 1, '25bee515bb56e3ed00bce301d3933cef'),
(114, 1, '2019-01-04 12:09:25', '77.39.53.85', '', '0', 'ru-RU', 1, 'e04de781a99586fe037232d53a33efe2'),
(115, 1, '2019-01-08 01:27:51', '159.255.3.122', '', '0', 'ru-RU', 1, 'e027ed4d060c0f4e3e90368bf4aa262b'),
(116, 1, '2019-01-09 06:51:45', '88.86.82.109', '', '0', 'ru-RU', 1, '0278eebba2718fd86a11ee4c020365cb'),
(117, 1, '2019-01-11 06:04:48', '178.69.130.97', '', '0', 'ru-RU', 1, '73647e4aee210159300633330ccd3619'),
(118, 1, '2019-01-15 09:24:02', '217.76.76.209', '', '0', 'ru-RU', 1, '9d3cc8ec8a860f74108c93ab74b0d152'),
(119, 1, '2019-01-15 11:27:02', '77.238.149.239', '', '0', 'ru-RU', 1, 'fd69f3aca540112220210b6ed683f31a'),
(120, 1, '2019-01-16 12:34:38', '5.104.200.150', '', '0', 'ru-RU', 1, '030b3006dac8a2897318f34c6f26209e'),
(121, 1, '2019-01-16 19:27:51', '185.245.185.192', '', '0', 'ru-RU', 1, '6b601b11d8efc50f167be588aceb86df'),
(122, 1, '2019-01-17 21:04:32', '128.70.252.96', '', '0', 'ru-RU', 1, 'fa7854457cd9f1d81a6dc7dbbcebffcb'),
(123, 1, '2019-01-20 06:01:28', '192.162.242.167', '', '0', 'ru-RU', 1, '1957d351cddaece3791a948db8991360'),
(124, 1, '2019-01-24 21:04:49', '46.8.245.38', '', '0', 'ru-RU', 1, '05b925a7a2f7a18bda66cd3d7b2110cc'),
(125, 1, '2019-01-25 11:17:13', '94.158.126.241', '', '0', 'ru-RU', 1, 'a58be866ae30afde0e1f9322c92a404b'),
(126, 1, '2019-01-28 11:54:46', '94.25.171.82', '', '0', 'ru-RU', 1, '8d198dcc3db3b7940776fc73bf2dae3b'),
(127, 1, '2019-01-29 10:46:46', '85.114.30.150', '', '0', 'ru-RU', 1, 'e8dfced171b0f189d037889fb8c28460'),
(128, 1, '2019-02-01 05:56:04', '213.87.132.173', '', '0', 'ru-RU', 1, '91b90af5a72b01e288a707a5784adf4b'),
(129, 1, '2019-02-02 11:05:57', '87.229.253.10', '', '0', 'ru-RU', 1, 'a8f9294e80489b77263954599c139c60'),
(130, 1, '2019-02-04 06:00:30', '84.17.28.226', '', '0', 'ru-RU', 1, 'd69f3ec6e6ba3b65a0458b76c58c902f'),
(131, 1, '2019-02-05 02:19:12', '109.110.37.166', '', '0', 'ru-RU', 1, 'e100a21a4a49ab6435e52f6f393d9ac3'),
(132, 1, '2019-02-08 08:02:02', '87.117.189.240', '', '0', 'ru-RU', 1, '1c9c771aa29ee1205ba2b9984b9d7726'),
(133, 1, '2019-02-11 10:42:01', '31.210.215.201', '', '0', 'ru-RU', 1, 'b749132d6449b9233fd6d79ea60643c1'),
(134, 1, '2019-02-13 04:50:22', '95.181.2.157', '', '0', 'ru-RU', 1, '1f075e3fdecda43b1b632d45dbd7e2fd'),
(135, 1, '2019-02-15 08:54:32', '82.151.113.207', '', '0', 'ru-RU', 1, 'e12e119fab374532073dd31a6548e054'),
(136, 1, '2019-02-18 14:26:23', '94.181.37.149', '', '0', 'ru-RU', 1, '44674fa269b83b33a2caf2d470540048'),
(137, 1, '2019-02-22 13:32:25', '93.188.46.253', '', '0', 'ru-RU', 1, '5cd042978eb4d51f032393897dcbc596'),
(138, 1, '2019-02-25 05:32:59', '185.15.63.33', '', '0', 'ru-RU', 1, '1e50902d3edec9c6c7c3394b3d7e9917'),
(139, 1, '2019-02-25 08:27:44', '2.92.137.61', '', '0', 'ru-RU', 1, '1d7b71f7e7c47f2580b97bd567e09637'),
(140, 1, '2019-02-27 18:00:04', '80.244.42.246', '', '0', 'ru-RU', 1, 'f15c3364655160968b928791a1500e2d'),
(141, 1, '2019-02-28 08:39:30', '146.120.85.14', '', '0', 'ru-RU', 1, 'c6077f040ff50dc084bbf35d57d19355'),
(142, 1, '2019-02-28 11:50:09', '77.73.234.134', '', '0', 'ru-RU', 1, 'b29f574e90e682ec8f0576d696873049'),
(143, 1, '2019-03-01 11:37:26', '93.91.112.112', '', '0', 'ru-RU', 1, 'f6c465eb7ce80f34cba4553ee0cd5e16'),
(144, 1, '2019-03-04 03:15:20', '217.66.89.98', '', '0', 'ru-RU', 1, '8bc121b3eea84b23bdba4d905cc2c74d'),
(145, 1, '2019-03-04 13:57:48', '176.53.193.27', '', '0', 'ru-RU', 1, '3c7eade414ebf63dde49a4f1fab9617b'),
(146, 1, '2019-03-04 18:25:54', '5.1.55.169', '', '0', 'ru-RU', 1, '3dc8d626c742dca744f5f8cc27ba3d35'),
(147, 1, '2019-03-05 05:25:30', '87.252.225.136', '', '0', 'ru-RU', 1, 'eb062fe450101c1e70bc7cce62f2d865'),
(148, 1, '2019-03-07 05:02:32', '5.44.168.65', '', '0', 'ru-RU', 1, '679fdf1e3d084c788a69697b9b06320b'),
(149, 1, '2019-03-07 13:33:23', '31.148.48.19', '', '0', 'ru-RU', 1, '75d1298a79a3045bd687c992103c8b6a'),
(150, 1, '2019-03-08 05:53:57', '31.173.101.21', '', '0', 'ru-RU', 1, 'd19ca02eb81cc9c87a24e390adf86c9c'),
(151, 1, '2019-03-11 06:28:48', '176.59.208.217', '', '0', 'ru-RU', 1, 'fe532071d229390e122664722c2d3be3'),
(152, 1, '2019-03-11 07:40:26', '85.140.0.212', '', '0', 'ru-RU', 1, '9f00d08f54ca4c2476edd1284a3769ca'),
(153, 1, '2019-03-11 13:27:22', '193.169.44.55', '', '0', 'ru-RU', 1, 'b58f70af4ed454400228cadd4b9fb158'),
(154, 1, '2019-03-12 08:36:06', '95.153.128.97', '', '0', 'ru-RU', 1, 'ba060da3365f76fc5b595c9075305f78'),
(155, 1, '2019-03-13 07:20:42', '188.255.78.157', '', '0', 'ru-RU', 1, '8cd71b68935e1d754734ccf70e204409'),
(156, 1, '2019-03-14 10:59:26', '80.254.124.198', '', '0', 'ru-RU', 1, '80fa45aed4d0d275fdaa9065c84a6959'),
(157, 1, '2019-03-16 08:57:36', '83.149.47.227', '', '0', 'ru-RU', 1, 'e729ce77873f68d40832d32721d3f008'),
(158, 1, '2019-03-17 18:35:19', '2.132.236.28', '', '0', 'ru-RU', 1, '7a33f9295c89b80edb9821ea3ac3915e'),
(159, 1, '2019-03-21 07:14:59', '213.87.135.233', '', '0', 'ru-RU', 1, '01c235fcdfa281829ff70d59d56e3468'),
(160, 1, '2019-03-22 10:48:18', '77.111.247.182', '', '0', 'ru-RU', 1, 'd7d33828710605290f17236e39f1f0ca'),
(161, 1, '2019-03-28 06:47:03', '95.154.66.166', '', '0', 'ru-RU', 1, '4ea623753121979f8c897369309f534c'),
(162, 1, '2019-03-29 10:32:03', '176.108.187.8', '', '0', 'ru-RU', 1, 'b081795f73d7af83cc2086661fe2251a'),
(163, 1, '2019-03-29 11:38:01', '213.87.224.132', '', '0', 'ru-RU', 1, '5ff2a0329bb7c60a035fe9dcc09fff55'),
(164, 1, '2019-04-02 18:11:38', '92.38.138.71', '', '0', 'ru-RU', 1, '30b72308d346966c741b6a53c0ec9aaa'),
(165, 1, '2019-04-04 04:28:23', '95.181.2.210', '', '0', 'ru-RU', 1, 'f1c70547e60977ea85c95f3db9f2e648'),
(166, 1, '2019-04-04 09:07:57', '188.68.27.131', '', '0', 'ru-RU', 1, 'c53349b7847ec3855270c559ba646cc7'),
(167, 1, '2019-04-04 11:48:59', '213.87.131.241', '', '0', 'ru-RU', 1, '4eb18149206df7597d3d08e9b6ede802'),
(168, 1, '2019-04-08 06:32:27', '62.192.226.44', '', '0', 'ru-RU', 1, 'e71a901d55fe10bb292fce7097b56b52'),
(169, 1, '2019-04-08 12:11:36', '195.239.133.90', '', '0', 'ru-RU', 1, '86bf9a62be24da3070dee14990329ee0'),
(170, 1, '2019-04-09 10:40:40', '5.19.183.180', '', '0', 'ru-RU', 1, '4473699943030e0691976721bd9bf63f'),
(171, 1, '2019-04-09 11:40:08', '94.159.10.198', '', '0', 'ru-RU', 1, '761d6b955fb6e987a3d60b390c422be4'),
(172, 1, '2019-04-17 07:03:39', '87.117.189.59', '', '0', 'ru-RU', 1, '932ddee885750f0e5a59306c5644d800'),
(173, 1, '2019-04-17 08:17:20', '94.25.228.141', '', '0', 'ru-RU', 1, 'f5548162e3db0ba49dee0e0659f61c87'),
(174, 1, '2019-04-17 12:31:43', '213.87.154.91', '', '0', 'ru-RU', 1, 'd06fbffb4d07323dfe62afed5872a719'),
(175, 1, '2019-04-18 09:05:12', '178.66.45.179', '', '0', 'ru-RU', 1, '16cd565ef180c7e8dc3062d1220b6fc0'),
(176, 1, '2019-04-19 01:52:30', '109.110.37.166', '', '0', 'ru-RU', 1, 'e459d3c16e47aad15c8382a8cbdccf2f'),
(177, 1, '2019-04-21 22:36:37', '185.202.213.64', '', '0', 'ru-RU', 1, '20216b85fc5702d2f61f0ad4105db44a'),
(178, 1, '2019-04-22 05:31:17', '194.8.85.83', '', '0', 'ru-RU', 1, '58ef614cd9d952513af3d126f0a0d670'),
(179, 1, '2019-04-22 08:03:36', '195.96.75.182', '', '0', 'ru-RU', 1, '88f8bff598e64ea1d809c04aa94f7bb1'),
(180, 1, '2019-04-22 14:32:19', '87.244.12.73', '', '0', 'ru-RU', 1, 'c18c2395834469ce4f9585cae0672152'),
(181, 1, '2019-04-23 07:38:36', '193.150.109.25', '', '0', 'ru-RU', 1, '2f35b615cc7fd55d6ef1b216322db6bd'),
(182, 1, '2019-04-23 09:19:50', '178.124.171.210', '', '0', 'ru-RU', 1, '7648d9185394c510d3075f9d5566a50c'),
(183, 1, '2019-04-24 09:32:44', '82.208.114.251', '', '0', 'ru-RU', 1, 'eaf707cb8388a41eed98e1efe11415cb'),
(184, 1, '2019-04-26 07:11:46', '62.148.147.67', '', '0', 'ru-RU', 1, '803bada1eb3e077dd76ddea2abe3b917'),
(185, 1, '2019-04-26 08:49:23', '185.202.213.64', '', '0', 'ru-RU', 1, '9339e790900b8f7fa92751772f121ccf'),
(186, 1, '2019-04-27 09:47:22', '176.59.204.216', '', '0', 'ru-RU', 1, '3032ebec9e6c8f43bfff231f5ee9617e'),
(187, 1, '2019-04-29 08:03:06', '77.222.107.22', '', '0', 'ru-RU', 1, '1fbc0bcfe4b530b8b9b62986465be6ea'),
(188, 1, '2019-04-30 07:50:36', '95.106.129.169', '', '0', 'ru-RU', 1, '2d48cf485e562bddde95d06eab4bc84a'),
(189, 1, '2019-05-03 07:27:52', '217.66.154.196', '', '0', 'ru-RU', 1, 'bf37225a77108235740a41cbdc68d10e'),
(190, 1, '2019-05-03 09:12:53', '213.87.225.65', '', '0', 'ru-RU', 1, '6912dcf1547184af6360d5232aabf278'),
(191, 1, '2019-05-07 01:39:16', '94.28.111.131', '', '0', 'ru-RU', 1, 'c192c8cfee22b9f9354a6c53835a144d'),
(192, 1, '2019-05-10 08:54:08', '213.87.134.221', '', '0', 'ru-RU', 1, '4173b5be79cc8557d4dc61cb438b76b3'),
(193, 1, '2019-05-13 05:01:40', '109.174.97.238', '', '0', 'ru-RU', 1, '92f01021edfc15406c0ceaa5d7f951e4'),
(194, 1, '2019-05-14 11:31:05', '188.170.75.21', '', '0', 'ru-RU', 1, '3dfe6707312f0c04c8742a55fa1f44c8'),
(195, 1, '2019-05-15 12:29:45', '217.118.79.42', '', '0', 'ru-RU', 1, 'a876b69648ff61b58fb7773e8cc741f8'),
(196, 1, '2019-05-16 11:17:07', '185.180.229.151', '', '0', 'ru-RU', 1, '0488b3726c0d0cc9e1256666b1b67f2d'),
(197, 1, '2019-05-17 09:29:26', '85.140.2.239', '', '0', 'ru-RU', 1, 'eec721ec361844d880fc6984b16ba022'),
(198, 1, '2019-05-20 14:10:24', '5.35.76.24', '', '0', 'ru-RU', 1, 'f379828f48cd1c63bd53d5c3cb9fa486'),
(199, 1, '2019-05-21 10:12:35', '217.66.152.157', '', '0', 'ru-RU', 1, '7b39ff85db39457c920b3ee4cece5571'),
(200, 1, '2019-05-21 14:01:07', '188.162.73.201', '', '0', 'ru-RU', 1, '6da01ae9743c54a35b6849d221ee8d8e'),
(201, 1, '2019-05-22 11:40:34', '188.143.149.50', '', '0', 'ru-RU', 1, 'da3b1ed66814b836dd6a07b897742624'),
(202, 1, '2019-05-23 07:44:05', '91.185.7.154', '', '0', 'ru-RU', 1, '90fe92127fbf568efec2df0852904787'),
(203, 1, '2019-05-23 08:11:06', '109.124.14.137', '', '0', 'ru-RU', 1, 'a7be50b03345c0a9489abe6d3a780729'),
(204, 1, '2019-05-23 08:23:42', '176.59.71.158', '', '0', 'ru-RU', 1, 'a9768f326c59b3b2b2498ee7fce66afd'),
(205, 1, '2019-05-23 14:08:25', '79.104.198.21', '', '0', 'ru-RU', 1, '8b84ef17534a066ab7b6f7d8883e4512'),
(206, 1, '2019-05-24 22:37:40', '185.153.47.228', '', '0', 'ru-RU', 1, '5c93fc665d34af1dca5cbd82c49b2761'),
(207, 1, '2019-05-27 06:54:23', '178.184.213.17', '', '0', 'ru-RU', 1, '44b07d7c6b86fad114cbdec843672f75'),
(208, 1, '2019-05-29 11:11:27', '87.117.56.175', '', '0', 'ru-RU', 1, 'b87e5f2f67d0daea1afd6d5b6a55cc51'),
(209, 1, '2019-05-31 11:30:59', '213.138.196.50', '', '0', 'ru-RU', 1, '984af09013e67cef3429986c0fd35891'),
(210, 1, '2019-06-01 07:05:17', '91.225.78.62', '', '0', 'ru-RU', 1, '3dc2527e05b90bccbe375722a52f99ed'),
(211, 1, '2019-06-03 06:03:41', '141.0.178.199', '', '0', 'ru-RU', 1, '71eb68d188e15eb17eb708e2925fd271'),
(212, 1, '2019-06-03 08:57:58', '176.59.98.102', '', '0', 'ru-RU', 1, 'ab4226425168b6e88d52d3b4bd3a44fa'),
(213, 1, '2019-06-03 12:27:17', '10.0.1.34', '', '0', 'ru-RU', 1, 'a383ef593e42c1057c518995e3e14935'),
(214, 1, '2019-06-03 14:28:47', '87.244.35.106', '', '0', 'ru-RU', 1, '006aa5f2becd21035ab14c02e131d082'),
(215, 1, '2019-06-03 14:33:23', '5.18.102.195', '', '0', 'ru-RU', 1, '51348548ab048123547da5d9fb2a4246'),
(216, 1, '2019-06-04 07:48:34', '37.78.83.62', '', '0', 'ru-RU', 1, '8e5a389925b4110b0e9c37932e19f423'),
(217, 1, '2019-06-04 11:25:17', '37.214.191.48', '', '0', 'ru-RU', 1, '9e0dcd29c9adfd1579ccb1e06c8467d5'),
(218, 1, '2019-06-04 14:44:31', '94.25.169.144', '', '0', 'ru-RU', 1, 'd9ea466e1af6c8c2d2f09f7f85a91982'),
(219, 1, '2019-06-05 07:42:16', '46.42.6.210', '', '0', 'ru-RU', 1, 'b824ac433cf71bec8ff6ad4c29038cb1'),
(220, 1, '2019-06-05 08:34:52', '185.68.210.136', '', '0', 'ru-RU', 1, '30613d6fbc90cfd21843368866020922'),
(221, 1, '2019-06-07 08:21:21', '78.107.205.26', '', '0', 'ru-RU', 1, '5cfac5c3af1cde04e4995a1633e42919'),
(222, 1, '2019-06-11 05:13:25', '188.186.179.37', '', '0', 'ru-RU', 1, '7881ee3b0cf8ba7c706486b545d1a803'),
(223, 1, '2019-06-11 11:21:37', '94.25.168.93', '', '0', 'ru-RU', 1, '1607478ccbabccf2aa53f4abb5c4a931'),
(224, 1, '2019-06-13 06:01:47', '95.153.129.72', '', '0', 'ru-RU', 1, '438c1954ff1f693924d24b2e7eff9242'),
(225, 1, '2019-06-13 07:59:07', '88.81.212.134', '', '0', 'ru-RU', 1, '48fa4ed3f8d7a9e1e95fca150653941d'),
(226, 1, '2019-06-13 10:09:07', '46.146.40.98', '', '0', 'ru-RU', 1, 'e4478448223dbf695cfcbe2b87ae7419'),
(227, 1, '2019-06-14 04:44:24', '109.194.26.122', '', '0', 'ru-RU', 1, 'acf71b8521b6367862fef4a3eb3e5eae'),
(228, 1, '2019-06-16 19:23:13', '213.87.148.176', '', '0', 'ru-RU', 1, '6ceb4e80c12154a64d244973ada2a97a'),
(229, 1, '2019-06-17 08:41:37', '85.202.11.139', '', '0', 'ru-RU', 1, '3fea62a6bbe017363e847f4c2fb89082'),
(230, 1, '2019-06-19 14:02:57', '77.41.235.148', '', '0', 'ru-RU', 1, 'e1bf7f2035587970c8aa29fc49d45bef'),
(231, 1, '2019-06-21 06:37:29', '78.29.47.189', '', '0', 'ru-RU', 1, 'd4afd81a47edd8b380e604a52e3b3ec9'),
(232, 1, '2019-06-23 12:49:04', '2.94.99.235', '', '0', 'ru-RU', 1, 'fc66b67e85d0169326035265f1222b3e'),
(233, 1, '2019-06-26 03:58:20', '109.202.14.147', '', '0', 'ru-RU', 1, '84474bf2d6d865d1827a29a7063a7732'),
(234, 1, '2019-06-26 12:57:41', '37.229.63.146', '', '0', 'ru-RU', 1, '5cb4f2618283d06f0724968875b7fbdc'),
(235, 1, '2019-07-09 10:43:13', '79.175.2.130', '', '0', 'ru-RU', 1, '95dbfa80222ad7be7d2a80bf0191d81c'),
(236, 1, '2019-07-10 07:42:40', '193.106.213.88', '', '0', 'ru-RU', 1, '0b92c64ec15f80d86a4c6e84595ef65b'),
(237, 3, '2019-06-28 12:37:25', '213.87.157.152', '', '0', 'ru-RU', 1, '4491e164cc5663ec4bc42cbde14c6176'),
(238, 3, '2019-06-30 12:57:23', '176.59.47.139', '', '0', 'ru-RU', 1, '976d4fc16a146fd3ec3c894f86addc0b'),
(239, 3, '2019-07-01 13:27:51', '46.242.9.90', '', '0', 'ru-RU', 1, '143d82f4d6d22228efa16756e7b3cb07'),
(240, 3, '2019-07-02 07:34:03', '85.234.35.85', '', '0', 'ru-RU', 1, 'd561796674b095b26d6c1fe99f01cca9'),
(241, 3, '2019-07-02 16:02:19', '188.170.80.149', '', '0', 'ru-RU', 1, '8690de5821e57e509ce5cd738f3afef4'),
(242, 3, '2019-07-05 12:49:47', '188.170.195.246', '', '0', 'ru-RU', 1, '01f1fc43c3267241688260dc38672f7b'),
(243, 3, '2019-07-08 12:43:00', '195.182.148.58', '', '0', 'ru-RU', 1, 'fd50fe7081d9d6f9e90dd7179f7fc843'),
(244, 3, '2019-07-09 08:59:30', '81.1.244.34', '', '0', 'ru-RU', 1, '67d38adb62031a36929e60340e0be8fe'),
(245, 3, '2019-07-09 10:34:17', '79.175.2.130', '', '0', 'ru-RU', 1, '95ed363b33cef79e86c3f83e3949d369'),
(246, 3, '2019-07-10 12:49:04', '213.87.130.106', '', '0', 'ru-RU', 1, '951f8bb51948ff61dcf18f2e3e2d71d1');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_submission_columns`
--

CREATE TABLE `hud_rsform_submission_columns` (
  `FormId` int(11) NOT NULL,
  `ColumnName` varchar(255) NOT NULL,
  `ColumnStatic` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_submission_values`
--

CREATE TABLE `hud_rsform_submission_values` (
  `SubmissionValueId` int(11) NOT NULL,
  `FormId` int(11) NOT NULL,
  `SubmissionId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldValue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_submission_values`
--

INSERT INTO `hud_rsform_submission_values` (`SubmissionValueId`, `FormId`, `SubmissionId`, `FieldName`, `FieldValue`) VALUES
(1, 1, 1, 'Radiobutton', 'Частное лицо'),
(2, 1, 1, 'FullName', 'Руслан'),
(3, 1, 1, 'Phone', '89203578330'),
(4, 1, 1, 'Email', 'polimserv@gmail.com'),
(5, 1, 1, 'City', 'Не важно'),
(6, 1, 1, 'Message', 'Добрый день. Нужна консультация Вашего специалиста. Весной закупили У Вас продукцию на достаточно крупную сумму, через регионального представителя. Недовольны качеством финального монтажа ограждений, промежуточный профиль очень сильно гуляет. Есть видео. Хотим непосредственно с Вами переговорить касательно этого вопроса. Какие фиксаторы надо использовать и какие стандарты шатания балясины ограждений. Мы считаем для такой ценовой категории изделия у нас получается сильно большое шатание. Прошу перезвонить. '),
(7, 1, 1, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(8, 1, 1, 'formId', '1'),
(9, 1, 2, 'Radiobutton', 'Частное лицо'),
(10, 1, 2, 'FullName', 'Ирина '),
(11, 1, 2, 'Phone', '89213652444'),
(12, 1, 2, 'Email', 'zebra_2004@rambler.ru'),
(13, 1, 2, 'City', 'Санкт-Петербург '),
(14, 1, 2, 'Message', 'Добрый день, могу ли я ознакомиться с техническом паспортом фасадной доски cm-cladding, документы мне необходимы для проведения экспертизы доски'),
(15, 1, 2, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(16, 1, 2, 'formId', '1'),
(17, 1, 3, 'Radiobutton', 'Компания'),
(18, 1, 3, 'FullName', 'Денис'),
(19, 1, 3, 'Phone', '89051093099'),
(20, 1, 3, 'Email', 'tuirrti@mail.ru'),
(21, 1, 3, 'City', 'Иваново'),
(22, 1, 3, 'Message', 'Добрый день!\nНаша организация занимается переработкой вторичного полиэтилена и полипропилена.\nИщем поставщиков для реализации нового направления, такого как изделия из древесно-полимерного композита.\nКак можно получить образцы вашей продукции, буклеты, прайсы и т.д...\nПрошу направить контактные данные сотрудника Вашей компании для связи по этому вопросу.'),
(23, 1, 3, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(24, 1, 3, 'formId', '1'),
(25, 1, 4, 'Radiobutton', 'Частное лицо'),
(26, 1, 4, 'FullName', 'Борис'),
(27, 1, 4, 'Phone', '9857643589'),
(28, 1, 4, 'Email', 'all2@me.com'),
(29, 1, 4, 'City', 'Москва'),
(30, 1, 4, 'Message', 'Добрый день, ищу фасадную доску CM Cladding,  подскажите у кого можно купить в Москве, к кому не обращусь нет в наличии.\n\n'),
(31, 1, 4, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(32, 1, 4, 'formId', '1'),
(33, 1, 5, 'Radiobutton', 'Частное лицо'),
(34, 1, 5, 'Company', ''),
(35, 1, 5, 'FullName', 'Александр'),
(36, 1, 5, 'Phone', '89139850197'),
(37, 1, 5, 'Email', 'ushakov2130@mail.ru'),
(38, 1, 5, 'City', 'Новосибирск '),
(39, 1, 5, 'Message', 'Добрый День!\nЯ бы хотел узнать как правильно мантировать дпк \nСпасибо '),
(40, 1, 5, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(41, 1, 5, 'formId', '1'),
(42, 1, 6, 'Radiobutton', 'Компания'),
(43, 1, 6, 'Company', ' СпецЭнергоСервис'),
(44, 1, 6, 'FullName', 'Александр'),
(45, 1, 6, 'Phone', '+7-921-986-00-26'),
(46, 1, 6, 'Email', 'a.ermolin@szkontakt.ru'),
(47, 1, 6, 'City', 'Санкт-Петербург'),
(48, 1, 6, 'Message', 'Добрый день!\nИнтересует: Террасная доска (лиственница) - 105 м2\nПрошу сообщить цену и возможный срок поставки.'),
(49, 1, 6, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(50, 1, 6, 'formId', '1'),
(51, 1, 7, 'Radiobutton', 'Частное лицо'),
(52, 1, 7, 'Company', ''),
(53, 1, 7, 'FullName', 'Владимир'),
(54, 1, 7, 'Phone', '+79086392832'),
(55, 1, 7, 'Email', '9086392832@mail.ru'),
(56, 1, 7, 'City', 'Екатеринбург'),
(57, 1, 7, 'Message', 'Подскажите пожалуйста, можно ли использовать ДПК в бане, непосредственно в парилке. '),
(58, 1, 7, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(59, 1, 7, 'formId', '1'),
(60, 1, 8, 'Radiobutton', 'Компания'),
(61, 1, 8, 'Company', 'ООО Логотэк'),
(62, 1, 8, 'FullName', 'Алексей'),
(63, 1, 8, 'Phone', '8-908-988-77-44'),
(64, 1, 8, 'Email', 'logotek-pro@mail.ru'),
(65, 1, 8, 'City', 'Уссурийск'),
(66, 1, 8, 'Message', 'Доброе утро! Прошу выслать оптовый и розничный прайс на вашу продукцию (ДПК). Откуда происходят отгрузки? Довозите ли до транспортной? Что из себя представляет рекламный материал?'),
(67, 1, 8, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(68, 1, 8, 'formId', '1'),
(69, 1, 9, 'Radiobutton', 'Компания'),
(70, 1, 9, 'Company', 'Lignum'),
(71, 1, 9, 'FullName', 'Илья'),
(72, 1, 9, 'Phone', '89213075265'),
(73, 1, 9, 'Email', 'ceo@lignumstore.ru'),
(74, 1, 9, 'City', 'Санкт-Петербург'),
(75, 1, 9, 'Message', 'Добрый день.\nИнтересует Ваша продукция. Сообщите пожалуйста цены и условия работы.\nНаш сайт lignumstore.ru'),
(76, 1, 9, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(77, 1, 9, 'formId', '1'),
(78, 1, 10, 'Radiobutton', 'Компания'),
(79, 1, 10, 'Company', 'Mebelita'),
(80, 1, 10, 'FullName', 'Ярдушкин Игорь Геннадьевич'),
(81, 1, 10, 'Phone', '+79023279555'),
(82, 1, 10, 'Email', 'yardushkin@mail.ru'),
(83, 1, 10, 'City', 'Чебоксары'),
(84, 1, 10, 'Message', 'На один из наших объектов может потребоваться Ваша продукция.\nНам нужен прайс-лист и технический каталог.'),
(85, 1, 10, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(86, 1, 10, 'formId', '1'),
(87, 1, 11, 'Radiobutton', 'Частное лицо'),
(88, 1, 11, 'Company', ''),
(89, 1, 11, 'FullName', 'Станислав'),
(90, 1, 11, 'Phone', '89219172175'),
(91, 1, 11, 'Email', '9172175@gmail.com'),
(92, 1, 11, 'City', 'Санкт-Петербург'),
(93, 1, 11, 'Message', 'Добрый день. Хотим продать оборудование для производства водостоков. Оборудование 2013 года. Все рабочее. Если Вам интересно данное предложение готовы обсудить все детали по телефону.'),
(94, 1, 11, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(95, 1, 11, 'formId', '1'),
(96, 1, 12, 'Radiobutton', 'Частное лицо'),
(97, 1, 12, 'Company', ''),
(98, 1, 12, 'FullName', 'Светлана'),
(99, 1, 12, 'Phone', '89312317451'),
(100, 1, 12, 'Email', '81255@mail.ru'),
(101, 1, 12, 'City', 'Санкт-Петербург'),
(102, 1, 12, 'Message', 'Хотели купить террасную доску 30кв м '),
(103, 1, 12, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(104, 1, 12, 'formId', '1'),
(105, 1, 13, 'Radiobutton', 'Частное лицо'),
(106, 1, 13, 'Company', ''),
(107, 1, 13, 'FullName', 'Дмитрий'),
(108, 1, 13, 'Phone', '89990903040'),
(109, 1, 13, 'Email', 'wladislav29@mail.ru'),
(110, 1, 13, 'City', 'Архангельск'),
(111, 1, 13, 'Message', 'Как можно приобрести вашу продукцию'),
(112, 1, 13, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(113, 1, 13, 'formId', '1'),
(114, 1, 14, 'Radiobutton', 'Частное лицо'),
(115, 1, 14, 'Company', ''),
(116, 1, 14, 'FullName', 'Даниил'),
(117, 1, 14, 'Phone', '89002086610'),
(118, 1, 14, 'Email', '2090808@mail.ru'),
(119, 1, 14, 'City', 'Екатеринбург'),
(120, 1, 14, 'Message', 'Добрый день, подскажите где в Екатеринбурге купить CM Cladding 2,2 (дуб) по акции? Акция вроде как есть, но дилеры в Екатеринбурге которые указаны на Вашем сайте не поддерживают это мероприятие. Спасибо.'),
(121, 1, 14, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(122, 1, 14, 'formId', '1'),
(123, 1, 15, 'Radiobutton', 'Компания'),
(124, 1, 15, 'Company', 'УНО Скрытый крепеж '),
(125, 1, 15, 'FullName', 'Михаил'),
(126, 1, 15, 'Phone', '+ 7 931 969 2259'),
(127, 1, 15, 'Email', 'Mikhail.S@uno-fasteners.ru'),
(128, 1, 15, 'City', 'Санкт-Петербург (РФ)'),
(129, 1, 15, 'Message', 'Доброго дня.\n\nМЫ производим скрытый крепеж из полиамида для монтажа планкена и террасной доски, куда можно прислать вам коммерческое предложение.\n\nСпасибо.'),
(130, 1, 15, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(131, 1, 15, 'formId', '1'),
(132, 1, 16, 'Radiobutton', 'Частное лицо'),
(133, 1, 16, 'Company', ''),
(134, 1, 16, 'FullName', 'Казбек'),
(135, 1, 16, 'Phone', '+79188255519'),
(136, 1, 16, 'Email', 'k1970bk@mail.ru'),
(137, 1, 16, 'City', 'Владикавказ'),
(138, 1, 16, 'Message', 'Можно ли приклеить дпк клеем к металлическим лагам,если да то каким клеем?! Спасибо,жду ответ.'),
(139, 1, 16, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(140, 1, 16, 'formId', '1'),
(141, 1, 17, 'Radiobutton', 'Компания'),
(142, 1, 17, 'Company', 'Забайкалфасад'),
(143, 1, 17, 'FullName', 'Елена'),
(144, 1, 17, 'Phone', '89145118869'),
(145, 1, 17, 'Email', 'Kapitel-EASizikova@bk.ru'),
(146, 1, 17, 'City', 'Чита'),
(147, 1, 17, 'Message', 'Стать официальным дилером'),
(148, 1, 17, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(149, 1, 17, 'formId', '1'),
(150, 1, 18, 'Radiobutton', 'Компания'),
(151, 1, 18, 'Company', 'ТСК'),
(152, 1, 18, 'FullName', 'Сергей'),
(153, 1, 18, 'Phone', '+79780972444'),
(154, 1, 18, 'Email', 'dpk.krum@yandex.ru'),
(155, 1, 18, 'City', 'Симферополь'),
(156, 1, 18, 'Message', 'Интересует заборный профиль и ограждения.'),
(157, 1, 18, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(158, 1, 18, 'formId', '1'),
(159, 1, 19, 'Radiobutton', 'Частное лицо'),
(160, 1, 19, 'Company', ''),
(161, 1, 19, 'FullName', 'Александр'),
(162, 1, 19, 'Phone', '+79967621533'),
(163, 1, 19, 'Email', 'alex.oleshuk.92@mail.ru'),
(164, 1, 19, 'City', 'Санкт-Петербург'),
(165, 1, 19, 'Message', 'Хотелось бы уточнить техническую информацию о продукте'),
(166, 1, 19, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(167, 1, 19, 'formId', '1'),
(168, 1, 20, 'Radiobutton', 'Частное лицо'),
(169, 1, 20, 'Company', ''),
(170, 1, 20, 'FullName', 'Петр'),
(171, 1, 20, 'Phone', '+375296350316'),
(172, 1, 20, 'Email', 'peter.lagutin@gmail.com'),
(173, 1, 20, 'City', 'Минск'),
(174, 1, 20, 'Message', 'Здравствуйте!\nИнтересует доска Vintage цвет Эбен, 25м2\nПоскольку я из Минска, то меня интересует где в Москве она есть в наличии, чтобы купить без предоплат и ожиданий - приехать, заплатить, загрузиться и уехать.\nПодскажите, пжлст.'),
(175, 1, 20, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(176, 1, 20, 'formId', '1'),
(177, 1, 21, 'Radiobutton', 'Частное лицо'),
(178, 1, 21, 'Company', ''),
(179, 1, 21, 'FullName', 'Александр'),
(180, 1, 21, 'Phone', '+79967621533'),
(181, 1, 21, 'Email', 'alex.oleshuk.92@mail.ru'),
(182, 1, 21, 'City', 'Санкт-Петербург'),
(183, 1, 21, 'Message', 'Нужна техническая информация'),
(184, 1, 21, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(185, 1, 21, 'formId', '1'),
(186, 1, 22, 'Radiobutton', 'Компания'),
(187, 1, 22, 'Company', 'Вэд климат'),
(188, 1, 22, 'FullName', 'Дмитрий'),
(189, 1, 22, 'Phone', '89277606242'),
(190, 1, 22, 'Email', 'kondicioner63@ya.ru'),
(191, 1, 22, 'City', 'Самара'),
(192, 1, 22, 'Message', 'Какие условия'),
(193, 1, 22, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(194, 1, 22, 'formId', '1'),
(195, 1, 23, 'Radiobutton', 'Компания'),
(196, 1, 23, 'Company', 'ТОП ХАУС'),
(197, 1, 23, 'FullName', 'Александр'),
(198, 1, 23, 'Phone', '+79967621533'),
(199, 1, 23, 'Email', 'alex.oleshuk.92@mail.ru'),
(200, 1, 23, 'City', 'Санкт-Петербург'),
(201, 1, 23, 'Message', 'Добрый день, мне нужна более полная техническая информация о террасной доске, состав и т.д. \nP.s. Тех информации на сайте не достаточно'),
(202, 1, 23, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(203, 1, 23, 'formId', '1'),
(204, 1, 24, 'Radiobutton', 'Компания'),
(205, 1, 24, 'Company', 'ООО Воттоваара'),
(206, 1, 24, 'FullName', 'Алексей'),
(207, 1, 24, 'Phone', '89114010000'),
(208, 1, 24, 'Email', 'gaz10rus@yandex.ru'),
(209, 1, 24, 'City', 'Petrozavodsk'),
(210, 1, 24, 'Message', 'Добрый день. Как стать диллером. мы находимся город Петрозаводск. диллера нет'),
(211, 1, 24, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(212, 1, 24, 'formId', '1'),
(213, 1, 25, 'Radiobutton', 'Компания'),
(214, 1, 25, 'Company', 'ОРСИ'),
(215, 1, 25, 'FullName', 'Ольга'),
(216, 1, 25, 'Phone', '9858148414'),
(217, 1, 25, 'Email', 'frolova@orsi-tc.ru'),
(218, 1, 25, 'City', 'Москва'),
(219, 1, 25, 'Message', 'Интересует сотрудничество по поставкам садового паркета.\nНаши клиенты - сети DIY Федерального и регионального назначения.\nВопрос срочный(есть заказ)'),
(220, 1, 25, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(221, 1, 25, 'formId', '1'),
(222, 1, 26, 'Radiobutton', 'Компания'),
(223, 1, 26, 'Company', 'ооо ДИАС'),
(224, 1, 26, 'FullName', 'Сергей'),
(225, 1, 26, 'Phone', '89067955604'),
(226, 1, 26, 'Email', 'bsv-20@yandex.ru'),
(227, 1, 26, 'City', 'Москва'),
(228, 1, 26, 'Message', 'Здравствуйте.  Подскажите по стоимости шпалер.'),
(229, 1, 26, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(230, 1, 26, 'formId', '1'),
(231, 1, 27, 'Radiobutton', 'Компания'),
(232, 1, 27, 'Company', 'ООО Воттоваара'),
(233, 1, 27, 'FullName', 'Алексей Николаевич Ахматов'),
(234, 1, 27, 'Phone', '89114010000'),
(235, 1, 27, 'Email', 'gaz10rus@yandex.ru'),
(236, 1, 27, 'City', 'Петрозаводск'),
(237, 1, 27, 'Message', 'Хотим с вами работать . Что нужно для этого?'),
(238, 1, 27, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(239, 1, 27, 'formId', '1'),
(240, 1, 28, 'Radiobutton', 'Компания'),
(241, 1, 28, 'Company', 'test'),
(242, 1, 28, 'FullName', 'Олег Алексеевич Орлов'),
(243, 1, 28, 'Phone', '1111111'),
(244, 1, 28, 'Email', 'oleg.orlov@utsrus.com'),
(245, 1, 28, 'City', 'Санкт-Петербург'),
(246, 1, 28, 'Message', 'test'),
(247, 1, 28, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(248, 1, 28, 'formId', '1'),
(249, 1, 29, 'Radiobutton', 'Компания'),
(250, 1, 29, 'Company', 'ООО Браво '),
(251, 1, 29, 'FullName', 'Владимир '),
(252, 1, 29, 'Phone', '89222077570'),
(253, 1, 29, 'Email', 'raumwelt@mail.ru'),
(254, 1, 29, 'City', 'Екатерибург'),
(255, 1, 29, 'Message', 'Дилерство в Екатеринбурге'),
(256, 1, 29, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(257, 1, 29, 'formId', '1'),
(258, 1, 30, 'Radiobutton', 'Компания'),
(259, 1, 30, 'Company', 'БауМастер'),
(260, 1, 30, 'FullName', 'Артем'),
(261, 1, 30, 'Phone', '9292224161'),
(262, 1, 30, 'Email', 'valter@bau-meister.ru'),
(263, 1, 30, 'City', 'Екатеринбург'),
(264, 1, 30, 'Message', 'занимаемся продажами строительных материалов в оптовом и розничных секторах, а также ремонтом и строительством в малоэтажном сегменте (Служба профессионального сопровождения строительства  ) периодически приходят заявки на вашу продукцию, вышлите условия работы и прайс на продукцию'),
(265, 1, 30, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(266, 1, 30, 'formId', '1'),
(267, 1, 31, 'Radiobutton', 'Компания'),
(268, 1, 31, 'Company', 'ооо'),
(269, 1, 31, 'FullName', 'Семен'),
(270, 1, 31, 'Phone', '89046778585'),
(271, 1, 31, 'Email', 'stroytorg-kazan@mail.ru'),
(272, 1, 31, 'City', 'казань'),
(273, 1, 31, 'Message', 'Добрый день!!! Мне нужно что бы со мной связался ваш представитель в Казани по имени Альберт.'),
(274, 1, 31, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(275, 1, 31, 'formId', '1'),
(276, 1, 32, 'Radiobutton', 'Частное лицо'),
(277, 1, 32, 'Company', ''),
(278, 1, 32, 'FullName', 'Виталий'),
(279, 1, 32, 'Phone', '+79141694345'),
(280, 1, 32, 'Email', 'vitaly1@bk.ru'),
(281, 1, 32, 'City', 'Хабаровск'),
(282, 1, 32, 'Message', 'Мне необходимо на смонтированную платформу 3 на 6 метров уложить террасную доску. Можно ли у Вас её приобрести и сколько это будет стоить?'),
(283, 1, 32, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(284, 1, 32, 'formId', '1'),
(285, 1, 33, 'Radiobutton', 'Частное лицо'),
(286, 1, 33, 'Company', ''),
(287, 1, 33, 'FullName', 'Сергей'),
(288, 1, 33, 'Phone', '89110743593'),
(289, 1, 33, 'Email', 'kdindustry@yandex.ru'),
(290, 1, 33, 'City', 'Калининград'),
(291, 1, 33, 'Message', 'Добрый день! Хотел узнать условия получения статуса дилера.'),
(292, 1, 33, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(293, 1, 33, 'formId', '1'),
(294, 1, 34, 'Radiobutton', 'Частное лицо'),
(295, 1, 34, 'Company', ''),
(296, 1, 34, 'FullName', 'Александр'),
(297, 1, 34, 'Phone', '+79111718666'),
(298, 1, 34, 'Email', 'burnash@mail.ru'),
(299, 1, 34, 'City', 'Санкт-Петербург'),
(300, 1, 34, 'Message', 'Меня интересует сайдинг из ДПК для отделки загородного домика'),
(301, 1, 34, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(302, 1, 34, 'formId', '1'),
(303, 1, 35, 'Radiobutton', 'Частное лицо'),
(304, 1, 35, 'Company', ''),
(305, 1, 35, 'FullName', 'Федор Константинович'),
(306, 1, 35, 'Phone', '+79622736009'),
(307, 1, 35, 'Email', 'bog70@yandex.ru'),
(308, 1, 35, 'City', 'г.Щекино '),
(309, 1, 35, 'Message', 'Добрый день .Занимаюсь комплектацией и строительством домов малоэтажного строительства ,прошу сообщить о возможности сотрудничества по реализации продукции на территории тульской области и г.тулы ,выслать прайс лист \nс уважением Федор Константинович'),
(310, 1, 35, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(311, 1, 35, 'formId', '1'),
(312, 1, 36, 'Radiobutton', 'Частное лицо'),
(313, 1, 36, 'Company', ''),
(314, 1, 36, 'FullName', 'Ирина '),
(315, 1, 36, 'Phone', '89024729494'),
(316, 1, 36, 'Email', 'irinacode@mail.ru'),
(317, 1, 36, 'City', 'Пермь'),
(318, 1, 36, 'Message', 'Интересует террасная доска ( палубная ) из лиственницы . '),
(319, 1, 36, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(320, 1, 36, 'formId', '1'),
(321, 1, 37, 'Radiobutton', 'Частное лицо'),
(322, 1, 37, 'Company', ''),
(323, 1, 37, 'FullName', 'Евгений'),
(324, 1, 37, 'Phone', '89226546200'),
(325, 1, 37, 'Email', 'zhenechka.momot@mai.lru'),
(326, 1, 37, 'City', 'ХМАО Сургут'),
(327, 1, 37, 'Message', 'Здравствуйте Требуется расчет стоимости и доставки ДПК'),
(328, 1, 37, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(329, 1, 37, 'formId', '1'),
(330, 1, 38, 'Radiobutton', 'Частное лицо'),
(331, 1, 38, 'Company', ''),
(332, 1, 38, 'FullName', 'Сергей'),
(333, 1, 38, 'Phone', '+79177585620'),
(334, 1, 38, 'Email', 'sergeysimonov63@gmail.com'),
(335, 1, 38, 'City', 'Уфа '),
(336, 1, 38, 'Message', 'Нужно композитное ограждение на два балкона с трех сторон с размерами 1200х4150 и 1200х5550 ростояние между осями с рисунком чертёж 7 '),
(337, 1, 38, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(338, 1, 38, 'formId', '1'),
(339, 1, 39, 'Radiobutton', 'Частное лицо'),
(340, 1, 39, 'Company', ''),
(341, 1, 39, 'FullName', 'Виктор'),
(342, 1, 39, 'Phone', '89603172686'),
(343, 1, 39, 'Email', 'snab@rem-str.ru'),
(344, 1, 39, 'City', 'Пенза'),
(345, 1, 39, 'Message', 'Доска ДПК цвет коричневый 31шт\nРазмеры веранды 4,85*4,45 укладка по стороне 4,85'),
(346, 1, 39, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(347, 1, 39, 'formId', '1'),
(348, 1, 40, 'Radiobutton', 'Компания'),
(349, 1, 40, 'Company', 'Комфортный дом'),
(350, 1, 40, 'FullName', 'Сергей'),
(351, 1, 40, 'Phone', '89601865686'),
(352, 1, 40, 'Email', 'comforthouse52@mail.ru'),
(353, 1, 40, 'City', 'Нижний Новгород'),
(354, 1, 40, 'Message', 'Здравствуйте. Интересует сотрудничество по изделиям ДПК. Территория работы Нижегородская область'),
(355, 1, 40, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(356, 1, 40, 'formId', '1'),
(357, 1, 41, 'Radiobutton', 'Компания'),
(358, 1, 41, 'Company', 'БлагоСтройПрестиж'),
(359, 1, 41, 'FullName', 'Ирина'),
(360, 1, 41, 'Phone', '8-4956416707       8 -4986010695'),
(361, 1, 41, 'Email', 'info@bsp7.ru'),
(362, 1, 41, 'City', 'г. Москва'),
(363, 1, 41, 'Message', 'Прошу дать кп на ДПК в наличии\nRal- 706\nдлина доски 1,5м.\n30м.2\n\nВо вложении пример цвета который мне нужен.\nэто как раз ral - 706\nон может немного отличаться от фото.\n\nСоединительные элементы не нужны.!\nДоска между собой соединяться не будет!\nДоска нужна для производства скамеек.\nТорцы должны быть закрыты.\nСпасибо. '),
(364, 1, 41, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(365, 1, 41, 'formId', '1'),
(366, 1, 42, 'Radiobutton', 'Частное лицо'),
(367, 1, 42, 'Company', ''),
(368, 1, 42, 'FullName', 'Андрей'),
(369, 1, 42, 'Phone', '+79023000009'),
(370, 1, 42, 'Email', 'prosport52@bk.ru'),
(371, 1, 42, 'City', 'Нижний Новгород'),
(372, 1, 42, 'Message', 'цену на террасную доску из лиственницы,где купить?'),
(373, 1, 42, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(374, 1, 42, 'formId', '1'),
(375, 1, 43, 'Radiobutton', 'Частное лицо'),
(376, 1, 43, 'Company', ''),
(377, 1, 43, 'FullName', 'василий'),
(378, 1, 43, 'Phone', '89835658814'),
(379, 1, 43, 'Email', 'gavrilovomsk@mail.ru'),
(380, 1, 43, 'City', 'сочи'),
(381, 1, 43, 'Message', 'как сдклть заказ в Сочи?'),
(382, 1, 43, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(383, 1, 43, 'formId', '1'),
(384, 1, 44, 'Radiobutton', 'Компания'),
(385, 1, 44, 'Company', 'БлагоСтройПрестиж'),
(386, 1, 44, 'FullName', 'Ирина '),
(387, 1, 44, 'Phone', '+74956416707'),
(388, 1, 44, 'Email', 'info@bsp7.ru'),
(389, 1, 44, 'City', 'Москва'),
(390, 1, 44, 'Message', 'Нужно дпк на скамьи '),
(391, 1, 44, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(392, 1, 44, 'formId', '1'),
(393, 1, 45, 'Radiobutton', 'Частное лицо'),
(394, 1, 45, 'Company', ''),
(395, 1, 45, 'FullName', 'виктория'),
(396, 1, 45, 'Phone', '+79629946812'),
(397, 1, 45, 'Email', 'nika410@mail.ru'),
(398, 1, 45, 'City', 'vjcrdf'),
(399, 1, 45, 'Message', 'террасная доска дпк'),
(400, 1, 45, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(401, 1, 45, 'formId', '1'),
(402, 1, 46, 'Radiobutton', 'Частное лицо'),
(403, 1, 46, 'Company', ''),
(404, 1, 46, 'FullName', 'Андрей'),
(405, 1, 46, 'Phone', '+79025773608'),
(406, 1, 46, 'Email', 'manzia@mail.ru'),
(407, 1, 46, 'City', 'Иркутск'),
(408, 1, 46, 'Message', 'Заказать террасную доску '),
(409, 1, 46, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(410, 1, 46, 'formId', '1'),
(411, 1, 47, 'Radiobutton', 'Компания'),
(412, 1, 47, 'Company', 'ООО Технокомпроект'),
(413, 1, 47, 'FullName', 'Игорь '),
(414, 1, 47, 'Phone', '+7 921 9637831'),
(415, 1, 47, 'Email', 'igor@jamstone.ru'),
(416, 1, 47, 'City', 'Санкт Петербург'),
(417, 1, 47, 'Message', 'Интересует изделия из термообработанной доски для фасадов,террас'),
(418, 1, 47, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(419, 1, 47, 'formId', '1'),
(420, 1, 48, 'Radiobutton', 'Частное лицо'),
(421, 1, 48, 'Company', ''),
(422, 1, 48, 'FullName', 'Елена Кисленкова'),
(423, 1, 48, 'Phone', '89824751007'),
(424, 1, 48, 'Email', 'elen.kisl@yandex.ru'),
(425, 1, 48, 'City', 'Пермь'),
(426, 1, 48, 'Message', 'Интересует Ваша продукция . Цена и возможность отправки транспортной компанией до места назначения г.ПЕРМЬ '),
(427, 1, 48, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(428, 1, 48, 'formId', '1'),
(429, 1, 49, 'Radiobutton', 'Компания'),
(430, 1, 49, 'Company', 'ООО СибСК'),
(431, 1, 49, 'FullName', 'Валерий'),
(432, 1, 49, 'Phone', '+79029407361'),
(433, 1, 49, 'Email', 'valfomintsev@gmail.com'),
(434, 1, 49, 'City', 'Красноярск'),
(435, 1, 49, 'Message', 'Предлагаем сотрудничество по поставке погонажных изделий из Красноярского края'),
(436, 1, 49, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(437, 1, 49, 'formId', '1'),
(438, 1, 50, 'Radiobutton', 'Компания'),
(439, 1, 50, 'Company', 'Декор и Свет'),
(440, 1, 50, 'FullName', 'Татьяна'),
(441, 1, 50, 'Phone', '8(3424)201061'),
(442, 1, 50, 'Email', 'decor.svet@mail.ru'),
(443, 1, 50, 'City', 'Березники, Пермский край'),
(444, 1, 50, 'Message', 'Интересуют условия сотрудничества, оптовые цены, образцы , сроки поставок'),
(445, 1, 50, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(446, 1, 50, 'formId', '1'),
(447, 1, 51, 'Radiobutton', 'Частное лицо'),
(448, 1, 51, 'Company', ''),
(449, 1, 51, 'FullName', 'Николай'),
(450, 1, 51, 'Phone', '+79853862949'),
(451, 1, 51, 'Email', '3388640@mail.ru'),
(452, 1, 51, 'City', 'Москва'),
(453, 1, 51, 'Message', 'Есть ли у Вас цвет Терракот'),
(454, 1, 51, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(455, 1, 51, 'formId', '1'),
(456, 1, 52, 'Radiobutton', 'Компания'),
(457, 1, 52, 'Company', 'ООО '),
(458, 1, 52, 'FullName', 'Рамиль'),
(459, 1, 52, 'Phone', '9274023502'),
(460, 1, 52, 'Email', 'koral-snab@mail.ru'),
(461, 1, 52, 'City', 'Казань'),
(462, 1, 52, 'Message', 'Хочу приобрести планкен из лиственницы.'),
(463, 1, 52, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(464, 1, 52, 'formId', '1'),
(465, 1, 53, 'Radiobutton', 'Компания'),
(466, 1, 53, 'Company', 'ООО Технологии света'),
(467, 1, 53, 'FullName', 'Виолетта'),
(468, 1, 53, 'Phone', '89185584685'),
(469, 1, 53, 'Email', 'order@tl-led.ru'),
(470, 1, 53, 'City', 'Таганрог'),
(471, 1, 53, 'Message', 'Добрый день, интересует  террасная доска цвет дуб, необходимо с вами связаться для просчета'),
(472, 1, 53, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(473, 1, 53, 'formId', '1'),
(474, 1, 54, 'Radiobutton', 'Компания'),
(475, 1, 54, 'Company', 'ИП Богач Александр Л'),
(476, 1, 54, 'FullName', 'Александр '),
(477, 1, 54, 'Phone', '89672788424'),
(478, 1, 54, 'Email', 'info@vasha-terrasa.ru'),
(479, 1, 54, 'City', 'Москва'),
(480, 1, 54, 'Message', 'Мы занимаемся строительством террас. И хотели бы внедрить Вашу доску в наш ассортимент. \nВаша -терраса.рф'),
(481, 1, 54, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(482, 1, 54, 'formId', '1'),
(483, 1, 55, 'Radiobutton', 'Компания'),
(484, 1, 55, 'Company', 'Автомаркет'),
(485, 1, 55, 'FullName', 'александр'),
(486, 1, 55, 'Phone', '89115770577'),
(487, 1, 55, 'Email', 'alfa-servis777@mail.ru'),
(488, 1, 55, 'City', 'yfhmzy-vfh'),
(489, 1, 55, 'Message', 'добрый день ! нас интересует Палубная доска из лиственницы обработанная, сорт Прима, 140х45мм в количестве - 600 м кв '),
(490, 1, 55, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(491, 1, 55, 'formId', '1'),
(492, 1, 56, 'Radiobutton', 'Частное лицо'),
(493, 1, 56, 'Company', ''),
(494, 1, 56, 'FullName', 'Евгений'),
(495, 1, 56, 'Phone', '89507102477'),
(496, 1, 56, 'Email', 'koloskov.evgenii@mail.ru'),
(497, 1, 56, 'City', 'Белгород'),
(498, 1, 56, 'Message', 'Добрый день! Интересует террасная доска'),
(499, 1, 56, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(500, 1, 56, 'formId', '1'),
(501, 1, 57, 'Radiobutton', 'Частное лицо'),
(502, 1, 57, 'Company', ''),
(503, 1, 57, 'FullName', 'Василий'),
(504, 1, 57, 'Phone', '9617822322'),
(505, 1, 57, 'Email', '70214472@mail.ru'),
(506, 1, 57, 'City', 'Тюмень'),
(507, 1, 57, 'Message', 'Хочу купить террасную доску Серия Vintage. Скажите пожалуйста как можно это сделать?'),
(508, 1, 57, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(509, 1, 57, 'formId', '1'),
(510, 1, 58, 'Radiobutton', 'Компания'),
(511, 1, 58, 'Company', 'МС Регион'),
(512, 1, 58, 'FullName', 'Милан'),
(513, 1, 58, 'Phone', '8925-22-31-787'),
(514, 1, 58, 'Email', 'spkreg@mail.ru'),
(515, 1, 58, 'City', 'Москва'),
(516, 1, 58, 'Message', 'Какой самый большой дилер в Москве, у которого есть кроме декинга и соответствующий крепеж? Контакт?'),
(517, 1, 58, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(518, 1, 58, 'formId', '1'),
(519, 1, 59, 'Radiobutton', 'Частное лицо'),
(520, 1, 59, 'Company', ''),
(521, 1, 59, 'FullName', 'Алексей'),
(522, 1, 59, 'Phone', '+79052072505'),
(523, 1, 59, 'Email', 'spb.potolki@mail.ru'),
(524, 1, 59, 'City', 'СПб'),
(525, 1, 59, 'Message', 'Здравствуйте,интересует терр.доска из ДПК.'),
(526, 1, 59, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(527, 1, 59, 'formId', '1'),
(528, 1, 60, 'Radiobutton', 'Компания'),
(529, 1, 60, 'Company', 'Magly Proekt'),
(530, 1, 60, 'FullName', 'Владислав'),
(531, 1, 60, 'Phone', '8 (499) 520-77-80 (24)'),
(532, 1, 60, 'Email', 'v.lykov@maglyproekt.com'),
(533, 1, 60, 'City', 'Москва'),
(534, 1, 60, 'Message', 'Добрый день!\n\nНаша компания занимается ландшафтным проектированием нового объекта по адресу: г. Москва, Химкинское водохранилище. Для данного и будущих проектов нашим архитекторам хотелось бы получить образцы вашей ДПК доски. \n\nТакже нам хотелось бы получить, по возможности, каталог с указанием возможных цветов и технических характеристик на данные образцы.\n\nСпасибо!'),
(535, 1, 60, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(536, 1, 60, 'formId', '1'),
(537, 1, 61, 'Radiobutton', 'Частное лицо'),
(538, 1, 61, 'Company', ''),
(539, 1, 61, 'FullName', 'Артур'),
(540, 1, 61, 'Phone', '89038781740'),
(541, 1, 61, 'Email', 'aror@inbox.ru'),
(542, 1, 61, 'City', 'Иваново'),
(543, 1, 61, 'Message', 'Интересуют Перила из ДПК , цены, сроки'),
(544, 1, 61, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(545, 1, 61, 'formId', '1'),
(546, 1, 62, 'Radiobutton', 'Компания'),
(547, 1, 62, 'Company', 'ООО Латитудо'),
(548, 1, 62, 'FullName', 'Ирина'),
(549, 1, 62, 'Phone', '+79511446626'),
(550, 1, 62, 'Email', 'content@latitudo.ru'),
(551, 1, 62, 'City', 'Белгород'),
(552, 1, 62, 'Message', 'Здравствуйте\nУ вас на сайте на странице \n2 цвета венге на странице террасная доска серия SOLID\n возможно опечатка\nподскажите еще цены на серию террасной доски SOLID'),
(553, 1, 62, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(554, 1, 62, 'formId', '1'),
(555, 1, 63, 'Radiobutton', 'Частное лицо'),
(556, 1, 63, 'Company', ''),
(557, 1, 63, 'FullName', 'андрей сергеевич шарапов'),
(558, 1, 63, 'Phone', '89286222942'),
(559, 1, 63, 'Email', 'asharapow@mail.ru'),
(560, 1, 63, 'City', 'РОСТОВСКАЯ ОБЛАСТЬ'),
(561, 1, 63, 'Message', 'дпк хочу купить в ростове-на-дону'),
(562, 1, 63, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(563, 1, 63, 'formId', '1'),
(564, 1, 64, 'Radiobutton', 'Частное лицо'),
(565, 1, 64, 'Company', ''),
(566, 1, 64, 'FullName', 'Андрей'),
(567, 1, 64, 'Phone', '89168770004'),
(568, 1, 64, 'Email', 'andalh@yandex.ru'),
(569, 1, 64, 'City', 'Москва'),
(570, 1, 64, 'Message', 'интересует дилерство'),
(571, 1, 64, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(572, 1, 64, 'formId', '1'),
(573, 1, 65, 'Radiobutton', 'Частное лицо'),
(574, 1, 65, 'Company', ''),
(575, 1, 65, 'FullName', 'Сергей'),
(576, 1, 65, 'Phone', '89519122020'),
(577, 1, 65, 'Email', 'terrasann@mail.ru'),
(578, 1, 65, 'City', 'Нижний Новгород'),
(579, 1, 65, 'Message', 'Здравствуйте! Прошу выслать дилерский прайс и условия для дилеров. Спасибо!'),
(580, 1, 65, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(581, 1, 65, 'formId', '1'),
(582, 1, 66, 'Radiobutton', 'Компания'),
(583, 1, 66, 'Company', 'СИБДЭК  ООО'),
(584, 1, 66, 'FullName', 'Алексей'),
(585, 1, 66, 'Phone', '+79039303338'),
(586, 1, 66, 'Email', '3121054@mail.ru'),
(587, 1, 66, 'City', 'Новосибирск'),
(588, 1, 66, 'Message', 'Добрый день,  наша компания занимается  торговлей древесно-полимерного композита (ДПК)  в Новосибирске. Интересует условия сотрудничества.'),
(589, 1, 66, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(590, 1, 66, 'formId', '1'),
(591, 1, 67, 'Radiobutton', 'Частное лицо'),
(592, 1, 67, 'Company', ''),
(593, 1, 67, 'FullName', 'Сергей'),
(594, 1, 67, 'Phone', '+79161455321'),
(595, 1, 67, 'Email', 'shunkin@mail.ru'),
(596, 1, 67, 'City', 'Москва'),
(597, 1, 67, 'Message', 'Добрый день!\nДилер нее смог четко ответить на вопрос.\nНами была приобретена доска цвета Венге серии Винтаж, на Вашем сайте инфо, что заглушек под нее нет, есть только торцевая доска или уголок. Возможно ли использование заглушек для серии Натур? Т.к. я, например, не вижу разнице в профиле досок серий Винтаж и Натур.\nЕсли да, то есть ли у они у вас в наличии (90 штук), чтобы сделать заказ через дилера?\n\nЕсли нет, то какие варианты может предложить, чтобы эстетично закрыть торцы досок?\n\nПризнателен за скорый ответ,\nСергей'),
(598, 1, 67, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(599, 1, 67, 'formId', '1'),
(600, 1, 68, 'Radiobutton', 'Частное лицо'),
(601, 1, 68, 'Company', ''),
(602, 1, 68, 'FullName', 'Дмитрий'),
(603, 1, 68, 'Phone', '89146551288'),
(604, 1, 68, 'Email', 'miruslug@bk.ru'),
(605, 1, 68, 'City', 'Владивосток'),
(606, 1, 68, 'Message', 'Купить и установить фасад'),
(607, 1, 68, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(608, 1, 68, 'formId', '1'),
(609, 1, 69, 'Radiobutton', 'Компания'),
(610, 1, 69, 'Company', 'ООО ОЛДИ СТРОЙ'),
(611, 1, 69, 'FullName', 'Дмитрий'),
(612, 1, 69, 'Phone', '+79038124557'),
(613, 1, 69, 'Email', 'oldi.obninsk@mail.ru'),
(614, 1, 69, 'City', 'Обнинск'),
(615, 1, 69, 'Message', 'Добрый день! Наша компания продаёт изделия из ДПК. На склад не приобретаем, только под заказ. Заинтересовала ваша фасадная облицовка из ДПК. Возможно ли получить на неё интересное предложение по цене и образцы?'),
(616, 1, 69, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(617, 1, 69, 'formId', '1'),
(618, 1, 70, 'Radiobutton', 'Компания'),
(619, 1, 70, 'Company', 'PAKON'),
(620, 1, 70, 'FullName', 'Алексей'),
(621, 1, 70, 'Phone', '+79262153125'),
(622, 1, 70, 'Email', 'Ledenev@pakon.ru'),
(623, 1, 70, 'City', 'Москва'),
(624, 1, 70, 'Message', 'Добрый день, наша компания занимается отделкой фасадов, остеклением, кровлями загородных резиденций.\n\nВ данный момент в работе проект, где архитектор хочет применить Вашу продукцию.\nИнтересуют Доски в варианте из ДПК для террас  Cottagemode Scandinavia серии Solid 140х22мм (без пустот)\nПлощадь данной террасы 240 м.кв.'),
(625, 1, 70, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(626, 1, 70, 'formId', '1'),
(627, 1, 71, 'Radiobutton', 'Частное лицо'),
(628, 1, 71, 'Company', ''),
(629, 1, 71, 'FullName', 'Катя '),
(630, 1, 71, 'Phone', '788888888888'),
(631, 1, 71, 'Email', 'nadjva@bigmir.net'),
(632, 1, 71, 'City', 'Киев'),
(633, 1, 71, 'Message', 'Добрый день \nСкажите, пожалуйста, ваш садовый паркет подходит для укладки на закрытом балконе квартиры, где не так проветривается, как на улице? Может ли выделится запах или какие-то испарения?\nСпасибо '),
(634, 1, 71, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(635, 1, 71, 'formId', '1'),
(636, 1, 72, 'Radiobutton', 'Компания'),
(637, 1, 72, 'Company', 'Студия Алиса Фасады'),
(638, 1, 72, 'FullName', 'Дозоров Андрей Геннадьевич'),
(639, 1, 72, 'Phone', '+79114511147'),
(640, 1, 72, 'Email', 'info@alisa39.com'),
(641, 1, 72, 'City', 'Калининград'),
(642, 1, 72, 'Message', 'Добрый день! \nимеем интерес представить вашу продукцию на рынке калининградского региона. '),
(643, 1, 72, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(644, 1, 72, 'formId', '1'),
(645, 1, 73, 'Radiobutton', 'Компания'),
(646, 1, 73, 'Company', '102 фасада'),
(647, 1, 73, 'FullName', 'Зухра'),
(648, 1, 73, 'Phone', '89378440102'),
(649, 1, 73, 'Email', 'zfmuham@gmail.com'),
(650, 1, 73, 'City', 'Уфа'),
(651, 1, 73, 'Message', 'Здравствуйте,\nинтересует дилерство в РБ, часть Челябинской области. '),
(652, 1, 73, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(653, 1, 73, 'formId', '1'),
(654, 1, 74, 'Radiobutton', 'Частное лицо'),
(655, 1, 74, 'Company', ''),
(656, 1, 74, 'FullName', 'Владимир'),
(657, 1, 74, 'Phone', '9206406181'),
(658, 1, 74, 'Email', 'golitsinvo@mail.ru'),
(659, 1, 74, 'City', 'Кострома'),
(660, 1, 74, 'Message', 'Добрый день. Заинтересовала террасная доска серии Микс. Хотелось бы узнать стоимость и условия приобретения.'),
(661, 1, 74, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(662, 1, 74, 'formId', '1'),
(663, 1, 75, 'Radiobutton', 'Частное лицо'),
(664, 1, 75, 'Company', ''),
(665, 1, 75, 'FullName', 'Сергей'),
(666, 1, 75, 'Phone', '+77074222984'),
(667, 1, 75, 'Email', 'Sayanles_kz@mail.ru'),
(668, 1, 75, 'City', 'Астана'),
(669, 1, 75, 'Message', 'Требуется террассная доска листва 27- 28 мм , обьём 350м2'),
(670, 1, 75, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(671, 1, 75, 'formId', '1'),
(672, 1, 76, 'Radiobutton', 'Компания'),
(673, 1, 76, 'Company', 'ЕВРОФАСАД'),
(674, 1, 76, 'FullName', 'Ирина'),
(675, 1, 76, 'Phone', '89511359320'),
(676, 1, 76, 'Email', 'eurofasad31@ya.ru'),
(677, 1, 76, 'City', 'Белгород'),
(678, 1, 76, 'Message', 'интересует террасная доска и ограждения.ищем поставщиков'),
(679, 1, 76, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(680, 1, 76, 'formId', '1'),
(681, 1, 77, 'Radiobutton', 'Компания'),
(682, 1, 77, 'Company', 'ИП Сотников '),
(683, 1, 77, 'FullName', 'Ирина'),
(684, 1, 77, 'Phone', '89271192315'),
(685, 1, 77, 'Email', 'Sobosrus@bk.ru'),
(686, 1, 77, 'City', 'Саратов'),
(687, 1, 77, 'Message', 'Необходимо приобрести фасадную доску'),
(688, 1, 77, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(689, 1, 77, 'formId', '1'),
(690, 1, 78, 'Radiobutton', 'Частное лицо'),
(691, 1, 78, 'Company', ''),
(692, 1, 78, 'FullName', 'Ирина'),
(693, 1, 78, 'Phone', '89086745255'),
(694, 1, 78, 'Email', 'y.tsandera@gmail.com'),
(695, 1, 78, 'City', 'Краснодар'),
(696, 1, 78, 'Message', 'Здравствуйте,  я ландшафтный дизайнер, познакомилась с вашей компанией на выставке. Хочу узнать стоимость заборного профиля из ДПК?'),
(697, 1, 78, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(698, 1, 78, 'formId', '1'),
(699, 1, 79, 'Radiobutton', 'Частное лицо'),
(700, 1, 79, 'Company', ''),
(701, 1, 79, 'FullName', 'Андрей'),
(702, 1, 79, 'Phone', '+79122364564'),
(703, 1, 79, 'Email', 'andrey@saiding66.ru'),
(704, 1, 79, 'City', 'Екатеринбург'),
(705, 1, 79, 'Message', 'Здравствуйте. Можно узнать подробнее об условиях по дилерству?'),
(706, 1, 79, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(707, 1, 79, 'formId', '1'),
(708, 1, 80, 'Radiobutton', 'Компания'),
(709, 1, 80, 'Company', 'Кубиметр'),
(710, 1, 80, 'FullName', 'Антон'),
(711, 1, 80, 'Phone', '9602600203'),
(712, 1, 80, 'Email', 'info@kubimetr.ru'),
(713, 1, 80, 'City', 'Санкт-Петербург'),
(714, 1, 80, 'Message', 'Интерес к продукции.'),
(715, 1, 80, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(716, 1, 80, 'formId', '1'),
(717, 1, 81, 'Radiobutton', 'Компания'),
(718, 1, 81, 'Company', 'Оконные Технологии'),
(719, 1, 81, 'FullName', 'Максим Сундеев'),
(720, 1, 81, 'Phone', '+79046893016'),
(721, 1, 81, 'Email', 'info@serviceslip.ru'),
(722, 1, 81, 'City', 'Липецк'),
(723, 1, 81, 'Message', 'Хотелось бы связаться с целью дальнейшего сотрудничества.'),
(724, 1, 81, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(725, 1, 81, 'formId', '1'),
(726, 1, 82, 'Radiobutton', 'Частное лицо'),
(727, 1, 82, 'Company', ''),
(728, 1, 82, 'FullName', 'Андрей'),
(729, 1, 82, 'Phone', '+375256171489'),
(730, 1, 82, 'Email', 'ales.grinberg@yandex.by'),
(731, 1, 82, 'City', 'Минск'),
(732, 1, 82, 'Message', 'Здравствуйте, меня зовут Андрей.\n\nИнтересуюсь темой паркетной доски, точнее ДПК, изучал её в интернете - увидел ваш сайт в рекламе Яндекса.\n\nЖиву в Минске, не в РФ! Реклама не должна была мне показываться! Вы же только по РФ работаете? Здесь много своих таких производителей и продавцов, вряд-ли к вам кто-то обратится.\n\nРекламу на Яндексе сами делали и настраиваете?\n\nСудя по всему настроена она не правильно. Получается, что вы показываете рекламу не тем кому её надо показывать, они - кликают, вы - платите. Крутите рекламу и отправляете деньги - в космос!\n\nПодскажите это тем, кто занимается у вас рекламой - пусть исправят ошибки.\n\nСам наступал на эти грабли лет 10 назад. Если что - спрашивайте, подскажу что знаю.\n\nУдачи!'),
(733, 1, 82, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(734, 1, 82, 'formId', '1'),
(735, 1, 83, 'Radiobutton', 'Компания'),
(736, 1, 83, 'Company', 'ООО КАПЕР'),
(737, 1, 83, 'FullName', 'Антон'),
(738, 1, 83, 'Phone', '+79122292244'),
(739, 1, 83, 'Email', 'ooo_kaper@mail.ru'),
(740, 1, 83, 'City', 'Екатеринбург'),
(741, 1, 83, 'Message', 'Хочу приобрести водосточную систему '),
(742, 1, 83, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(743, 1, 83, 'formId', '1'),
(744, 1, 84, 'Radiobutton', 'Компания'),
(745, 1, 84, 'Company', 'EUROFASADE'),
(746, 1, 84, 'FullName', 'Ирина'),
(747, 1, 84, 'Phone', '89511359320'),
(748, 1, 84, 'Email', 'eurofasad31@yandex.ru'),
(749, 1, 84, 'City', 'Белгород'),
(750, 1, 84, 'Message', 'Добрый день! Нас очень заинтересовала ДПК продукция.\nХотели бы по сотрудничать!'),
(751, 1, 84, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(752, 1, 84, 'formId', '1'),
(753, 1, 85, 'Radiobutton', 'Частное лицо'),
(754, 1, 85, 'Company', ''),
(755, 1, 85, 'FullName', 'Лейла'),
(756, 1, 85, 'Phone', '+79896561004'),
(757, 1, 85, 'Email', 'leilani63@mail.ru'),
(758, 1, 85, 'City', 'Махачкала'),
(759, 1, 85, 'Message', 'Добрый день. Куда можно направить чертежи ? Спасибо '),
(760, 1, 85, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(761, 1, 85, 'formId', '1'),
(762, 1, 86, 'Radiobutton', 'Компания'),
(763, 1, 86, 'Company', 'ООО Ультра'),
(764, 1, 86, 'FullName', 'Екатерина'),
(765, 1, 86, 'Phone', '8-961-575-22-26'),
(766, 1, 86, 'Email', 'evd@bzsn.ru'),
(767, 1, 86, 'City', 'Магнитогорск'),
(768, 1, 86, 'Message', 'Добрый день!\nООО Ультра - управляющая компания ЗАО Белорецкий завод сеток и настилов. Компания Ультра существует с 1999 г. и на сегодняшний день уверенно занимает лидирующие позиции на рынке металлопроката, что подтверждается многолетним сотрудничеством с ведущими отраслевыми лидерами. \nНаша компания сосредоточена на разработке инновационных изделий из металла и обладает мощным потенциалом производства в сочетании с многолетним опытом продвижения на рынок. \nЗАО БЗСН специализируется на производстве сеток, лент, листов, гнутого профиля и прочих изделий из металла для различных отраслей промышленности и личного потребления.\nПродукция ЗАО БЗСН пользуется большим спросом на территории России, ближнего и дальнего зарубежья.\nНаша компания заинтересована в честном ведении бизнеса и установлению долгосрочных и взаимовыгодных отношений. Наши консультанты всегда рады помочь Вам в выборе необходимого товара из широкого ассортимента продукции, представленной на нашей производственной площадке.\nБудем рады взаимовыгодному сотрудничеству с вами. '),
(769, 1, 86, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(770, 1, 86, 'formId', '1'),
(771, 1, 87, 'Radiobutton', 'Частное лицо'),
(772, 1, 87, 'Company', ''),
(773, 1, 87, 'FullName', 'Александр Добрынин'),
(774, 1, 87, 'Phone', '9652827476'),
(775, 1, 87, 'Email', 'and05771@mail.ru'),
(776, 1, 87, 'City', 'Пушкино, Московская'),
(777, 1, 87, 'Message', 'Здравствуйте. хотим приобрести  материал для крыльца. подскажите где можно купить сразу всё. Перила итд. Спасибо'),
(778, 1, 87, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(779, 1, 87, 'formId', '1'),
(780, 1, 88, 'Radiobutton', 'Частное лицо'),
(781, 1, 88, 'Company', ''),
(782, 1, 88, 'FullName', 'Антон'),
(783, 1, 88, 'Phone', '+79181983052'),
(784, 1, 88, 'Email', 'frolov_an@mail.ru'),
(785, 1, 88, 'City', 'Крым'),
(786, 1, 88, 'Message', 'Добрый день,\n\nПланирую приобрести для террасы частного дома вашу террасную доску. Заинтересовала серия Natur, цвет венге.\nВозникло несколько вопросов:\n1. Есть ли у вас официальные дилеры в Крыму?\n2. В чем разница между металлическими и пластиковыми крепежами для досок? Какие можете порекомендовать?\nВлияет ли вид крепежа на ширину шва?\n3. Есть ли у вас фото с примером укладки досок серии Natur, чтобы посмотреть на ширину шва? Какая она получается после укладки?\n4. На своем сайте вы предлагаете лаги из ДПК. Имеет ли смысл доплатить и использовать лаги из алюминия? Насколько они лучше лаг из ДПК?\n5. Смущает, что в инструкции по уходу есть совет сразу удалять жировые пятна с поверхности доски. Терраса летом будет использоваться как столовая зона и такие загрязнения неизбежны. Имеет ли покрыть доску специальным маслом для ДПК, чтобы жировые пятна лучше смывались? \n6. Часть террасы летом будет находиться на солнце. Насколько будет заметен эффект выгорания? Есть ли у вас фото с примерами выгорания на солнце?\n7. Правильно ли я понял, что в состав досок входит не ПВХ, а первичный полиэтилен?\n8. На других сайтах ваша продукция разбита на категории NATUR, PRO и SOLID. На вашем сайте информации про категорию PRO не нашел. Ее уже не выпускают? В чем отличие серии MIX от серии NATUR?\n'),
(787, 1, 88, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(788, 1, 88, 'formId', '1'),
(789, 1, 89, 'Radiobutton', 'Компания'),
(790, 1, 89, 'Company', 'ооо фортуна'),
(791, 1, 89, 'FullName', 'денис'),
(792, 1, 89, 'Phone', '+79500698799'),
(793, 1, 89, 'Email', 'denis-birjukov16@rambler.ru'),
(794, 1, 89, 'City', 'тулун'),
(795, 1, 89, 'Message', 'Здравствуйте! Условия для дилеров'),
(796, 1, 89, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(797, 1, 89, 'formId', '1'),
(798, 1, 90, 'Radiobutton', 'Компания'),
(799, 1, 90, 'Company', 'ООО Новый Интерьер'),
(800, 1, 90, 'FullName', 'Сергей'),
(801, 1, 90, 'Phone', '89056055255'),
(802, 1, 90, 'Email', 'nsg62@yandex.ru'),
(803, 1, 90, 'City', 'Кимры'),
(804, 1, 90, 'Message', 'Забор из ДПК'),
(805, 1, 90, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(806, 1, 90, 'formId', '1'),
(807, 1, 91, 'Radiobutton', 'Частное лицо'),
(808, 1, 91, 'Company', ''),
(809, 1, 91, 'FullName', 'Руслан'),
(810, 1, 91, 'Phone', '89818500099'),
(811, 1, 91, 'Email', '8500099@mail.ru'),
(812, 1, 91, 'City', 'Санкт-Петербург'),
(813, 1, 91, 'Message', 'Здравствуйте. Хотелось бы узнать цены на вашу продукцию.'),
(814, 1, 91, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(815, 1, 91, 'formId', '1'),
(816, 1, 92, 'Radiobutton', 'Компания'),
(817, 1, 92, 'Company', 'Грин Тех'),
(818, 1, 92, 'FullName', 'Евгений'),
(819, 1, 92, 'Phone', '+79269268822'),
(820, 1, 92, 'Email', 'pev@sayangroup.ru'),
(821, 1, 92, 'City', 'Москва'),
(822, 1, 92, 'Message', 'По поводу сотрудничества'),
(823, 1, 92, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(824, 1, 92, 'formId', '1'),
(825, 1, 93, 'Radiobutton', 'Компания'),
(826, 1, 93, 'Company', 'Оператор'),
(827, 1, 93, 'FullName', 'Алексей'),
(828, 1, 93, 'Phone', '+79036517017'),
(829, 1, 93, 'Email', 'a.fionov@operator-vrn.ru'),
(830, 1, 93, 'City', 'Воронеж'),
(831, 1, 93, 'Message', 'Наша компания занимается хранением овощей и фруктов. Мы заинтересованы в ящиках для хранения сельхозпродукции из ДПК. Может ли Ваша компания произвести их по спецзаказу?'),
(832, 1, 93, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(833, 1, 93, 'formId', '1'),
(834, 1, 94, 'Radiobutton', 'Компания'),
(835, 1, 94, 'Company', 'ИП Патрин '),
(836, 1, 94, 'FullName', 'Андрей'),
(837, 1, 94, 'Phone', '8-916-647-23-31'),
(838, 1, 94, 'Email', 'oak1356056@gmail.com'),
(839, 1, 94, 'City', 'Москва'),
(840, 1, 94, 'Message', 'Добрый день!\nУ нас магазин напольных покрытий в ТСК Ленинградка, пав. 31, 29 км Ленинградского ш.\nПросим Вас рассмотреть вопрос сотрудничества.\nнадеемся на положительное решение вопроса!'),
(841, 1, 94, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(842, 1, 94, 'formId', '1'),
(843, 1, 95, 'Radiobutton', 'Компания'),
(844, 1, 95, 'Company', 'домкомфорт'),
(845, 1, 95, 'FullName', 'Илья '),
(846, 1, 95, 'Phone', '+79089333363'),
(847, 1, 95, 'Email', 'panchenko@domcomfort.ru'),
(848, 1, 95, 'City', 'г. Челябинск'),
(849, 1, 95, 'Message', 'Добрый день, как получить прайс лист на продукцию? '),
(850, 1, 95, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(851, 1, 95, 'formId', '1'),
(852, 1, 96, 'Radiobutton', 'Частное лицо'),
(853, 1, 96, 'Company', ''),
(854, 1, 96, 'FullName', 'максим'),
(855, 1, 96, 'Phone', '89040356555'),
(856, 1, 96, 'Email', 'eccotara@yandex.ru'),
(857, 1, 96, 'City', 'ковров'),
(858, 1, 96, 'Message', 'А есть щиты из дпк ?'),
(859, 1, 96, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(860, 1, 96, 'formId', '1'),
(861, 1, 97, 'Radiobutton', 'Частное лицо'),
(862, 1, 97, 'Company', ''),
(863, 1, 97, 'FullName', 'Николай'),
(864, 1, 97, 'Phone', '8 910 946 83 53'),
(865, 1, 97, 'Email', 'nikolaj.ivanchenkov.71@mail.ru'),
(866, 1, 97, 'City', 'Тула'),
(867, 1, 97, 'Message', 'Добрый день интересуют ступени на лестницу, с уважением Николай.'),
(868, 1, 97, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(869, 1, 97, 'formId', '1'),
(870, 1, 98, 'Radiobutton', 'Компания'),
(871, 1, 98, 'Company', 'Мир кровли и фасада'),
(872, 1, 98, 'FullName', 'Дмитрий'),
(873, 1, 98, 'Phone', '+79148953233'),
(874, 1, 98, 'Email', '953233@gmail.com'),
(875, 1, 98, 'City', 'иркутск'),
(876, 1, 98, 'Message', 'Добрый день. Интересуют условия сотрудничества. Спасибо!'),
(877, 1, 98, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(878, 1, 98, 'formId', '1'),
(879, 1, 99, 'Radiobutton', 'Компания'),
(880, 1, 99, 'Company', 'ооо мвн моторс'),
(881, 1, 99, 'FullName', 'Виталий'),
(882, 1, 99, 'Phone', '8-926-523-10-17'),
(883, 1, 99, 'Email', 'wkl2010@yandex.ru'),
(884, 1, 99, 'City', 'Люберцы'),
(885, 1, 99, 'Message', 'Наша компания развивает направление продаж  Материалы для загородного строительства. Под это направление мы рассматриваем материалы.'),
(886, 1, 99, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(887, 1, 99, 'formId', '1'),
(888, 1, 100, 'Radiobutton', 'Компания'),
(889, 1, 100, 'Company', 'о'),
(890, 1, 100, 'FullName', 'рр'),
(891, 1, 100, 'Phone', '2544'),
(892, 1, 100, 'Email', 'ggy@bhyb.ru'),
(893, 1, 100, 'City', 'yj'),
(894, 1, 100, 'Message', 'А фотки то ворованные)'),
(895, 1, 100, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(896, 1, 100, 'formId', '1'),
(897, 1, 101, 'Radiobutton', 'Компания'),
(898, 1, 101, 'Company', 'МОНАС'),
(899, 1, 101, 'FullName', 'Константин'),
(900, 1, 101, 'Phone', '89606438339'),
(901, 1, 101, 'Email', 'orel-monas@mail.ru'),
(902, 1, 101, 'City', 'Орёл'),
(903, 1, 101, 'Message', 'Заготавливаем и перерабатываем лесоматериалы ангарской лиственницы и сосны в Иркутской области. Готовы к сотрудничеству по изготовлению и поставкам интересующей Вас продукции автомобильным и ж.д. транспортом в другие регионы'),
(904, 1, 101, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(905, 1, 101, 'formId', '1'),
(906, 1, 102, 'Radiobutton', 'Частное лицо'),
(907, 1, 102, 'Company', ''),
(908, 1, 102, 'FullName', 'Михаил'),
(909, 1, 102, 'Phone', '89885053162'),
(910, 1, 102, 'Email', 'Papazyan.mikhail@mail.ru'),
(911, 1, 102, 'City', 'Сочи'),
(912, 1, 102, 'Message', 'Добрый день  ООО Грантстрой производит строительные работы на самом крупном объекте  в городе Сочи соответственно у нас большие объёмы ,хотелось бы с вами поработать .'),
(913, 1, 102, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(914, 1, 102, 'formId', '1'),
(915, 1, 103, 'Radiobutton', 'Компания'),
(916, 1, 103, 'Company', 'СтройДвор'),
(917, 1, 103, 'FullName', 'Ида Дзантиева'),
(918, 1, 103, 'Phone', '9188223986'),
(919, 1, 103, 'Email', 'stroydvor77@mail.ru'),
(920, 1, 103, 'City', 'Владикавказ'),
(921, 1, 103, 'Message', 'Мне нужна прямоугольная водосточная система');
INSERT INTO `hud_rsform_submission_values` (`SubmissionValueId`, `FormId`, `SubmissionId`, `FieldName`, `FieldValue`) VALUES
(922, 1, 103, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(923, 1, 103, 'formId', '1'),
(924, 1, 104, 'Radiobutton', 'Частное лицо'),
(925, 1, 104, 'Company', ''),
(926, 1, 104, 'FullName', 'Григорий'),
(927, 1, 104, 'Phone', '89253164551'),
(928, 1, 104, 'Email', 'Sakaly.81@mail.ru'),
(929, 1, 104, 'City', 'Москва'),
(930, 1, 104, 'Message', 'Добрый день, по поводу сотрудничество. '),
(931, 1, 104, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(932, 1, 104, 'formId', '1'),
(933, 1, 105, 'Radiobutton', 'Компания'),
(934, 1, 105, 'Company', 'ООО Завод АРЛЕС'),
(935, 1, 105, 'FullName', 'Андрей Канашевич'),
(936, 1, 105, 'Phone', '+79817403674'),
(937, 1, 105, 'Email', 'snab@arlesspb.ru'),
(938, 1, 105, 'City', 'Санкт-Петербург'),
(939, 1, 105, 'Message', 'Добрый день!\nИнтересуют контакты компании-дистрибьютора в нашем городе, для заключения дилерского договора.'),
(940, 1, 105, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(941, 1, 105, 'formId', '1'),
(942, 1, 106, 'Radiobutton', 'Частное лицо'),
(943, 1, 106, 'Company', ''),
(944, 1, 106, 'FullName', 'Александр'),
(945, 1, 106, 'Phone', '+7 985 920 08 92'),
(946, 1, 106, 'Email', 'info@ecocluster.ru'),
(947, 1, 106, 'City', 'Краснодар'),
(948, 1, 106, 'Message', 'Мы хотим приобрести вашу продукцию из лиственницы. Вышлите пожалуйста цены.'),
(949, 1, 106, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(950, 1, 106, 'formId', '1'),
(951, 1, 107, 'Radiobutton', 'Компания'),
(952, 1, 107, 'Company', 'ООО Элмако'),
(953, 1, 107, 'FullName', 'Максим Константинович'),
(954, 1, 107, 'Phone', '+7-911-870-61-90'),
(955, 1, 107, 'Email', 'maksim.belyaev@elmaco.ru'),
(956, 1, 107, 'City', 'Санкт-Петербург'),
(957, 1, 107, 'Message', 'Добрый день.\n\nИнтересует получения Ваших каталогов и образцов. Дилеры не интересует, т.к. крупная строительная компания, предпочитаем работать напрямую с производителями.'),
(958, 1, 107, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(959, 1, 107, 'formId', '1'),
(960, 1, 108, 'Radiobutton', 'Компания'),
(961, 1, 108, 'Company', 'ООО Файнвуд'),
(962, 1, 108, 'FullName', 'Дмитрий'),
(963, 1, 108, 'Phone', '+7 (965) 0-618-619'),
(964, 1, 108, 'Email', 'finewood78@gmail.com'),
(965, 1, 108, 'City', 'Санкт-Петербург'),
(966, 1, 108, 'Message', 'Добрый день.\nЗанимаемся производством материалов из термообработанной древесины (термоосина, термососна).\nОсновной ассортимент:\n1) Термоосина:\n- вагонка 15х90 и 15х130 (6 различных профилей)\n- доска полок (26х90 и 26х120)\n- погонажная продукция (галтель, уголок, брусок)\n2) Термососна:\n- доска полок 26х92\n- террасная доска 26х92\n- планкен скошенный 26х92\n- доска пола (шпунт) 26х92\nРассматриваем возможность производства под Вашей торговой маркой. Интересуют условия сотрудничества.\nПри необходимости вышлю описание с фотографиями и цены продукции, которую производим на данный момент. Есть возможность немного изменить профили продукции при необходимости.'),
(967, 1, 108, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(968, 1, 108, 'formId', '1'),
(969, 1, 109, 'Radiobutton', 'Частное лицо'),
(970, 1, 109, 'Company', ''),
(971, 1, 109, 'FullName', 'QWERTY'),
(972, 1, 109, 'Phone', '8-800-555-35-35'),
(973, 1, 109, 'Email', 'platon.baskov@utsrus.com'),
(974, 1, 109, 'City', 'Санкт-Петербург'),
(975, 1, 109, 'Message', 'Тест'),
(976, 1, 109, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(977, 1, 109, 'formId', '1'),
(978, 1, 110, 'Radiobutton', 'Частное лицо'),
(979, 1, 110, 'Company', ''),
(980, 1, 110, 'FullName', 'JFJFJF'),
(981, 1, 110, 'Phone', '123123123'),
(982, 1, 110, 'Email', 'LOL@utsrus.com'),
(983, 1, 110, 'City', 'Mosc'),
(984, 1, 110, 'Message', 'Test'),
(985, 1, 110, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(986, 1, 110, 'formId', '1'),
(987, 1, 111, 'Radiobutton', 'Частное лицо'),
(988, 1, 111, 'Company', ''),
(989, 1, 111, 'FullName', 'В'),
(990, 1, 111, 'Phone', '111'),
(991, 1, 111, 'Email', 'hgfdhgfdhgf@gmail.com'),
(992, 1, 111, 'City', 'Москва'),
(993, 1, 111, 'Message', 'Сайт отстой, потратьте немножко денег, позорище!'),
(994, 1, 111, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(995, 1, 111, 'formId', '1'),
(996, 1, 112, 'Radiobutton', 'Частное лицо'),
(997, 1, 112, 'Company', ''),
(998, 1, 112, 'FullName', 'Вячеслав'),
(999, 1, 112, 'Phone', '+7 911 406 66 19'),
(1000, 1, 112, 'Email', 'vyacheslav.shevlyakov@mail.ru'),
(1001, 1, 112, 'City', 'Петрозаводск'),
(1002, 1, 112, 'Message', ' Я  архитектор проектирую  различные объекты. Хочу заказать палубную доску и масло-воск.  Нужен Ваш E-mail  что бы сделать заявку.'),
(1003, 1, 112, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1004, 1, 112, 'formId', '1'),
(1005, 1, 113, 'Radiobutton', 'Компания'),
(1006, 1, 113, 'Company', ' ИП  Сухорученко'),
(1007, 1, 113, 'FullName', 'сергей'),
(1008, 1, 113, 'Phone', '+79118115305'),
(1009, 1, 113, 'Email', 'suhoruchenko.sergei@gmail.com'),
(1010, 1, 113, 'City', 'Кировск Ленинградская область'),
(1011, 1, 113, 'Message', 'Я хочу приобрести у Вас паркетную доску из лиственницы CM WOOD NATUR 670Х134Х19 ММ это размеры указаны общей или рабочей площади доски ? Если рабочей площади то надо в количестве 435 штук. Для объекта,если качество,цена устроит в дальнейшем будем приобретать значительно большие объемы.'),
(1012, 1, 113, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1013, 1, 113, 'formId', '1'),
(1014, 1, 114, 'Radiobutton', 'Компания'),
(1015, 1, 114, 'Company', 'ИП Безпаленко '),
(1016, 1, 114, 'FullName', 'Сергей'),
(1017, 1, 114, 'Phone', '9187938804'),
(1018, 1, 114, 'Email', 'sbezpalenko@mail.ru'),
(1019, 1, 114, 'City', 'Ставрополь'),
(1020, 1, 114, 'Message', 'День добрый!\nЗанимаемся продажей стройматериалов и индивидуальным строительством. Прошу выслать условия по работе с вами и прайс лист.'),
(1021, 1, 114, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1022, 1, 114, 'formId', '1'),
(1023, 1, 115, 'Radiobutton', 'Частное лицо'),
(1024, 1, 115, 'Company', ''),
(1025, 1, 115, 'FullName', 'Александр'),
(1026, 1, 115, 'Phone', '+79145500417'),
(1027, 1, 115, 'Email', 'rosbipk@mail.ru'),
(1028, 1, 115, 'City', 'Благовещенск Амурская обл.'),
(1029, 1, 115, 'Message', 'Нет цен на Вашу продукцию, трудно делать выбор !'),
(1030, 1, 115, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1031, 1, 115, 'formId', '1'),
(1032, 1, 116, 'Radiobutton', 'Компания'),
(1033, 1, 116, 'Company', 'ооо кадоро'),
(1034, 1, 116, 'FullName', 'юрий'),
(1035, 1, 116, 'Phone', '89115059999'),
(1036, 1, 116, 'Email', 'cadoro@bk.ru'),
(1037, 1, 116, 'City', 'череповец'),
(1038, 1, 116, 'Message', 'сотрудничество '),
(1039, 1, 116, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1040, 1, 116, 'formId', '1'),
(1041, 1, 117, 'Radiobutton', 'Компания'),
(1042, 1, 117, 'Company', 'ООО СТК Домострой'),
(1043, 1, 117, 'FullName', 'Александр Турзанов'),
(1044, 1, 117, 'Phone', '+78172239797'),
(1045, 1, 117, 'Email', 'turzanov@stkdomostroy.ru'),
(1046, 1, 117, 'City', 'Вологда'),
(1047, 1, 117, 'Message', 'просьба отправить прайс-лист и условия сотрудничества'),
(1048, 1, 117, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1049, 1, 117, 'formId', '1'),
(1050, 1, 118, 'Radiobutton', 'Частное лицо'),
(1051, 1, 118, 'Company', ''),
(1052, 1, 118, 'FullName', 'Владимир'),
(1053, 1, 118, 'Phone', '+7 777 6957777'),
(1054, 1, 118, 'Email', 'v.yesyp@gmail.com'),
(1055, 1, 118, 'City', 'Алматы'),
(1056, 1, 118, 'Message', 'Касательно обработки фасада'),
(1057, 1, 118, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1058, 1, 118, 'formId', '1'),
(1059, 1, 119, 'Radiobutton', 'Компания'),
(1060, 1, 119, 'Company', 'Изумрудный Дом'),
(1061, 1, 119, 'FullName', 'Кирилл'),
(1062, 1, 119, 'Phone', '89518707868'),
(1063, 1, 119, 'Email', 'izumrudny-dom@mail.ru'),
(1064, 1, 119, 'City', 'Воронеж'),
(1065, 1, 119, 'Message', 'Интересует финская термо доска'),
(1066, 1, 119, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1067, 1, 119, 'formId', '1'),
(1068, 1, 120, 'Radiobutton', 'Частное лицо'),
(1069, 1, 120, 'Company', ''),
(1070, 1, 120, 'FullName', 'Анна'),
(1071, 1, 120, 'Phone', '89042930687'),
(1072, 1, 120, 'Email', 'a.kirillova@mitlex.com'),
(1073, 1, 120, 'City', 'Липецк'),
(1074, 1, 120, 'Message', 'Добрый день, хотелось бы запросить Ваши образцы'),
(1075, 1, 120, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1076, 1, 120, 'formId', '1'),
(1077, 1, 121, 'Radiobutton', 'Компания'),
(1078, 1, 121, 'Company', 'Куб Марин'),
(1079, 1, 121, 'FullName', 'Вячеслав'),
(1080, 1, 121, 'Phone', '+79219461047'),
(1081, 1, 121, 'Email', 'LVGDevelopment@gmail.com'),
(1082, 1, 121, 'City', 'Санкт-Петербург'),
(1083, 1, 121, 'Message', 'Добрый день!\nМеня интересует фасадные панели ДПК и террасная доска ДПК\nВозможно ли получить от вас прайс на вашу продукцию.'),
(1084, 1, 121, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1085, 1, 121, 'formId', '1'),
(1086, 1, 122, 'Radiobutton', 'Компания'),
(1087, 1, 122, 'Company', 'Ип Молчанов'),
(1088, 1, 122, 'FullName', 'Александр '),
(1089, 1, 122, 'Phone', '+79182436000'),
(1090, 1, 122, 'Email', 'mo505@mail.ru'),
(1091, 1, 122, 'City', 'Краснодар'),
(1092, 1, 122, 'Message', 'Интересует ваша продукция для закупки на склад.'),
(1093, 1, 122, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1094, 1, 122, 'formId', '1'),
(1095, 1, 123, 'Radiobutton', 'Частное лицо'),
(1096, 1, 123, 'Company', ''),
(1097, 1, 123, 'FullName', 'Людмила '),
(1098, 1, 123, 'Phone', '9787945385'),
(1099, 1, 123, 'Email', 'ludmila.polyakova65@gmail.com'),
(1100, 1, 123, 'City', 'Саки'),
(1101, 1, 123, 'Message', 'Жду звонка'),
(1102, 1, 123, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1103, 1, 123, 'formId', '1'),
(1104, 1, 124, 'Radiobutton', 'Компания'),
(1105, 1, 124, 'Company', 'ООО НУРСТРОЙ'),
(1106, 1, 124, 'FullName', 'Нурмагомед'),
(1107, 1, 124, 'Phone', '89280477774'),
(1108, 1, 124, 'Email', 'nur-aliev75@mail.ru'),
(1109, 1, 124, 'City', 'Хасавюрт'),
(1110, 1, 124, 'Message', 'Хотим сотрудничать'),
(1111, 1, 124, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1112, 1, 124, 'formId', '1'),
(1113, 1, 125, 'Radiobutton', 'Компания'),
(1114, 1, 125, 'Company', 'Абсолют проект'),
(1115, 1, 125, 'FullName', 'Максим Песка'),
(1116, 1, 125, 'Phone', '+7(4922)37-70-71'),
(1117, 1, 125, 'Email', 'peska@absolut33.ru'),
(1118, 1, 125, 'City', 'Владимир'),
(1119, 1, 125, 'Message', 'Для благоустройства Добросельского парка в городе Владимире хотим заложить террасную доску с вашего сайта. Пожалуйста, свяжите с нами для консультации и сотрудничества.'),
(1120, 1, 125, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1121, 1, 125, 'formId', '1'),
(1122, 1, 126, 'Radiobutton', 'Компания'),
(1123, 1, 126, 'Company', 'ИП Чиканов '),
(1124, 1, 126, 'FullName', 'Александр'),
(1125, 1, 126, 'Phone', '+79167543297'),
(1126, 1, 126, 'Email', 'chikanov@list.ru'),
(1127, 1, 126, 'City', 'Подольск'),
(1128, 1, 126, 'Message', 'Добрый день.\nИнтересуют условия сотрудничества и дилерский прайс.\nУ нас магазин-склад в г.Подольск.  Торговля строительными материалами.\nБлагодарю'),
(1129, 1, 126, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1130, 1, 126, 'formId', '1'),
(1131, 1, 127, 'Radiobutton', 'Компания'),
(1132, 1, 127, 'Company', 'Окна Петербурга'),
(1133, 1, 127, 'FullName', 'Антон Долинин'),
(1134, 1, 127, 'Phone', '+79657694020'),
(1135, 1, 127, 'Email', 'dolinin@okna-peter.ru'),
(1136, 1, 127, 'City', 'Санкт-Петербург'),
(1137, 1, 127, 'Message', 'Добрый день. Интересует партнерское сотрудничество. Мы остекляем более 300 загородных домов в год. Также производим и монтируем зимние сады. Интересуют дополнительные продажи нашим заказчикам: водосточная система, террасная доска, садовый пакет '),
(1138, 1, 127, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1139, 1, 127, 'formId', '1'),
(1140, 1, 128, 'Radiobutton', 'Компания'),
(1141, 1, 128, 'Company', 'ооо Кринс'),
(1142, 1, 128, 'FullName', 'Сергей владимирович'),
(1143, 1, 128, 'Phone', '+7 495 7610006'),
(1144, 1, 128, 'Email', 'info@doorwuds.ru'),
(1145, 1, 128, 'City', 'Одинцово'),
(1146, 1, 128, 'Message', 'Здравствуйте, есть желание стать вашим партером и реализовывать продукцию, мы занимаемся напольными покрытиями, есть свой магазин в одинцовском районе и интернет ресурс'),
(1147, 1, 128, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1148, 1, 128, 'formId', '1'),
(1149, 1, 129, 'Radiobutton', 'Компания'),
(1150, 1, 129, 'Company', 'Строй Сити'),
(1151, 1, 129, 'FullName', 'Александр'),
(1152, 1, 129, 'Phone', '89054254817'),
(1153, 1, 129, 'Email', 'bru-hanter@inbox.ru'),
(1154, 1, 129, 'City', 'Шашты'),
(1155, 1, 129, 'Message', 'Здравствуйте. Хочу стать вашим дилером.'),
(1156, 1, 129, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1157, 1, 129, 'formId', '1'),
(1158, 1, 130, 'Radiobutton', 'Частное лицо'),
(1159, 1, 130, 'Company', ''),
(1160, 1, 130, 'FullName', 'Алексей'),
(1161, 1, 130, 'Phone', '89213517381'),
(1162, 1, 130, 'Email', 'samushenok@mail.ru'),
(1163, 1, 130, 'City', 'Санкт-Петербург'),
(1164, 1, 130, 'Message', 'Добрый день!\n\nНазовите пожалуйста адреса магазинов в СПб, где можно приобрести фиброцементный сайдинг CM Bord'),
(1165, 1, 130, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1166, 1, 130, 'formId', '1'),
(1167, 1, 131, 'Radiobutton', 'Компания'),
(1168, 1, 131, 'Company', 'ООО Торговый Дом Май'),
(1169, 1, 131, 'FullName', 'Сергей Игоревич Теверовский'),
(1170, 1, 131, 'Phone', '+79025554975'),
(1171, 1, 131, 'Email', '554975@mail.ru'),
(1172, 1, 131, 'City', 'Владивосток'),
(1173, 1, 131, 'Message', 'Добрый день, интересует ваш фиброцементный сайдинг. Пришлите пожалуйста на почту информацию о нем , условия сотрудничества и цены.'),
(1174, 1, 131, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1175, 1, 131, 'formId', '1'),
(1176, 1, 132, 'Radiobutton', 'Компания'),
(1177, 1, 132, 'Company', 'ООО Вайма'),
(1178, 1, 132, 'FullName', 'Ринат'),
(1179, 1, 132, 'Phone', '89625616711'),
(1180, 1, 132, 'Email', 'd2505525@gmail.com'),
(1181, 1, 132, 'City', 'Киров'),
(1182, 1, 132, 'Message', 'Интересует дилерство в городе Киров. Есть ли в нашем регионе представители? Какие условия по сотрудничеству? '),
(1183, 1, 132, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1184, 1, 132, 'formId', '1'),
(1185, 1, 133, 'Radiobutton', 'Компания'),
(1186, 1, 133, 'Company', 'Отделка'),
(1187, 1, 133, 'FullName', 'Наталья'),
(1188, 1, 133, 'Phone', '8-920-526-45-99'),
(1189, 1, 133, 'Email', 'ONK@BAZAOTDELKA.RU'),
(1190, 1, 133, 'City', 'Липецк'),
(1191, 1, 133, 'Message', 'Добрый день. Наша организация является базой строительно-отделочных материалов. Территориально находимся в Липецке. К кому можно обратиться по вопросу получения КП на перспективу дальнейшего сотрудничества. Интересует декинг (террасная доска)'),
(1192, 1, 133, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1193, 1, 133, 'formId', '1'),
(1194, 1, 134, 'Radiobutton', 'Компания'),
(1195, 1, 134, 'Company', 'ООО Ёлочка'),
(1196, 1, 134, 'FullName', 'Андрей'),
(1197, 1, 134, 'Phone', '+7-900-107-4802'),
(1198, 1, 134, 'Email', 'supplier@elochka42.ru'),
(1199, 1, 134, 'City', 'Кемерово'),
(1200, 1, 134, 'Message', 'здравствуйте, меня зовут Андрей, я директор магазина паркета и напольных покрытий Ёлочка в г.Кемерово. Хочу продавать вашу доску, свяжитесь со мной и всё подробнее обсудим. \n'),
(1201, 1, 134, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1202, 1, 134, 'formId', '1'),
(1203, 1, 135, 'Radiobutton', 'Компания'),
(1204, 1, 135, 'Company', 'Центр Кровли '),
(1205, 1, 135, 'FullName', 'Спивак Нина Васильевна'),
(1206, 1, 135, 'Phone', '+7 910 321 33 66'),
(1207, 1, 135, 'Email', 'marketing@ckbel.ru'),
(1208, 1, 135, 'City', 'Белгород'),
(1209, 1, 135, 'Message', 'Добрый день! Подскажите, проводится ли Вашей компанией обучение по монтажу Ваших продуктов?\nЕсли ДА, то как попасть на такое обучение?'),
(1210, 1, 135, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1211, 1, 135, 'formId', '1'),
(1212, 1, 136, 'Radiobutton', 'Компания'),
(1213, 1, 136, 'Company', 'Комфортный дом'),
(1214, 1, 136, 'FullName', 'Сергей'),
(1215, 1, 136, 'Phone', '89222377780'),
(1216, 1, 136, 'Email', 'studiocomforthome@mail.ru'),
(1217, 1, 136, 'City', 'Челябинск'),
(1218, 1, 136, 'Message', 'Хотим стать Вашим дилером'),
(1219, 1, 136, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1220, 1, 136, 'formId', '1'),
(1221, 1, 137, 'Radiobutton', 'Компания'),
(1222, 1, 137, 'Company', 'ДДЕК'),
(1223, 1, 137, 'FullName', 'Андрей'),
(1224, 1, 137, 'Phone', '89254045060'),
(1225, 1, 137, 'Email', 'ddek.ru@ya.ru'),
(1226, 1, 137, 'City', 'Зеленоград'),
(1227, 1, 137, 'Message', 'Добрый день!\nМы являемся интернет магазином ddek.ru\nПрошу прислать дилерский прайс и условия сотрудничества на электронную почту'),
(1228, 1, 137, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1229, 1, 137, 'formId', '1'),
(1230, 1, 138, 'Radiobutton', 'Компания'),
(1231, 1, 138, 'Company', 'ASDECOR'),
(1232, 1, 138, 'FullName', 'Сергей'),
(1233, 1, 138, 'Phone', '89649408384'),
(1234, 1, 138, 'Email', 'as-decor@bk.ru'),
(1235, 1, 138, 'City', 'Сочи'),
(1236, 1, 138, 'Message', 'Добрый день! Интересует сотрудничество с вами по вашей продукции. Пришлите условия и прайс листы. Спасибо'),
(1237, 1, 138, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1238, 1, 138, 'formId', '1'),
(1239, 1, 139, 'Radiobutton', 'Компания'),
(1240, 1, 139, 'Company', 'По дереву'),
(1241, 1, 139, 'FullName', 'Анастасия'),
(1242, 1, 139, 'Phone', '89106873759'),
(1243, 1, 139, 'Email', 'rodionova_as37@mail.ru'),
(1244, 1, 139, 'City', 'Иваново'),
(1245, 1, 139, 'Message', 'Средняя стоимость террасная доска композитную и крепеж к ней.'),
(1246, 1, 139, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1247, 1, 139, 'formId', '1'),
(1248, 1, 140, 'Radiobutton', 'Частное лицо'),
(1249, 1, 140, 'Company', ''),
(1250, 1, 140, 'FullName', 'Алексей'),
(1251, 1, 140, 'Phone', '+79128040558'),
(1252, 1, 140, 'Email', '401668@mail.ru'),
(1253, 1, 140, 'City', 'Магнитогорск '),
(1254, 1, 140, 'Message', 'Мне нужна террасная доска и ограждения '),
(1255, 1, 140, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1256, 1, 140, 'formId', '1'),
(1257, 1, 141, 'Radiobutton', 'Компания'),
(1258, 1, 141, 'Company', 'DeckTie'),
(1259, 1, 141, 'FullName', 'Дмитрий'),
(1260, 1, 141, 'Phone', '89215619072'),
(1261, 1, 141, 'Email', 'ds@decktie.ru'),
(1262, 1, 141, 'City', 'Санкт-Петербург'),
(1263, 1, 141, 'Message', 'Добрый день!\nУвидел на Вашем сайте ассортимент террасной доски из дерева, хотел уточнить продаете ли вместе с Вашей доской крепеж? \nНаша компания занимается производством скрытого крепежа для террасной доски, планкена. Хотел обсудить возможность сотрудничества с Вашей организацией. '),
(1264, 1, 141, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1265, 1, 141, 'formId', '1'),
(1266, 1, 142, 'Radiobutton', 'Компания'),
(1267, 1, 142, 'Company', 'ООО РодонСтрой'),
(1268, 1, 142, 'FullName', 'Вероника Устинова'),
(1269, 1, 142, 'Phone', '+7(925) 688-08-88'),
(1270, 1, 142, 'Email', 'rodon.stroy@gmail.com'),
(1271, 1, 142, 'City', 'Москва'),
(1272, 1, 142, 'Message', 'Добрый день!\n\nАрхитектурная  и Строительная компания РодонСтрой выражает Вам свое почтение.\n\nМы являемся ген.подрядчиком по строительству дет.садов, школ и лагерей, реконструкции парков, набережных.\n\nМы заинтересованы во взаимовыгодных, долгосрочных партнерских отношениях и в связи с этим, просим Вас предоставить нам прайс на ассортимент поставляемой продукции.\n\nПример договора, каталоги с видами продукции и колорными решениями.\n\nНа сегодняшний день мы прорабатывает застройку порядка 2000-3000 м2 (беседки, площадки и террасы) с применением пластиковой доски (для принятия положительного решения, просим предоставить прайс с максимальной скидкой'),
(1273, 1, 142, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1274, 1, 142, 'formId', '1'),
(1275, 1, 143, 'Radiobutton', 'Компания'),
(1276, 1, 143, 'Company', 'СОЗДАНИЕ'),
(1277, 1, 143, 'FullName', 'Андрей Доценко'),
(1278, 1, 143, 'Phone', '+7-903-801-06-00'),
(1279, 1, 143, 'Email', 'akcent2007@inbox.ru'),
(1280, 1, 143, 'City', 'Тверь'),
(1281, 1, 143, 'Message', 'Добрый день.\nНаша компания занимается розничной продажей стройматериалов. У нас 2 магазина в Тверской области: г.Красный Холм и пгт Сандово. Интересует Ваша продукция. Просьба выслать на эл.почту прайс и условия работы.'),
(1282, 1, 143, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1283, 1, 143, 'formId', '1'),
(1284, 1, 144, 'Radiobutton', 'Частное лицо'),
(1285, 1, 144, 'Company', ''),
(1286, 1, 144, 'FullName', 'Рузия'),
(1287, 1, 144, 'Phone', '9659128164'),
(1288, 1, 144, 'Email', 'r.zalyalova@gkmayak.ru'),
(1289, 1, 144, 'City', 'Канск Красноярский край '),
(1290, 1, 144, 'Message', 'Нужна водосточка RAL 5005'),
(1291, 1, 144, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1292, 1, 144, 'formId', '1'),
(1293, 1, 145, 'Radiobutton', 'Компания'),
(1294, 1, 145, 'Company', 'Квинтэссенция'),
(1295, 1, 145, 'FullName', 'Мария Смирнова'),
(1296, 1, 145, 'Phone', '9533438823'),
(1297, 1, 145, 'Email', 'vs25smirnova@yandex.ru'),
(1298, 1, 145, 'City', 'Санкт-Петербург'),
(1299, 1, 145, 'Message', 'Добрый день!\n\nПоявился запрос на продукцию Вашей компании\nCM Decking серия VINTAGE цвет EBONY (эбен, серый) \n3000 х 345 х 25 мм - 13 шт\n\nПросьба сориентировать по условиям работы и срокам поставки\n\nСпасибо,\nс уважением, Мария'),
(1300, 1, 145, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1301, 1, 145, 'formId', '1'),
(1302, 1, 146, 'Radiobutton', 'Компания'),
(1303, 1, 146, 'Company', 'ООО СибМастер'),
(1304, 1, 146, 'FullName', 'Денис'),
(1305, 1, 146, 'Phone', '89091906015'),
(1306, 1, 146, 'Email', 'dav.sibmaster@mail.ru'),
(1307, 1, 146, 'City', 'Тюмень'),
(1308, 1, 146, 'Message', 'Доброго времени суток. Планируем стать вашим партнером на территории Тюменской области. В настоящий момент занимаемся оформлением офисного помещения, хотим получить от вас образцы продукции и дилерские ценовые условия.  '),
(1309, 1, 146, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1310, 1, 146, 'formId', '1'),
(1311, 1, 147, 'Radiobutton', 'Частное лицо'),
(1312, 1, 147, 'Company', ''),
(1313, 1, 147, 'FullName', 'Сергей'),
(1314, 1, 147, 'Phone', '+375296470074'),
(1315, 1, 147, 'Email', 's.e.petroff@gmail.com'),
(1316, 1, 147, 'City', 'г.Минск'),
(1317, 1, 147, 'Message', 'Здравствуйте! Я архитектор. На объект строительства нужна террасная доска из ДПК  Vintage цвет венге 1000м2. Какая будет цена с доставкой в Минск(или без нее). Возможно понадобится и ограждение. Спасибо.'),
(1318, 1, 147, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1319, 1, 147, 'formId', '1'),
(1320, 1, 148, 'Radiobutton', 'Компания'),
(1321, 1, 148, 'Company', 'Арматор'),
(1322, 1, 148, 'FullName', 'Сергей'),
(1323, 1, 148, 'Phone', '89139199012'),
(1324, 1, 148, 'Email', 'feshenko78@bk.ru'),
(1325, 1, 148, 'City', 'Новосибирск'),
(1326, 1, 148, 'Message', 'Хотелось бы рассмотреть возможность взаимоотношений в плане дилетантства в Сибирском регионе'),
(1327, 1, 148, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1328, 1, 148, 'formId', '1'),
(1329, 1, 149, 'Radiobutton', 'Частное лицо'),
(1330, 1, 149, 'Company', ''),
(1331, 1, 149, 'FullName', 'александр'),
(1332, 1, 149, 'Phone', '89500821562'),
(1333, 1, 149, 'Email', 'atelier.loi@mail.ru'),
(1334, 1, 149, 'City', 'ангарск'),
(1335, 1, 149, 'Message', 'здравствуйте! купить оптом сайдинг дпк цвет коричневый где посмотреть ???'),
(1336, 1, 149, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1337, 1, 149, 'formId', '1'),
(1338, 1, 150, 'Radiobutton', 'Компания'),
(1339, 1, 150, 'Company', 'Монтаж 72'),
(1340, 1, 150, 'FullName', 'Валерий '),
(1341, 1, 150, 'Phone', '89634551367'),
(1342, 1, 150, 'Email', 'krysha72@yandex.ru'),
(1343, 1, 150, 'City', 'Тюмень '),
(1344, 1, 150, 'Message', 'Интересно, сколько стоит водосток? Спасибо '),
(1345, 1, 150, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1346, 1, 150, 'formId', '1'),
(1347, 1, 151, 'Radiobutton', 'Компания'),
(1348, 1, 151, 'Company', 'Dpkpro '),
(1349, 1, 151, 'FullName', 'Сергей'),
(1350, 1, 151, 'Phone', '+7 (992) 340-20-50'),
(1351, 1, 151, 'Email', 'dpkpro@list.ru'),
(1352, 1, 151, 'City', 'Екатеринбург'),
(1353, 1, 151, 'Message', 'добрый день! вышлите пожалуйста дилерский прайслист '),
(1354, 1, 151, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1355, 1, 151, 'formId', '1'),
(1356, 1, 152, 'Radiobutton', 'Компания'),
(1357, 1, 152, 'Company', 'RichHome'),
(1358, 1, 152, 'FullName', 'Павел Нашталов'),
(1359, 1, 152, 'Phone', '79196863333'),
(1360, 1, 152, 'Email', 'p.nashtalov@tehpostavka24.ru'),
(1361, 1, 152, 'City', 'Казань'),
(1362, 1, 152, 'Message', 'Добрый день! Мы хотим закупить вашу продукцию, перезвоните нам пожалуйста.'),
(1363, 1, 152, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1364, 1, 152, 'formId', '1'),
(1365, 1, 153, 'Radiobutton', 'Компания'),
(1366, 1, 153, 'Company', 'Торговый Дом Прайм'),
(1367, 1, 153, 'FullName', 'ПАВЕЛ ВЛАДИМИРОВИЧ МОЛИБОГА'),
(1368, 1, 153, 'Phone', '9166728335'),
(1369, 1, 153, 'Email', 'td.praim@bk.ru'),
(1370, 1, 153, 'City', 'КРАСНОГОРСК'),
(1371, 1, 153, 'Message', 'Добрый день! Подскажите пожалуйста какие у Вас условия сотрудничества?'),
(1372, 1, 153, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1373, 1, 153, 'formId', '1'),
(1374, 1, 154, 'Radiobutton', 'Частное лицо'),
(1375, 1, 154, 'Company', ''),
(1376, 1, 154, 'FullName', 'Александр'),
(1377, 1, 154, 'Phone', '89198934030'),
(1378, 1, 154, 'Email', '89054307077@bk.ru'),
(1379, 1, 154, 'City', 'Ростов-на-Дону '),
(1380, 1, 154, 'Message', 'Реализуем террасную доску. '),
(1381, 1, 154, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1382, 1, 154, 'formId', '1'),
(1383, 1, 155, 'Radiobutton', 'Частное лицо'),
(1384, 1, 155, 'Company', ''),
(1385, 1, 155, 'FullName', 'Владислав'),
(1386, 1, 155, 'Phone', '79032670999'),
(1387, 1, 155, 'Email', 'info@olimp.moscow'),
(1388, 1, 155, 'City', 'Москва'),
(1389, 1, 155, 'Message', 'Добрый день. У нас ИП, хотели стать вашим дилером.'),
(1390, 1, 155, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1391, 1, 155, 'formId', '1'),
(1392, 1, 156, 'Radiobutton', 'Компания'),
(1393, 1, 156, 'Company', 'ХОРОС'),
(1394, 1, 156, 'FullName', 'Татьяна'),
(1395, 1, 156, 'Phone', '8(928)157-90-70'),
(1396, 1, 156, 'Email', 'zakaz@les-m.ru'),
(1397, 1, 156, 'City', 'Ростов-на-Дону'),
(1398, 1, 156, 'Message', 'Добрый день!\nМы торговая организация, хотим связаться с Вами по поводу сотрудничества.\nНаш сайт:  les-m.ru'),
(1399, 1, 156, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1400, 1, 156, 'formId', '1'),
(1401, 1, 157, 'Radiobutton', 'Частное лицо'),
(1402, 1, 157, 'Company', ''),
(1403, 1, 157, 'FullName', 'Дарья'),
(1404, 1, 157, 'Phone', '89209412464'),
(1405, 1, 157, 'Email', 'darya9209412464@mail.ru'),
(1406, 1, 157, 'City', 'Владимир '),
(1407, 1, 157, 'Message', 'Добрый день. На данный момент открываем новый магазин строительных материалов. Интересует Ваша террасная доска. Какие условия сотрудничества. Жду вашего ответа. '),
(1408, 1, 157, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1409, 1, 157, 'formId', '1'),
(1410, 1, 158, 'Radiobutton', 'Компания'),
(1411, 1, 158, 'Company', 'Армада Кровля Фасад'),
(1412, 1, 158, 'FullName', 'Константин '),
(1413, 1, 158, 'Phone', '+77019993747'),
(1414, 1, 158, 'Email', 'armadacorp.kz@gmail.com'),
(1415, 1, 158, 'City', 'Караганда '),
(1416, 1, 158, 'Message', 'Здравствуйте интересует ваша продукция из ДПК, а также CM Board. В 2018 на мосбилд посещал Ваш стенд, минеральный сайдинг был очень интересным, но к сожалению не доступен в прошлом году. Надеемся на взаимовыгодное сотрудничество. Было бы также интересно пощупать образцы продукции:декинг(кроме фасадного) и минеральный сайдинг. Спасибо, жду обратной связи. '),
(1417, 1, 158, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1418, 1, 158, 'formId', '1'),
(1419, 1, 159, 'Radiobutton', 'Частное лицо'),
(1420, 1, 159, 'Company', ''),
(1421, 1, 159, 'FullName', 'Сослан'),
(1422, 1, 159, 'Phone', '+79103600281'),
(1423, 1, 159, 'Email', 'sos505@mail.ru'),
(1424, 1, 159, 'City', 'Белгород'),
(1425, 1, 159, 'Message', 'Здравствуйте, \nМы занимаемся продажей и монтажем террасной доски. Работаем как с физ лицами так и в сторону развития собственной дилерской сети. На данный момент есть договореность с 2мя оптово-розничными магазинами которые занимаются строительно-отделочными материалами. Нам необходимо понимать порядок цен, т.е. нужен прайс с теми ценами которые Вы готовы предоставить нам на начале работы с Вами и что сможете предложить в дальнейшем. Так же нам необходимы образцы Вашей продукции. На данный мы работаем как само занятые без образования юр лица или ип, в дальнейшем это исправим.'),
(1426, 1, 159, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1427, 1, 159, 'formId', '1'),
(1428, 1, 160, 'Radiobutton', 'Компания'),
(1429, 1, 160, 'Company', 'ОкнаСтарт'),
(1430, 1, 160, 'FullName', 'Максим'),
(1431, 1, 160, 'Phone', '+79823254308'),
(1432, 1, 160, 'Email', 'musjakaev@rambler.ru'),
(1433, 1, 160, 'City', 'Челябинск'),
(1434, 1, 160, 'Message', 'Здравствуйте! Хочу с вами сотрудничать, жду звонка.'),
(1435, 1, 160, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1436, 1, 160, 'formId', '1'),
(1437, 1, 161, 'Radiobutton', 'Компания'),
(1438, 1, 161, 'Company', 'ООО Мейстер '),
(1439, 1, 161, 'FullName', 'Сергей '),
(1440, 1, 161, 'Phone', '+7 902 555 74 96'),
(1441, 1, 161, 'Email', 'plast-wood@mail.ru'),
(1442, 1, 161, 'City', 'Владивосток'),
(1443, 1, 161, 'Message', 'Здравствуйте!\nНаша компания с 2007 года осуществляет закупки в России, КНР и продажу материалов  из ДПК, термодревесины, импрегнированной древесины - террасной доски, ограждений и т.п.\nНаш сайт meistervl.ru\nПросьба сообщить условия сотрудничества и цены.\nС уважением, ген.директор Сергей Якименко'),
(1444, 1, 161, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1445, 1, 161, 'formId', '1'),
(1446, 1, 162, 'Radiobutton', 'Компания'),
(1447, 1, 162, 'Company', 'Spaceco'),
(1448, 1, 162, 'FullName', 'ЮЛИЯ'),
(1449, 1, 162, 'Phone', '+79787113530'),
(1450, 1, 162, 'Email', 'juliet.olegovma@mail.ru'),
(1451, 1, 162, 'City', 'Ялта'),
(1452, 1, 162, 'Message', 'Добрый день!\nна один из наших объектов нужна террасная доска+сайдинг. скажите к какому из дистрибъютеров мне лучше обратиться?'),
(1453, 1, 162, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1454, 1, 162, 'formId', '1'),
(1455, 1, 163, 'Radiobutton', 'Компания'),
(1456, 1, 163, 'Company', 'ООО КАЛИАР'),
(1457, 1, 163, 'FullName', 'Сергей'),
(1458, 1, 163, 'Phone', '+79139199012'),
(1459, 1, 163, 'Email', 'feshenko78@bk.ru'),
(1460, 1, 163, 'City', 'Новосибирск'),
(1461, 1, 163, 'Message', 'Хотелось бы обсудить вопрос о сотрудничестве'),
(1462, 1, 163, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1463, 1, 163, 'formId', '1'),
(1464, 1, 164, 'Radiobutton', 'Частное лицо'),
(1465, 1, 164, 'Company', ''),
(1466, 1, 164, 'FullName', 'НАТАЛЬЯ'),
(1467, 1, 164, 'Phone', '89099943344'),
(1468, 1, 164, 'Email', 'and05771@mail.ru'),
(1469, 1, 164, 'City', 'Пушкино, Московская'),
(1470, 1, 164, 'Message', 'Добрый вечер ! Где можно увидеть образцы перил?'),
(1471, 1, 164, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1472, 1, 164, 'formId', '1'),
(1473, 1, 165, 'Radiobutton', 'Компания'),
(1474, 1, 165, 'Company', ' ТСК Династия'),
(1475, 1, 165, 'FullName', 'Алексей'),
(1476, 1, 165, 'Phone', '+79528071689'),
(1477, 1, 165, 'Email', 'akimova.golova@yandex.ru'),
(1478, 1, 165, 'City', 'Кемерово'),
(1479, 1, 165, 'Message', 'Здравствуйте. Наша компания занимается строительством домов, коттеджей, бань из оцилиндрованного бревна и клееного бруса. Хотим сотрудничать с вами по реализации вашей продукции из ДПК'),
(1480, 1, 165, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1481, 1, 165, 'formId', '1'),
(1482, 1, 166, 'Radiobutton', 'Компания'),
(1483, 1, 166, 'Company', 'ООО Дом'),
(1484, 1, 166, 'FullName', 'Денис'),
(1485, 1, 166, 'Phone', '89108197056'),
(1486, 1, 166, 'Email', 'ooodom@rambler.ru'),
(1487, 1, 166, 'City', 'Ярославская область, г. Рыбинск'),
(1488, 1, 166, 'Message', 'Добрый день.\nМы строительная компания. Есть проект террасы. Готовы к сотрудничеству.'),
(1489, 1, 166, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1490, 1, 166, 'formId', '1'),
(1491, 1, 167, 'Radiobutton', 'Компания'),
(1492, 1, 167, 'Company', 'Лескрафт'),
(1493, 1, 167, 'FullName', 'Сергей'),
(1494, 1, 167, 'Phone', '89183993939'),
(1495, 1, 167, 'Email', 'Lss3993939@yandex.ru'),
(1496, 1, 167, 'City', 'Краснодар'),
(1497, 1, 167, 'Message', 'Добрый день, интерисуют продукты из лиственницы и термомодифицированной лревисины . Прошу Вас предложить КП и условия сотрудничества на поставки данной продукции'),
(1498, 1, 167, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1499, 1, 167, 'formId', '1'),
(1500, 1, 168, 'Radiobutton', 'Компания'),
(1501, 1, 168, 'Company', 'ООО Архпромкомплект'),
(1502, 1, 168, 'FullName', 'Николай Латкин'),
(1503, 1, 168, 'Phone', '8182-65-52-49'),
(1504, 1, 168, 'Email', 'latkin@apk.ru'),
(1505, 1, 168, 'City', 'Архангельск'),
(1506, 1, 168, 'Message', 'Добрый день. \nмы компания ООО ПСК Архпромкомплект (г.Архангельск)\nсайт: www.apk.ru\nзанимаемся розничной торговлей инженерного, печного, котельного, вентиляционного оборудования и проч.\n\nвидели продукцию (водостоки) на выставке Мосбилд 2019\n\nпросим скинуть прайс по данной продукции, и условия по сотрудничеству.'),
(1507, 1, 168, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1508, 1, 168, 'formId', '1'),
(1509, 1, 169, 'Radiobutton', 'Компания'),
(1510, 1, 169, 'Company', 'ТД Стройпласт'),
(1511, 1, 169, 'FullName', 'Денис'),
(1512, 1, 169, 'Phone', '89202777187'),
(1513, 1, 169, 'Email', '7473331@mail.ru'),
(1514, 1, 169, 'City', 'Тула'),
(1515, 1, 169, 'Message', 'Добрый день, интересует сотрудничество в г. Тула.'),
(1516, 1, 169, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1517, 1, 169, 'formId', '1'),
(1518, 1, 170, 'Radiobutton', 'Частное лицо'),
(1519, 1, 170, 'Company', ''),
(1520, 1, 170, 'FullName', 'Юлия'),
(1521, 1, 170, 'Phone', '89117095667'),
(1522, 1, 170, 'Email', '89117095667@mail.ru'),
(1523, 1, 170, 'City', 'Санкт-Петербург'),
(1524, 1, 170, 'Message', 'Здравствуйте!\n\nНеобходимы сертификаты на Вашу продукцию.\nСертификаты соответствия и пожарные.'),
(1525, 1, 170, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1526, 1, 170, 'formId', '1'),
(1527, 1, 171, 'Radiobutton', 'Компания'),
(1528, 1, 171, 'Company', 'Евродек'),
(1529, 1, 171, 'FullName', 'Евгений'),
(1530, 1, 171, 'Phone', '89779081190'),
(1531, 1, 171, 'Email', 'evgeniy@euro-deck.ru'),
(1532, 1, 171, 'City', 'Москва'),
(1533, 1, 171, 'Message', 'Интересно сотрудничество'),
(1534, 1, 171, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1535, 1, 171, 'formId', '1'),
(1536, 1, 172, 'Radiobutton', 'Частное лицо'),
(1537, 1, 172, 'Company', ''),
(1538, 1, 172, 'FullName', 'Семен'),
(1539, 1, 172, 'Phone', '89046778585'),
(1540, 1, 172, 'Email', 'stroytorg-kazan@mail.ru'),
(1541, 1, 172, 'City', 'Казань'),
(1542, 1, 172, 'Message', 'Добрый день! Ищу работу в Казани в сфере ДПК , Я специалист могу сделать расчеты по всему по заборной доске ,ограждениям ,террасной доске ,ступеням,  могу продвигать доску компаниям , продавать как в розницу так и оптом , дилерам поставлять , работал с апрель-маркетом с айратом , опыт работы 3года. '),
(1543, 1, 172, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1544, 1, 172, 'formId', '1'),
(1545, 1, 173, 'Radiobutton', 'Частное лицо'),
(1546, 1, 173, 'Company', ''),
(1547, 1, 173, 'FullName', 'Вячеслав'),
(1548, 1, 173, 'Phone', '+7 981 7555484'),
(1549, 1, 173, 'Email', 'uspeh8888uspeh@yandex.ru'),
(1550, 1, 173, 'City', 'Спб'),
(1551, 1, 173, 'Message', 'Купить террасную доску'),
(1552, 1, 173, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1553, 1, 173, 'formId', '1'),
(1554, 1, 174, 'Radiobutton', 'Компания'),
(1555, 1, 174, 'Company', 'Твоя терраса'),
(1556, 1, 174, 'FullName', 'Денис'),
(1557, 1, 174, 'Phone', '89803795656'),
(1558, 1, 174, 'Email', 'tvoya-terrasa.blg@mail.ru'),
(1559, 1, 174, 'City', 'Белгород'),
(1560, 1, 174, 'Message', 'ОС  садовый паркет  OAK (дуб, желтый)'),
(1561, 1, 174, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1562, 1, 174, 'formId', '1'),
(1563, 1, 175, 'Radiobutton', 'Частное лицо'),
(1564, 1, 175, 'Company', ''),
(1565, 1, 175, 'FullName', 'Евгения'),
(1566, 1, 175, 'Phone', '8-952-2716772'),
(1567, 1, 175, 'Email', 'kiselevaevgenia2603@gmail.com'),
(1568, 1, 175, 'City', 'Санкт-Петербург'),
(1569, 1, 175, 'Message', 'Здравствуйте!\nИнтересует ваше ограждение для клумб.\n\nПодскажите, пожалуйста, какую высоту можно набирать этим ограждением? Если нужна прямоугольная грядка высотой 45 или 60 см. Выдержит ли конструкция такую высоту и все земли?\n\nСпасибо.'),
(1570, 1, 175, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1571, 1, 175, 'formId', '1'),
(1572, 1, 176, 'Radiobutton', 'Компания'),
(1573, 1, 176, 'Company', 'ООО  ТД Майолика'),
(1574, 1, 176, 'FullName', 'Сергей Игоревич Теверовский'),
(1575, 1, 176, 'Phone', '+79025554975'),
(1576, 1, 176, 'Email', '554975@mail.ru'),
(1577, 1, 176, 'City', 'Владивосток'),
(1578, 1, 176, 'Message', 'Добрый день, хотим стать Вашим представителем по фасадным панелям на территории Приморского края.'),
(1579, 1, 176, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1580, 1, 176, 'formId', '1'),
(1581, 1, 177, 'Radiobutton', 'Компания'),
(1582, 1, 177, 'Company', 'Parket777'),
(1583, 1, 177, 'FullName', 'Дмитрий'),
(1584, 1, 177, 'Phone', '89119255194'),
(1585, 1, 177, 'Email', '5drector@mail.ru'),
(1586, 1, 177, 'City', 'Санкт-Петербург'),
(1587, 1, 177, 'Message', 'Добрый день\n\nв связи с расширением ассортимента продукции, интересует террасная доска и палубная доска\n\nпросьба выслать \n\n1 - ваши условия сотрудничества\n\n2 - оптовый прайс лист\n\n3 - презентации вашей продукции'),
(1588, 1, 177, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1589, 1, 177, 'formId', '1'),
(1590, 1, 178, 'Radiobutton', 'Компания'),
(1591, 1, 178, 'Company', 'Лико Плюс '),
(1592, 1, 178, 'FullName', 'Дмитрий'),
(1593, 1, 178, 'Phone', '8-913-933-92-33'),
(1594, 1, 178, 'Email', 'lico.plus@mail.ru'),
(1595, 1, 178, 'City', 'Новосибирск'),
(1596, 1, 178, 'Message', 'Здравствуйте!\nСалон напольных покрытий Lico Plus хочет продавать Вашу продукцию. Наш адрес: г Новосибирск, ул. Светлановская, 50 к 1 ТЦ Красный мамонт'),
(1597, 1, 178, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1598, 1, 178, 'formId', '1'),
(1599, 1, 179, 'Radiobutton', 'Частное лицо'),
(1600, 1, 179, 'Company', ''),
(1601, 1, 179, 'FullName', 'Марк'),
(1602, 1, 179, 'Phone', '89104492489'),
(1603, 1, 179, 'Email', 'mlevintan@gmail.com'),
(1604, 1, 179, 'City', 'Москва'),
(1605, 1, 179, 'Message', 'Добрый день!\n\nВ разделе где купить  нашёл три компании и сделал у них запрос по плитке 30х30 Венге классик с подсветкой и без.  Один из них сразу предупреждает ,что цвет может не совпасть, так как разные партии. Подскажите, это от вашего склада зависит или от склада продавца?'),
(1606, 1, 179, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1607, 1, 179, 'formId', '1'),
(1608, 1, 180, 'Radiobutton', 'Компания'),
(1609, 1, 180, 'Company', 'ООО Кронекс'),
(1610, 1, 180, 'FullName', 'Дмитрий'),
(1611, 1, 180, 'Phone', '+7 966 032 78 14'),
(1612, 1, 180, 'Email', 'managerkronex@gmail.com'),
(1613, 1, 180, 'City', 'Москва'),
(1614, 1, 180, 'Message', 'Предложение по опорам Kronex.\nДобрый день. \nХочу предложить регулируемые опоры Kronex для вашей компании. \nБуду рад ответить на  вопросы по нашим опорам.\nНаш склад расположен по адресу: Москва, Очаковское шоссе 36.\n\n'),
(1615, 1, 180, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1616, 1, 180, 'formId', '1'),
(1617, 1, 181, 'Radiobutton', 'Компания'),
(1618, 1, 181, 'Company', 'Контур Плюс'),
(1619, 1, 181, 'FullName', 'Олег'),
(1620, 1, 181, 'Phone', '+79631497804'),
(1621, 1, 181, 'Email', 'kontur.saransk@bk.ru'),
(1622, 1, 181, 'City', 'Саранск'),
(1623, 1, 181, 'Message', 'Здравствуйте!\nЯ представляю саранскую торгово-строительную компанию, сейчас ищем готового к работе поставщика ДПК на будущий сезон. Ранее несколько лет работали с ульяновским заводом, но уже более года на производстве проблемы. Напишите, пожалуйста, возможные варианты сотрудничества.'),
(1624, 1, 181, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1625, 1, 181, 'formId', '1'),
(1626, 1, 182, 'Radiobutton', 'Компания'),
(1627, 1, 182, 'Company', 'ООО ТАПАС'),
(1628, 1, 182, 'FullName', 'Павел Алещик'),
(1629, 1, 182, 'Phone', '375445879738'),
(1630, 1, 182, 'Email', 'pavel2611@gmail.com'),
(1631, 1, 182, 'City', 'Минск'),
(1632, 1, 182, 'Message', 'Добрый день.\nБеспокоит ООО ТАПАС, г. Минск, Беларусь.\nХотим приобрести ДПК доску CM Decking Vintage в объеме 1300 кв.м.\nС поставкой в г. Минск, Беларусь.\nПрошу сообщить, к кому из Ваших дилеров нам выгоднее обратиться для поставки данного объема? Имеются ли Ваши представители на территории Беларуси?\nСпасибо\n'),
(1633, 1, 182, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1634, 1, 182, 'formId', '1'),
(1635, 1, 183, 'Radiobutton', 'Компания'),
(1636, 1, 183, 'Company', 'Станкопромстрой'),
(1637, 1, 183, 'FullName', 'Александр Юрьевич'),
(1638, 1, 183, 'Phone', '89877570787'),
(1639, 1, 183, 'Email', '79101032841@bk.ru'),
(1640, 1, 183, 'City', 'Нижний Новгород'),
(1641, 1, 183, 'Message', 'Добрый день, заинтересовала ваша продукция у меня 60 розничных точек по Нижнему Новгороду. Хочу получить от вас образцы,для рассмотрения.\nПланирую работать по всех России есть так же контакты точек которые уже работают, хочу от вас хороший прайс с ценами.\nИ от чего зависит сотрудничество?'),
(1642, 1, 183, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1643, 1, 183, 'formId', '1'),
(1644, 1, 184, 'Radiobutton', 'Компания'),
(1645, 1, 184, 'Company', 'ООО СтройКомфорт'),
(1646, 1, 184, 'FullName', 'Денис'),
(1647, 1, 184, 'Phone', '+7 9206135777'),
(1648, 1, 184, 'Email', 'budayev777@gmail.com'),
(1649, 1, 184, 'City', 'Калуга'),
(1650, 1, 184, 'Message', 'Мы хотим расширить список предлагаемой нами продукции, наши направление деятельности светопрозрачные конструкции и воротные системы.\nПоэтому хотели стать Вашими дилерами.'),
(1651, 1, 184, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1652, 1, 184, 'formId', '1'),
(1653, 1, 185, 'Radiobutton', 'Компания'),
(1654, 1, 185, 'Company', 'Parket777'),
(1655, 1, 185, 'FullName', 'Дмитрий'),
(1656, 1, 185, 'Phone', '89119255194'),
(1657, 1, 185, 'Email', '5drector@mail.ru'),
(1658, 1, 185, 'City', 'Санкт-Петербург, Москва'),
(1659, 1, 185, 'Message', 'Добрый день, меня зовут Дмитрий\n\nдиректор компании Parket777\n\nв связи с расширением ассортимента продукции, интересует террасная доска, доска ДКП,  термоясень, декинг и т.д.\n\n( занимаемся всеми видами напольных покрытий - сайт  parket777.ru   - сеть розничных магазинов в С-Пб, Москве, Ярославле )\n\n\nпросьба выслать \n\n1 - ваши условия сотрудничества\n\n2 - оптовый прайс лист\n\n3 - презентации вашей продукции\n'),
(1660, 1, 185, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1661, 1, 185, 'formId', '1'),
(1662, 1, 186, 'Radiobutton', 'Компания'),
(1663, 1, 186, 'Company', 'ДомКомфорт Челябинск'),
(1664, 1, 186, 'FullName', 'Даниил'),
(1665, 1, 186, 'Phone', '9068632002'),
(1666, 1, 186, 'Email', 'Danilkann78@gmail.com'),
(1667, 1, 186, 'City', 'Челябинск'),
(1668, 1, 186, 'Message', 'Прайс нужен для нас и для розницы.\nИ телефон с кем можно подробней пообщаться.'),
(1669, 1, 186, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1670, 1, 186, 'formId', '1'),
(1671, 1, 187, 'Radiobutton', 'Компания'),
(1672, 1, 187, 'Company', 'OOO Велес'),
(1673, 1, 187, 'FullName', 'Александр'),
(1674, 1, 187, 'Phone', '+79226988834'),
(1675, 1, 187, 'Email', 'tialva@mail.ru'),
(1676, 1, 187, 'City', 'Челябинск'),
(1677, 1, 187, 'Message', 'Хотим сотрудничать с Вами по продажам Вашей доски на данный момент есть заказ порядка 500м2 нужен прайс и образцы Вашей продукции.\nС уважением Александр тел:+79226988834'),
(1678, 1, 187, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1679, 1, 187, 'formId', '1'),
(1680, 1, 188, 'Radiobutton', 'Компания'),
(1681, 1, 188, 'Company', 'Вековые традиции'),
(1682, 1, 188, 'FullName', 'Екатерина'),
(1683, 1, 188, 'Phone', '559776'),
(1684, 1, 188, 'Email', 'nova_45@mail.ru'),
(1685, 1, 188, 'City', 'тверь'),
(1686, 1, 188, 'Message', 'Интересуют ограждения,цены .Доска террасная серия винтаж Эбэн . Цена. Так же интересно,делаете ли ограждения по нашей длинне? просьба связаться срочно'),
(1687, 1, 188, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1688, 1, 188, 'formId', '1'),
(1689, 1, 189, 'Radiobutton', 'Частное лицо'),
(1690, 1, 189, 'Company', ''),
(1691, 1, 189, 'FullName', 'Галина'),
(1692, 1, 189, 'Phone', '89119323983'),
(1693, 1, 189, 'Email', '6_64@mail.ru'),
(1694, 1, 189, 'City', 'Санкт-Петербург'),
(1695, 1, 189, 'Message', 'Здравствуйте, скажите пожалуйста сколько стоят ваши клумбы?'),
(1696, 1, 189, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1697, 1, 189, 'formId', '1'),
(1698, 1, 190, 'Radiobutton', 'Компания'),
(1699, 1, 190, 'Company', 'Ип '),
(1700, 1, 190, 'FullName', 'Максим Колбатов'),
(1701, 1, 190, 'Phone', '89134455533'),
(1702, 1, 190, 'Email', 'max_kolbatov@mail.ru'),
(1703, 1, 190, 'City', 'Абакан '),
(1704, 1, 190, 'Message', 'Здравствуйте, хотел бы закупить вашу продукцию. Заключить договор на выгодных условиях поставки я Занимаюсь строительством . '),
(1705, 1, 190, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1706, 1, 190, 'formId', '1'),
(1707, 1, 191, 'Radiobutton', 'Частное лицо'),
(1708, 1, 191, 'Company', ''),
(1709, 1, 191, 'FullName', 'Полина'),
(1710, 1, 191, 'Phone', '89089999588'),
(1711, 1, 191, 'Email', 'omo-snab@mail.ru'),
(1712, 1, 191, 'City', 'Большой Камень.'),
(1713, 1, 191, 'Message', 'мы находимся в приморском крае.\nнаша компания строит дома.\nмне нужны контакты компании с кем можно связаться по закупке материалов на водосточную систему кровли. '),
(1714, 1, 191, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1715, 1, 191, 'formId', '1'),
(1716, 1, 192, 'Radiobutton', 'Компания'),
(1717, 1, 192, 'Company', 'Мастерская ЛиД'),
(1718, 1, 192, 'FullName', 'Розалия'),
(1719, 1, 192, 'Phone', '89165256626'),
(1720, 1, 192, 'Email', '5256626@mail.ru'),
(1721, 1, 192, 'City', 'Москва'),
(1722, 1, 192, 'Message', 'Интересует террасная доска'),
(1723, 1, 192, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1724, 1, 192, 'formId', '1'),
(1725, 1, 193, 'Radiobutton', 'Компания'),
(1726, 1, 193, 'Company', 'Эдем'),
(1727, 1, 193, 'FullName', 'Константин'),
(1728, 1, 193, 'Phone', '8-913-944-73-38'),
(1729, 1, 193, 'Email', 'skm@nov.net'),
(1730, 1, 193, 'City', 'Новосибирск'),
(1731, 1, 193, 'Message', 'Добрый день!\nХотелось бы с Вами сотрудничать по террасной доске. Сообщите как с Вами связаться.\n\nС уважением,  Константин.'),
(1732, 1, 193, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1733, 1, 193, 'formId', '1'),
(1734, 1, 194, 'Radiobutton', 'Частное лицо'),
(1735, 1, 194, 'Company', ''),
(1736, 1, 194, 'FullName', 'Карен'),
(1737, 1, 194, 'Phone', '79213504901'),
(1738, 1, 194, 'Email', 'maleryan@mail.ru'),
(1739, 1, 194, 'City', 'Санкт-Петербург'),
(1740, 1, 194, 'Message', 'Интересует отделка фасада, застил террасной доски и ограждений. '),
(1741, 1, 194, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1742, 1, 194, 'formId', '1'),
(1743, 1, 195, 'Radiobutton', 'Частное лицо'),
(1744, 1, 195, 'Company', ''),
(1745, 1, 195, 'FullName', 'Анна'),
(1746, 1, 195, 'Phone', '89833002000'),
(1747, 1, 195, 'Email', 'kucherenko900@mail.ru'),
(1748, 1, 195, 'City', 'Новосибирск'),
(1749, 1, 195, 'Message', 'Добрый день!нужна террасная  доска mix,на которую действует акция по распродаже .хотела приобрести в магазине,но там не было распродажи на нее!'),
(1750, 1, 195, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1751, 1, 195, 'formId', '1'),
(1752, 1, 196, 'Radiobutton', 'Частное лицо'),
(1753, 1, 196, 'Company', ''),
(1754, 1, 196, 'FullName', 'Александр'),
(1755, 1, 196, 'Phone', '8-961-279-79-49'),
(1756, 1, 196, 'Email', 'avfedotov83@mail.ru'),
(1757, 1, 196, 'City', 'Ростов на Дону'),
(1758, 1, 196, 'Message', 'Добрый день меня интересует террасная доска серииVINTAG (ЭБЕН)'),
(1759, 1, 196, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1760, 1, 196, 'formId', '1'),
(1761, 1, 197, 'Radiobutton', 'Компания'),
(1762, 1, 197, 'Company', 'Гуд Хаус'),
(1763, 1, 197, 'FullName', 'Максим'),
(1764, 1, 197, 'Phone', '79879011764'),
(1765, 1, 197, 'Email', 'pro_roof@mail.ru'),
(1766, 1, 197, 'City', 'Самара'),
(1767, 1, 197, 'Message', 'Есть потребность в металле рукки, 1600 м.кв.'),
(1768, 1, 197, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1769, 1, 197, 'formId', '1'),
(1770, 1, 198, 'Radiobutton', 'Компания'),
(1771, 1, 198, 'Company', 'МОФАС'),
(1772, 1, 198, 'FullName', 'АЛЕКСЕЙ'),
(1773, 1, 198, 'Phone', '89261884999'),
(1774, 1, 198, 'Email', 'order@mofas.ru'),
(1775, 1, 198, 'City', 'Москва'),
(1776, 1, 198, 'Message', 'Хочу продавать вашу продукцию.'),
(1777, 1, 198, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1778, 1, 198, 'formId', '1'),
(1779, 1, 199, 'Radiobutton', 'Компания'),
(1780, 1, 199, 'Company', 'ПДП'),
(1781, 1, 199, 'FullName', 'Владимир'),
(1782, 1, 199, 'Phone', '89819334675'),
(1783, 1, 199, 'Email', 'zakaz@bestcork.ru'),
(1784, 1, 199, 'City', 'Санкт-Петербург'),
(1785, 1, 199, 'Message', 'Добрый день !\nПрошу связаться со мной. Интересует возможность получения дилерских условий и сотрудничества на постоянной основе.\nЗаранее благодарен !'),
(1786, 1, 199, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1787, 1, 199, 'formId', '1');
INSERT INTO `hud_rsform_submission_values` (`SubmissionValueId`, `FormId`, `SubmissionId`, `FieldName`, `FieldValue`) VALUES
(1788, 1, 200, 'Radiobutton', 'Частное лицо'),
(1789, 1, 200, 'Company', ''),
(1790, 1, 200, 'FullName', 'Павел'),
(1791, 1, 200, 'Phone', '89515872028'),
(1792, 1, 200, 'Email', 'pavel.krasikov.88@mail.ru'),
(1793, 1, 200, 'City', 'Кемерово'),
(1794, 1, 200, 'Message', 'Здравствуйте, подскажите у вас можно заказать террасную доску и ограждения из ДПК. '),
(1795, 1, 200, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1796, 1, 200, 'formId', '1'),
(1797, 1, 201, 'Radiobutton', 'Компания'),
(1798, 1, 201, 'Company', 'ООО Завод АРЛЕС'),
(1799, 1, 201, 'FullName', 'Андрей'),
(1800, 1, 201, 'Phone', '+79119916837'),
(1801, 1, 201, 'Email', 'snab@arlesspb.ru'),
(1802, 1, 201, 'City', 'Санкт-Петербург'),
(1803, 1, 201, 'Message', 'Добрый день!\nИнтересует сотрудничество по материалам из ДПК.\nХотели бы заключить дилерский договор.\n\nС уважением, Андрей Канашевич \nИнженер по снабжению\nООО Завод АРЛЕС'),
(1804, 1, 201, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1805, 1, 201, 'formId', '1'),
(1806, 1, 202, 'Radiobutton', 'Компания'),
(1807, 1, 202, 'Company', 'ССТ'),
(1808, 1, 202, 'FullName', 'Антон'),
(1809, 1, 202, 'Phone', '+77018005062'),
(1810, 1, 202, 'Email', 'a.yalbachev@verbulak.com'),
(1811, 1, 202, 'City', 'Атыару'),
(1812, 1, 202, 'Message', 'для зданий модульного типа требуются водостоки\nскажите пожалуйста куда можно отправить тех. задание? '),
(1813, 1, 202, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1814, 1, 202, 'formId', '1'),
(1815, 1, 203, 'Radiobutton', 'Компания'),
(1816, 1, 203, 'Company', 'ИП'),
(1817, 1, 203, 'FullName', 'Юлия Анатольевна'),
(1818, 1, 203, 'Phone', '8-952-85-75-08'),
(1819, 1, 203, 'Email', 'Julenka.z@mail.ru'),
(1820, 1, 203, 'City', 'Колпашево'),
(1821, 1, 203, 'Message', 'Добрый день,заинтересовала Ваша продукция.Вышлите пожалуйста оптовый прайс лист и условия сотрудничества.'),
(1822, 1, 203, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1823, 1, 203, 'formId', '1'),
(1824, 1, 204, 'Radiobutton', 'Компания'),
(1825, 1, 204, 'Company', 'ип ляпусова '),
(1826, 1, 204, 'FullName', 'Максим'),
(1827, 1, 204, 'Phone', '89085042000'),
(1828, 1, 204, 'Email', 'donkotton@mail.ru'),
(1829, 1, 204, 'City', 'Ростов-на-Дону'),
(1830, 1, 204, 'Message', 'Просим сообщить контакты представительства в г. Ростове-на-дону, для приобретения вашей продукции'),
(1831, 1, 204, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1832, 1, 204, 'formId', '1'),
(1833, 1, 205, 'Radiobutton', 'Компания'),
(1834, 1, 205, 'Company', 'Сибирский ДПК'),
(1835, 1, 205, 'FullName', 'Николай'),
(1836, 1, 205, 'Phone', '+79029403652'),
(1837, 1, 205, 'Email', 'sk_skala@mail.ru'),
(1838, 1, 205, 'City', 'Красноярск'),
(1839, 1, 205, 'Message', 'Очень заинтересовали ступени. Если в ассортименте ступени длиной 4 метра? Да и вообще хотел бы попросить прайс. '),
(1840, 1, 205, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1841, 1, 205, 'formId', '1'),
(1842, 1, 206, 'Radiobutton', 'Частное лицо'),
(1843, 1, 206, 'Company', ''),
(1844, 1, 206, 'FullName', 'Магомед '),
(1845, 1, 206, 'Phone', '89280604400'),
(1846, 1, 206, 'Email', 'krovlya001@mail.ru'),
(1847, 1, 206, 'City', 'Каспийск '),
(1848, 1, 206, 'Message', 'Сотрудничество'),
(1849, 1, 206, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1850, 1, 206, 'formId', '1'),
(1851, 1, 207, 'Radiobutton', 'Частное лицо'),
(1852, 1, 207, 'Company', ''),
(1853, 1, 207, 'FullName', 'Максим'),
(1854, 1, 207, 'Phone', '+79025162972'),
(1855, 1, 207, 'Email', 'laboracom@list.ru'),
(1856, 1, 207, 'City', 'Иркутск'),
(1857, 1, 207, 'Message', 'Интересует покупка террасной доски СМ Декинг, серия Натур, цвет дуб и аксессуары. Прошу вас рекомендовать надёжную компанию из Нск или Крск или готов купить напрямую в Нск у вас (тогда прошу вас выслать прайс).'),
(1858, 1, 207, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1859, 1, 207, 'formId', '1'),
(1860, 1, 208, 'Radiobutton', 'Частное лицо'),
(1861, 1, 208, 'Company', ''),
(1862, 1, 208, 'FullName', 'Валерий Бухтияров'),
(1863, 1, 208, 'Phone', '9148442194'),
(1864, 1, 208, 'Email', 'vbuhtik@mail.ru'),
(1865, 1, 208, 'City', 'Улан-Удэ'),
(1866, 1, 208, 'Message', 'С каким шагом кладутся лаги под декинг?'),
(1867, 1, 208, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1868, 1, 208, 'formId', '1'),
(1869, 1, 209, 'Radiobutton', 'Частное лицо'),
(1870, 1, 209, 'Company', ''),
(1871, 1, 209, 'FullName', 'Виталий'),
(1872, 1, 209, 'Phone', '89147091083'),
(1873, 1, 209, 'Email', 'gensrz@mail.ru'),
(1874, 1, 209, 'City', 'г.Находка, Приморский край'),
(1875, 1, 209, 'Message', 'Здравствуйте!\nПокупал для терассы доску серии GRAND цвет WENGE (венге,коричневый)прошлогодней колеции, не хватило четыре доски. Упродавцов нет в наличии. Посоветовали обратиться непосредственно к Вам, как дистребьютору, может быть у Вас завалялась прошлогодняя доска на складе?\nС Уважением.\nТкаченко Виталий\n89147091083   '),
(1876, 1, 209, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1877, 1, 209, 'formId', '1'),
(1878, 1, 210, 'Radiobutton', 'Компания'),
(1879, 1, 210, 'Company', 'Центр Крепежа'),
(1880, 1, 210, 'FullName', 'Линар'),
(1881, 1, 210, 'Phone', '89534025394'),
(1882, 1, 210, 'Email', 'liak3387@gmail.com'),
(1883, 1, 210, 'City', 'Казань, Республика Татарстан, Мамадышский тракт, 44'),
(1884, 1, 210, 'Message', 'Добрый день!\nХочу стать вашим дилером, прошу прайс лист на продукцию и выставочные образцы.'),
(1885, 1, 210, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1886, 1, 210, 'formId', '1'),
(1887, 1, 211, 'Radiobutton', 'Компания'),
(1888, 1, 211, 'Company', 'ООО ГК Иником'),
(1889, 1, 211, 'FullName', 'Елена'),
(1890, 1, 211, 'Phone', '89276546254'),
(1891, 1, 211, 'Email', 'e.butenko@inikom.ru'),
(1892, 1, 211, 'City', 'Самара'),
(1893, 1, 211, 'Message', 'Добрый день, \nнам интересна продукция Вашей компании. Рассматриваем возможность закупки у Вас водосточной системы. Пришлите пожалуйста КП для нас.\nОчень жду обратной связи.  '),
(1894, 1, 211, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1895, 1, 211, 'formId', '1'),
(1896, 1, 212, 'Radiobutton', 'Компания'),
(1897, 1, 212, 'Company', 'ИП Ибрагимов Равиль '),
(1898, 1, 212, 'FullName', 'Равиль '),
(1899, 1, 212, 'Phone', '89090622000'),
(1900, 1, 212, 'Email', 'ip.ibragimov@gmail.com'),
(1901, 1, 212, 'City', 'Воткинск '),
(1902, 1, 212, 'Message', 'Можно ваш прайс?'),
(1903, 1, 212, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1904, 1, 212, 'formId', '1'),
(1905, 1, 213, 'Radiobutton', 'Частное лицо'),
(1906, 1, 213, 'Company', ''),
(1907, 1, 213, 'FullName', 'User User'),
(1908, 1, 213, 'Phone', '11111111111'),
(1909, 1, 213, 'Email', 'test@test.test'),
(1910, 1, 213, 'City', 'User'),
(1911, 1, 213, 'Message', 'wetwerewr'),
(1912, 1, 213, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1913, 1, 213, 'formId', '1'),
(1914, 1, 214, 'Radiobutton', 'Компания'),
(1915, 1, 214, 'Company', 'ООО интердекор'),
(1916, 1, 214, 'FullName', 'Алевтина'),
(1917, 1, 214, 'Phone', '8-953-959-96-75'),
(1918, 1, 214, 'Email', 'bag@id71.ru'),
(1919, 1, 214, 'City', 'Тула'),
(1920, 1, 214, 'Message', 'Ищем поставщика Террасной доски, садового паркета. Имеем 21 магазин по Тульской, Калужской, Липецкой, Орловской области. Пришлите оптовый прайс, пожалуйста. Хотим стать вашим дилером. '),
(1921, 1, 214, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1922, 1, 214, 'formId', '1'),
(1923, 1, 215, 'Radiobutton', 'Компания'),
(1924, 1, 215, 'Company', 'ООО Ваш Дом'),
(1925, 1, 215, 'FullName', 'Андрей'),
(1926, 1, 215, 'Phone', '89643212215'),
(1927, 1, 215, 'Email', 'da@vashome.ru'),
(1928, 1, 215, 'City', 'Санкт-Петербург'),
(1929, 1, 215, 'Message', 'Добрый  день, хотел бы получить у Вас дилерские условия и образцы. Имеется опыт работы по продаже Вашей продукции. '),
(1930, 1, 215, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1931, 1, 215, 'formId', '1'),
(1932, 1, 216, 'Radiobutton', 'Компания'),
(1933, 1, 216, 'Company', 'ООО СВАРОГ'),
(1934, 1, 216, 'FullName', 'Павел'),
(1935, 1, 216, 'Phone', '89882363635'),
(1936, 1, 216, 'Email', 'svs@svarog-catalog.ru'),
(1937, 1, 216, 'City', 'Сочи'),
(1938, 1, 216, 'Message', 'Добрый день. Нам необходим\nТеррасная доска Дёкинг Тип 1  размером 14х13х3000мм цвет молочный - 52шт  \nИли примерно такие размеры и цвет '),
(1939, 1, 216, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1940, 1, 216, 'formId', '1'),
(1941, 1, 217, 'Radiobutton', 'Компания'),
(1942, 1, 217, 'Company', 'БЕЛКОРСНАБ'),
(1943, 1, 217, 'FullName', 'ДМИТРИЙ'),
(1944, 1, 217, 'Phone', '+375 44 741 50 16'),
(1945, 1, 217, 'Email', 'belkorsnab@tut.by'),
(1946, 1, 217, 'City', 'Республика Беларусь, г. Могилев'),
(1947, 1, 217, 'Message', 'Интересуют дилерские отношения. '),
(1948, 1, 217, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1949, 1, 217, 'formId', '1'),
(1950, 1, 218, 'Radiobutton', 'Компания'),
(1951, 1, 218, 'Company', 'MAS'),
(1952, 1, 218, 'FullName', 'Максим'),
(1953, 1, 218, 'Phone', '89269801680'),
(1954, 1, 218, 'Email', 'art.max@bk.ru'),
(1955, 1, 218, 'City', 'Москва'),
(1956, 1, 218, 'Message', 'Интересует ДПК, лиственница, \nтермо'),
(1957, 1, 218, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1958, 1, 218, 'formId', '1'),
(1959, 1, 219, 'Radiobutton', 'Компания'),
(1960, 1, 219, 'Company', 'компания Sokolov '),
(1961, 1, 219, 'FullName', 'Анна '),
(1962, 1, 219, 'Phone', '8-903-899-9523'),
(1963, 1, 219, 'Email', 'a.petropavlovskaya@uvelit.ru'),
(1964, 1, 219, 'City', 'Кострома'),
(1965, 1, 219, 'Message', 'Добрый день! заказчик выбрал у вас на сайте Террасная доска ДПК полнотелая CM Scandinavia Solid Дуб , хотели получить образец , у компаний которые указаны как ваши представители нет образцов и купить в качестве образца готовую  доску нельзя. Расскажите, пож-та , как нам получить образец данной доски ? '),
(1966, 1, 219, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1967, 1, 219, 'formId', '1'),
(1968, 1, 220, 'Radiobutton', 'Частное лицо'),
(1969, 1, 220, 'Company', ''),
(1970, 1, 220, 'FullName', 'максим'),
(1971, 1, 220, 'Phone', '9209466507'),
(1972, 1, 220, 'Email', 'erkinzebralog@gmail.com'),
(1973, 1, 220, 'City', 'Москва'),
(1974, 1, 220, 'Message', 'доска дпк импорт  китай'),
(1975, 1, 220, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1976, 1, 220, 'formId', '1'),
(1977, 1, 221, 'Radiobutton', 'Компания'),
(1978, 1, 221, 'Company', 'ЛВЛ Проект'),
(1979, 1, 221, 'FullName', 'Иван'),
(1980, 1, 221, 'Phone', '+79219419147'),
(1981, 1, 221, 'Email', 'iklekov@gmail.com'),
(1982, 1, 221, 'City', 'Санкт-Петербург'),
(1983, 1, 221, 'Message', 'Добрый день!\nНеобходимо выполнить поставку террасной доски в Казахстан. Объем поставки 500 м2, в комплекте клипсы и направляющие (АЛ или тоже ДПК). Особенность запроса в том, что поставку необходимо провести между юрлицами, а значит без НДС. Как правило все продавцы избегают таких контрактов, либо НДС не исключают.\nПоэтому образуемся напрямую к вам, в надежде на такой контракт, а так же планируем рассмотреть возможность стать вашим киллером на территории Казахстана. Офис в г. Нурсултан.\nСпасибо большое за ответ.'),
(1984, 1, 221, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1985, 1, 221, 'formId', '1'),
(1986, 1, 222, 'Radiobutton', 'Частное лицо'),
(1987, 1, 222, 'Company', ''),
(1988, 1, 222, 'FullName', 'Марина'),
(1989, 1, 222, 'Phone', '8-950-484-12-93'),
(1990, 1, 222, 'Email', 'pankova@logist72.ru'),
(1991, 1, 222, 'City', 'Тюмень'),
(1992, 1, 222, 'Message', 'Желаем приобрести:\n- 2 водосточных желоба, длинной по 8,5м;\n- 2 водосточных трубы по 3м;\n- 2 стыковки желоба и трубы.\nПрошу сориентировать по цене и срокам поставки, спасибо\n'),
(1993, 1, 222, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(1994, 1, 222, 'formId', '1'),
(1995, 1, 223, 'Radiobutton', 'Компания'),
(1996, 1, 223, 'Company', 'ИП рассулов '),
(1997, 1, 223, 'FullName', 'Игорь '),
(1998, 1, 223, 'Phone', '+79999990054'),
(1999, 1, 223, 'Email', 'igorkanara777@gmail.com'),
(2000, 1, 223, 'City', 'Голицыно'),
(2001, 1, 223, 'Message', 'Здравствуйте , мы занимаемся розничными продажами  декинга и прочих материалов для отделки домов , хотел узнать как можно свами сотрудничать ? '),
(2002, 1, 223, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2003, 1, 223, 'formId', '1'),
(2004, 1, 224, 'Radiobutton', 'Компания'),
(2005, 1, 224, 'Company', 'ИП'),
(2006, 1, 224, 'FullName', 'Владимир Васильев'),
(2007, 1, 224, 'Phone', '9885766677'),
(2008, 1, 224, 'Email', '1866677@gmail.com'),
(2009, 1, 224, 'City', 'Каменск Шахтинск'),
(2010, 1, 224, 'Message', 'Доброе утро! Где можно закупить водосточная систему...'),
(2011, 1, 224, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2012, 1, 224, 'formId', '1'),
(2013, 1, 225, 'Radiobutton', 'Частное лицо'),
(2014, 1, 225, 'Company', ''),
(2015, 1, 225, 'FullName', 'Василий Волгин'),
(2016, 1, 225, 'Phone', '89124889609'),
(2017, 1, 225, 'Email', 'volgin.vn87@gmail.com'),
(2018, 1, 225, 'City', 'Пермь'),
(2019, 1, 225, 'Message', 'Интересует, что мне необходимо для устройства настила площадь 200 м2, расстояние между опорами под лаги? планирую закрутить сваи по ним устроить металокаркас на него положить лаги.\n   '),
(2020, 1, 225, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2021, 1, 225, 'formId', '1'),
(2022, 1, 226, 'Radiobutton', 'Частное лицо'),
(2023, 1, 226, 'Company', ''),
(2024, 1, 226, 'FullName', 'Алексей'),
(2025, 1, 226, 'Phone', '89082565706'),
(2026, 1, 226, 'Email', 'alex.kor777@mail.ru'),
(2027, 1, 226, 'City', 'Пермь'),
(2028, 1, 226, 'Message', 'Есть желание сделать забор из Вашей продукции.'),
(2029, 1, 226, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2030, 1, 226, 'formId', '1'),
(2031, 1, 227, 'Radiobutton', 'Компания'),
(2032, 1, 227, 'Company', 'Ангарастрой'),
(2033, 1, 227, 'FullName', 'Анна'),
(2034, 1, 227, 'Phone', '89246176800'),
(2035, 1, 227, 'Email', 'wd@733763.ru'),
(2036, 1, 227, 'City', 'Иркутск'),
(2037, 1, 227, 'Message', 'Здравствуйте!\n\nПодскажите, пожалуйста, условия для дилеров и как приобрести образцы декинга?'),
(2038, 1, 227, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2039, 1, 227, 'formId', '1'),
(2040, 1, 228, 'Radiobutton', 'Частное лицо'),
(2041, 1, 228, 'Company', ''),
(2042, 1, 228, 'FullName', 'Яна'),
(2043, 1, 228, 'Phone', '+79167366023'),
(2044, 1, 228, 'Email', 'yana.icult@gmail.com'),
(2045, 1, 228, 'City', 'Москва'),
(2046, 1, 228, 'Message', 'Здравствуйте!\nУточните пожалуйста, где в Москве можно купить новую серию террасной доски ROBUST ?'),
(2047, 1, 228, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2048, 1, 228, 'formId', '1'),
(2049, 1, 229, 'Radiobutton', 'Компания'),
(2050, 1, 229, 'Company', 'Kronalux'),
(2051, 1, 229, 'FullName', 'Никита'),
(2052, 1, 229, 'Phone', '89227277270'),
(2053, 1, 229, 'Email', 'kronalux@mail.ru'),
(2054, 1, 229, 'City', 'Челябинск'),
(2055, 1, 229, 'Message', 'Добрый день, интересует террасная доска вашего производства, работаете ли вы с дилерами или дистрибьюторами ?'),
(2056, 1, 229, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2057, 1, 229, 'formId', '1'),
(2058, 1, 230, 'Radiobutton', 'Компания'),
(2059, 1, 230, 'Company', 'Гармония интерьера'),
(2060, 1, 230, 'FullName', 'Александр'),
(2061, 1, 230, 'Phone', '+9658430777'),
(2062, 1, 230, 'Email', 'aleksander.shatunov2016@yandex.ru'),
(2063, 1, 230, 'City', 'Ижевск'),
(2064, 1, 230, 'Message', ' \n\nТеррасная доска ДПК пустотелая СМ Decking серия Natur, цвет Рябина\n	\n\nМ2\n	\n\n163\n\nТеррасная доска ДПК пустотелая СМ Decking серия Natur, цвет Венге\n	\n\nМ2\n	\n\n40\n\nНесущая лага 2000х40х25 СМ Decking\n	\n\nШт\n	\n\n326\n\nОпорная плита из бетонного камня 200х200х40 мм\n	\n\nшт\n	\n\n857\n\nТорцевая доска 2000х50х10 мм СМ Decking СМ Decking серия Natur, цвет аналогичный террасной доске\n	\n\nШт\n	\n\n43'),
(2065, 1, 230, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2066, 1, 230, 'formId', '1'),
(2067, 1, 231, 'Radiobutton', 'Компания'),
(2068, 1, 231, 'Company', 'LePole'),
(2069, 1, 231, 'FullName', 'Павел'),
(2070, 1, 231, 'Phone', '+79128936666'),
(2071, 1, 231, 'Email', 'le.pole2@bk.ru'),
(2072, 1, 231, 'City', 'Челябинск'),
(2073, 1, 231, 'Message', 'Добрый день!\n\nНаша компания занимается продажей Дверей и Напольной продукции в городе Челябинск.\nВ связи с частыми обращениями от наших партнеров-дизайнеров в выборе садового паркета хотели бы рассмотреть сотрудничество с вашей компанией для оформления выставки в наших салонах.'),
(2074, 1, 231, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2075, 1, 231, 'formId', '1'),
(2076, 1, 232, 'Radiobutton', 'Частное лицо'),
(2077, 1, 232, 'Company', ''),
(2078, 1, 232, 'FullName', 'Кирилл'),
(2079, 1, 232, 'Phone', '89109177090'),
(2080, 1, 232, 'Email', 'kirmeer@gmail.com'),
(2081, 1, 232, 'City', 'Калуга '),
(2082, 1, 232, 'Message', 'Добрый день! \n\nЯ облицевал фасад дома вашей доской Фасадная облицовка CM Cladding NATUR, 12х152х3000 мм, цвет OAK (Дуб)\n\nТеперь хочу сделать забор таким же цветом. Подскажите какую доску использовать? Хочу сделать в шахматном порядке как на приложенном фото \n\n'),
(2083, 1, 232, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2084, 1, 232, 'formId', '1'),
(2085, 1, 233, 'Radiobutton', 'Компания'),
(2086, 1, 233, 'Company', 'Амбаръ'),
(2087, 1, 233, 'FullName', 'Виктор'),
(2088, 1, 233, 'Phone', '8-953-917-8700'),
(2089, 1, 233, 'Email', 'map.tomsk@ambar-s.ru'),
(2090, 1, 233, 'City', 'Томск'),
(2091, 1, 233, 'Message', 'Добрый день! Наш клиент хочет совместить Террасную доску Винтаж Венге со ступенями Венге. Но наш региональный поставщик отказывается сделать фотографии, приложив их друг к другу. Хотел Вас попросить сделать фотографии при солнечном свете, чтобы в одном кадре была доска Винтаж Венге и Ступень Венге. Речь идет о площади доски 230 м.кв. и 93 м.п. ступеней. Заранее спасибо!'),
(2092, 1, 233, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2093, 1, 233, 'formId', '1'),
(2094, 1, 234, 'Radiobutton', 'Частное лицо'),
(2095, 1, 234, 'Company', ''),
(2096, 1, 234, 'FullName', 'Maxim'),
(2097, 1, 234, 'Phone', '+380985070601'),
(2098, 1, 234, 'Email', 'greams0@gmail.com'),
(2099, 1, 234, 'City', 'Воронеж'),
(2100, 1, 234, 'Message', 'Добрый день,\nменя зовут Максим, я разработчик компании ТвояТерраса. Мы сейчас разрабатываем систему для автоматического добавления и или изменения товаров и выгрузкой в Яндекс.Маркет.\n\nУ меня возник вопрос. У Вас есть какая-то выгрузка товаров? XML или YML или CSV, подойдёт что угодно. Выгрузка из PDF - очень моторна и трудоемка.\n\nВы можете позвонить или написать в Telegram или Whatsapp по номеру который указан в форме.\nНадеюсь на Ваше понимание.\n\nС уважением, Максим.'),
(2101, 1, 234, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2102, 1, 234, 'formId', '1'),
(2103, 1, 235, 'Company', 'Блок'),
(2104, 1, 235, 'Site_comp', 'http://blokspb.ru'),
(2105, 1, 235, 'City', 'Санкт-Петербург'),
(2106, 1, 235, 'Address_comp', 'ул Коммуны 63'),
(2107, 1, 235, 'FullName', 'Александр'),
(2108, 1, 235, 'Position_comp', 'Менеджер по закупкам'),
(2109, 1, 235, 'Phone', '+79995345395'),
(2110, 1, 235, 'Email', 'romanov.alexander3003@gmail.com'),
(2111, 1, 235, 'Message', 'Мы хотим представлять Вашу продукцию в Санкт-Петербург, мы являемся лидерами розничного строительного рынка  () а так-же реализуем террасную доску.\nВ связи с ростом рынка древесно полимерного композита мы хотим расширять ассортимент, поэтому желаем сотрудничать с перспективными партнерами.\nНаправьте пожалуйста прайс с ассортиментом и дилерскими ценами, и условия сотрудничества.'),
(2112, 1, 235, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2113, 1, 235, 'formId', '1'),
(2114, 1, 236, 'Company', 'Студия Декора'),
(2115, 1, 236, 'Site_comp', 'www.studiadecora.ru'),
(2116, 1, 236, 'City', 'Краснодар'),
(2117, 1, 236, 'Address_comp', '1й Пригородный проезд, 45'),
(2118, 1, 236, 'FullName', 'Карина'),
(2119, 1, 236, 'Position_comp', 'Директор'),
(2120, 1, 236, 'Phone', '89880838828'),
(2121, 1, 236, 'Email', 'Akademiadp@mail.ru'),
(2122, 1, 236, 'Message', 'Добрый день!\nНас интересует вопрос дилерства.'),
(2123, 1, 236, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2124, 1, 236, 'formId', '1'),
(2125, 3, 237, 'FullName', 'Павел Владимирович Корнеев'),
(2126, 3, 237, 'Email', 'p.korneev@mail.ru'),
(2127, 3, 237, 'Category', 'CM Decking'),
(2128, 3, 237, 'Message', 'Посоветуйте партнера в Москве и области кто работает с Вашей продукцией . У кого есть нормальный сток. И вменяемые менеджеры. \nХочу отделать крыльцо. Ступени . Пол и стены. Обьем не большой. Делаю сам. Надо материал.'),
(2129, 3, 237, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2130, 3, 237, 'formId', '3'),
(2131, 3, 238, 'FullName', 'Максим'),
(2132, 3, 238, 'Email', 'fmak@mail.ru'),
(2133, 3, 238, 'Category', 'CM Decking'),
(2134, 3, 238, 'Message', 'Здравствуйте. Подскажите, где производят террасную доску из ДПК ?'),
(2135, 3, 238, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2136, 3, 238, 'formId', '3'),
(2137, 3, 239, 'FullName', 'Горбунова Ольга'),
(2138, 3, 239, 'Email', 'olgadecorator@yandex.ru'),
(2139, 3, 239, 'Category', 'CM Decking'),
(2140, 3, 239, 'Message', 'Здравствуйте! Хочу направить информацию для просчета стоимости летней веранды площадью 120м2 на крыше здания по адресу г.Москва Трубная площадь дом 2\n'),
(2141, 3, 239, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2142, 3, 239, 'formId', '3'),
(2143, 3, 240, 'FullName', 'Герман'),
(2144, 3, 240, 'Email', 'garant-stroy.itr@mail.ru'),
(2145, 3, 240, 'Category', 'CM Cladding'),
(2146, 3, 240, 'Message', 'Добрый день. Интересует Ваша продукция, но к сожалению не могу дозвониться до дилера в своем регионе, г. Пенза Ваш парк, подскажите есть ли еще дилеры в моем регионе'),
(2147, 3, 240, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2148, 3, 240, 'formId', '3'),
(2149, 3, 241, 'FullName', 'Евгений '),
(2150, 3, 241, 'Email', 'eandreenko47@gmail.com'),
(2151, 3, 241, 'Category', 'CM Decking'),
(2152, 3, 241, 'Message', 'Здравствуйте, где можно в СПБ приобрести подступенники дпк цвет эбен,или как их купить под заказ'),
(2153, 3, 241, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2154, 3, 241, 'formId', '3'),
(2155, 3, 242, 'FullName', 'Виктор'),
(2156, 3, 242, 'Email', 'vg@minimaldeck.ru'),
(2157, 3, 242, 'Category', 'CM Decking'),
(2158, 3, 242, 'Message', 'Добрый день! Где находится главный склад в Москве и где производится террасная доска ДПК?'),
(2159, 3, 242, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2160, 3, 242, 'formId', '3'),
(2161, 3, 243, 'FullName', 'Ирина'),
(2162, 3, 243, 'Email', 'bestiana@mail.ru'),
(2163, 3, 243, 'Category', 'CM Railing'),
(2164, 3, 243, 'Message', 'Добрый день, интересуют ограждения для террасы. Понравилась фотография номер 7 в вашем каталоге. На самой террасе лежит керамогранит.  Длина 4 метра 56,5 см, ширина 1 метр 38,5 см. Как правильно рассчитать ограждения с комплектующими? Есть ли в наличии?'),
(2165, 3, 243, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2166, 3, 243, 'formId', '3'),
(2167, 3, 244, 'FullName', 'Станислав'),
(2168, 3, 244, 'Email', 'sale@art-profil.ru'),
(2169, 3, 244, 'Category', 'CM Decking'),
(2170, 3, 244, 'Message', 'Добрый день !\n\nЕсть потребность в товаре: Угловой профиль\nРазмер:\n2000 х 50 х 38 x 8 мм (ясень ) в количестве 225 шт. \nВозможно ли выполнение такого заказа ?\n Срок ограничен (30 дней)'),
(2171, 3, 244, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2172, 3, 244, 'formId', '3'),
(2173, 3, 245, 'FullName', 'Александр'),
(2174, 3, 245, 'Email', 'romanov.alexander3003@gmail.com'),
(2175, 3, 245, 'Category', 'CM Decking'),
(2176, 3, 245, 'Message', 'Добрый день!\nМы хотим представлять Вашу продукцию в Санкт-Петербурге, мы лидера рынка газа-бетона. \nВ связи с ростом рынка древесно полимерного композита, мы хотим расширять ассортимент, поэтому желаем сотрудничать с перспективными партнерами.\nНаправьте пожалуйста прайс с дилерскими ценами на почту'),
(2177, 3, 245, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2178, 3, 245, 'formId', '3'),
(2179, 3, 246, 'FullName', 'Светлана'),
(2180, 3, 246, 'Email', 'designburo62@mail.ru'),
(2181, 3, 246, 'Category', 'CM Garden'),
(2182, 3, 246, 'Message', 'проект загородного дома. есть вопросы. как можно с вами связаться?'),
(2183, 3, 246, 'PersonalData', 'Я даю согласие на обработку персональных данных'),
(2184, 3, 246, 'formId', '3');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_rsform_translations`
--

CREATE TABLE `hud_rsform_translations` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `lang_code` varchar(32) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `reference_id` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hud_rsform_translations`
--

INSERT INTO `hud_rsform_translations` (`id`, `form_id`, `lang_code`, `reference`, `reference_id`, `value`) VALUES
(1, 1, 'ru-RU', 'forms', 'ErrorMessage', '<p class=\"formRed\"><span style=\"color: #3b8475;\">Пожалуйста, заполните все поля!</span></p>'),
(2, 1, 'ru-RU', 'forms', 'Thankyou', '<p>{FullName:value},</p>\n<p>Спасибо за Ваше сообщение!</p>\n<script type=\"text/javascript\">// <![CDATA[\nwindow.top.setTimeout(\'window.parent.SqueezeBox.close()\', 3500);\n// ]]></script>'),
(3, 1, 'ru-RU', 'forms', 'FormTitle', 'Стать дилером'),
(4, 1, 'ru-RU', 'forms', 'UserEmailFromName', '{global:sitename}'),
(5, 1, 'ru-RU', 'forms', 'UserEmailSubject', '{global:fromname}'),
(6, 1, 'ru-RU', 'forms', 'AdminEmailFromName', '{global:sitename}'),
(7, 1, 'ru-RU', 'forms', 'AdminEmailSubject', '{global:fromname}'),
(8, 1, 'ru-RU', 'forms', 'MetaDesc', 'Форма обратной связи cottagemode'),
(9, 1, 'ru-RU', 'forms', 'MetaKeywords', 'Форма, обратной связи, cottagemode'),
(10, 1, 'ru-RU', 'forms', 'UserEmailText', '<p>Спасибо за вашу заявку. Мы постараемся обработать ваше обращение в короткие сроки и связаться с вами.</p>'),
(11, 1, 'ru-RU', 'forms', 'AdminEmailText', '<h2>Форма обратной связи с сайта {global:siteurl}</h2>\n<dl>\n<dt>{Company:caption} :</dt>\n<dd>{Company:value}</dd>\n<dt>{Site_comp:caption}:</dt>\n<dd>{Site_comp:value}</dd>\n<dt>{City:caption}:</dt>\n<dd>{City:value}</dd>\n<dt>{Address_comp:caption}:</dt>\n<dd>{Address_comp:value}</dd>\n<dt>{FullName:caption}:</dt>\n<dd>{FullName:value}</dd>\n<dt>{Position_comp:caption}:</dt>\n<dd>{Position_comp:value}</dd>\n<dt>{Phone:caption}:</dt>\n<dd>{Phone:value}</dd>\n<dt>{Email:caption}:</dt>\n<dd>{Email:value}</dd>\n<dt>{Message:caption}:</dt>\n<dd>{Message:value}</dd>\n</dl>'),
(12, 1, 'ru-RU', 'forms', 'DeletionEmailFromName', ''),
(13, 1, 'ru-RU', 'forms', 'DeletionEmailSubject', ''),
(14, 1, 'ru-RU', 'properties', '1.CAPTION', 'Контактное лицо'),
(15, 1, 'ru-RU', 'properties', '1.DESCRIPTION', ''),
(16, 1, 'ru-RU', 'properties', '1.VALIDATIONMESSAGE', 'Пожалуйста, представьтесь'),
(17, 1, 'ru-RU', 'properties', '1.DEFAULTVALUE', ''),
(18, 1, 'ru-RU', 'properties', '1.PLACEHOLDER', 'Пожалуйста, введите Имя'),
(19, 1, 'ru-RU', 'properties', '2.CAPTION', 'Ваш E-mail'),
(20, 1, 'ru-RU', 'properties', '2.DESCRIPTION', ''),
(21, 1, 'ru-RU', 'properties', '2.VALIDATIONMESSAGE', 'Введите свой e-mail адрес'),
(22, 1, 'ru-RU', 'properties', '2.DEFAULTVALUE', ''),
(23, 1, 'ru-RU', 'properties', '2.PLACEHOLDER', 'Пожалуйста, введите свой e-mail'),
(24, 1, 'ru-RU', 'properties', '3.LABEL', 'Отправить'),
(25, 1, 'ru-RU', 'properties', '3.RESETLABEL', ''),
(26, 1, 'ru-RU', 'properties', '3.PREVBUTTON', ''),
(27, 1, 'ru-RU', 'properties', '3.CAPTION', ''),
(28, 1, 'ru-RU', 'properties', '3.DISPLAYPROGRESSMSG', ''),
(29, 1, 'ru-RU', 'properties', '4.CAPTION', 'Ваш телефон'),
(30, 1, 'ru-RU', 'properties', '4.DESCRIPTION', ''),
(31, 1, 'ru-RU', 'properties', '4.VALIDATIONMESSAGE', 'Введите номер телефона'),
(32, 1, 'ru-RU', 'properties', '4.DEFAULTVALUE', ''),
(33, 1, 'ru-RU', 'properties', '4.PLACEHOLDER', 'Пожалуйста, введите свой номер телефона'),
(34, 1, 'ru-RU', 'properties', '5.CAPTION', 'Ваш город'),
(35, 1, 'ru-RU', 'properties', '5.DESCRIPTION', ''),
(36, 1, 'ru-RU', 'properties', '5.VALIDATIONMESSAGE', 'Укажите город'),
(37, 1, 'ru-RU', 'properties', '5.DEFAULTVALUE', ''),
(38, 1, 'ru-RU', 'properties', '5.PLACEHOLDER', 'Пожалуйста, введите Ваш город'),
(39, 1, 'ru-RU', 'properties', '6.CAPTION', 'Ваше сообщение'),
(40, 1, 'ru-RU', 'properties', '6.DESCRIPTION', ''),
(41, 1, 'ru-RU', 'properties', '6.VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(42, 1, 'ru-RU', 'properties', '6.DEFAULTVALUE', ''),
(43, 1, 'ru-RU', 'properties', '6.PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(44, 1, 'ru-RU', 'properties', '7.CAPTION', ''),
(45, 1, 'ru-RU', 'properties', '7.DESCRIPTION', ''),
(46, 1, 'ru-RU', 'properties', '7.VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(47, 1, 'ru-RU', 'properties', '7.ITEMS', 'Я даю согласие на обработку персональных данных'),
(48, 1, 'ru-RU', 'properties', '8.CAPTION', ''),
(49, 1, 'ru-RU', 'properties', '8.DESCRIPTION', ''),
(50, 1, 'ru-RU', 'properties', '8.VALIDATIONMESSAGE', 'Неверный ввод'),
(51, 1, 'ru-RU', 'properties', '8.REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(52, 1, 'ru-RU', 'properties', '9.CAPTION', ''),
(53, 1, 'ru-RU', 'properties', '9.DESCRIPTION', ''),
(54, 1, 'ru-RU', 'properties', '9.VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(55, 1, 'ru-RU', 'properties', '9.ITEMS', 'Частное лицо[c]\nКомпания'),
(56, 1, 'ru-RU', 'properties', '10.CAPTION', 'Компания'),
(57, 1, 'ru-RU', 'properties', '10.DESCRIPTION', ''),
(58, 1, 'ru-RU', 'properties', '10.VALIDATIONMESSAGE', 'Неверный ввод'),
(59, 1, 'ru-RU', 'properties', '10.DEFAULTVALUE', ''),
(60, 1, 'ru-RU', 'properties', '10.PLACEHOLDER', 'Пожалуйста, введите название компании'),
(61, 1, 'ru-RU', 'properties', '11.CAPTION', ''),
(62, 1, 'ru-RU', 'properties', '11.DESCRIPTION', ''),
(63, 1, 'ru-RU', 'properties', '11.VALIDATIONMESSAGE', 'Неверный ввод reCAPTCHA'),
(64, 1, 'ru-RU', 'properties', '12.CAPTION', 'Сайт компании'),
(65, 1, 'ru-RU', 'properties', '12.DESCRIPTION', ''),
(66, 1, 'ru-RU', 'properties', '12.VALIDATIONMESSAGE', 'Неверный ввод'),
(67, 1, 'ru-RU', 'properties', '12.DEFAULTVALUE', ''),
(68, 1, 'ru-RU', 'properties', '12.PLACEHOLDER', 'Пожалуйста, введите сайт компании'),
(69, 1, 'ru-RU', 'properties', '13.CAPTION', 'Адрес Компании'),
(70, 1, 'ru-RU', 'properties', '13.DESCRIPTION', ''),
(71, 1, 'ru-RU', 'properties', '13.VALIDATIONMESSAGE', 'Неверный ввод'),
(72, 1, 'ru-RU', 'properties', '13.DEFAULTVALUE', ''),
(73, 1, 'ru-RU', 'properties', '13.PLACEHOLDER', 'Пожалуйста, введите Ваш адрес компании'),
(74, 1, 'ru-RU', 'properties', '14.CAPTION', 'Должность'),
(75, 1, 'ru-RU', 'properties', '14.DESCRIPTION', ''),
(76, 1, 'ru-RU', 'properties', '14.VALIDATIONMESSAGE', 'Вводите только буквы'),
(77, 1, 'ru-RU', 'properties', '14.DEFAULTVALUE', ''),
(78, 1, 'ru-RU', 'properties', '14.PLACEHOLDER', 'Пожалуйста, введите Вашу должность'),
(79, 1, 'ru-RU', 'properties', '15.TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>'),
(80, 1, 'ru-RU', 'properties', '16.CAPTION', ''),
(81, 1, 'ru-RU', 'properties', '16.DESCRIPTION', ''),
(82, 1, 'ru-RU', 'properties', '16.VALIDATIONMESSAGE', ''),
(83, 2, 'ru-RU', 'forms', 'ErrorMessage', '<p class=\"formRed\"><span style=\"color: #3b8475;\">Пожалуйста, заполните все поля!</span></p>'),
(84, 2, 'ru-RU', 'forms', 'Thankyou', '<p>{FullName:value},</p>\n<p>Спасибо за Ваше сообщение!</p>\n<script type=\"text/javascript\">window.top.setTimeout(\'window.parent.SqueezeBox.close()\', 3500);</script>'),
(85, 2, 'ru-RU', 'forms', 'FormTitle', 'Заказать образец'),
(86, 2, 'ru-RU', 'forms', 'UserEmailFromName', '{global:sitename}'),
(87, 2, 'ru-RU', 'forms', 'UserEmailSubject', '{global:fromname}'),
(88, 2, 'ru-RU', 'forms', 'AdminEmailFromName', '{global:sitename}'),
(89, 2, 'ru-RU', 'forms', 'AdminEmailSubject', '{global:fromname}'),
(90, 2, 'ru-RU', 'forms', 'MetaDesc', 'Форма заказа образца'),
(91, 2, 'ru-RU', 'forms', 'MetaKeywords', 'Форма, заказа, образца'),
(92, 2, 'ru-RU', 'forms', 'UserEmailText', '<p>Спасибо за то, что связались с нами. Мы ответим Вам как можно быстрее.</p>'),
(93, 2, 'ru-RU', 'forms', 'AdminEmailText', '<h2>Форма заказа образца CM BORD {global:siteurl}</h2>\n<ul>\n<li>Выбрано - {Radiobutton:value}</li>\n<li>{Company:caption}: {Company:value}</li>\n<li><strong>{FullName:caption}:</strong> {FullName:value}</li>\n<li><strong>{Phone:caption}:</strong> {Phone:value}</li>\n<li><strong>{Email:caption}:</strong> {Email:value}</li>\n<li><strong>{City:caption}:</strong> {City:value}</li>\n<li><strong>{Message:caption}:</strong> {Message:value}</li>\n</ul>'),
(94, 2, 'ru-RU', 'forms', 'DeletionEmailFromName', ''),
(95, 2, 'ru-RU', 'forms', 'DeletionEmailSubject', ''),
(96, 2, 'ru-RU', 'properties', '17.CAPTION', ''),
(97, 2, 'ru-RU', 'properties', '17.DESCRIPTION', ''),
(98, 2, 'ru-RU', 'properties', '17.VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(99, 2, 'ru-RU', 'properties', '17.ITEMS', 'Частное лицо[c]\nКомпания'),
(100, 2, 'ru-RU', 'properties', '18.CAPTION', 'Компания'),
(101, 2, 'ru-RU', 'properties', '18.DESCRIPTION', ''),
(102, 2, 'ru-RU', 'properties', '18.VALIDATIONMESSAGE', 'Неверный ввод'),
(103, 2, 'ru-RU', 'properties', '18.DEFAULTVALUE', ''),
(104, 2, 'ru-RU', 'properties', '18.PLACEHOLDER', 'Пожалуйста, введите название компании'),
(105, 2, 'ru-RU', 'properties', '19.CAPTION', 'Ваше имя'),
(106, 2, 'ru-RU', 'properties', '19.DESCRIPTION', ''),
(107, 2, 'ru-RU', 'properties', '19.VALIDATIONMESSAGE', 'Пожалуйста, представьтесь'),
(108, 2, 'ru-RU', 'properties', '19.DEFAULTVALUE', ''),
(109, 2, 'ru-RU', 'properties', '19.PLACEHOLDER', ''),
(110, 2, 'ru-RU', 'properties', '20.CAPTION', 'Ваш телефон'),
(111, 2, 'ru-RU', 'properties', '20.DESCRIPTION', ''),
(112, 2, 'ru-RU', 'properties', '20.VALIDATIONMESSAGE', 'Введите номер телефона'),
(113, 2, 'ru-RU', 'properties', '20.DEFAULTVALUE', ''),
(114, 2, 'ru-RU', 'properties', '20.PLACEHOLDER', 'Пожалуйста, введите свой номер телефона'),
(115, 2, 'ru-RU', 'properties', '21.CAPTION', 'Ваш E-mail'),
(116, 2, 'ru-RU', 'properties', '21.DESCRIPTION', ''),
(117, 2, 'ru-RU', 'properties', '21.VALIDATIONMESSAGE', 'Введите свой e-mail адрес'),
(118, 2, 'ru-RU', 'properties', '21.DEFAULTVALUE', ''),
(119, 2, 'ru-RU', 'properties', '21.PLACEHOLDER', ''),
(120, 2, 'ru-RU', 'properties', '22.CAPTION', 'Ваш город'),
(121, 2, 'ru-RU', 'properties', '22.DESCRIPTION', ''),
(122, 2, 'ru-RU', 'properties', '22.VALIDATIONMESSAGE', 'Укажите город'),
(123, 2, 'ru-RU', 'properties', '22.DEFAULTVALUE', ''),
(124, 2, 'ru-RU', 'properties', '22.PLACEHOLDER', 'Пожалуйста, введите Ваш город'),
(125, 2, 'ru-RU', 'properties', '23.CAPTION', 'Ваше сообщение'),
(126, 2, 'ru-RU', 'properties', '23.DESCRIPTION', ''),
(127, 2, 'ru-RU', 'properties', '23.VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(128, 2, 'ru-RU', 'properties', '23.DEFAULTVALUE', ''),
(129, 2, 'ru-RU', 'properties', '23.PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(130, 2, 'ru-RU', 'properties', '24.CAPTION', ''),
(131, 2, 'ru-RU', 'properties', '24.DESCRIPTION', ''),
(132, 2, 'ru-RU', 'properties', '24.VALIDATIONMESSAGE', 'Неверный ввод'),
(133, 2, 'ru-RU', 'properties', '24.REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(134, 2, 'ru-RU', 'properties', '25.CAPTION', ''),
(135, 2, 'ru-RU', 'properties', '25.DESCRIPTION', ''),
(136, 2, 'ru-RU', 'properties', '25.VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(137, 2, 'ru-RU', 'properties', '25.ITEMS', 'Я даю согласие на обработку персональных данных'),
(138, 2, 'ru-RU', 'properties', '26.LABEL', 'Отправить'),
(139, 2, 'ru-RU', 'properties', '26.RESETLABEL', ''),
(140, 2, 'ru-RU', 'properties', '26.PREVBUTTON', ''),
(141, 2, 'ru-RU', 'properties', '26.CAPTION', ''),
(142, 2, 'ru-RU', 'properties', '26.DISPLAYPROGRESSMSG', ''),
(143, 2, 'ru-RU', 'properties', '27.CAPTION', ''),
(144, 2, 'ru-RU', 'properties', '27.DESCRIPTION', ''),
(145, 2, 'ru-RU', 'properties', '27.VALIDATIONMESSAGE', 'Неверный ввод капчи'),
(146, 2, 'ru-RU', 'properties', '28.TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>'),
(147, 3, 'ru-RU', 'forms', 'ErrorMessage', '<p class=\"formRed\"><span style=\"color: #3b8475;\">Пожалуйста, заполните все поля!</span></p>'),
(148, 3, 'ru-RU', 'forms', 'Thankyou', '<p>{FullName:value},</p>\n<p>Спасибо за Ваше сообщение!</p>\n<script type=\"text/javascript\">window.top.setTimeout(\'window.parent.SqueezeBox.close()\', 3500);</script>'),
(149, 3, 'ru-RU', 'forms', 'FormTitle', 'Задать вопрос'),
(150, 3, 'ru-RU', 'forms', 'UserEmailFromName', '{global:sitename}'),
(151, 3, 'ru-RU', 'forms', 'UserEmailSubject', '{global:fromname}'),
(152, 3, 'ru-RU', 'forms', 'AdminEmailFromName', '{global:sitename}'),
(153, 3, 'ru-RU', 'forms', 'AdminEmailSubject', '{global:fromname}'),
(154, 3, 'ru-RU', 'forms', 'MetaDesc', 'Форма обратной связи cottagemode'),
(155, 3, 'ru-RU', 'forms', 'MetaKeywords', 'Форма, обратной связи, cottagemode'),
(156, 3, 'ru-RU', 'forms', 'UserEmailText', '<p>Спасибо {FullName:value} за то, что связались с нами. Мы ответим Вам как можно быстрее.</p>\n<p></p>'),
(157, 3, 'ru-RU', 'forms', 'AdminEmailText', '<h2>Форма \"Задать Вопрос\" с сайта {global:siteurl}</h2>\n<ul>\n<li><strong>{FullName:caption}:</strong> {FullName:value}</li>\n<li><strong>{Email:caption}:</strong> {Email:value}</li>\n<li><strong>{Category:caption}:</strong> {Category:value}</li>\n<li><strong>{Message:caption}:</strong> {Message:value}</li>\n</ul>'),
(158, 3, 'ru-RU', 'forms', 'DeletionEmailFromName', ''),
(159, 3, 'ru-RU', 'forms', 'DeletionEmailSubject', ''),
(160, 3, 'ru-RU', 'properties', '29.CAPTION', ''),
(161, 3, 'ru-RU', 'properties', '29.DESCRIPTION', ''),
(162, 3, 'ru-RU', 'properties', '29.VALIDATIONMESSAGE', 'Выберите один из вариантов'),
(163, 3, 'ru-RU', 'properties', '29.ITEMS', 'Частное лицо[c]\nКомпания'),
(164, 3, 'ru-RU', 'properties', '30.CAPTION', 'Компания'),
(165, 3, 'ru-RU', 'properties', '30.DESCRIPTION', ''),
(166, 3, 'ru-RU', 'properties', '30.VALIDATIONMESSAGE', 'Неверный ввод'),
(167, 3, 'ru-RU', 'properties', '30.DEFAULTVALUE', ''),
(168, 3, 'ru-RU', 'properties', '30.PLACEHOLDER', 'Пожалуйста, введите название компании'),
(169, 3, 'ru-RU', 'properties', '31.CAPTION', 'Ваше имя'),
(170, 3, 'ru-RU', 'properties', '31.DESCRIPTION', ''),
(171, 3, 'ru-RU', 'properties', '31.VALIDATIONMESSAGE', 'Пожалуйста, представьтесь'),
(172, 3, 'ru-RU', 'properties', '31.DEFAULTVALUE', ''),
(173, 3, 'ru-RU', 'properties', '31.PLACEHOLDER', ''),
(174, 3, 'ru-RU', 'properties', '32.CAPTION', 'Ваш E-mail'),
(175, 3, 'ru-RU', 'properties', '32.DESCRIPTION', ''),
(176, 3, 'ru-RU', 'properties', '32.VALIDATIONMESSAGE', 'Введите свой e-mail адрес'),
(177, 3, 'ru-RU', 'properties', '32.DEFAULTVALUE', ''),
(178, 3, 'ru-RU', 'properties', '32.PLACEHOLDER', ''),
(179, 3, 'ru-RU', 'properties', '33.CAPTION', 'Ваше сообщение'),
(180, 3, 'ru-RU', 'properties', '33.DESCRIPTION', ''),
(181, 3, 'ru-RU', 'properties', '33.VALIDATIONMESSAGE', 'Введите сообщение без спецсимволов'),
(182, 3, 'ru-RU', 'properties', '33.DEFAULTVALUE', ''),
(183, 3, 'ru-RU', 'properties', '33.PLACEHOLDER', 'Пожалуйста, введите сообщение'),
(184, 3, 'ru-RU', 'properties', '34.CAPTION', ''),
(185, 3, 'ru-RU', 'properties', '34.DESCRIPTION', ''),
(186, 3, 'ru-RU', 'properties', '34.VALIDATIONMESSAGE', 'Неверный ввод'),
(187, 3, 'ru-RU', 'properties', '34.REFRESHTEXT', '<i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>'),
(188, 3, 'ru-RU', 'properties', '35.CAPTION', ''),
(189, 3, 'ru-RU', 'properties', '35.DESCRIPTION', ''),
(190, 3, 'ru-RU', 'properties', '35.VALIDATIONMESSAGE', 'Вам нужно согласиться на обработку персональных данных'),
(191, 3, 'ru-RU', 'properties', '35.ITEMS', 'Я даю согласие на обработку персональных данных'),
(192, 3, 'ru-RU', 'properties', '36.CAPTION', ''),
(193, 3, 'ru-RU', 'properties', '36.DESCRIPTION', ''),
(194, 3, 'ru-RU', 'properties', '36.VALIDATIONMESSAGE', 'Неверный ввод'),
(195, 3, 'ru-RU', 'properties', '37.LABEL', 'Отправить'),
(196, 3, 'ru-RU', 'properties', '37.RESETLABEL', ''),
(197, 3, 'ru-RU', 'properties', '37.PREVBUTTON', ''),
(198, 3, 'ru-RU', 'properties', '37.CAPTION', ''),
(199, 3, 'ru-RU', 'properties', '37.DISPLAYPROGRESSMSG', ''),
(200, 3, 'ru-RU', 'properties', '38.TEXT', 'Оставьте свой вопрос по нашей продукции и мы свяжемся с вами.'),
(201, 3, 'ru-RU', 'properties', '39.CAPTION', 'Категория товара'),
(202, 3, 'ru-RU', 'properties', '39.DESCRIPTION', ''),
(203, 3, 'ru-RU', 'properties', '39.VALIDATIONMESSAGE', 'Нужно выбрать категорию'),
(204, 3, 'ru-RU', 'properties', '39.ITEMS', 'Категория не выбрана[c][d]\nCM Decking\nCM Bord\nCM Garden\nCM Cladding\nCM Railing\nCM Fencing\nCM Vattern\nCM Wood Natur\nCM Wood Thermo'),
(205, 3, 'ru-RU', 'properties', '40.TEXT', '<a href=\"/agreement\">Политика в отношении обработки персональных данных</a>');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_schemas`
--

CREATE TABLE `hud_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_schemas`
--

INSERT INTO `hud_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.9.10-2019-07-09'),
(10014, '4.2.0');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_session`
--

CREATE TABLE `hud_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(3) UNSIGNED DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_session`
--

INSERT INTO `hud_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(0x323137696c6674387676733362613363627674377237686c7375756c696c6e67, 0, 1, 1567069132, NULL, 0, ''),
(0x6e66626e6264313876703039616c396a346f69726f676d703972646868726f74, 1, 1, 1567081626, NULL, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_tags`
--

CREATE TABLE `hud_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_tags`
--

INSERT INTO `hud_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 421, '2019-07-03 12:10:16', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_template_styles`
--

CREATE TABLE `hud_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_template_styles`
--

INSERT INTO `hud_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(8, 'isis', 1, '1', 'isis - Default', '{\"templateColor\":\"\",\"logoFile\":\"\"}'),
(11, 'cottagemode', 0, '1', 'CottageMode', '{}');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_ucm_base`
--

CREATE TABLE `hud_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_ucm_content`
--

CREATE TABLE `hud_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Структура таблицы `hud_ucm_history`
--

CREATE TABLE `hud_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_updates`
--

CREATE TABLE `hud_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Дамп данных таблицы `hud_updates`
--

INSERT INTO `hud_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 2, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/hy-AM_details.xml', '', ''),
(2, 2, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.4.1.2', '', 'https://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(3, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.9.7.1', '', 'https://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(4, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(5, 2, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.8.0.1', '', 'https://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(6, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(7, 2, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/gl-ES_details.xml', '', ''),
(8, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/ka-GE_details.xml', '', ''),
(9, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.9.7.1', '', 'https://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(10, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(11, 2, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.2', '', 'https://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(12, 2, 0, 'Bengali', '', 'pkg_bn-BD', 'package', '', 0, '3.8.10.1', '', 'https://update.joomla.org/language/details3/bn-BD_details.xml', '', ''),
(13, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.9.5.1', '', 'https://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(14, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(15, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.9.5.1', '', 'https://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(16, 2, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.2', '', 'https://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(17, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.6.5.2', '', 'https://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(18, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.8.11.1', '', 'https://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(19, 2, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(20, 2, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.8.5.1', '', 'https://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(21, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(22, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.9.7.1', '', 'https://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(23, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(24, 2, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '3.8.11.1', '', 'https://update.joomla.org/language/details3/eo-XX_details.xml', '', ''),
(25, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.8.10.1', '', 'https://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(26, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(27, 2, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/km-KH_details.xml', '', ''),
(28, 2, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.8.9.1', '', 'https://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(29, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.7.3.1', '', 'https://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(30, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/lt-LT_details.xml', '', ''),
(31, 2, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.6.5.1', '', 'https://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(32, 2, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.8.11.1', '', 'https://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(33, 2, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.2.1', '', 'https://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(34, 2, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(35, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(36, 2, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.9.5.1', '', 'https://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(38, 2, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(39, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(40, 2, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(41, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(42, 2, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(43, 2, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(44, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(45, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.9.4.1', '', 'https://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(46, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.7.1.1', '', 'https://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(47, 2, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.7.5.1', '', 'https://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(48, 2, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.2', '', 'https://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(49, 2, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '3.7.5.1', '', 'https://update.joomla.org/language/details3/eu-ES_details.xml', '', ''),
(50, 2, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.2', '', 'https://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(51, 2, 0, 'German DE', '', 'pkg_de-DE', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(52, 2, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(53, 2, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(54, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.9.5.1', '', 'https://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(55, 2, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(56, 2, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(57, 2, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.2', '', 'https://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(58, 2, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(59, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(60, 2, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(61, 2, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(62, 2, 0, 'English CA', '', 'pkg_en-CA', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(63, 2, 0, 'French CA', '', 'pkg_fr-CA', 'package', '', 0, '3.6.5.1', '', 'https://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(64, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(65, 2, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(66, 2, 0, 'Dari Persian', '', 'pkg_prs-AF', 'package', '', 0, '3.4.4.2', '', 'https://update.joomla.org/language/details3/prs-AF_details.xml', '', ''),
(67, 2, 0, 'Turkmen', '', 'pkg_tk-TM', 'package', '', 0, '3.5.0.2', '', 'https://update.joomla.org/language/details3/tk-TM_details.xml', '', ''),
(68, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '3.8.13.1', '', 'https://update.joomla.org/language/details3/ga-IE_details.xml', '', ''),
(69, 2, 0, 'Dzongkha', '', 'pkg_dz-BT', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/dz-BT_details.xml', '', ''),
(70, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', ''),
(71, 2, 0, 'Spanish CO', '', 'pkg_es-CO', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/es-CO_details.xml', '', ''),
(72, 2, 0, 'German CH', '', 'pkg_de-CH', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/de-CH_details.xml', '', ''),
(73, 2, 0, 'German AT', '', 'pkg_de-AT', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/de-AT_details.xml', '', ''),
(74, 2, 0, 'German LI', '', 'pkg_de-LI', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/de-LI_details.xml', '', ''),
(75, 2, 0, 'German LU', '', 'pkg_de-LU', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/de-LU_details.xml', '', ''),
(76, 2, 0, 'English NZ', '', 'pkg_en-NZ', 'package', '', 0, '3.9.6.1', '', 'https://update.joomla.org/language/details3/en-NZ_details.xml', '', ''),
(77, 2, 0, 'Kazakh', '', 'pkg_kk-KZ', 'package', '', 0, '3.9.8.1', '', 'https://update.joomla.org/language/details3/kk-KZ_details.xml', '', ''),
(83, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(84, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(85, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/ka-GE_details.xml', '', ''),
(86, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(87, 2, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.9.9.1', '', 'https://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(88, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(89, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(90, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(91, 2, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(92, 2, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(93, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(94, 2, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(95, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(96, 2, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(97, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(98, 2, 0, 'German DE', '', 'pkg_de-DE', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(99, 2, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(100, 2, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(101, 2, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(102, 2, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(103, 2, 0, 'English CA', '', 'pkg_en-CA', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(104, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(105, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', ''),
(106, 2, 0, 'Spanish CO', '', 'pkg_es-CO', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/es-CO_details.xml', '', ''),
(107, 2, 0, 'German CH', '', 'pkg_de-CH', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/de-CH_details.xml', '', ''),
(108, 2, 0, 'German AT', '', 'pkg_de-AT', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/de-AT_details.xml', '', ''),
(109, 2, 0, 'German LI', '', 'pkg_de-LI', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/de-LI_details.xml', '', ''),
(110, 2, 0, 'German LU', '', 'pkg_de-LU', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/de-LU_details.xml', '', ''),
(111, 2, 0, 'English NZ', '', 'pkg_en-NZ', 'package', '', 0, '3.9.10.1', '', 'https://update.joomla.org/language/details3/en-NZ_details.xml', '', ''),
(112, 4, 10006, 'RSForm! Pro 2.2.4', '', 'com_rsform', 'component', '', 1, '2.2.4', '', 'https://www.rsjoomla.com/updates/com_rsform/Component/com_rsform.xml', 'https://www.rsjoomla.com/support/documentation/rsform-pro/changelog/rsform-pro-changelog.html', ''),
(113, 5, 10010, 'Google No Captcha ReCAPTCHA 1.52.3', '', 'rsfprecaptchav2', 'plugin', 'system', 0, '1.52.3', '', 'https://www.rsjoomla.com/updates/com_rsform/Plugins/plg_recaptchav2.xml', 'https://www.rsjoomla.com/blog', ''),
(114, 6, 10011, 'RSForm! Pro Module for Joomla! 3.x', '', 'mod_rsform', 'module', '', 0, '2.0.0', '', 'https://www.rsjoomla.com/updates/com_rsform/Modules/mod_rsform.xml', 'https://www.rsjoomla.com/blog', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_update_sites`
--

CREATE TABLE `hud_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Дамп данных таблицы `hud_update_sites`
--

INSERT INTO `hud_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1566999889, ''),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 1563780782, ''),
(3, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1566999979, ''),
(4, 'RSForm! Pro', 'extension', 'https://www.rsjoomla.com/updates/com_rsform/Component/com_rsform.xml', 1, 1563780782, ''),
(5, 'RSForm! Pro - reCAPTCHA v2 Plugin', 'extension', 'https://www.rsjoomla.com/updates/com_rsform/Plugins/plg_recaptchav2.xml', 1, 1563780783, ''),
(6, 'RSForm! Pro - Module', 'extension', 'https://www.rsjoomla.com/updates/com_rsform/Modules/mod_rsform.xml', 1, 1563780784, ''),
(7, 'RSForm! Pro - Content Plugin', 'extension', 'https://www.rsjoomla.com/updates/com_rsform/Plugins/plg_content.xml', 1, 1563780784, ''),
(8, 'Joomlashack Framework', 'extension', 'https://deploy.ostraining.com/client/update/free/stable/lib_allediaframework', 1, 1563780785, ''),
(9, 'Joomlashack System Plugin', 'extension', 'https://deploy.ostraining.com/client/update/free/stable/plg_system_ossystem', 1, 1563780786, ''),
(10, 'OSMap', 'extension', 'https://deploy.ostraining.com/client/update/free/stable/com_osmap', 1, 1563780786, ''),
(11, 'FL Yandex Turbo Plugin', 'extension', 'https://fictionlabs.ru/update?extension=plg_ajax_flyandexturbo', 1, 1563780786, '');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_update_sites_extensions`
--

CREATE TABLE `hud_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Дамп данных таблицы `hud_update_sites_extensions`
--

INSERT INTO `hud_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 802),
(2, 10002),
(3, 28),
(4, 10006),
(5, 10010),
(6, 10011),
(7, 10013),
(8, 10015),
(9, 10016),
(10, 10014),
(11, 10018);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_usergroups`
--

CREATE TABLE `hud_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_usergroups`
--

INSERT INTO `hud_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Структура таблицы `hud_users`
--

CREATE TABLE `hud_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_users`
--

INSERT INTO `hud_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(421, 'Webmaster', 'civil', 'oleg.orlov@utsrus.com', '$2y$10$NK8ZX383N66BKfI6emnnrO8RdpELuUq9kxfTIsw3hF544fr3ofJ3O', 0, 1, '2019-07-03 12:10:16', '2019-08-29 12:27:05', '0', '{\"admin_style\":\"\",\"admin_language\":\"ru-RU\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_user_keys`
--

CREATE TABLE `hud_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_user_notes`
--

CREATE TABLE `hud_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hud_user_profiles`
--

CREATE TABLE `hud_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Структура таблицы `hud_user_usergroup_map`
--

CREATE TABLE `hud_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_user_usergroup_map`
--

INSERT INTO `hud_user_usergroup_map` (`user_id`, `group_id`) VALUES
(421, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_utf8_conversion`
--

CREATE TABLE `hud_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_utf8_conversion`
--

INSERT INTO `hud_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- Структура таблицы `hud_viewlevels`
--

CREATE TABLE `hud_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hud_viewlevels`
--

INSERT INTO `hud_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hud_action_logs`
--
ALTER TABLE `hud_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  ADD KEY `idx_user_id_extension` (`user_id`,`extension`),
  ADD KEY `idx_extension_item_id` (`extension`,`item_id`);

--
-- Индексы таблицы `hud_action_logs_extensions`
--
ALTER TABLE `hud_action_logs_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_action_logs_users`
--
ALTER TABLE `hud_action_logs_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_notify` (`notify`);

--
-- Индексы таблицы `hud_action_log_config`
--
ALTER TABLE `hud_action_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_assets`
--
ALTER TABLE `hud_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Индексы таблицы `hud_associations`
--
ALTER TABLE `hud_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Индексы таблицы `hud_banners`
--
ALTER TABLE `hud_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_banner_clients`
--
ALTER TABLE `hud_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Индексы таблицы `hud_banner_tracks`
--
ALTER TABLE `hud_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Индексы таблицы `hud_categories`
--
ALTER TABLE `hud_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_contact_details`
--
ALTER TABLE `hud_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Индексы таблицы `hud_content`
--
ALTER TABLE `hud_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Индексы таблицы `hud_contentitem_tag_map`
--
ALTER TABLE `hud_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Индексы таблицы `hud_content_frontpage`
--
ALTER TABLE `hud_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Индексы таблицы `hud_content_rating`
--
ALTER TABLE `hud_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Индексы таблицы `hud_content_types`
--
ALTER TABLE `hud_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Индексы таблицы `hud_extensions`
--
ALTER TABLE `hud_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Индексы таблицы `hud_fields`
--
ALTER TABLE `hud_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_fields_categories`
--
ALTER TABLE `hud_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Индексы таблицы `hud_fields_groups`
--
ALTER TABLE `hud_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_fields_values`
--
ALTER TABLE `hud_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Индексы таблицы `hud_finder_filters`
--
ALTER TABLE `hud_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `hud_finder_links`
--
ALTER TABLE `hud_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Индексы таблицы `hud_finder_links_terms0`
--
ALTER TABLE `hud_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms1`
--
ALTER TABLE `hud_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms2`
--
ALTER TABLE `hud_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms3`
--
ALTER TABLE `hud_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms4`
--
ALTER TABLE `hud_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms5`
--
ALTER TABLE `hud_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms6`
--
ALTER TABLE `hud_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms7`
--
ALTER TABLE `hud_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms8`
--
ALTER TABLE `hud_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_terms9`
--
ALTER TABLE `hud_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termsa`
--
ALTER TABLE `hud_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termsb`
--
ALTER TABLE `hud_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termsc`
--
ALTER TABLE `hud_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termsd`
--
ALTER TABLE `hud_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termse`
--
ALTER TABLE `hud_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_links_termsf`
--
ALTER TABLE `hud_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Индексы таблицы `hud_finder_taxonomy`
--
ALTER TABLE `hud_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Индексы таблицы `hud_finder_taxonomy_map`
--
ALTER TABLE `hud_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Индексы таблицы `hud_finder_terms`
--
ALTER TABLE `hud_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Индексы таблицы `hud_finder_terms_common`
--
ALTER TABLE `hud_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Индексы таблицы `hud_finder_tokens`
--
ALTER TABLE `hud_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Индексы таблицы `hud_finder_tokens_aggregate`
--
ALTER TABLE `hud_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Индексы таблицы `hud_finder_types`
--
ALTER TABLE `hud_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `hud_languages`
--
ALTER TABLE `hud_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Индексы таблицы `hud_menu`
--
ALTER TABLE `hud_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_menu_types`
--
ALTER TABLE `hud_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Индексы таблицы `hud_messages`
--
ALTER TABLE `hud_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Индексы таблицы `hud_messages_cfg`
--
ALTER TABLE `hud_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Индексы таблицы `hud_modules`
--
ALTER TABLE `hud_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_modules_menu`
--
ALTER TABLE `hud_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Индексы таблицы `hud_newsfeeds`
--
ALTER TABLE `hud_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Индексы таблицы `hud_osmap_items_settings`
--
ALTER TABLE `hud_osmap_items_settings`
  ADD PRIMARY KEY (`sitemap_id`,`uid`,`settings_hash`);

--
-- Индексы таблицы `hud_osmap_sitemaps`
--
ALTER TABLE `hud_osmap_sitemaps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `default_idx` (`is_default`,`id`);

--
-- Индексы таблицы `hud_osmap_sitemap_menus`
--
ALTER TABLE `hud_osmap_sitemap_menus`
  ADD PRIMARY KEY (`sitemap_id`,`menutype_id`),
  ADD KEY `fk_sitemaps_idx` (`sitemap_id`),
  ADD KEY `ordering_idx` (`sitemap_id`,`ordering`);

--
-- Индексы таблицы `hud_overrider`
--
ALTER TABLE `hud_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_postinstall_messages`
--
ALTER TABLE `hud_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Индексы таблицы `hud_privacy_consents`
--
ALTER TABLE `hud_privacy_consents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Индексы таблицы `hud_privacy_requests`
--
ALTER TABLE `hud_privacy_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_redirect_links`
--
ALTER TABLE `hud_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Индексы таблицы `hud_rsform_calculations`
--
ALTER TABLE `hud_rsform_calculations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_rsform_components`
--
ALTER TABLE `hud_rsform_components`
  ADD UNIQUE KEY `ComponentId` (`ComponentId`),
  ADD KEY `ComponentTypeId` (`ComponentTypeId`),
  ADD KEY `FormId` (`FormId`);

--
-- Индексы таблицы `hud_rsform_component_types`
--
ALTER TABLE `hud_rsform_component_types`
  ADD PRIMARY KEY (`ComponentTypeId`);

--
-- Индексы таблицы `hud_rsform_component_type_fields`
--
ALTER TABLE `hud_rsform_component_type_fields`
  ADD KEY `ComponentTypeId` (`ComponentTypeId`);

--
-- Индексы таблицы `hud_rsform_conditions`
--
ALTER TABLE `hud_rsform_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Индексы таблицы `hud_rsform_condition_details`
--
ALTER TABLE `hud_rsform_condition_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `condition_id` (`condition_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Индексы таблицы `hud_rsform_config`
--
ALTER TABLE `hud_rsform_config`
  ADD PRIMARY KEY (`SettingName`);

--
-- Индексы таблицы `hud_rsform_directory`
--
ALTER TABLE `hud_rsform_directory`
  ADD PRIMARY KEY (`formId`);

--
-- Индексы таблицы `hud_rsform_directory_fields`
--
ALTER TABLE `hud_rsform_directory_fields`
  ADD UNIQUE KEY `formId` (`formId`,`componentId`);

--
-- Индексы таблицы `hud_rsform_emails`
--
ALTER TABLE `hud_rsform_emails`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_rsform_forms`
--
ALTER TABLE `hud_rsform_forms`
  ADD PRIMARY KEY (`FormId`);

--
-- Индексы таблицы `hud_rsform_mappings`
--
ALTER TABLE `hud_rsform_mappings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hud_rsform_posts`
--
ALTER TABLE `hud_rsform_posts`
  ADD PRIMARY KEY (`form_id`);

--
-- Индексы таблицы `hud_rsform_properties`
--
ALTER TABLE `hud_rsform_properties`
  ADD UNIQUE KEY `PropertyId` (`PropertyId`),
  ADD KEY `ComponentId` (`ComponentId`);

--
-- Индексы таблицы `hud_rsform_submissions`
--
ALTER TABLE `hud_rsform_submissions`
  ADD PRIMARY KEY (`SubmissionId`),
  ADD KEY `FormId` (`FormId`),
  ADD KEY `SubmissionId` (`SubmissionId`,`FormId`,`DateSubmitted`),
  ADD KEY `SubmissionHash` (`SubmissionHash`);

--
-- Индексы таблицы `hud_rsform_submission_columns`
--
ALTER TABLE `hud_rsform_submission_columns`
  ADD PRIMARY KEY (`FormId`,`ColumnName`,`ColumnStatic`);

--
-- Индексы таблицы `hud_rsform_submission_values`
--
ALTER TABLE `hud_rsform_submission_values`
  ADD PRIMARY KEY (`SubmissionValueId`),
  ADD KEY `FormId` (`FormId`),
  ADD KEY `SubmissionId` (`SubmissionId`);

--
-- Индексы таблицы `hud_rsform_translations`
--
ALTER TABLE `hud_rsform_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Индексы таблицы `hud_schemas`
--
ALTER TABLE `hud_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Индексы таблицы `hud_session`
--
ALTER TABLE `hud_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`),
  ADD KEY `client_id_guest` (`client_id`,`guest`);

--
-- Индексы таблицы `hud_tags`
--
ALTER TABLE `hud_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Индексы таблицы `hud_template_styles`
--
ALTER TABLE `hud_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_client_id_home` (`client_id`,`home`);

--
-- Индексы таблицы `hud_ucm_base`
--
ALTER TABLE `hud_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Индексы таблицы `hud_ucm_content`
--
ALTER TABLE `hud_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Индексы таблицы `hud_ucm_history`
--
ALTER TABLE `hud_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Индексы таблицы `hud_updates`
--
ALTER TABLE `hud_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Индексы таблицы `hud_update_sites`
--
ALTER TABLE `hud_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Индексы таблицы `hud_update_sites_extensions`
--
ALTER TABLE `hud_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Индексы таблицы `hud_usergroups`
--
ALTER TABLE `hud_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Индексы таблицы `hud_users`
--
ALTER TABLE `hud_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `hud_user_keys`
--
ALTER TABLE `hud_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `hud_user_notes`
--
ALTER TABLE `hud_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Индексы таблицы `hud_user_profiles`
--
ALTER TABLE `hud_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Индексы таблицы `hud_user_usergroup_map`
--
ALTER TABLE `hud_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Индексы таблицы `hud_viewlevels`
--
ALTER TABLE `hud_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hud_action_logs`
--
ALTER TABLE `hud_action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_action_logs_extensions`
--
ALTER TABLE `hud_action_logs_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `hud_action_log_config`
--
ALTER TABLE `hud_action_log_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `hud_assets`
--
ALTER TABLE `hud_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT для таблицы `hud_banners`
--
ALTER TABLE `hud_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_banner_clients`
--
ALTER TABLE `hud_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_categories`
--
ALTER TABLE `hud_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `hud_contact_details`
--
ALTER TABLE `hud_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_content`
--
ALTER TABLE `hud_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `hud_content_types`
--
ALTER TABLE `hud_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `hud_extensions`
--
ALTER TABLE `hud_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10020;

--
-- AUTO_INCREMENT для таблицы `hud_fields`
--
ALTER TABLE `hud_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `hud_fields_groups`
--
ALTER TABLE `hud_fields_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hud_finder_filters`
--
ALTER TABLE `hud_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_finder_links`
--
ALTER TABLE `hud_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_finder_taxonomy`
--
ALTER TABLE `hud_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hud_finder_terms`
--
ALTER TABLE `hud_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_finder_types`
--
ALTER TABLE `hud_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_languages`
--
ALTER TABLE `hud_languages`
  MODIFY `lang_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hud_menu`
--
ALTER TABLE `hud_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT для таблицы `hud_menu_types`
--
ALTER TABLE `hud_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hud_messages`
--
ALTER TABLE `hud_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_modules`
--
ALTER TABLE `hud_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `hud_newsfeeds`
--
ALTER TABLE `hud_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_osmap_sitemaps`
--
ALTER TABLE `hud_osmap_sitemaps`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hud_overrider`
--
ALTER TABLE `hud_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT для таблицы `hud_postinstall_messages`
--
ALTER TABLE `hud_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `hud_privacy_consents`
--
ALTER TABLE `hud_privacy_consents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_privacy_requests`
--
ALTER TABLE `hud_privacy_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_redirect_links`
--
ALTER TABLE `hud_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_calculations`
--
ALTER TABLE `hud_rsform_calculations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_components`
--
ALTER TABLE `hud_rsform_components`
  MODIFY `ComponentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_component_types`
--
ALTER TABLE `hud_rsform_component_types`
  MODIFY `ComponentTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2425;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_conditions`
--
ALTER TABLE `hud_rsform_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_condition_details`
--
ALTER TABLE `hud_rsform_condition_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_emails`
--
ALTER TABLE `hud_rsform_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_forms`
--
ALTER TABLE `hud_rsform_forms`
  MODIFY `FormId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_mappings`
--
ALTER TABLE `hud_rsform_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_properties`
--
ALTER TABLE `hud_rsform_properties`
  MODIFY `PropertyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_submissions`
--
ALTER TABLE `hud_rsform_submissions`
  MODIFY `SubmissionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_submission_values`
--
ALTER TABLE `hud_rsform_submission_values`
  MODIFY `SubmissionValueId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2185;

--
-- AUTO_INCREMENT для таблицы `hud_rsform_translations`
--
ALTER TABLE `hud_rsform_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT для таблицы `hud_tags`
--
ALTER TABLE `hud_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hud_template_styles`
--
ALTER TABLE `hud_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `hud_ucm_content`
--
ALTER TABLE `hud_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_ucm_history`
--
ALTER TABLE `hud_ucm_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_updates`
--
ALTER TABLE `hud_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT для таблицы `hud_update_sites`
--
ALTER TABLE `hud_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `hud_usergroups`
--
ALTER TABLE `hud_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `hud_users`
--
ALTER TABLE `hud_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT для таблицы `hud_user_keys`
--
ALTER TABLE `hud_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_user_notes`
--
ALTER TABLE `hud_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hud_viewlevels`
--
ALTER TABLE `hud_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
