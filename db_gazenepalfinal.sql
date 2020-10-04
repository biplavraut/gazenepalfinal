-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2020 at 01:32 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gazenepalfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` tinyint(4) DEFAULT '0',
  `featured` tinyint(4) DEFAULT '0',
  `top_trending` tinyint(4) DEFAULT '0',
  `trip_of_month` tinyint(4) DEFAULT '0',
  `rating` tinyint(4) DEFAULT '10',
  `departure_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_categories` longtext COLLATE utf8mb4_unicode_ci,
  `best_season` longtext COLLATE utf8mb4_unicode_ci,
  `difficulty` longtext COLLATE utf8mb4_unicode_ci,
  `group_size` longtext COLLATE utf8mb4_unicode_ci,
  `types` longtext COLLATE utf8mb4_unicode_ci,
  `order_item` bigint(20) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `meta_tags` longtext COLLATE utf8mb4_unicode_ci,
  `meta_categories` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `title`, `location`, `slug`, `image`, `display_image`, `cover_image`, `display`, `featured`, `top_trending`, `trip_of_month`, `rating`, `departure_date`, `price`, `discount`, `duration`, `altitude`, `menu_categories`, `best_season`, `difficulty`, `group_size`, `types`, `order_item`, `meta_title`, `meta_keywords`, `meta_tags`, `meta_categories`, `excerpt`, `created_at`, `updated_at`) VALUES
(5, 'Cycling', 'Shivapuri Area', 'cycling', 'no-image.png', 'display_cycling.jpeg', NULL, 1, 0, 0, 0, 10, NULL, '80$', NULL, '2D/1N', NULL, '[{\"title\":\"Cycling\",\"id\":22}]', '[{\"id\":13,\"title\":\"Any\"}]', '{\"id\":1,\"title\":\"Easy\"}', '[{\"id\":5,\"title\":\"Any\"}]', '[{\"id\":3,\"title\":\"Tourist Bus\"},{\"id\":4,\"title\":\"Helicopter\"}]', 2, NULL, NULL, NULL, NULL, NULL, '2020-01-10 00:39:13', '2020-02-12 06:56:06'),
(6, 'Paragliding', 'Pokhara', 'paragliding', 'no-image.png', 'display_paragliding.jpeg', NULL, 0, 0, 0, 0, 10, NULL, '80$', NULL, '1N/2D', NULL, '[{\"title\":\"Paragliding\",\"id\":21}]', '[{\"id\":13,\"title\":\"Any\"}]', '{\"id\":3,\"title\":\"Quite Tough\"}', '[{\"id\":5,\"title\":\"Any\"}]', '[{\"id\":3,\"title\":\"Tourist Bus\"}]', 3, NULL, NULL, NULL, NULL, NULL, '2020-01-10 01:08:47', '2020-02-12 06:56:06'),
(8, 'Elephant Safari', 'Sauraha Area', 'elephant-safari', 'no-image.png', 'display_elephant-safari.jpeg', NULL, 1, 0, 0, 0, 10, NULL, '300$', NULL, '2N/3D', NULL, '[{\"title\":\"Elephant Safari\",\"id\":30}]', '[{\"id\":13,\"title\":\"Any\"}]', '{\"id\":2,\"title\":\"Moderate\"}', '[{\"id\":5,\"title\":\"Any\"}]', '[{\"id\":3,\"title\":\"Tourist Bus\"}]', 1, NULL, NULL, NULL, NULL, NULL, '2020-01-10 01:18:38', '2020-02-12 06:56:06'),
(9, 'Hill Trekking', 'Shivapuri Area', 'hill-trekking', 'no-image.png', 'display_hill-trekking.jpeg', NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, 'null', 'null', '{\"id\":2,\"title\":\"Moderate\"}', 'null', '[{\"id\":1,\"title\":\"Trekking\"}]', 4, NULL, NULL, NULL, NULL, NULL, '2020-01-12 02:45:14', '2020-02-12 06:56:06'),
(10, 'vyakutey jump', NULL, 'vyakutey-jump', 'no-image.png', 'display_vyakutey-jump.jpeg', NULL, 1, 1, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, '[{\"title\":\"Paragliding\",\"id\":21}]', '[{\"id\":6,\"title\":\"june\"}]', '{\"id\":2,\"title\":\"Moderate\"}', '[{\"id\":2,\"title\":\"Family\"}]', '[{\"id\":5,\"title\":\"Flights\"}]', 5, NULL, NULL, NULL, NULL, NULL, '2020-01-21 01:22:44', '2020-02-12 06:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `activities_details`
--

CREATE TABLE `activities_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item` bigint(20) DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `meta_tags` longtext COLLATE utf8mb4_unicode_ci,
  `meta_categories` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `image`, `display`, `date`, `author`, `order_item`, `meta_keywords`, `meta_tags`, `meta_categories`, `excerpt`, `created_at`, `updated_at`) VALUES
(2, 'Food in Nepal', 'food-in-nepal', 'food-in-nepal.png', 1, '2019-05-07', 'Pers Creation', 2, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'test', 'test', '<p>aThis is as a</p>', '2019-05-18 23:55:16', '2020-02-20 02:47:31'),
(3, 'Dashain and Tihar', 'dashain-and-tihar', 'dashain-and-tihar.jpeg', 1, NULL, 'Pers Creation', 3, NULL, NULL, NULL, '<p>hello</p>', '2019-12-08 04:48:45', '2020-02-18 05:41:44'),
(4, 'Maha Shivaratri', 'maha-shivaratri', 'maha-shivaratri.jpeg', 1, '2020-02-21', 'Gaze Nepal- Sunil Thapa', 1, 'maha shivaratri, cultural tour, shivaratri', 'maha shivaratri, cultural tour, shivaratri', 'maha shivaratri, cultural tour, shivaratri', '<p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Mahasivaratri also known as shivaratri is celebrated as the day in which lord Shiva married to Parvati. It is also called as a night of Shiva where devotee take strict fast while&nbsp;some doesn’t even take a drop of water. The ceremony is mainly celebrated throughout the night by worshiping Shiva linga every three hours with milk, curd, honey etc.&nbsp;It is celebrated by Hindus across&nbsp;the globe with great belief. Some of the places to visit on this auspicious day:-</span></p><ol><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">India</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Nepal (Pashupatinath)</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Bangladesh</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Mauritius</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Trinidad &amp; Tobago</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Guyana</span></li><li class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Fiji</span></li></ol><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">This great festival is celebrated annually. Every year thousands of internal and external tourist visits Pashupatinath and other famous pilgrimages and Temples to celebrate and worship on this auspicious day. Pashupatinath is considered as the Guardian and Protector of the Kathmandu Valley and Nepal. Apart from Puja other attractions includes Sadhu Babas from different parts of Nepal and India. Some sadhus are covered in ashes while some prefer to be completely naked. A Sadhu who is considered holy, smokes Marijuana from chillem on the eve of the day. All four doors of the temple are opened at 3:15 A.M. No matter with what security or number of police personnel deployed, it makes no sense for one day in the year when hashish or weed goes legal in Nepal. This trend has not only been exploited, but to some extent exaggerated by drug abusers and teenagers in using illegal substances in the name of culture and tradition. But saying that it has only cons may be misleading because on this day many tourists come to Nepal and Pashupatinath which has contributed largely in the economy of the country and helps promote Tourism Industry of the country.</span></p><p class=\"ql-align-justify\"><strong style=\"color: rgb(34, 34, 34);\">Read on to know more interesting facts about this auspicious day.</strong></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">The term Maha Shivaratri is said to be a ‘Great Night of Shiva’.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">It is believed to be the night where Shiva performed the Tandava dance.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">It is a special night for unmarried women, who fasts to get a husband like Lord Shiva as he is said to be the ideal companion whereas married women pray for their husband wellbeing.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">This is the day when lord Shiva manifested Shiva linga.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">It is believed that by worshipping Lord Shiva on this day brings the control mechanism over thoughts like anger, lust and greed.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Maha Shivaratri celebrates the union of Shiva and Shakti, two greatest forces of the Universe.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Shiva married Parvati on this day.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">The legends signify that this day is the favorite of Lord Shiva and also throws light on his greatness and the supremacy&nbsp;over all other Hindu Gods and Goddesses. According to another legend of Samudra manthan, Shiva saved the world from the disastrous effects of a poison that emerged as a by product of the churning of the sea (Samudra manthan), by consuming the whole of the poison. Shiva could arrest the poison in his throat by his Yogic powers and it didn\'t go down his throat. His neck turned blue due to the effect of the poison on his throat and henceforth he is also known as Neela Kantha.&nbsp;After earth\'s creation was complete, Parvati asked Lord Shiva which devotees and rituals pleased him the most. The Lord replied that the 14th night of the new moon, in the dark fortnight during the month of Falgun, is his favorite day. Parvati repeated these words to her&nbsp;friends, from whom the word spread to all creation.</span></p><p><br></p>', '2019-12-08 04:50:33', '2020-02-19 01:13:52'),
(5, 'Test title', 'test-title', 'test-title.png', 1, '2020-02-18', 'Gaze Nepal- Sunil Thapa', 4, 'maha shivaratri, cultural tour, shivaratri', 'maha shivaratri, cultural tour, shivaratri', 'maha shivaratri, cultural tour, shivaratri', '<p> fasdfa</p>', '2020-02-19 01:37:21', '2020-02-19 01:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `title`, `slug`, `icon`, `display`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Address', 'address', 'seo.svg', 1, 'sgggg', '2019-05-19 00:20:44', '2019-05-19 01:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `map` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `featured` tinyint(4) DEFAULT NULL,
  `top_trending` tinyint(4) DEFAULT NULL,
  `trip_of_month` tinyint(4) DEFAULT NULL,
  `rating` tinyint(10) DEFAULT NULL,
  `accommodatiom` text COLLATE utf8mb4_unicode_ci,
  `discount` double DEFAULT NULL,
  `departure_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_categories` longtext COLLATE utf8mb4_unicode_ci,
  `best_season` longtext COLLATE utf8mb4_unicode_ci,
  `difficulty` longtext COLLATE utf8mb4_unicode_ci,
  `group_size` longtext COLLATE utf8mb4_unicode_ci,
  `types` longtext COLLATE utf8mb4_unicode_ci,
  `order_item` bigint(20) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `meta_tags` longtext COLLATE utf8mb4_unicode_ci,
  `meta_categories` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `slug`, `image`, `map`, `display_image`, `cover_image`, `display`, `featured`, `top_trending`, `trip_of_month`, `rating`, `accommodatiom`, `discount`, `departure_date`, `price`, `duration`, `altitude`, `menu_categories`, `best_season`, `difficulty`, `group_size`, `types`, `order_item`, `meta_title`, `meta_keywords`, `meta_tags`, `meta_categories`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Everest Base Camp and Gokyo', 'everest-base-camp-and-gokyo', 'everest-base-camp-and-gokyo.jpeg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12', '5500', '[{\"title\":\"Rafting\",\"id\":2}]', '[{\"id\":8,\"title\":\"August\"},{\"id\":9,\"title\":\"September\"},{\"id\":10,\"title\":\"October\"}]', '{\"id\":3,\"title\":\"Quite Tough\"}', '[{\"id\":4,\"title\":\"Large Group\"},{\"id\":3,\"title\":\"Adult Group\"}]', '[{\"id\":5,\"title\":\"Flights\"},{\"id\":3,\"title\":\"Tourist Bus\"}]', 2, NULL, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'dsds', 'asdas', '<p>sc</p>', '2019-05-13 02:37:01', '2019-12-29 03:45:02'),
(2, 'Manang 15 Day Tour', 'manang-15-day-tour', 'mustang-trekking-6-days.jpeg', 'mustang-trekking-6-days-map.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, '3 Star', NULL, NULL, NULL, '6', '4500', 'null', 'null', 'null', 'null', 'null', 1, NULL, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'Dashain, festival of goddess durga, hindu festival', '<p>This is short desc</p>', '2019-05-19 00:13:00', '2020-02-13 02:58:38'),
(3, 'Annapurna Circuit Trek', 'annapurna-circuit-trek', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:27:54', '2019-12-29 03:45:02'),
(4, 'Manang', 'manang', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:32:23', '2019-12-29 03:45:02'),
(5, 'asdf', 'asdf', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:34:03', '2019-12-29 03:45:02'),
(6, 'f adfasd fas dfas', 'f-adfasd-fas-dfas', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:35:04', '2019-12-29 03:45:02'),
(7, 'f asdfas df as', 'f-asdfas-df-as', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:37:34', '2019-12-29 03:45:02'),
(8, 'Test 1', 'test-1', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:38:02', '2019-12-29 03:45:02'),
(9, 'Test 2', 'test-2', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2019-05-31 02:38:21', '2019-12-29 03:45:02'),
(10, 'Test 3', 'test-3', 'no-image.png', NULL, NULL, NULL, 1, 1, 1, 1, NULL, NULL, 9, '2019-07-19', '1800', '14', '450', '[{\"title\":\"Rafting\",\"id\":10}]', '[{\"id\":1,\"title\":\"January\"}]', '{\"id\":4,\"title\":\"Extremely Tough\"}', '[{\"id\":5,\"title\":\"Any\"}]', '[{\"id\":5,\"title\":\"Flights\"}]', 10, NULL, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'asdas', 'asdas', NULL, '2019-05-31 02:39:06', '2019-12-29 03:45:02'),
(11, 'Rest', 'rest', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, '2019-06-10 00:31:47', '2019-12-29 03:45:02'),
(12, 'Chitwan Safari', 'chitwan-safari', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, '2019-09-25 06:27:01', '2019-12-29 03:45:02'),
(15, 'My name is khan', 'my-name-is-khan', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:18:10', '2019-12-29 03:45:02'),
(16, 'Mustang Trekking 6 Days', 'mustang-trekking-6-days-1', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:36:23', '2019-12-29 03:45:02'),
(17, 'Mustang Trekking 6 Days', 'content exists', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:38:53', '2019-12-29 03:45:02'),
(19, 'Mustang Trekking 6 Days', '[{\"slug\":\"mustang-trekking-6-days\"},{\"slug\":\"mustang-trekking-6-days-1\"}]', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:47:13', '2019-12-29 03:45:02'),
(21, 'My name is khan', '[{\"slug\":\"my-name-is-khan\"}]', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:48:19', '2019-12-29 03:45:02'),
(22, 'test slug', '[]', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, '2019-12-08 01:48:34', '2019-12-29 03:45:02'),
(23, 'everest region', 'everest-region', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, '2019-12-09 03:25:40', '2019-12-29 03:45:02'),
(24, 'test', 'test', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, '2019-12-18 01:39:21', '2019-12-29 03:45:02'),
(25, 'sdsd dada', 'sdsd-dada', 'no-image.png', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, '2019-12-18 02:29:48', '2019-12-29 03:45:02'),
(26, 'dolpa 5 Days', 'dolpa-5-days', 'no-image.png', 'dolpa-map.png', 'display_dolpa.jpeg', 'cover_dolpa.jpeg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 22, NULL, NULL, NULL, NULL, NULL, '2019-12-27 03:52:39', '2020-02-12 02:05:11'),
(27, 'Final Test Package', 'final-test-package', 'no-image.png', NULL, 'display_final-test-package.jpeg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, '2020-02-14', '3000', NULL, NULL, '[{\"title\":\"Paragliding\",\"id\":21},{\"title\":\"Everest Region\",\"id\":9}]', '[{\"id\":1,\"title\":\"January\"},{\"id\":2,\"title\":\"February\"}]', '{\"id\":2,\"title\":\"Moderate\"}', '[{\"id\":2,\"title\":\"Family\"}]', '[{\"id\":2,\"title\":\"Private Jeep-Car\"},{\"id\":3,\"title\":\"Tourist Bus\"}]', 23, NULL, NULL, NULL, NULL, NULL, '2020-02-13 02:59:26', '2020-02-13 03:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `title`, `slug`, `content_slug`, `display`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Lifestyle', 'lifestyle', 'everest-base-camp-and-gokyo', 1, 'asdasdasd', '2019-05-13 02:38:15', '2019-05-13 02:38:15'),
(2, 'Includes', 'includes', 'everest-base-camp-and-gokyo', 1, 'sasasas', '2019-05-13 02:38:50', '2019-05-13 02:38:50'),
(3, 'Itinerary', 'itinerary', 'mustang-trekking-6-days', 1, 'adsasd asd asda', '2019-05-19 00:14:19', '2019-05-19 00:14:19'),
(4, 'Includes', 'includes-1', 'mustang-trekking-6-days', 1, 'dsds dfs dsfd', '2019-05-19 00:14:59', '2019-05-19 00:14:59'),
(5, 'Detail Itinerary', 'detail-itinerary', 'everest-base-camp-and-gokyo', 1, '<h4>Day 1: Welcome to Kathmandu!</h4><hr><p class=\"ql-align-justify\">As you fly into Kathmandu, you\'ll have beautiful views over the valley, the Himalaya, and of the terraced fields below. After going through customs, a representative will be waiting to guide you through the initial culture shock of Kathmandu’s narrow, winding streets and get you settled into your hotel. Once you\'ve settled in, head out and visit some of the best&nbsp;Kathmandu\'s cultural highlights. In the evening, the tourist hub of&nbsp;Thamel&nbsp;is a good place to grab your first meal, with a variety of restaurants to chose from offering both Western and local Nepali dishes. In the afternoon we will regroup for a briefing and preparations for the departure.</p><h4>Day 2: Explore Kathmandu!</h4><hr><p class=\"ql-align-justify\">This morning we will take you on incredible sightseeing tour to the key attractions in and around Kathmandu.There are a&nbsp;number of ways you can spend the day&nbsp;given the many incredible sights around the&nbsp;Kathmandu Valley. Later in the evening, We will visit UNESCO protected and living Temple monuments of Pashupatinath, Boudhanath and Swayambhunath and return to the hotel at&nbsp;2pm. In the afternoon you may have time to explore, Patan or Bhaktapur, and the lesser-known towns. Your hotel will be located in Thamel, the area with an amazing range of fascinating highlights, you will be accompanied by the professional licensed guide. Kathmandu has more World Heritage sites than any other city in the world. Overnight stay at Thamel.</p><h4>Day 3: Rafting warm-up and Butterfly beach</h4><hr><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Travel to the river, with a full safety briefing before you start and a quick 3-hour rafting warm-up before camping at Butterfly beach. The first few days are quite gentle with Grade II/III rapids to get you nicely warmed up.</span></p><h4>Days 4-6: Rafting: rinse and repeat</h4><hr><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Full days of rafting ahead. Your general routine will be breakfast at 7:30 am, packed by 9:00 am, and on the river by 9.30. We will then paddle down until lunchtime (12 noon) when we will stop on a beach for around an hour to refresh ourselves before jumping back in the rafts/kayaks. We will raft until around 4 pm when we will then set up camp for the evening.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Enjoy a spot for fishing, explore the local villages and temples, or simply relax with a book on the beach before lighting the night\'s campfire. As the days go on, the rapids get bigger, the highlights being Hakapur, Rhino Rock and Jungle Corridor - rapids that you won’t forget for a while!</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">We\'ll be traveling through dense forests, remote villages and stunning scenery.</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">As we near the end of the trip, the river flattens out a bit as we get closer to the Indian Plains.</span></p><h4>Day 07: Drive or fly back to Kathmandu</h4><hr><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">This is our last day in the raft. We will raft to the final Hindu temple where we will stop to have a quick tour. We will then take out of the river at 1 pm. For those who have opted for the flight back to Kathmandu (currently around $170 USD per person), it is a quick drive to Biratnagar airport and then a 45-minute flight back to Kathmandu. For those on a tighter budget, we will load the bus and travel 15 hours overnight back to Kathmandu, arriving approximately 9 am the following morning.</span></p><h4>Day 8: Depart Kathmandu</h4><hr><p class=\"ql-align-justify\"><span style=\"color: rgb(34, 34, 34);\">Time to say farewell to Nepal. Enjoy your last moments in Kathmandu with breakfast in a café, a city stroll, and/or souvenir shopping. A representative will meet you at your hotel and drive you to the airport for your return flight home. It\'s good to be at the airport at least two hours prior to departure.</span></p><p><br></p>', '2019-05-29 04:39:49', '2019-05-29 04:39:49'),
(6, 'Highlights', 'highlights', 'everest-base-camp-and-gokyo', 1, '<p>ghfghf</p>', '2019-05-29 04:58:25', '2019-05-29 04:59:11'),
(7, 'Itinerary', 'itinerary-1', 'test-3', 1, '<p>w wrgwer wer werasada </p>', '2019-05-31 03:50:53', '2019-05-31 03:55:38'),
(8, 'includes', 'includes-2', 'test-3', 1, '<p>saasasa</p>', '2019-05-31 03:55:31', '2019-05-31 03:55:31'),
(9, 'FAQ', 'faq', 'mustang-trekking-6-days', 1, '<p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p><p>Make sure to keep all page content within the&nbsp;<code style=\"color: rgb(232, 62, 140);\">#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the&nbsp;<code style=\"color: rgb(232, 62, 140);\">#menu-toggle</code>&nbsp;ID which will toggle the menu when clicked.</p>', '2019-12-27 01:10:23', '2019-12-27 01:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `devmenus`
--

CREATE TABLE `devmenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `child` tinyint(4) NOT NULL DEFAULT '0',
  `order_item` bigint(20) DEFAULT NULL,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devmenus`
--

INSERT INTO `devmenus` (`id`, `title`, `slug`, `image`, `icon`, `type`, `display`, `child`, `order_item`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Region', 'region', 'no-image.png', NULL, 0, 1, 0, 2, NULL, '2019-12-16 01:40:54', '2019-12-16 01:43:48'),
(2, 'Activities', 'activities', 'no-image.png', NULL, 0, 1, 0, 3, NULL, '2019-12-16 01:41:19', '2019-12-16 01:43:48'),
(3, 'Destination', 'destination', 'no-image.png', NULL, 0, 1, 0, 1, NULL, '2019-12-16 01:43:46', '2019-12-16 01:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `child` tinyint(4) NOT NULL DEFAULT '0',
  `order_item` bigint(20) DEFAULT NULL,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_id`, `title`, `slug`, `image`, `icon`, `type`, `display`, `parent_id`, `child`, `order_item`, `excerpt`, `created_at`, `updated_at`) VALUES
(6, 1, 'Nepal', 'nepal', 'nepal.jpeg', 'seo.svg', 1, 1, 0, 0, 1, '<p>fa dfaaf as</p>', '2019-05-30 06:01:54', '2019-12-06 01:21:42'),
(7, 1, 'India', 'india', 'india.jpeg', 'seo.svg', 1, 1, 0, 0, 3, '<p> adfas sdf</p>', '2019-05-30 06:02:13', '2019-12-06 01:21:42'),
(8, 1, 'Bhutan', 'bhutan', 'bhutan.jpeg', 'seo.svg', 1, 1, 0, 0, 4, '<p> adfa sdas fasd</p>', '2019-05-30 06:02:54', '2019-12-06 01:21:42'),
(9, 1, 'Everest Region', 'everest-region', 'everest-region.jpeg', 'seo.svg', 1, 1, 0, 0, 2, '<p> asdfas dfasda s</p>', '2019-05-30 06:03:15', '2019-12-06 01:21:42'),
(12, 3, 'Beach Activities', 'beach-activities', 'beach-activities.jpeg', 'seo.svg', 1, 1, 0, 0, 7, '<p><span style=\"color: rgb(34, 34, 34);\">Beach Activities</span></p>', '2019-12-06 00:41:19', '2019-12-06 04:14:15'),
(13, 3, 'Romantic Getaways', 'romantic-getaways', 'romantic-getaways.jpeg', NULL, 1, 1, 0, 0, 8, '<p><span style=\"color: rgb(34, 34, 34);\">Romantic Getaways</span></p>', '2019-12-06 00:42:24', '2019-12-06 04:14:31'),
(14, 3, 'Mountain Madness', 'mountain-madness', 'mountain-madness.jpeg', NULL, 1, 1, 0, 0, 9, '<p><span style=\"color: rgb(34, 34, 34);\">Mountain Madness</span></p>', '2019-12-06 00:42:57', '2019-12-06 04:15:35'),
(15, 3, 'Active Explorer', 'active-explorer', 'active-explorer.jpeg', NULL, 1, 1, 0, 0, 10, '<p><span style=\"color: rgb(34, 34, 34);\">Active Explorer</span></p>', '2019-12-06 00:43:33', '2019-12-06 04:15:43'),
(16, 3, 'Icy Challenge', 'icy-challenge', 'icy-challenge.jpeg', NULL, 1, 1, 0, 0, 11, '<p><span style=\"color: rgb(34, 34, 34);\">Icy Challenge</span></p>', '2019-12-06 00:44:04', '2019-12-06 04:15:51'),
(17, 3, 'Hill Trekking', 'hill-trekking', 'hill-trekking.jpeg', NULL, 1, 1, 0, 0, 12, '<p><span style=\"color: rgb(34, 34, 34);\">Hill Trekking</span></p>', '2019-12-06 00:44:40', '2019-12-06 04:16:12'),
(18, 3, 'Forest Camping', 'forest-camping', 'forest-camping.jpeg', NULL, 1, 1, 0, 0, 13, '<p><span style=\"color: rgb(34, 34, 34);\">Forest Camping</span></p>', '2019-12-06 00:45:06', '2019-12-06 04:16:26'),
(19, 3, 'River Rafting', 'river-rafting', 'river-rafting.jpeg', NULL, 1, 1, 0, 0, 14, '<p><span style=\"color: rgb(34, 34, 34);\">River Rafting</span></p>', '2019-12-06 00:45:36', '2019-12-06 04:16:42'),
(21, 2, 'Paragliding', 'paragliding', 'paragliding.jpeg', NULL, 1, 1, 0, 0, 2, '<p>Pokhara</p>', '2019-12-06 02:02:51', '2019-12-06 04:11:11'),
(22, 2, 'Cycling', 'cycling', 'cycling.jpeg', NULL, 1, 1, 0, 0, 3, '<p><span style=\"color: rgb(34, 34, 34);\">Shivapuri Area</span></p>', '2019-12-06 02:04:31', '2019-12-06 02:51:58'),
(30, 2, 'Elephant Safari', 'elephant-safari', 'elephant-safari.jpeg', 'seo.svg', 1, 1, 0, 0, 15, '<p>dgdhdghy</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '2019-12-06 03:01:52', '2019-12-06 03:01:52'),
(31, 2, 'Biplav Raut', 'biplav-raut', 'biplav-raut.jpeg', 'seo.svg', 1, 1, 0, 0, 16, '<p>asd</p>', '2019-12-06 03:08:15', '2019-12-06 03:08:15'),
(34, 3, 'test1', 'test1', 'test1', NULL, 1, 1, 0, 0, 17, '<p>sdkhsjdh</p>', '2019-12-06 03:44:49', '2019-12-06 03:46:37'),
(35, 3, 'test2', 'test2', 'test2', 'seo.svg', 1, 1, 0, 0, 18, '<p>kxskfdlh</p>', '2019-12-06 03:45:22', '2019-12-06 03:45:56'),
(36, 3, 'test3', 'test3', 'test3', 'seo.svg', 1, 1, 0, 0, 19, '<p>dslfjsd</p>', '2019-12-06 03:47:09', '2019-12-06 04:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_04_16_075453_create_menus_table', 1),
(9, '2019_04_23_052457_create_contacts_table', 1),
(10, '2019_04_23_080129_create_contents_table', 1),
(11, '2019_04_24_075003_create_blogs_table', 1),
(12, '2019_04_30_100649_create_details_table', 1),
(13, '2019_05_12_091536_create_partners_table', 1),
(14, '2019_05_12_091732_create_testimonials_table', 1),
(15, '2019_05_12_092741_create_sliders_table', 1),
(16, '2019_05_12_093337_create_seos_table', 2),
(18, '2019_05_30_054446_create_devmenus_table', 3),
(22, '2019_12_20_063054_region_detail', 7),
(25, '2019_12_25_065644_create_activities_table', 8),
(26, '2019_12_25_075847_create_activities_details_table', 9),
(27, '2020_01_02_070604_create_regions_table', 10),
(28, '2020_01_02_073530_create_region_details_table', 11),
(29, '2020_01_10_095600_create_teams_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `order_item` bigint(20) DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `title`, `slug`, `image`, `display`, `order_item`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Partner 1', 'partner-1', 'partner-1.jpeg', 1, 1, 'https://www.gazenepal.com/', '2019-05-18 05:01:43', '2019-05-18 05:01:43'),
(2, 'Biplav Raut', 'biplav-raut', 'biplav-raut.jpeg', 1, 2, 'https://www.gazenepal.com/', '2020-01-10 04:18:02', '2020-01-10 04:18:02'),
(3, 'Elephant Safari', 'elephant-safari', 'elephant-safari.png', 1, 3, 'sasa', '2020-01-10 04:18:42', '2020-01-10 04:18:42'),
(4, 'sagar humagain', 'sagar-humagain', 'sagar-humagain.jpeg', 1, 4, 'https://www.gazenepal.com/', '2020-01-10 04:28:46', '2020-01-10 04:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` tinyint(4) DEFAULT '0',
  `featured` tinyint(4) DEFAULT '0',
  `top_trending` tinyint(4) DEFAULT '0',
  `trip_of_month` tinyint(4) DEFAULT '0',
  `rating` tinyint(4) DEFAULT '10',
  `departure_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elevation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_categories` longtext COLLATE utf8mb4_unicode_ci,
  `best_season` longtext COLLATE utf8mb4_unicode_ci,
  `difficulty` longtext COLLATE utf8mb4_unicode_ci,
  `group_size` longtext COLLATE utf8mb4_unicode_ci,
  `types` longtext COLLATE utf8mb4_unicode_ci,
  `order_item` bigint(20) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `meta_tags` longtext COLLATE utf8mb4_unicode_ci,
  `meta_categories` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `title`, `slug`, `image`, `display_image`, `cover_image`, `map`, `display`, `featured`, `top_trending`, `trip_of_month`, `rating`, `departure_date`, `price`, `discount`, `duration`, `elevation`, `altitude`, `menu_categories`, `best_season`, `difficulty`, `group_size`, `types`, `order_item`, `meta_title`, `meta_keywords`, `meta_tags`, `meta_categories`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Everest Region', 'everest-region', 'no-image.png', 'everest-region-display.jpeg', 'everest-region-cover.jpeg', 'everest-region-map.png', 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 2, NULL, NULL, NULL, NULL, NULL, '2020-02-12 05:14:26', '2020-02-12 06:54:54'),
(2, 'Annapurna Region', 'annapurna-region', 'no-image.png', 'annapurna-region-display.jpeg', 'annapurna-region-cover.jpeg', 'annapurna-region-map.png', 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-02-12 05:17:32', '2020-02-12 06:54:54'),
(3, 'Dolpo Region', 'dolpo-region', 'no-image.png', 'dolpo-region-display.png', NULL, NULL, 1, 1, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 3, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:24:45', '2020-02-20 07:25:09'),
(4, 'Langtang Region', 'langtang-region', 'no-image.png', 'langtang-region-display.jpeg', NULL, NULL, 1, 1, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 4, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:25:34', '2020-02-20 07:25:55'),
(5, 'Chitwan', 'chitwan', 'no-image.png', 'chitwan-display.jpeg', NULL, NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 5, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:28:06', '2020-02-20 07:28:36'),
(6, 'Lumbini', 'lumbini', 'no-image.png', 'lumbini-display.jpeg', NULL, NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:28:49', '2020-02-20 07:29:03'),
(7, 'Mugu Region', 'mugu-region', 'no-image.png', 'mugu-region-display.jpeg', NULL, NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:30:27', '2020-02-20 07:31:57'),
(8, 'Upper Mustang', 'upper-mustang', 'no-image.png', 'upper-mustang-display.jpeg', NULL, NULL, 1, 1, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'null', 'null', 'null', 'null', 'null', 8, NULL, NULL, NULL, NULL, NULL, '2020-02-20 07:38:59', '2020-02-20 07:40:18'),
(9, 'Maha Shivaratri', 'maha-shivaratri', 'no-image.png', NULL, NULL, NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2020-08-16 01:41:04', '2020-08-16 01:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `region_details`
--

CREATE TABLE `region_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `region_details`
--

INSERT INTO `region_details` (`id`, `title`, `display_image`, `slug`, `content_slug`, `display`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Elephant Safari', '0', 'elephant-safari', 'elephant-safari', 1, '<p>elephant safari</p>', '2020-01-02 01:52:44', '2020-01-02 01:52:44'),
(2, 'Elephant Safari', '', 'elephant-safari-1', 'nepal', 1, '<p>dada</p>', '2020-01-08 23:52:56', '2020-01-08 23:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `title`, `keyword`, `subject`, `topic`, `summary`, `classification`, `category`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Download Gaze nepal App! Gaze Nepal Travel & Tours- Your adventure, trekking and holiday getaway.', 'gaze nepal, travel nepal, travel and tour, travel and tours in Nepal, visit nepal, visit nepal 2020, visitnepal2020, vacation in Nepal, travel agency, travel agency in nepal, Travel designer,', 'Nepal Travel, Tours, Travel, Everest Trek Operator, Ticketing , Jungle Safari , Tour Operator, Tour Leader, Guide, Design travel vaction, Nepal Expedition Operator', 'Travel and tours in nepal, Travel guides, Ticketing, Mountain Flights, Peak climbing, cultural tours, yoga meditational retreat, Adventure Sports', 'We provide customized travel services in all directions, from Premium luxury hotels to Holiday packages, all of which cover both Domestic and International destinations. We also deal with Fli', 'gaze nepal, travel nepal, travel and tour, travel and tours in Nepal, visit nepal, visit nepal 2020, visitnepal2020, vacation in Nepal, travel agency, travel agency in nepal, Travel designer, travel guide, tour leader, trekking, trekking in nepal, cultural tours, adventure, adventure in Nepal, adventure sports, yoga, yoga in nepal, meditation, meditation retreat, meditaion retreat in nepal, gaze nepal travel and tours, rafting, kayaking, Bungee jumping, zip line, Muktinath, pashupatinath, temples of nepal, climate of nepal.', 'Travel and tours in nepal, Travel guides', '<p>Gaze Nepal is a Travel agency; helps to design your adventure, trekking and vacation in Nepal. In addition to booking and reservations, we assist customers in choosing their preferred activities, transportation medium, lodging as well as food preferences.</p>', NULL, '2020-02-12 00:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `order_item` bigint(20) DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `sub_title`, `slug`, `image`, `display`, `order_item`, `link`, `created_at`, `updated_at`) VALUES
(5, 'Patan Durbar', 'Historical place and Krishna Mandir', 'patan-durbar', 'patan-durbar.png', 1, 1, 'https://www.gazenepal.com/', '2019-12-05 02:36:54', '2020-02-20 07:36:50'),
(6, 'Nepali Home Stay', 'Live like a Nepalese and experience the day to day activities.', 'nepali-home-stay', 'swyambhu.jpeg', 1, 2, 'https://www.gazenepal.com/', '2019-12-05 04:04:36', '2020-02-20 07:36:50'),
(7, 'Pokhara', 'City of lakes', 'pokhara', 'pokhara.jpeg', 1, 4, 'https://www.gazenepal.com/', '2019-12-05 04:05:42', '2020-02-20 07:36:50'),
(8, 'Poon Hill', 'Lord Shive, Har har mahadev', 'poon-hill', 'poon-hill.png', 1, 3, 'https://www.gazenepal.com/', '2020-02-12 06:51:47', '2020-02-20 07:36:50'),
(9, 'Tengbuche', 'View of Mt. Tengbuche from Lobuche', 'tengbuche', 'kritipur.jpeg', 1, 5, 'https://www.gazenepal.com/', '2020-02-19 05:49:21', '2020-02-20 07:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item` bigint(20) DEFAULT NULL,
  `display` tinyint(4) NOT NULL,
  `facebook_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_posts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `title`, `slug`, `image`, `order_item`, `display`, `facebook_link`, `instagram_link`, `member_posts`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Sagar Humagain', 'sagar-humagain', 'sagar-humagain.jpeg', 1, 1, 'https://www.facebook.com/sagar.humagainn', 'https://www.instagram.com/sagarhumagain', 'Developer', '<p>dsfsdkfhsdkjhfdsjkfhdskjh</p>', '2020-01-10 04:31:10', '2020-01-10 05:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'no-image.png',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `order_item` bigint(20) DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_posts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_testimonial` longtext COLLATE utf8mb4_unicode_ci,
  `excerpt` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `slug`, `image`, `display`, `order_item`, `country`, `client_posts`, `trip_testimonial`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john-doe', 'john-doe.png', 1, 1, 'Nepal', 'CEO', '[{\"title\":\"Everest Base Camp and Gokyo\",\"id\":1},{\"title\":\"Mustang Trekking 6 Days\",\"id\":2}]', '<p>This is just a sample		</p>', '2019-05-18 05:03:06', '2019-05-29 23:45:08'),
(2, 'Jane Doe', 'jane-doe', 'jane-doe.jpeg', 1, 2, 'Nepal', 'Managing Director', NULL, '<p>This is very nice company. We love to work with this team.</p>', '2019-05-20 23:17:50', '2019-05-20 23:17:50'),
(3, 'Biplav Raut', 'biplav-raut', 'biplav-raut.png', 1, 3, 'Nepal', 'CEO', '[{\"title\":\"Everest Base Camp and Gokyo\",\"id\":1},{\"title\":\"Mustang Trekking 6 Days\",\"id\":2}]', '<p>This is a Test Testimonial. It was nice working with you. This is a trip testimonial for Everest base Camp and Mustang Trekking.</p>', '2019-05-29 23:52:20', '2019-05-29 23:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `github` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `password`, `type`, `facebook`, `instagram`, `github`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Biplav Raut', 'biplav-raut', 'biplavraut@gmail.com', '$2y$10$dZC9OnLgS3tIchT7e0C0p.MtrDyOEYT.SvvRMbMybqO2qaMMB.wPG', 'supdev', '#', '#', '#', 'These are my experiences', 'biplav-raut.jpeg', NULL, '2019-05-12 04:07:43', '2019-05-27 09:56:25'),
(2, 'Biplav Raj Raut', 'biplav-raj-raut', 'biplavraut@yatracms.com', '$2y$10$3qxPf2VzQaHfbXTQFIE.1.myZg7KamUQj9tUuIYOZgMnDpC5OdVBS', 'admin', '#', '#', '#', 'Biplav Raut is Developer of The Yatra CMS', NULL, NULL, '2019-05-27 09:46:12', '2019-05-27 09:46:12'),
(3, 'Site Owner', 'site-owner', 'siteowner@yatracms.com', '$2y$10$7BlP/l62m2o2kMXzBTaTGuSOYx7DZswbAugBxL0sNynrrq/GiTC/O', 'supadmin', '#', '#', '#', 'This is site Owner', NULL, NULL, '2019-05-28 23:35:53', '2019-05-28 23:35:53'),
(4, 'Editor', 'editor', 'editor@yatracms.com', '$2y$10$qpwiPI32ZT0v8e08yr.ICO0L9coBGIvBbrM1uosdiXxBZtTlHUZGS', 'editor', '#', '#', '#', 'This is the Site Editor', NULL, 'CWI1H8AwXc6G7sNtSWfP5v3urWNQmi34uecqqp0Wuay1OFNdlKYtbvvItg1P', '2019-05-28 23:36:45', '2019-05-28 23:36:45'),
(5, 'User', 'user', 'user@yatracms.com', '$2y$10$Qc47RdPy7ezJeLtHOrdc6eQjjxbIn14QOi7TbrwJh8Odt97eK/fDi', 'user', '#', '#', '#', 'This is only the site user', NULL, NULL, '2019-05-28 23:43:15', '2019-05-28 23:43:15'),
(6, 'Developer', 'developer', 'developer@yatracms.com', '$2y$10$KeBxa7UXQGLFDAuuN9zDDuWWDKcda.ygnlgLM3kgqtgLe6px22m0O', 'dev', '#', '#', '#', 'I am Developer', NULL, NULL, '2019-05-28 23:50:16', '2019-05-28 23:50:16'),
(7, 'sagar humagain', 'sagar-humagain', 'sahumagain@gmail.com', '$2y$10$2QfQMj4mLE0j5Mq.RvtOdeA3j.Gxs4JJGSa4sg.VPEvWN6nKUomAa', 'dev', '#', '#', '#', NULL, 'sagar-humagain.jpeg', NULL, '2019-09-25 05:47:23', '2019-09-25 06:15:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `activities_slug_unique` (`slug`);

--
-- Indexes for table `activities_details`
--
ALTER TABLE `activities_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `activities_details_slug_unique` (`slug`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_slug_unique` (`slug`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contents_slug_unique` (`slug`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `details_slug_unique` (`slug`);

--
-- Indexes for table `devmenus`
--
ALTER TABLE `devmenus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devmenus_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `regions_slug_unique` (`slug`);

--
-- Indexes for table `region_details`
--
ALTER TABLE `region_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `region_details_slug_unique` (`slug`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_slug_unique` (`slug`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testimonials_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `activities_details`
--
ALTER TABLE `activities_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `devmenus`
--
ALTER TABLE `devmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `region_details`
--
ALTER TABLE `region_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
