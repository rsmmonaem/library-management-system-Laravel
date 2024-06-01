-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2024 at 04:32 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library-management-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` bigint(20) UNSIGNED NOT NULL,
  `AuthorName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AuthorBio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `AuthorName`, `AuthorBio`, `created_at`, `updated_at`) VALUES
(1, 'J.K. Rowling gg', 'British author best known for the Harry Potter series', NULL, '2024-05-20 05:54:04'),
(2, 'George Orwell', 'English novelist and essayist, best known for the dystopian novel 1984', NULL, NULL),
(3, 'Jane Austen', 'English novelist known primarily for her six major novels', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` bigint(20) UNSIGNED NOT NULL,
  `PublishedDate` date NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AvailableCopies` int(11) NOT NULL,
  `ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalCopies` int(11) NOT NULL,
  `AuthorID` bigint(20) UNSIGNED NOT NULL,
  `BookCover_Image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `PublishedDate`, `Title`, `AvailableCopies`, `ISBN`, `TotalCopies`, `AuthorID`, `BookCover_Image`, `created_at`, `updated_at`) VALUES
(1, '1997-06-26', 'Harry Potter and the Philosopher\'s Stone', 9, '9780747532743', 10, 1, NULL, NULL, '2024-05-18 11:13:29'),
(2, '1949-06-08', 'Nineteen Eighty-Four', 10, '9780451524935', 10, 2, NULL, NULL, '2024-05-18 10:11:52'),
(3, '1813-01-28', 'Pride and Prejudice Four', 10, '9780141439518', 170, 3, NULL, NULL, '2024-05-20 05:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `BorrowID` bigint(20) UNSIGNED NOT NULL,
  `BorrowDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Status` enum('Borrowed','Returned','Overdue') COLLATE utf8mb4_unicode_ci NOT NULL,
  `MemberID` bigint(20) UNSIGNED NOT NULL,
  `BookID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`BorrowID`, `BorrowDate`, `ReturnDate`, `Status`, `MemberID`, `BookID`, `created_at`, `updated_at`) VALUES
(13, '2024-05-05', '2024-05-16', 'Returned', 2, 1, '2024-05-18 10:14:24', '2024-05-18 11:13:29'),
(14, '2024-05-05', '2024-05-10', 'Borrowed', 2, 1, '2024-05-18 10:14:35', '2024-05-18 11:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `MemberID` bigint(20) UNSIGNED NOT NULL,
  `PhoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RegistrationDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`MemberID`, `PhoneNumber`, `FirstName`, `LastName`, `Email`, `RegistrationDate`, `created_at`, `updated_at`) VALUES
(1, '123456789', 'John', 'Doe', 'john@example.com', '2024-05-01', NULL, NULL),
(2, '987654321', 'Jane', 'Smith', 'jane@example.com', '2024-05-05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_19_064854_add_member_id_to_users_table', 2),
(6, '2024_05_19_071453_add_user_type_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'e9c2be9d3074e92ee9680c8991808b5e72d93b851966ca45d3c142b6fbbe4ec8', '[\"*\"]', NULL, NULL, '2024-05-16 02:28:36', '2024-05-16 02:28:36'),
(2, 'App\\Models\\User', 1, 'authToken', '7ff80c1e19ec4446feee074463457b3357e9819702098b910bd515766474f8dd', '[\"*\"]', NULL, NULL, '2024-05-16 02:38:40', '2024-05-16 02:38:40'),
(3, 'App\\Models\\User', 1, 'authToken', 'b1dfff6653b51e0b35b5662241430aadb009c5353d752bf0c9dc77e155a78bf7', '[\"*\"]', NULL, NULL, '2024-05-16 02:45:12', '2024-05-16 02:45:12'),
(4, 'App\\Models\\User', 1, 'authToken', '7249aadea6d455663e755fd6a61b7d3d5629acc418e0365a6b05a3f4d5b08b65', '[\"*\"]', '2024-05-16 03:10:46', NULL, '2024-05-16 02:58:34', '2024-05-16 03:10:46'),
(5, 'App\\Models\\User', 1, 'authToken', 'cb74652b8735516f84a64c3777c65bed121608918283c8f4f2cf694e93a8701c', '[\"*\"]', NULL, NULL, '2024-05-19 00:27:31', '2024-05-19 00:27:31'),
(6, 'App\\Models\\User', 1, 'authToken', '917c22b354cf9df7074cd6d93713f7f454ea3ef1747db7b373702741a4e57426', '[\"*\"]', NULL, NULL, '2024-05-19 00:28:15', '2024-05-19 00:28:15'),
(7, 'App\\Models\\User', 1, 'authToken', 'fdf132c1ee66a9d23818c7680665a97bd74dea758a22b6c6a1e29d7168cdd62f', '[\"*\"]', NULL, NULL, '2024-05-19 00:31:02', '2024-05-19 00:31:02'),
(8, 'App\\Models\\User', 1, 'authToken', '929a0fd6cc4bb389275e0ec528124459edf48beb90a6c7c4e6dd0a5c3c242e8d', '[\"*\"]', NULL, NULL, '2024-05-19 00:31:31', '2024-05-19 00:31:31'),
(9, 'App\\Models\\User', 1, 'authToken', '78b358216ed0db64aff8df28e1076376fbe1bc4ac58f8042ddc3ac341c7b897f', '[\"*\"]', NULL, NULL, '2024-05-19 01:04:30', '2024-05-19 01:04:30'),
(10, 'App\\Models\\User', 1, 'authToken', '56a98383032a7d95cf71741fb265904b160698543e757308f829a0d91b2ba00f', '[\"*\"]', NULL, NULL, '2024-05-19 01:08:22', '2024-05-19 01:08:22'),
(11, 'App\\Models\\User', 1, 'authToken', '49c0a6a7e2d8041e37d8fdb9e1add27bd795a88ae3efb88aa7a828a45632417a', '[\"*\"]', NULL, NULL, '2024-05-19 01:11:54', '2024-05-19 01:11:54'),
(12, 'App\\Models\\User', 1, 'authToken', '4ca81ead605238cc69f74ed747af43b0ddb21cca09f4fea1a9645edba1483af5', '[\"*\"]', NULL, NULL, '2024-05-19 01:16:06', '2024-05-19 01:16:06'),
(13, 'App\\Models\\User', 2, 'authToken', '12ee2e9c96c87a40634db281f40ee3d2d67fd9f72f33949a911b2cc0060b2d1d', '[\"*\"]', NULL, NULL, '2024-05-19 01:16:28', '2024-05-19 01:16:28'),
(14, 'App\\Models\\User', 1, 'authToken', '1fc41ea66614236f433e0172609fea66b45f4fe98b4fbf5ffba63c8e70b1a9cf', '[\"*\"]', NULL, NULL, '2024-05-20 08:33:07', '2024-05-20 08:33:07'),
(15, 'App\\Models\\User', 1, 'authToken', '002b75e4acd7d937d092b69098fabc7ddeec76951cc02e3614a1c2fcaffe8389', '[\"*\"]', NULL, NULL, '2024-05-20 08:33:22', '2024-05-20 08:33:22'),
(16, 'App\\Models\\User', 1, 'authToken', 'aa265cd52f060f882ecb89d13c461af10e5e34dd4d862e507c384ee73bc734f0', '[\"*\"]', NULL, NULL, '2024-05-20 08:34:35', '2024-05-20 08:34:35'),
(17, 'App\\Models\\User', 1, 'authToken', '455d3c6bb8936913b8fe50154c62bb9fa641c744a076a0ba6414fc1c92f08a94', '[\"*\"]', NULL, NULL, '2024-05-20 08:35:27', '2024-05-20 08:35:27'),
(18, 'App\\Models\\User', 1, 'authToken', '7aa4c6ca16d4d91d0a4c4033d296ba0840fce417ce110106a28e91ec76476e0a', '[\"*\"]', NULL, NULL, '2024-05-20 08:42:03', '2024-05-20 08:42:03'),
(19, 'App\\Models\\User', 1, 'authToken', '8d5362b8f791be1c5b691008eaf1ff403a07bb8fe231953a930506e0a6877e51', '[\"*\"]', '2024-05-20 08:45:03', NULL, '2024-05-20 08:43:58', '2024-05-20 08:45:03'),
(20, 'App\\Models\\User', 1, 'authToken', '6f2111b286561ffecd6fd188ebc741c31f9c79350063d3610704c1ec91c77134', '[\"*\"]', NULL, NULL, '2024-05-20 08:47:28', '2024-05-20 08:47:28'),
(21, 'App\\Models\\User', 1, 'authToken', 'c2c82da4398e7c64e2b92c7074e0a0e252ecacdc07cab63c2c41005cdfe115ed', '[\"*\"]', NULL, NULL, '2024-05-20 08:52:16', '2024-05-20 08:52:16'),
(22, 'App\\Models\\User', 1, 'authToken', '7639f0ffe5c59b1b6030064f349eb9d0a50d23224d777164b022e5af94dd35f0', '[\"*\"]', NULL, NULL, '2024-05-20 08:53:54', '2024-05-20 08:53:54'),
(23, 'App\\Models\\User', 1, 'authToken', 'de17ce95b87a9138f64d5185f372b89da256e48f6df8973c9e8f8f374ec7fd50', '[\"*\"]', NULL, NULL, '2024-05-20 08:55:48', '2024-05-20 08:55:48'),
(24, 'App\\Models\\User', 1, 'authToken', 'b25782cbdeb9933dd12bf58dbb6c4dcdb9d3889945b03b9cdee103023a9ca355', '[\"*\"]', NULL, NULL, '2024-05-20 08:57:16', '2024-05-20 08:57:16'),
(25, 'App\\Models\\User', 1, 'authToken', '1c0274b9aa070fe8611701e78bfe6b2808819a30254bca5bb10d3c29e8b55e4d', '[\"*\"]', '2024-05-20 08:58:33', NULL, '2024-05-20 08:57:21', '2024-05-20 08:58:33'),
(26, 'App\\Models\\User', 1, 'authToken', '91b4b5ef7fdaa36c050a6c9dff335e26014c67d5ea1a515209db2d702b9a57d2', '[\"*\"]', '2024-05-20 09:28:44', NULL, '2024-05-20 09:14:28', '2024-05-20 09:28:44'),
(27, 'App\\Models\\User', 1, 'authToken', '451a8277b99832e38985a44fb490b6cd38ff4bd6d02d04d355496bcc6ed8bfc1', '[\"*\"]', NULL, NULL, '2024-05-20 14:51:00', '2024-05-20 14:51:00'),
(28, 'App\\Models\\User', 1, 'authToken', '63cb9e0de5eb5cab8d580da76676ebf7635b90038b0240607e482b26425fb5b2', '[\"*\"]', NULL, NULL, '2024-05-20 14:52:05', '2024-05-20 14:52:05'),
(29, 'App\\Models\\User', 1, 'authToken', 'f09cbc889d6d156d4688f49383af81096588c8e3ee9e656a781dec5ef4aed685', '[\"*\"]', NULL, NULL, '2024-05-20 15:00:19', '2024-05-20 15:00:19'),
(30, 'App\\Models\\User', 1, 'authToken', '2cf06c43f63cbda5c7044298dca514cee432d054dc770b64ce07b89f814b1c4d', '[\"*\"]', NULL, NULL, '2024-05-20 15:02:52', '2024-05-20 15:02:52'),
(31, 'App\\Models\\User', 1, 'authToken', '1ab2896f10c0d340b6e0b5644c474eb131669311d99e426abf4805e8d78b7379', '[\"*\"]', NULL, NULL, '2024-05-20 15:03:04', '2024-05-20 15:03:04'),
(32, 'App\\Models\\User', 1, 'authToken', '202e22e6e040f6e925476c10c830965901218d3a398493ec6ea8e9e592b9ce34', '[\"*\"]', NULL, NULL, '2024-05-20 15:03:08', '2024-05-20 15:03:08'),
(33, 'App\\Models\\User', 1, 'authToken', 'd5dc8788f85fcd0d94eb10a351ab17a03fd80784da8bfa6e207b2ff1657141d6', '[\"*\"]', NULL, NULL, '2024-05-20 15:03:09', '2024-05-20 15:03:09'),
(34, 'App\\Models\\User', 1, 'authToken', '3bd0951e162b9884e85630904df65a084d4f85dfd807cb9aeeb5a7bcf8fa3240', '[\"*\"]', NULL, NULL, '2024-05-20 15:08:40', '2024-05-20 15:08:40'),
(35, 'App\\Models\\User', 1, 'authToken', '33c9687c6c30e013c18a3827e9051fe13fba176d4279dc2b5de65e356c14639c', '[\"*\"]', NULL, NULL, '2024-05-20 15:08:58', '2024-05-20 15:08:58'),
(36, 'App\\Models\\User', 1, 'authToken', 'e794a12e7103b891fbf5f4e0c2c9a1c1ef17b0d25c3e30d0d5a4359e62ea8ccf', '[\"*\"]', NULL, NULL, '2024-05-20 15:12:04', '2024-05-20 15:12:04'),
(37, 'App\\Models\\User', 1, 'authToken', '293257b2868659d61c73bf60dc07da74457f92c5bf1312ad4fcc12ecd767ab7a', '[\"*\"]', NULL, NULL, '2024-05-20 15:17:09', '2024-05-20 15:17:09'),
(38, 'App\\Models\\User', 1, 'authToken', 'b8f1f77488ec4ec334571ae1b12af0b0e39656cfa15908ac49b58bc83e7a2b72', '[\"*\"]', NULL, NULL, '2024-05-20 15:18:42', '2024-05-20 15:18:42'),
(39, 'App\\Models\\User', 1, 'authToken', '9efe3b1df994ec05a3720bf9f137047787a1d5cf12633f4eb6b725ecbf2b7869', '[\"*\"]', NULL, NULL, '2024-05-20 15:20:13', '2024-05-20 15:20:13'),
(40, 'App\\Models\\User', 1, 'authToken', 'e73a70f2a07c96dcdcf7964c194cd1169121e283726850507de8de6c015595c0', '[\"*\"]', NULL, NULL, '2024-05-20 15:20:26', '2024-05-20 15:20:26'),
(41, 'App\\Models\\User', 1, 'authToken', '3dff698cdea82b7e22edf6a1e4e910ce1b8f47161ba19b803685f11ea6a7eb2d', '[\"*\"]', NULL, NULL, '2024-05-20 15:20:39', '2024-05-20 15:20:39'),
(42, 'App\\Models\\User', 1, 'authToken', '34acbdeb533eb9d26db17852e1de7d68ca766cc98398f59e698d78c3e58c3448', '[\"*\"]', NULL, NULL, '2024-05-20 15:23:47', '2024-05-20 15:23:47'),
(43, 'App\\Models\\User', 1, 'authToken', 'a4ddc8ef471e9481dfce2bbc1f4f3bb6b4c55707da4294eafe82cd624d29b3d1', '[\"*\"]', '2024-05-20 15:26:03', NULL, '2024-05-20 15:25:57', '2024-05-20 15:26:03'),
(44, 'App\\Models\\User', 1, 'authToken', 'c3fb72b2193b06e6293a8deae3bbe2c5cb6808a242995869d4b3a2cb5afce1eb', '[\"*\"]', '2024-05-20 15:29:57', NULL, '2024-05-20 15:27:06', '2024-05-20 15:29:57'),
(45, 'App\\Models\\User', 1, 'authToken', 'cded040d80c89f7c97a9a78e4b72076eb7c7af533117905c89cb4cd79111f1c6', '[\"*\"]', '2024-05-20 15:30:20', NULL, '2024-05-20 15:30:18', '2024-05-20 15:30:20'),
(46, 'App\\Models\\User', 1, 'authToken', 'b7af1f0f161a6f73832a1af22b9a933fc3c5de47cdbbef768b2de939b7055414', '[\"*\"]', '2024-05-20 15:33:00', NULL, '2024-05-20 15:32:58', '2024-05-20 15:33:00'),
(47, 'App\\Models\\User', 2, 'authToken', 'df76b4560400723769fb3a5b767c03ea3eb44c49b0755955154660ad584325d5', '[\"*\"]', '2024-05-20 15:34:57', NULL, '2024-05-20 15:34:20', '2024-05-20 15:34:57'),
(48, 'App\\Models\\User', 1, 'authToken', '3cf34eea8778dc087c4d568fb196e39925b3cca19c7d104fa47ce2667b46af67', '[\"*\"]', NULL, NULL, '2024-05-20 23:50:35', '2024-05-20 23:50:35'),
(49, 'App\\Models\\User', 1, 'authToken', 'e145b39c4b5b5d1886e4672c270ee971a943fff0d7cd2c79ee48fcb878a75c9b', '[\"*\"]', NULL, NULL, '2024-05-21 00:00:05', '2024-05-21 00:00:05'),
(50, 'App\\Models\\User', 1, 'authToken', '6d3c480127e788b2fbf3cf252fd8f00cc87a45b43bf8e8ac8e87dd89cbdc19f5', '[\"*\"]', NULL, NULL, '2024-05-21 00:01:02', '2024-05-21 00:01:02'),
(51, 'App\\Models\\User', 1, 'authToken', '0953ed70910b29671f0cbdc2833b44da1ada0d06fd3a45f7eb9b93ee71a64b10', '[\"*\"]', NULL, NULL, '2024-05-21 00:04:29', '2024-05-21 00:04:29'),
(52, 'App\\Models\\User', 2, 'authToken', 'a1fb19d478fc160ce2eabc5a929f61d6d7108e85347d8a7a490e5d00b88c949e', '[\"*\"]', NULL, NULL, '2024-05-21 00:29:17', '2024-05-21 00:29:17'),
(53, 'App\\Models\\User', 1, 'authToken', '184dba9fe973d1abe87d85c1620464d201ea274694e87bdb12dbb4f072c39f36', '[\"*\"]', NULL, NULL, '2024-05-21 00:40:53', '2024-05-21 00:40:53'),
(54, 'App\\Models\\User', 2, 'authToken', 'f33f9853418e2126c9b51abe6cf0d521f1661a0a3b438d7cf5f46b0b027e8359', '[\"*\"]', NULL, NULL, '2024-05-21 00:41:50', '2024-05-21 00:41:50'),
(55, 'App\\Models\\User', 1, 'authToken', 'ab2bc46f7a18b5328f4e3d07d6a1cbe44b011675fa8c7b82d314d2bdc66d420b', '[\"*\"]', NULL, NULL, '2024-05-21 00:43:57', '2024-05-21 00:43:57'),
(56, 'App\\Models\\User', 1, 'authToken', 'ef884f093e9f2c0c020571b49e25468478df35a2b7f4125081e27097540a144a', '[\"*\"]', NULL, NULL, '2024-05-21 00:46:37', '2024-05-21 00:46:37'),
(57, 'App\\Models\\User', 2, 'authToken', '1fbe9e49f755969ce7cd8f9948462d2e745166fb760d8a805bb61268422f352b', '[\"*\"]', NULL, NULL, '2024-05-21 00:46:53', '2024-05-21 00:46:53'),
(58, 'App\\Models\\User', 1, 'authToken', '6bf6c3008e0d1a0cf208747194044041f6d14c946b5ce20555b6c85c5d01ae97', '[\"*\"]', NULL, NULL, '2024-05-21 00:49:14', '2024-05-21 00:49:14'),
(59, 'App\\Models\\User', 2, 'authToken', '9dab540947130d4e512a318d9f48354321ac9a719be5c6cc831fca43bdfb8a0f', '[\"*\"]', NULL, NULL, '2024-05-21 00:49:31', '2024-05-21 00:49:31'),
(60, 'App\\Models\\User', 2, 'authToken', '48afc0084eb5eacf61ed88d55a04a6b8ccfd04ee498bb2c6a070636ab03ca2e5', '[\"*\"]', NULL, NULL, '2024-05-21 00:54:56', '2024-05-21 00:54:56'),
(61, 'App\\Models\\User', 1, 'authToken', '0baf0cff71c750a88792bf7949b8952d64deb106ffe4c477385c960d22ec3198', '[\"*\"]', NULL, NULL, '2024-05-21 00:55:27', '2024-05-21 00:55:27'),
(62, 'App\\Models\\User', 1, 'authToken', '98122737bcf5a63a5f7da4bd1f5a57e2b647b41023b42c63aaff513d5375a239', '[\"*\"]', NULL, NULL, '2024-05-21 00:56:35', '2024-05-21 00:56:35'),
(63, 'App\\Models\\User', 1, 'authToken', '2bcb37daabf6e01f8adad8c9b0c2cfd8172b8128dd9f92b416dae6c61df0c385', '[\"*\"]', NULL, NULL, '2024-05-21 01:06:03', '2024-05-21 01:06:03'),
(64, 'App\\Models\\User', 2, 'authToken', 'bad9edfc5624972280d9fd3ab7644e8ecdbc0d1ea0d4db82f341ff20965959d5', '[\"*\"]', NULL, NULL, '2024-05-21 02:54:47', '2024-05-21 02:54:47'),
(65, 'App\\Models\\User', 1, 'authToken', '4f94e014fe536473a3b10432bc41b88608a2f6f89bc5eac338464686674825c5', '[\"*\"]', NULL, NULL, '2024-05-21 03:02:03', '2024-05-21 03:02:03'),
(66, 'App\\Models\\User', 2, 'authToken', '5bd62054f92003e8023d79d7a243685256047ebf9c94138eff74001bb140b5a7', '[\"*\"]', NULL, NULL, '2024-05-21 03:02:54', '2024-05-21 03:02:54'),
(67, 'App\\Models\\User', 2, 'authToken', '367a76c61c2639ad559a3b63c60d8dffa2c5c36432e13b0dc191ed4c9e26c255', '[\"*\"]', NULL, NULL, '2024-05-21 03:04:58', '2024-05-21 03:04:58'),
(68, 'App\\Models\\User', 1, 'authToken', '05c4b53fe93676bcc3bebb32b5c70cc30f0bb342f0a55ec0136b8d555923a506', '[\"*\"]', NULL, NULL, '2024-05-21 03:07:11', '2024-05-21 03:07:11'),
(69, 'App\\Models\\User', 2, 'authToken', '36663ce36fb4809b7767f434cde0ac09162bf6a7b41e5b2ff9f16beecbbdc97e', '[\"*\"]', NULL, NULL, '2024-05-21 03:16:30', '2024-05-21 03:16:30'),
(70, 'App\\Models\\User', 2, 'authToken', 'a66cfbedd014204f30b3eeaca62b461b51d30bc1c0def7fc0d8792e099e51406', '[\"*\"]', NULL, NULL, '2024-05-21 03:17:13', '2024-05-21 03:17:13'),
(71, 'App\\Models\\User', 2, 'authToken', 'd59af3cafa544c4b7a4eeaf5bb2bc3c634e375d6d9932ba41423ba7c0b80925a', '[\"*\"]', NULL, NULL, '2024-05-21 03:18:00', '2024-05-21 03:18:00'),
(72, 'App\\Models\\User', 2, 'authToken', '775177ebfb14de27a5ee25b3dc448cd433a6c158096f4ccb74a29679046c6578', '[\"*\"]', NULL, NULL, '2024-05-21 03:18:41', '2024-05-21 03:18:41'),
(73, 'App\\Models\\User', 2, 'authToken', 'a82886c21d883946409736cd51ffbc565760f94fda1c7b95f27aba083f9bffd5', '[\"*\"]', NULL, NULL, '2024-05-21 03:19:27', '2024-05-21 03:19:27'),
(74, 'App\\Models\\User', 1, 'authToken', '8e7bb8b702b3859e26c04990646eb52b5e2ca5c9027c1465b47f3a6f20a6de38', '[\"*\"]', NULL, NULL, '2024-05-21 03:19:37', '2024-05-21 03:19:37'),
(75, 'App\\Models\\User', 2, 'authToken', '5a6076433d926f9abdb78f6101b48f6abd96bde5aea6ae1e947cdfa3319909f7', '[\"*\"]', NULL, NULL, '2024-05-21 03:21:37', '2024-05-21 03:21:37'),
(76, 'App\\Models\\User', 1, 'authToken', 'f151d812275b57bb181857a66cc795f6689a53cdaf1ed3c3af4f5a7c1a52a584', '[\"*\"]', NULL, NULL, '2024-05-21 03:26:04', '2024-05-21 03:26:04'),
(77, 'App\\Models\\User', 2, 'authToken', '41acc39d1d58d40af7089cd89ddacfe749c501148504f595ce4a5cbf27cd9376', '[\"*\"]', NULL, NULL, '2024-05-21 03:27:28', '2024-05-21 03:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `MemberID` bigint(20) UNSIGNED DEFAULT NULL,
  `user_type` enum('admin','member') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `MemberID`, `user_type`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$IE9Lf6/dL0kQeq3jGxKMTuGNTYeRMb/fxu8DSFPrfx/UACLhxVoXa', NULL, '2024-05-16 02:24:43', '2024-05-16 02:24:43', 1, 'admin'),
(2, 'Regular User', 'user@example.com', NULL, '$2y$12$hyu0l7cq5zVd.pAX78TPqulIvI/4dH23LJO2QNKHMf1sWhzkuXYtK', NULL, '2024-05-16 02:24:44', '2024-05-16 02:24:44', 2, 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`BorrowID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_memberid_foreign` (`MemberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthorID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `BorrowID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `MemberID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`);

--
-- Constraints for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`),
  ADD CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_memberid_foreign` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
