-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2019 at 08:21 AM
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
-- Database: `db_yatracms`
--

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
(1, 'Dashain and Tihar', 'dashain-and-tihar', NULL, 1, '2019-05-07', 'Pers Creation', 2, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'Test', '<p>sdsa asdas d a</p>', '2019-05-13 02:53:20', '2019-05-19 01:31:16'),
(2, 'Food in Nepal', 'food-in-nepal', 'food-in-nepal', 1, '2019-05-07', 'Pers Creation', 1, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'test', 'test', '<p>aThis is as a</p>', '2019-05-18 23:55:16', '2019-05-19 01:31:16');

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
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `featured` tinyint(4) DEFAULT NULL,
  `top_trending` tinyint(4) DEFAULT NULL,
  `trip_of_month` tinyint(4) DEFAULT NULL,
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

INSERT INTO `contents` (`id`, `title`, `slug`, `image`, `display`, `featured`, `top_trending`, `trip_of_month`, `discount`, `departure_date`, `price`, `duration`, `altitude`, `menu_categories`, `best_season`, `difficulty`, `group_size`, `types`, `order_item`, `meta_keywords`, `meta_tags`, `meta_categories`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'Everest Base Camp and Gokyo', 'everest-base-camp-and-gokyo', 'everest-base-camp-and-gokyo.jpeg', 1, NULL, NULL, NULL, NULL, NULL, NULL, '12', '5500', '[{\"title\":\"Rafting\",\"id\":2}]', '[{\"id\":8,\"title\":\"August\"},{\"id\":9,\"title\":\"September\"},{\"id\":10,\"title\":\"October\"}]', '{\"id\":3,\"title\":\"Quite Tough\"}', '[{\"id\":4,\"title\":\"Large Group\"},{\"id\":3,\"title\":\"Adult Group\"}]', '[{\"id\":5,\"title\":\"Flights\"},{\"id\":3,\"title\":\"Tourist Bus\"}]', 1, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'asdas', 'asdas', '<p>sc</p>', '2019-05-13 02:37:01', '2019-05-31 03:59:59'),
(2, 'Mustang Trekking 6 Days', 'mustang-trekking-6-days', 'mustang-trekking-6-days.jpeg', 1, NULL, NULL, NULL, NULL, NULL, NULL, '6', '4500', '[{\"title\":\"Trekking\",\"id\":3},{\"title\":\"Trekking in Nepal\",\"id\":6},{\"title\":\"Jungle Safari\",\"id\":4}]', '[{\"id\":1,\"title\":\"January\"},{\"id\":2,\"title\":\"February\"}]', '{\"id\":3,\"title\":\"Quite Tough\"}', '[{\"id\":4,\"title\":\"Large Group\"},{\"id\":3,\"title\":\"Adult Group\"}]', '[{\"id\":1,\"title\":\"Trekking\"},{\"id\":4,\"title\":\"Helicopter\"},{\"id\":3,\"title\":\"Tourist Bus\"}]', 2, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'Dashain, festival of goddess durga, hindu festival', '<p>This is short desc</p>', '2019-05-19 00:13:00', '2019-05-19 00:39:12'),
(3, 'Annapurna Circuit Trek', 'annapurna-circuit-trek', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2019-05-31 02:27:54', '2019-05-31 02:27:54'),
(4, 'Manang', 'manang', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2019-05-31 02:32:23', '2019-05-31 02:32:23'),
(5, 'asdf', 'asdf', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, '2019-05-31 02:34:03', '2019-05-31 02:34:03'),
(6, 'f adfasd fas dfas', 'f-adfasd-fas-dfas', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, '2019-05-31 02:35:04', '2019-05-31 02:35:04'),
(7, 'f asdfas df as', 'f-asdfas-df-as', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, '2019-05-31 02:37:34', '2019-05-31 02:37:34'),
(8, 'Test 1', 'test-1', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, '2019-05-31 02:38:02', '2019-05-31 02:38:02'),
(9, 'Test 2', 'test-2', 'no-image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, '2019-05-31 02:38:21', '2019-05-31 02:38:21'),
(10, 'Test 3', 'test-3', 'no-image.png', 1, 1, 1, 1, 9, '2019-07-19', '1800', '14', '450', '[{\"title\":\"Rafting\",\"id\":10}]', '[{\"id\":1,\"title\":\"January\"}]', '{\"id\":4,\"title\":\"Extremely Tough\"}', '[{\"id\":5,\"title\":\"Any\"}]', '[{\"id\":5,\"title\":\"Flights\"}]', 10, 'socil media marketing in Nepal, promote online shop, ecommerce, promotion plan, promotion in nepal, social media promotion in nepal', 'asdas', 'asdas', NULL, '2019-05-31 02:39:06', '2019-05-31 04:00:55');

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
(8, 'includes', 'includes-2', 'test-3', 1, '<p>saasasa</p>', '2019-05-31 03:55:31', '2019-05-31 03:55:31');

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
(1, 'Destinations', 'destinations', 'destination.jpeg', 'seo.svg', 1, 1, 0, 1, '<p>fafa f da</p>', '2019-05-30 00:20:34', '2019-05-30 01:17:23'),
(2, 'Activities', 'activities', 'activities.jpeg', 'seo.svg', 1, 1, 0, 2, '<p>This is Activities</p><p><br></p>', '2019-05-30 00:32:51', '2019-05-30 00:45:32'),
(3, 'Region', 'region', 'region.png', 'seo.svg', 1, 1, 0, 3, '<p> dsds s</p>', '2019-05-30 02:51:24', '2019-05-30 23:22:37');

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
(6, 1, 'Nepal', 'nepal', 'nepal.jpeg', 'seo.svg', 1, 1, 0, 1, 1, '<p>fa dfaaf as</p>', '2019-05-30 06:01:54', '2019-05-30 06:03:18'),
(7, 1, 'India', 'india', 'india.jpeg', 'seo.svg', 1, 1, 0, 0, 3, '<p> adfas sdf</p>', '2019-05-30 06:02:13', '2019-05-30 06:03:18'),
(8, 1, 'Bhutan', 'bhutan', 'bhutan.jpeg', 'seo.svg', 1, 1, 0, 0, 4, '<p> adfa sdas fasd</p>', '2019-05-30 06:02:54', '2019-05-30 06:03:18'),
(9, 1, 'Everest Region', 'everest-region', 'everest-region.jpeg', 'seo.svg', 1, 1, 6, 0, 2, '<p> asdfas dfasda s</p>', '2019-05-30 06:03:15', '2019-05-30 06:03:18'),
(10, 2, 'Rafting', 'rafting', 'rafting.jpeg', 'seo.svg', 1, 1, 0, 0, 5, '<p>Ti afd a</p>', '2019-05-30 06:04:12', '2019-05-30 06:04:12'),
(11, 3, 'Everest Region', 'everest-region-1', 'everest-region-1.jpeg', 'seo.svg', 1, 1, 0, 0, 6, '<p>This is Everest Region	</p>', '2019-06-03 00:30:32', '2019-06-03 00:30:32');

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
(17, '2019_05_30_054446_create_devmenus_table', 3);

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
(1, 'Partner 1', 'partner-1', 'partner-1.jpeg', 1, 1, 'https://www.gazenepal.com/', '2019-05-18 05:01:43', '2019-05-18 05:01:43');

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
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Excerpt goes here',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Slider 1', 'This is sub title', 'slider-1', 'slider-1.jpeg', 1, 1, 'https://www.gazenepal.com/', '2019-05-18 05:00:20', '2019-05-18 05:00:20');

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
(6, 'Developer', 'developer', 'developer@yatracms.com', '$2y$10$KeBxa7UXQGLFDAuuN9zDDuWWDKcda.ygnlgLM3kgqtgLe6px22m0O', 'dev', '#', '#', '#', 'I am Developer', NULL, NULL, '2019-05-28 23:50:16', '2019-05-28 23:50:16');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `devmenus`
--
ALTER TABLE `devmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
