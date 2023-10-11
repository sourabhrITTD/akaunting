-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 08:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akaunting`
--

-- --------------------------------------------------------

--
-- Table structure for table `ewd_accounts`
--

CREATE TABLE `ewd_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `number` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_phone` varchar(191) DEFAULT NULL,
  `bank_address` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_accounts`
--

INSERT INTO `ewd_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2023-10-06 09:10:42', '2023-10-06 09:10:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bills`
--

CREATE TABLE `ewd_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) NOT NULL,
  `order_number` varchar(191) DEFAULT NULL,
  `bill_status_code` varchar(191) NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) NOT NULL,
  `vendor_email` varchar(191) DEFAULT NULL,
  `vendor_tax_number` varchar(191) DEFAULT NULL,
  `vendor_phone` varchar(191) DEFAULT NULL,
  `vendor_address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_histories`
--

CREATE TABLE `ewd_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_items`
--

CREATE TABLE `ewd_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_item_taxes`
--

CREATE TABLE `ewd_bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_payments`
--

CREATE TABLE `ewd_bill_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text DEFAULT NULL,
  `payment_method` varchar(191) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_statuses`
--

CREATE TABLE `ewd_bill_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_bill_statuses`
--

INSERT INTO `ewd_bill_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Draft', 'draft', '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL),
(2, 1, 'Received', 'received', '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL),
(3, 1, 'Partial', 'partial', '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL),
(4, 1, 'Paid', 'paid', '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_bill_totals`
--

CREATE TABLE `ewd_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_categories`
--

CREATE TABLE `ewd_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_categories`
--

INSERT INTO `ewd_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#605ca8', 1, '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL),
(2, 1, 'Deposit', 'income', '#f39c12', 1, '2023-10-06 09:10:43', '2023-10-06 09:10:43', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(4, 1, 'Other', 'expense', '#d2d6de', 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(5, 1, 'General', 'item', '#00c0ef', 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_companies`
--

CREATE TABLE `ewd_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_companies`
--

INSERT INTO `ewd_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2023-10-06 09:10:42', '2023-10-06 09:10:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_currencies`
--

CREATE TABLE `ewd_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `precision` varchar(191) DEFAULT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) DEFAULT NULL,
  `thousands_separator` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_currencies`
--

INSERT INTO `ewd_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL, '2', '$', 1, '.', ','),
(2, 1, 'Euro', 'EUR', 1.25000000, 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL, '2', '€', 1, ',', '.'),
(3, 1, 'British Pound', 'GBP', 1.60000000, 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL, '2', '£', 1, '.', ','),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL, '2', '₺', 1, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_customers`
--

CREATE TABLE `ewd_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `tax_number` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_failed_jobs`
--

CREATE TABLE `ewd_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoices`
--

CREATE TABLE `ewd_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `order_number` varchar(191) DEFAULT NULL,
  `invoice_status_code` varchar(191) NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) NOT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_tax_number` varchar(191) DEFAULT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_histories`
--

CREATE TABLE `ewd_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_items`
--

CREATE TABLE `ewd_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_item_taxes`
--

CREATE TABLE `ewd_invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_payments`
--

CREATE TABLE `ewd_invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text DEFAULT NULL,
  `payment_method` varchar(191) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_statuses`
--

CREATE TABLE `ewd_invoice_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_invoice_statuses`
--

INSERT INTO `ewd_invoice_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Draft', 'draft', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(2, 1, 'Sent', 'sent', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(3, 1, 'Viewed', 'viewed', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(4, 1, 'Approved', 'approved', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(5, 1, 'Partial', 'partial', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(6, 1, 'Paid', 'paid', '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_invoice_totals`
--

CREATE TABLE `ewd_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_items`
--

CREATE TABLE `ewd_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_jobs`
--

CREATE TABLE `ewd_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_media`
--

CREATE TABLE `ewd_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) NOT NULL,
  `directory` varchar(68) NOT NULL,
  `filename` varchar(121) NOT NULL,
  `extension` varchar(28) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `aggregate_type` varchar(32) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_mediables`
--

CREATE TABLE `ewd_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_migrations`
--

CREATE TABLE `ewd_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_migrations`
--

INSERT INTO `ewd_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_01_000000_create_accounts_table', 1),
(2, '2017_09_01_000000_create_bills_table', 1),
(3, '2017_09_01_000000_create_categories_table', 1),
(4, '2017_09_01_000000_create_companies_table', 1),
(5, '2017_09_01_000000_create_currencies_table', 1),
(6, '2017_09_01_000000_create_customers_table', 1),
(7, '2017_09_01_000000_create_invoices_table', 1),
(8, '2017_09_01_000000_create_items_table', 1),
(9, '2017_09_01_000000_create_jobs_table', 1),
(10, '2017_09_01_000000_create_modules_table', 1),
(11, '2017_09_01_000000_create_notifications_table', 1),
(12, '2017_09_01_000000_create_password_resets_table', 1),
(13, '2017_09_01_000000_create_payments_table', 1),
(14, '2017_09_01_000000_create_revenues_table', 1),
(15, '2017_09_01_000000_create_roles_table', 1),
(16, '2017_09_01_000000_create_sessions_table', 1),
(17, '2017_09_01_000000_create_settings_table', 1),
(18, '2017_09_01_000000_create_taxes_table', 1),
(19, '2017_09_01_000000_create_transfers_table', 1),
(20, '2017_09_01_000000_create_users_table', 1),
(21, '2017_09_01_000000_create_vendors_table', 1),
(22, '2017_09_19_delete_offline_file', 1),
(23, '2017_10_11_000000_create_bill_totals_table', 1),
(24, '2017_10_11_000000_create_invoice_totals_table', 1),
(25, '2017_11_16_000000_create_failed_jobs_table', 1),
(26, '2017_12_09_000000_add_currency_columns', 1),
(27, '2017_12_30_000000_create_mediable_tables', 1),
(28, '2018_01_03_000000_drop_attachment_column_bill_payments_table', 1),
(29, '2018_01_03_000000_drop_attachment_column_bills_table', 1),
(30, '2018_01_03_000000_drop_attachment_column_invoice_payments_table', 1),
(31, '2018_01_03_000000_drop_attachment_column_invoices_table', 1),
(32, '2018_01_03_000000_drop_attachment_column_payments_table', 1),
(33, '2018_01_03_000000_drop_attachment_column_revenues_table', 1),
(34, '2018_01_03_000000_drop_picture_column_items_table', 1),
(35, '2018_01_03_000000_drop_picture_column_users_table', 1),
(36, '2018_04_23_000000_add_category_column_invoices_bills', 1),
(37, '2018_04_26_000000_create_recurring_table', 1),
(38, '2018_04_30_000000_add_parent_column', 1),
(39, '2018_06_23_000000_modify_email_column', 1),
(40, '2018_06_30_000000_modify_enabled_column', 1),
(41, '2018_07_07_000000_modify_date_column', 1),
(42, '2018_09_26_000000_add_reference_column_customers', 1),
(43, '2018_09_26_000000_add_reference_column_vendors', 1),
(44, '2018_10_22_000000_create_bill_item_taxes_table', 1),
(45, '2018_10_22_000000_create_invoice_item_taxes_table', 1),
(46, '2018_10_27_000000_add_reconciled_column', 1),
(47, '2018_10_27_000000_create_reconciliations_table', 1),
(48, '2018_11_05_000000_add_tax_columns', 1),
(49, '2019_01_07_000000_drop_tax_id_column', 1),
(50, '2019_02_04_000000_modify_deleted_at_column_media_table', 1),
(51, '2020_01_01_000000_add_locale_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_modules`
--

CREATE TABLE `ewd_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_modules`
--

INSERT INTO `ewd_modules` (`id`, `company_id`, `alias`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offlinepayment', 1, '2023-10-06 09:10:44', '2023-10-06 09:10:44', NULL),
(2, 1, 'paypalstandard', 1, '2023-10-06 09:10:45', '2023-10-06 09:10:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_module_histories`
--

CREATE TABLE `ewd_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `version` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_module_histories`
--

INSERT INTO `ewd_module_histories` (`id`, `company_id`, `module_id`, `category`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'payment-gateway', '1.0.0', 'OfflinePayment installed', '2023-10-06 09:10:45', '2023-10-06 09:10:45', NULL),
(2, 1, 2, 'payment-gateway', '1.0.0', 'PaypalStandard installed', '2023-10-06 09:10:45', '2023-10-06 09:10:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_notifications`
--

CREATE TABLE `ewd_notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_password_resets`
--

CREATE TABLE `ewd_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_payments`
--

CREATE TABLE `ewd_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_permissions`
--

CREATE TABLE `ewd_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_permissions`
--

INSERT INTO `ewd_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2023-10-06 09:09:34', '2023-10-06 09:09:34'),
(2, 'read-api', 'Read Api', 'Read Api', '2023-10-06 09:09:35', '2023-10-06 09:09:35'),
(3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2023-10-06 09:09:36', '2023-10-06 09:09:36'),
(9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2023-10-06 09:09:37', '2023-10-06 09:09:37'),
(15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(17, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(18, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(19, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(20, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(21, 'create-common-import', 'Create Common Import', 'Create Common Import', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(22, 'create-common-items', 'Create Common Items', 'Create Common Items', '2023-10-06 09:09:38', '2023-10-06 09:09:38'),
(23, 'read-common-items', 'Read Common Items', 'Read Common Items', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(24, 'update-common-items', 'Update Common Items', 'Update Common Items', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(25, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(26, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(27, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(28, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(29, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(30, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2023-10-06 09:09:39', '2023-10-06 09:09:39'),
(31, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(32, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(33, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(34, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(35, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(36, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(37, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(38, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2023-10-06 09:09:40', '2023-10-06 09:09:40'),
(39, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(40, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(41, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(42, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(43, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(44, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(45, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(46, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2023-10-06 09:09:41', '2023-10-06 09:09:41'),
(47, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(48, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(49, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(50, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(51, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(52, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(53, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(54, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2023-10-06 09:09:42', '2023-10-06 09:09:42'),
(55, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(56, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(57, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(58, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(59, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(60, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(61, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2023-10-06 09:09:43', '2023-10-06 09:09:43'),
(62, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(63, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(64, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(65, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(66, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(67, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(68, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(69, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2023-10-06 09:09:44', '2023-10-06 09:09:44'),
(70, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(71, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(72, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(73, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(74, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(75, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(76, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(77, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2023-10-06 09:09:45', '2023-10-06 09:09:45'),
(78, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(79, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(80, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(81, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(82, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(83, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(84, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(85, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(86, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2023-10-06 09:09:46', '2023-10-06 09:09:46'),
(87, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2023-10-06 09:09:47', '2023-10-06 09:09:47'),
(88, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2023-10-06 09:09:47', '2023-10-06 09:09:47'),
(89, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2023-10-06 09:09:47', '2023-10-06 09:09:47'),
(90, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2023-10-06 09:09:47', '2023-10-06 09:09:47'),
(91, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2023-10-06 09:09:47', '2023-10-06 09:09:47'),
(92, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(93, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(94, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(95, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(98, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(99, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2023-10-06 09:09:48', '2023-10-06 09:09:48'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2023-10-06 09:09:49', '2023-10-06 09:09:49'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2023-10-06 09:09:49', '2023-10-06 09:09:49'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2023-10-06 09:09:49', '2023-10-06 09:09:49'),
(103, 'create-wizard-companies', 'Create Wizard Companies', 'Create Wizard Companies', '2023-10-06 09:09:49', '2023-10-06 09:09:49'),
(104, 'read-wizard-companies', 'Read Wizard Companies', 'Read Wizard Companies', '2023-10-06 09:09:49', '2023-10-06 09:09:49'),
(105, 'update-wizard-companies', 'Update Wizard Companies', 'Update Wizard Companies', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(106, 'create-wizard-currencies', 'Create Wizard Currencies', 'Create Wizard Currencies', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(107, 'read-wizard-currencies', 'Read Wizard Currencies', 'Read Wizard Currencies', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(108, 'update-wizard-currencies', 'Update Wizard Currencies', 'Update Wizard Currencies', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(109, 'create-wizard-taxes', 'Create Wizard Taxes', 'Create Wizard Taxes', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(110, 'read-wizard-taxes', 'Read Wizard Taxes', 'Read Wizard Taxes', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(111, 'update-wizard-taxes', 'Update Wizard Taxes', 'Update Wizard Taxes', '2023-10-06 09:09:50', '2023-10-06 09:09:50'),
(112, 'create-wizard-finish', 'Create Wizard Finish', 'Create Wizard Finish', '2023-10-06 09:09:51', '2023-10-06 09:09:51'),
(113, 'read-wizard-finish', 'Read Wizard Finish', 'Read Wizard Finish', '2023-10-06 09:09:51', '2023-10-06 09:09:51'),
(114, 'update-wizard-finish', 'Update Wizard Finish', 'Update Wizard Finish', '2023-10-06 09:09:51', '2023-10-06 09:09:51'),
(115, 'read-customer-panel', 'Read Customer Panel', 'Read Customer Panel', '2023-10-06 09:10:00', '2023-10-06 09:10:00'),
(116, 'read-customers-invoices', 'Read Customers Invoices', 'Read Customers Invoices', '2023-10-06 09:10:00', '2023-10-06 09:10:00'),
(117, 'update-customers-invoices', 'Update Customers Invoices', 'Update Customers Invoices', '2023-10-06 09:10:00', '2023-10-06 09:10:00'),
(118, 'read-customers-payments', 'Read Customers Payments', 'Read Customers Payments', '2023-10-06 09:10:00', '2023-10-06 09:10:00'),
(119, 'update-customers-payments', 'Update Customers Payments', 'Update Customers Payments', '2023-10-06 09:10:00', '2023-10-06 09:10:00'),
(120, 'read-customers-transactions', 'Read Customers Transactions', 'Read Customers Transactions', '2023-10-06 09:10:01', '2023-10-06 09:10:01'),
(121, 'read-customers-profile', 'Read Customers Profile', 'Read Customers Profile', '2023-10-06 09:10:01', '2023-10-06 09:10:01'),
(122, 'update-customers-profile', 'Update Customers Profile', 'Update Customers Profile', '2023-10-06 09:10:01', '2023-10-06 09:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_reconciliations`
--

CREATE TABLE `ewd_reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_recurring`
--

CREATE TABLE `ewd_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_id` int(10) UNSIGNED NOT NULL,
  `recurable_type` varchar(191) NOT NULL,
  `frequency` varchar(191) NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_revenues`
--

CREATE TABLE `ewd_revenues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_roles`
--

CREATE TABLE `ewd_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_roles`
--

INSERT INTO `ewd_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2023-10-06 09:09:34', '2023-10-06 09:09:34'),
(2, 'manager', 'Manager', 'Manager', '2023-10-06 09:09:51', '2023-10-06 09:09:51'),
(3, 'customer', 'Customer', 'Customer', '2023-10-06 09:10:00', '2023-10-06 09:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_role_permissions`
--

CREATE TABLE `ewd_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_role_permissions`
--

INSERT INTO `ewd_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
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
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(2, 1),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(3, 115),
(3, 116),
(3, 117),
(3, 118),
(3, 119),
(3, 120),
(3, 121),
(3, 122);

-- --------------------------------------------------------

--
-- Table structure for table `ewd_sessions`
--

CREATE TABLE `ewd_sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_settings`
--

CREATE TABLE `ewd_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_settings`
--

INSERT INTO `ewd_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'general.default_account', '1'),
(2, 1, 'general.financial_start', '01-01'),
(3, 1, 'general.timezone', 'Europe/London'),
(4, 1, 'general.date_format', 'd M Y'),
(5, 1, 'general.date_separator', 'space'),
(6, 1, 'general.percent_position', 'after'),
(7, 1, 'general.invoice_number_prefix', 'INV-'),
(8, 1, 'general.invoice_number_digit', '5'),
(9, 1, 'general.invoice_number_next', '1'),
(10, 1, 'general.default_payment_method', 'offlinepayment.cash.1'),
(11, 1, 'general.email_protocol', 'mail'),
(12, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(13, 1, 'general.send_invoice_reminder', '0'),
(14, 1, 'general.schedule_invoice_days', '1,3,5,10'),
(15, 1, 'general.send_bill_reminder', '0'),
(16, 1, 'general.schedule_bill_days', '10,5,3,1'),
(17, 1, 'general.send_item_reminder', '0'),
(18, 1, 'general.schedule_item_stocks', '3,5,7'),
(19, 1, 'general.schedule_time', '09:00'),
(20, 1, 'general.admin_theme', 'skin-green-light'),
(21, 1, 'general.list_limit', '25'),
(22, 1, 'general.use_gravatar', '0'),
(23, 1, 'general.session_handler', 'file'),
(24, 1, 'general.session_lifetime', '30'),
(25, 1, 'general.file_size', '2'),
(26, 1, 'general.file_types', 'pdf,jpeg,jpg,png'),
(27, 1, 'general.wizard', '0'),
(28, 1, 'general.invoice_item', 'settings.invoice.item'),
(29, 1, 'general.invoice_price', 'settings.invoice.price'),
(30, 1, 'general.invoice_quantity', 'settings.invoice.quantity'),
(31, 1, 'general.company_name', 'TATA'),
(32, 1, 'general.company_email', 'tatacompany@gmail.com'),
(33, 1, 'general.default_currency', 'USD'),
(34, 1, 'general.default_locale', 'en-GB'),
(35, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_taxes`
--

CREATE TABLE `ewd_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_transfers`
--

CREATE TABLE `ewd_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_users`
--

CREATE TABLE `ewd_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) NOT NULL DEFAULT 'en-GB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_users`
--

INSERT INTO `ewd_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `locale`) VALUES
(1, '', 'admin@gmail.com', '$2y$10$K0Kqm.L7M0EOIlVWFN6zK.AUlosOmC6fZYcxjPEoED5ZIxfdwhrtu', NULL, '2023-10-08 10:35:22', 1, '2023-10-06 09:10:45', '2023-10-08 10:35:22', NULL, 'en-GB'),
(5, 'Mahesh Ravi2w', 'ww@gmail.com', '$2y$10$lmbG3Qg1bGt2ghzGxk1A0O3YngvJrzsiRyCAum.RM5EFJRLf7HXpi', NULL, NULL, 1, '2023-10-10 10:25:07', '2023-10-10 10:25:07', NULL, 'en-GB'),
(6, 'Mahesh Ravi2w', 'ww@gmail.com', '$2y$10$boct1QMjCMpm47MFiNHfdu/VU8EiVQe2Ac4iT5y.XSaoQ8twHm/BG', NULL, NULL, 1, '2023-10-10 10:26:58', '2023-10-10 10:26:58', NULL, 'en-GB'),
(7, 'Mahesh Ravi2ws', 'wsw@gmail.com', '$2y$10$87rws79FbblfVtuBn7F5OeFYHMfOPO5pr1jd1Uyu9m9S7GbJweS7O', NULL, NULL, 1, '2023-10-10 10:34:18', '2023-10-10 10:34:18', NULL, 'en-GB');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_user_companies`
--

CREATE TABLE `ewd_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_user_companies`
--

INSERT INTO `ewd_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_user_permissions`
--

CREATE TABLE `ewd_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewd_user_roles`
--

CREATE TABLE `ewd_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewd_user_roles`
--

INSERT INTO `ewd_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users'),
(5, 1, 'users'),
(6, 1, 'users'),
(7, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `ewd_vendors`
--

CREATE TABLE `ewd_vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `tax_number` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ewd_accounts`
--
ALTER TABLE `ewd_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bills`
--
ALTER TABLE `ewd_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `bills_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_histories`
--
ALTER TABLE `ewd_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_items`
--
ALTER TABLE `ewd_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_item_taxes`
--
ALTER TABLE `ewd_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_payments`
--
ALTER TABLE `ewd_bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_statuses`
--
ALTER TABLE `ewd_bill_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_bill_totals`
--
ALTER TABLE `ewd_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_categories`
--
ALTER TABLE `ewd_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_companies`
--
ALTER TABLE `ewd_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewd_currencies`
--
ALTER TABLE `ewd_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_customers`
--
ALTER TABLE `ewd_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `customers_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_failed_jobs`
--
ALTER TABLE `ewd_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewd_invoices`
--
ALTER TABLE `ewd_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `invoices_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_histories`
--
ALTER TABLE `ewd_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_items`
--
ALTER TABLE `ewd_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_item_taxes`
--
ALTER TABLE `ewd_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_payments`
--
ALTER TABLE `ewd_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_statuses`
--
ALTER TABLE `ewd_invoice_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_invoice_totals`
--
ALTER TABLE `ewd_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_items`
--
ALTER TABLE `ewd_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  ADD KEY `items_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_jobs`
--
ALTER TABLE `ewd_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `ewd_media`
--
ALTER TABLE `ewd_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `ewd_mediables`
--
ALTER TABLE `ewd_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `mediables_tag_index` (`tag`),
  ADD KEY `mediables_order_index` (`order`);

--
-- Indexes for table `ewd_migrations`
--
ALTER TABLE `ewd_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewd_modules`
--
ALTER TABLE `ewd_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `modules_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_module_histories`
--
ALTER TABLE `ewd_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `ewd_notifications`
--
ALTER TABLE `ewd_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `ewd_password_resets`
--
ALTER TABLE `ewd_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `ewd_payments`
--
ALTER TABLE `ewd_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_permissions`
--
ALTER TABLE `ewd_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `ewd_reconciliations`
--
ALTER TABLE `ewd_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_recurring`
--
ALTER TABLE `ewd_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_recurable_id_recurable_type_index` (`recurable_id`,`recurable_type`);

--
-- Indexes for table `ewd_revenues`
--
ALTER TABLE `ewd_revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_roles`
--
ALTER TABLE `ewd_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `ewd_role_permissions`
--
ALTER TABLE `ewd_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `ewd_sessions`
--
ALTER TABLE `ewd_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `ewd_settings`
--
ALTER TABLE `ewd_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_taxes`
--
ALTER TABLE `ewd_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_transfers`
--
ALTER TABLE `ewd_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_index` (`company_id`);

--
-- Indexes for table `ewd_users`
--
ALTER TABLE `ewd_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `ewd_user_companies`
--
ALTER TABLE `ewd_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `ewd_user_permissions`
--
ALTER TABLE `ewd_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `ewd_user_roles`
--
ALTER TABLE `ewd_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `ewd_vendors`
--
ALTER TABLE `ewd_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `vendors_company_id_index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ewd_accounts`
--
ALTER TABLE `ewd_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ewd_bills`
--
ALTER TABLE `ewd_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_bill_histories`
--
ALTER TABLE `ewd_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_bill_items`
--
ALTER TABLE `ewd_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_bill_item_taxes`
--
ALTER TABLE `ewd_bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_bill_payments`
--
ALTER TABLE `ewd_bill_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_bill_statuses`
--
ALTER TABLE `ewd_bill_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ewd_bill_totals`
--
ALTER TABLE `ewd_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_categories`
--
ALTER TABLE `ewd_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ewd_companies`
--
ALTER TABLE `ewd_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ewd_currencies`
--
ALTER TABLE `ewd_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ewd_customers`
--
ALTER TABLE `ewd_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_failed_jobs`
--
ALTER TABLE `ewd_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoices`
--
ALTER TABLE `ewd_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoice_histories`
--
ALTER TABLE `ewd_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoice_items`
--
ALTER TABLE `ewd_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoice_item_taxes`
--
ALTER TABLE `ewd_invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoice_payments`
--
ALTER TABLE `ewd_invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_invoice_statuses`
--
ALTER TABLE `ewd_invoice_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ewd_invoice_totals`
--
ALTER TABLE `ewd_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_items`
--
ALTER TABLE `ewd_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_jobs`
--
ALTER TABLE `ewd_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_media`
--
ALTER TABLE `ewd_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_migrations`
--
ALTER TABLE `ewd_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `ewd_modules`
--
ALTER TABLE `ewd_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ewd_module_histories`
--
ALTER TABLE `ewd_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ewd_payments`
--
ALTER TABLE `ewd_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_permissions`
--
ALTER TABLE `ewd_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `ewd_reconciliations`
--
ALTER TABLE `ewd_reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_recurring`
--
ALTER TABLE `ewd_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_revenues`
--
ALTER TABLE `ewd_revenues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_roles`
--
ALTER TABLE `ewd_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ewd_settings`
--
ALTER TABLE `ewd_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ewd_taxes`
--
ALTER TABLE `ewd_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_transfers`
--
ALTER TABLE `ewd_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewd_users`
--
ALTER TABLE `ewd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ewd_vendors`
--
ALTER TABLE `ewd_vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ewd_mediables`
--
ALTER TABLE `ewd_mediables`
  ADD CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `ewd_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ewd_role_permissions`
--
ALTER TABLE `ewd_role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ewd_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ewd_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ewd_user_permissions`
--
ALTER TABLE `ewd_user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ewd_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ewd_user_roles`
--
ALTER TABLE `ewd_user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ewd_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
