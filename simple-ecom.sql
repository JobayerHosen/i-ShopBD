-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2019 at 11:30 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simple-ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `first` varchar(45) NOT NULL,
  `last` varchar(45) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `first`, `last`, `email`, `pwd`) VALUES
(1, 'Jobayer', 'Hosen', 'juba2732@gmail.com', '$2y$10$AtyI9EG7LcXYEFj3Wg3hYOOA6D4hlkSzwEq2Aen4W0ZaOYRbN.lgq');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(9, 'Acer'),
(1, 'Apple'),
(8, 'Asus'),
(10, 'Canon'),
(11, 'Dell'),
(3, 'Google'),
(6, 'HP'),
(4, 'Huawei'),
(2, 'Microsoft'),
(12, 'Nikon'),
(5, 'Samsung'),
(13, 'Toshiba'),
(7, 'Xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_user_id` int(11) NOT NULL,
  `cart_product_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_user_id`, `cart_product_id`, `cart_quantity`) VALUES
(9, 201, 21, 2),
(10, 201, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `featured-products`
--

CREATE TABLE `featured-products` (
  `featured_product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `featured-products`
--

INSERT INTO `featured-products` (`featured_product_id`, `feature_id`) VALUES
(15, 1),
(10, 2),
(7, 3),
(11, 4),
(18, 5),
(13, 6),
(20, 7),
(21, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` int(11) DEFAULT NULL,
  `order_ship_address` text NOT NULL,
  `oder_city` varchar(45) NOT NULL,
  `oder_zip` int(11) DEFAULT NULL,
  `order_phone` varchar(45) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_shiped` tinyint(4) DEFAULT '0',
  `order_tracking_number` varchar(100) DEFAULT NULL,
  `order_completed` tinyint(4) NOT NULL DEFAULT '0',
  `order_payment_method_id` int(11) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_user_id`, `order_ship_address`, `oder_city`, `oder_zip`, `order_phone`, `order_date`, `order_shiped`, `order_tracking_number`, `order_completed`, `order_payment_method_id`) VALUES
(1, 201, '', '', NULL, NULL, '2019-09-06 05:29:48', 0, NULL, 0, 2),
(21, 201, '', '', NULL, NULL, '2019-07-23 22:27:36', 0, NULL, 0, NULL),
(22, 201, '', '', NULL, NULL, '2019-07-23 22:28:28', 0, NULL, 0, NULL),
(23, 201, '', '', NULL, NULL, '2019-07-23 22:36:44', 0, NULL, 0, NULL),
(24, 201, '', '', NULL, NULL, '2019-07-24 00:38:30', 0, NULL, 0, 2),
(29, 0, '', '', NULL, NULL, '2019-11-29 18:47:09', 0, NULL, 0, 2),
(30, 0, '', '', NULL, NULL, '2019-12-02 14:41:04', 0, NULL, 0, 2),
(31, 0, '', '', NULL, NULL, '2019-12-02 18:31:10', 0, NULL, 0, 2),
(32, 201, '', '', NULL, NULL, '2019-12-02 18:32:36', 0, NULL, 0, 2),
(33, 201, '', '', NULL, NULL, '2019-12-02 18:39:29', 0, NULL, 0, 2),
(34, 201, '', '', NULL, NULL, '2019-12-02 18:39:59', 0, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `orders_order_id` int(11) NOT NULL,
  `products_product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `orders_order_id`, `products_product_id`, `product_quantity`) VALUES
(1, 0, 21, 2),
(25, 21, 15, 1),
(26, 21, 10, 1),
(27, 21, 18, 1),
(28, 21, 8, 1),
(29, 22, 15, 1),
(30, 22, 10, 1),
(31, 22, 18, 1),
(32, 22, 8, 1),
(33, 23, 15, 1),
(34, 23, 10, 1),
(35, 23, 18, 2),
(36, 23, 8, 1),
(37, 24, 21, 2),
(38, 29, 7, 1),
(39, 30, 7, 1),
(40, 30, 15, 1),
(41, 30, 18, 1),
(42, 31, 18, 1),
(43, 32, 18, 1),
(44, 33, 18, 1),
(45, 33, 15, 1),
(46, 33, 11, 1),
(47, 33, 21, 1),
(48, 34, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_order_id` int(11) DEFAULT NULL,
  `payment_amount` float NOT NULL,
  `payment_completed` tinyint(4) NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_order_id`, `payment_amount`, `payment_completed`, `payment_date`) VALUES
(1, 0, 97100, 0, NULL),
(3, 21, 317100, 0, NULL),
(4, 22, 317100, 0, NULL),
(5, 23, 372100, 0, NULL),
(6, 24, 32100, 0, NULL),
(7, 29, 50100, 0, NULL),
(8, 30, 170100, 0, NULL),
(9, 31, 55100, 0, NULL),
(10, 32, 55100, 0, NULL),
(11, 33, 287100, 0, NULL),
(12, 34, 32100, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL,
  `payment_method_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`) VALUES
(1, 'Bkash'),
(2, 'Cash-on-Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_thumb` varchar(255) DEFAULT NULL,
  `product_description` text,
  `product_stock` int(11) NOT NULL,
  `product_brand_id` int(11) NOT NULL,
  `product_catagory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_thumb`, `product_description`, `product_stock`, `product_brand_id`, `product_catagory_id`) VALUES
(1, 'APPLE MACBOOK PRO, core i7, 8th gen, 16GB RAM, 256GB SSD', 118000, 'pics/pic5ceacd5ad86430.65269467.jpeg', '<h2><strong><span style=\"color:#e74c3c\">APPLE MACBOOK PRO</span></strong></h2>\r\n\r\n<p>It&#39;s faster and more powerful than before. It has the brightest, most colorful Mac notebook display ever. And it features the Touch Bar - a Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. MacBook Pro is built on groundbreaking ideas. And it&#39;s ready for yours.</p>\r\n\r\n<h3><strong>Speciifcations:</strong></h3>\r\n\r\n<ul>\r\n	<li><span style=\"color:#e74c3c\">2.2GHz 6-core 8th-generation Intel&nbsp;Core&nbsp;i7 processor</span></li>\r\n	<li><span style=\"color:#e74c3c\">Turbo Boost up to 4.1GHz</span></li>\r\n	<li><span style=\"color:#e74c3c\">Radeon Pro 555X with 4GB of GDDR5 memory</span></li>\r\n	<li><span style=\"color:#e74c3c\">16GB 2400MHz DDR4 memory</span></li>\r\n	<li><span style=\"color:#e74c3c\">256GB SSD storage<sup>1</sup></span></li>\r\n	<li><span style=\"color:#e74c3c\">Retina display with True Tone</span></li>\r\n	<li><span style=\"color:#e74c3c\">Touch Bar and Touch ID</span></li>\r\n	<li><span style=\"color:#e74c3c\">Four Thunderbolt 3 ports</span></li>\r\n</ul>\r\n\r\n<p><span style=\"color:#7f8c8d\">It&#39;s razor thin, feather-light, and even faster and more powerful than before. It has the brightest, most colorful Mac notebook display ever. And it features the Touch Bar - a Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. MacBook Pro is built on groundbreaking ideas. And it&#39;s ready for yours.</span></p>\r\n\r\n<p><span style=\"color:#7f8c8d\">A revolutionary new way to use your Mac.The Touch Bar replaces the function keys that have long occupied the top of your keyboard with something much more versatile and capable.It changes automatically based on what you&#39;re doing to show you relevant tools you already know how to use - system controls like volume and brightness, interactive ways to adjust or browse through content, intelligent typing features like emoji and predictive text, and more. And now, Touch ID is available on a Mac enabling instant access to logins and so much more.</span></p>\r\n\r\n<p><span style=\"color:#7f8c8d\">Impressive all-day battery life.MacBook Pro packs more performance into a thin design, yet still provides all-day battery life - up to 10 hours. So you&#39;re free to keep watching, gaming, and editing from wherever you are.</span></p>\r\n', 0, 1, 1),
(5, 'Apple Macbook Air 13.3-inch Retina Display, Core i5, 8GB Ram, 128GB SSD MRE82LL/A Space Gray (2018)', 110000, 'pics/pic5d0a81b5d74859.44641485.jpg', '<h1>Apple Macbook Air 13.3-inch Retina Display, Core i5, 8GB Ram, 128GB SSD MRE82LL/A Space Gray (2018)</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>110,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>114,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8643</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i5 Processor 1.6GHz Up to 3.6GHz</li>\r\n	<li>8GB of 2133MHz LPDDR3</li>\r\n	<li>128GB PCIe-based SSD</li>\r\n	<li>13.3&quot; Retina Display</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel Core i5 8th Gen 1.6GHz dual-core Turbo Boost up to 3.6GHz, with 4MB L3 cache</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>13.3-inch Retina LED-backlit display with IPS technology; 2560-by-1600 native resolution at 227 pixels per inch with support for millions of colors</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>8GB of 2133MHz LPDDR3 onboard memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>128GB PCIe-based SSD<br />\r\n			&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>Intel UHD Graphics 617</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>macOS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>Built-in 50.3â€‘wattâ€‘hour lithiumâ€‘polymer battery<br />\r\n			Up to 12 hours wireless web<br />\r\n			Up to 13 hours iTunes movie playback<br />\r\n			Up to 30 days of standby time</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Adapter</td>\r\n			<td>30W USB-C Power Adapter; USB-C power port</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Stereo speakers<br />\r\n			Three microphones</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>78 (U.S.) or 79 (ISO) individual LED-backlit keys, including 12 function keys and 4 arrow keys<br />\r\n			Ambient light sensor<br />\r\n			Force Touch trackpad for precise cursor control and pressure-sensing capabilities; enables Force clicks, accelerators, pressure-sensitive drawing, and Multi-Touch gestures</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>No</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>720p FaceTime HD camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card Reader</td>\r\n			<td>USB-C to SD Card Reader</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Bluetooth 4.2 wireless technology</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>USB-C 3.1 Gen 2 (up to 10 Gbps)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>3.5 mm headphone jack</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>Height: 0.16&ndash;0.61 inch (0.41&ndash;1.56 cm)<br />\r\n			Width: 11.97 inches (30.41 cm)<br />\r\n			Depth: 8.36 inches (21.24 cm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>2.75 pounds (1.25 kg)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Space Gray</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>01 year</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 10, 1, 1),
(6, 'HP 15-db0001au AMD Dual Core E2-9000e 15.6\" HD Laptop With Genuine Win 10', 23000, 'pics/pic5d0a8304d0ead6.17555411.jpg', '<h1>HP 15-db0001au AMD Dual Core E2-9000e 15.6&quot; HD Laptop With Genuine Win 10</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>23,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>23,530à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8130</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>HP</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>AMD Dual-Core E2-9000e Processor (1.5 GHz up to 2 GHz)</li>\r\n	<li>4 GB DDR4 Ram</li>\r\n	<li>500 GB 5400 rpm SATA</li>\r\n	<li>15.6&quot; WLED-backlit (1366 x 768)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>AMD Dual-Core E2-9000e (1.5 GHz base frequency, up to 2 GHz burst frequency, 1 MB cache)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>15.6&quot; diagonal HD SVA BrightView WLED-backlit (1366 x 768)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>4 GB DDR4 Ram</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>500 GB 5400 rpm SATA</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>AMD Radeon&trade; R2 Graphics</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Windows 10 Genuine</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>3-cell, 41 Wh Li-ion</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Adapter</td>\r\n			<td>45 W AC power adapter</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Dual speakers</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Full-size island-style keyboard</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>DVD-Writer</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>HP TrueVision HD Camera with integrated digital microphone</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card Reader</td>\r\n			<td>1 multi-format SD media card reader</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>LAN</td>\r\n			<td>Integrated 10/100/1000 GbE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>Intel&reg; 802.11a/b/g/n/ac</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>4.2 Combo</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>1 USB 2.0; 2 USB 3.1 Gen 1 (Data transfer only)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>HDMI</td>\r\n			<td>1 HDMI 1.4b</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>1 headphone/microphone combo</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>37.6 x 24.6 x 2.25 cm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>Starting at 1.77 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Silver</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>1 year ( 1 year battery and adapter ) international warranty</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 8, 6, 1),
(7, 'HP Probook 450 G6 Core i5 8th Gen 15.6 Inch HD Notebook PC', 50000, 'pics/pic5d0a83c415b1c2.59994350.jpg', '<h1>HP Probook 450 G6 Core i5 8th Gen 15.6 Inch HD Notebook PC</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>50,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>52,400à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>10052</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>HP</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i5-8265U Processor (6M Cache, 1.60 GHz up to 3.90 GHz)</li>\r\n	<li>4GB DDR4 RAM</li>\r\n	<li>1 TB Hard Drive</li>\r\n	<li>15.6&quot; HD (1366 x 768) LED backlit</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel Core i5-8265U Processor (6M Cache, 1.60 GHz up to 3.90 GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>15.6 Inch HD (1366 x 768) SVA eDP anti-glare LED-backlit Ultraslim</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>4GB DDR4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB HDD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>Integrated Intel UHD Graphics 620</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chipset</td>\r\n			<td>Integrated with processor</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Free DOS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>HP Long Life 3-cell, 45 Wh Li-ion<br />\r\n			Battery Weight: 0.22 kg (0.49 lb)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Adapter</td>\r\n			<td>HP Smart 45 W External AC power adapter<br />\r\n			HP Smart 45 W USB Type-C adapter</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Integrated microphone (mono or dual-array)<br />\r\n			(2) Integrated stereo speakers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Special Feature</td>\r\n			<td>Finger Print Sensor</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Spill-resistant with optional backlit function</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>720p HD HP and IR Camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card Reader</td>\r\n			<td>(1) SD Card reader</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>LAN</td>\r\n			<td>HP LAN-Wireless Protection</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>Realtek RTL8822BE 802.11ac (2x2) WLAN</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Bluetooth 4.2 Combo</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>(1) USB 3.1 Type-C Gen 1 (Power Delivery, DisplayPort)<br />\r\n			(2) USB 3.1 Gen 1<br />\r\n			(1) USB 2.0 (Powered port)<br />\r\n			HP Smart 45 W USB Type-C adapter</td>\r\n		</tr>\r\n		<tr>\r\n			<td>HDMI</td>\r\n			<td>(1) HDMI 1.4b</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>(1) Headphone/microphone combo jack</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Extra RAM Slot</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M.2</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>36.50 x 25.68 x 1.91 cm (14.37 x 10.11 x 0.75 in)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>Starting at 2.0 kg (4.41 lb)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Silver</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>02 years Warranty (battery &amp; adapter 01 year)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 8, 6, 1),
(8, 'Apple MacBook Pro 13-inch Retina Display with Touch Bar, Core i5, 8GB RAM, 256GB SSD, Space Gray MR9Q2LL/A (2018)', 155000, 'pics/pic5d0a84a2d75ed5.36657336.jpg', '<h1>Apple MacBook Pro 13-inch Retina Display with Touch Bar, Core i5, 8GB RAM, 256GB SSD, Space Gray MR9Q2LL/A (2018)</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>155,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>158,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8110</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i5 8th Gen Ice Lake 2.3GHz up to 3.8GHz</li>\r\n	<li>8GB 2133MHz memory</li>\r\n	<li>256GB SSD Storage</li>\r\n	<li>13.3-backlit IPS (2560-by-1600)</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>2.3GHz quad-core Intel Core i5 Ice Lake, Turbo Boost up to 3.8GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>13.3-inch (diagonal) LED-backlit display with IPS technology; 2560-by-1600 native resolution at 227 pixels per inch with support for millions of colors</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>8GB of 2133MHz LPDDR3 onboard memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>256GB onboard SSD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>Intel Iris Plus Graphics 655</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Mac OS Sierra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>Built-in 58.0-watt-hour lithium-polymer battery</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Adapter</td>\r\n			<td>61W USB-C Power Adapter</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Full-size English backlit keyboard with: 64 (U.S.) or 65 (ISO) keys including 4 arrow keys<br />\r\n			Touch Bar with integrated Touch ID sensor<br />\r\n			Ambient light sensor<br />\r\n			Force Touch trackpad for precise cursor control and pressure-sensing capabilities; enables Force clicks, accelerators, pressure-sensitive drawing, and Multi-Touch gestures</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>No</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>720p FaceTime HD camera</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Bluetooth 5.0 wireless technology</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>Four Thunderbolt 3 (USB-C) ports&nbsp;<br />\r\n			with support for: Charging, DisplayPort, Thunderbolt (up to 40 Gbps), USB 3.1 Gen 2 (up to 10 Gbps)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>3.5 mm headphone jack</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>Height: 0.59 inch (1.49 cm)<br />\r\n			Width: 11.97 inches (30.41 cm)<br />\r\n			Depth: 8.36 inches (21.24 cm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>3.02 pounds (1.37 kg)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Grey</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>01 year</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 7, 1, 1),
(9, 'Apple Macbook Air 13.3-inch Retina Display, Core i5, 8GB Ram, 128GB SSD MRE82LL/A Space Gray (2018)', 110000, 'pics/pic5d0a857726b928.58929166.jpg', '<h1>Apple Macbook Air 13.3-inch Retina Display, Core i5, 8GB Ram, 128GB SSD MRE82LL/A Space Gray (2018)</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>110,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>114,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8643</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i5 Processor 1.6GHz Up to 3.6GHz</li>\r\n	<li>8GB of 2133MHz LPDDR3</li>\r\n	<li>128GB PCIe-based SSD</li>\r\n	<li>13.3&quot; Retina Display</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel Core i5 8th Gen 1.6GHz dual-core Turbo Boost up to 3.6GHz, with 4MB L3 cache</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>13.3-inch Retina LED-backlit display with IPS technology; 2560-by-1600 native resolution at 227 pixels per inch with support for millions of colors</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>8GB of 2133MHz LPDDR3 onboard memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>128GB PCIe-based SSD<br />\r\n			&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>Intel UHD Graphics 617</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>macOS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>Built-in 50.3â€‘wattâ€‘hour lithiumâ€‘polymer battery<br />\r\n			Up to 12 hours wireless web<br />\r\n			Up to 13 hours iTunes movie playback<br />\r\n			Up to 30 days of standby time</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Adapter</td>\r\n			<td>30W USB-C Power Adapter; USB-C power port</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Stereo speakers<br />\r\n			Three microphones</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>78 (U.S.) or 79 (ISO) individual LED-backlit keys, including 12 function keys and 4 arrow keys<br />\r\n			Ambient light sensor<br />\r\n			Force Touch trackpad for precise cursor control and pressure-sensing capabilities; enables Force clicks, accelerators, pressure-sensitive drawing, and Multi-Touch gestures</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>No</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>720p FaceTime HD camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card Reader</td>\r\n			<td>USB-C to SD Card Reader</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>Bluetooth 4.2 wireless technology</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>USB-C 3.1 Gen 2 (up to 10 Gbps)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>3.5 mm headphone jack</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>Height: 0.16&ndash;0.61 inch (0.41&ndash;1.56 cm)<br />\r\n			Width: 11.97 inches (30.41 cm)<br />\r\n			Depth: 8.36 inches (21.24 cm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>2.75 pounds (1.25 kg)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Space Gray</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>01 year</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 9, 1, 1),
(10, 'Dell Inspiron 5570 Core i3 8th Gen Laptop With Genuine Win 10', 42000, 'pics/pic5d0a8886de04f2.65997366.jpg', '<h1>Dell Inspiron 5570 Core i3 8th Gen Laptop With Genuine Win 10</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>42,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>42,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>9622</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Dell</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i3-8130U ( 2.20 GHz up to 3.40 GHz)</li>\r\n	<li>4GB DDR4 2400MHz</li>\r\n	<li>1TB HDD</li>\r\n	<li>15.6&quot; (1920x1080) FHD</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel Core i3-8130U Processor (4M Cache, 2.20 GHz up to 3.40 GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Display</td>\r\n			<td>15.6&quot; Resolution (1920x1080) FHD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory</td>\r\n			<td>4GB DDR4 2400MHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB HDD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics</td>\r\n			<td>Intel UHD Graphics 620</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Genuine Win 10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery</td>\r\n			<td>3 Cell</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>High Definition Audio with Waves MaxxAudio Pro, 1 combo headphone / microphone jack</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Standard full size spill-resistant keyboard</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>DVD RW</td>\r\n		</tr>\r\n		<tr>\r\n			<td>WebCam</td>\r\n			<td>Integrated widescreen HD (720p)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card Reader</td>\r\n			<td>SD Card Reader (SD, SDHC, SDXC)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Network &amp; Wireless Connectivity</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>LAN</td>\r\n			<td>10/100 Ethernet</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wi-Fi</td>\r\n			<td>1704 802.11b/g/n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>4.1</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Ports, Connectors &amp; Slots</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>USB (s)</td>\r\n			<td>USB 3.1 Gen 1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>HDMI</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio Jack Combo</td>\r\n			<td>1 combo headphone / microphone jack</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M.2</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Physical Specification</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x D x H)</td>\r\n			<td>Height: 22.7mm (0.89)&nbsp;<br />\r\n			Width: 380mm (14.96)<br />\r\n			Depth: 258mm (10.16)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight</td>\r\n			<td>Starting Weight: 4.85 lbs (2.20kg)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Color(s)</td>\r\n			<td>Black</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Manufacturing Warranty</td>\r\n			<td>2 years (Battery, Adapter 1 year)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 7, 11, 1),
(11, 'Apple iMac 4K 21\" (MNE02) 3.4GHz Quad-Core Intel Core i5', 151000, 'pics/pic5d0a8a3248c454.76309103.jpg', '<h1>Apple iMac 4K 21&quot; (MNE02) 3.4GHz Quad-Core Intel Core i5</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>151,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>157,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>7062</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>3.4 GHz quad-core Intel Core i5 (Boost up to 3.8 GHz)</li>\r\n	<li>8GB of 2400MHz DDR4</li>\r\n	<li>1TB Fusion Drive Storage</li>\r\n	<li>21.5-inchRetina 4K display</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>3.4 GHz quad-core Intel Core i5 (Boost up to 3.8 GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>8GB of 2400MHz DDR4 onboard memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics Card</td>\r\n			<td>Radeon Pro 560 with 4GB of VRAM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB Fusion Drive</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Monitor</td>\r\n			<td>21.5-inch (diagonal) Retina 4K display 4096-by-2304 resolution with support for one billion colors 500 nits brightness Wide color (P3)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Audio Stereo speakers, Microphone, 3.5 mm headphone jack</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Power Supply</td>\r\n			<td>100&ndash;240V AC</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Network &amp; Wireless Connectivity</td>\r\n			<td>Wireless 802.11ac Wi-Fi wireless networking IEEE 802.11a/b/g/n compatible</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Input Magic Keyboard, Magic Keyboard with Numeric Keypad</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mouse</td>\r\n			<td>Magic Mouse 2, Magic Trackpad 2</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>One Year International Limited Warranty (parts &amp; labor)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 8, 1, 2),
(12, 'Apple iMac 21.5\" MMQA2 Core i5 8GB RAM 1TB Storage', 111000, 'pics/pic5d0a8aa6cb86f2.26908217.jpg', '<h1>Apple iMac 21.5&quot; MMQA2 Core i5 8GB RAM 1TB Storage</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>111,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>115,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>6061</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel 2.3GHz dualâ€‘core i5 (Turbo Boost up to 3.6GHz)</li>\r\n	<li>8GB of 2133MHz DDR4</li>\r\n	<li>1TB (5400-rpm) hard drive</li>\r\n	<li>21.5-inch 1920x1080 display</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Desktop PC</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor Type</td>\r\n			<td>Intel 7th Gen 2.3GHz dualâ€‘core i5 (Turbo Boost up to 3.6GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Processor Speed</td>\r\n			<td>2.3GHz dualâ€‘core i5 (Turbo Boost up to 3.6GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>8GB of 2133MHz DDR4 onboard memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hard Disk</td>\r\n			<td>1TB (5400-rpm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Monitor</td>\r\n			<td>21.5-inch (diagonal) LEDâ€‘backlit 1920x1080 resolution with support for millions of colours display</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics Card</td>\r\n			<td>Intel Iris Plus Graphics 640</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lan</td>\r\n			<td>Wi-Fi-802.11ac Wi-Fi wireless networking, IEEE 802.11a/b/g/n compatible II<br />\r\n			Bluetooth- 4.2 wireless technology II</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Stereo speakers II<br />\r\n			<br />\r\n			Microphone II<br />\r\n			<br />\r\n			3.5mm headphone jack II<br />\r\n			<br />\r\n			Support for Apple iPhone headset with microphone II</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating system</td>\r\n			<td>macOS Sierra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mouse</td>\r\n			<td>Apple Magic Mouse 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>Apple Magic Keyboard</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Interface</td>\r\n			<td>3.5 mm headphone jack,<br />\r\n			SDXC card slot,<br />\r\n			Four USB 3 ports (compatible with USB 2),<br />\r\n			Two Thunderbolt 3 (USB-C) ports with support for:<br />\r\n			DisplayPort,<br />\r\n			Thunderbolt (up to 40 Gbps),<br />\r\n			USB 3.1 Gen 2 (up to 10 Gbps),<br />\r\n			Thunderbolt 2, HDMI, DVI, and VGA supported using adapters (sold separately),<br />\r\n			10/100/1000BASE-T Gigabit Ethernet (RJ-45 connector),<br />\r\n			Kensington lock slot</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 5, 1, 2),
(13, 'HP ProOne 400 G4 Core i5 8th Gen All in One PC', 61000, 'pics/pic5d0a8b3618d837.53549995.jpg', '<h1>HP ProOne 400 G4 Core i5 8th Gen All in One PC</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>61,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>62,380à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>Out Of Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>9016</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>HP</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel Core i5-8500T (9M Cache,2.10 GHz up to 3.50 GHz)</li>\r\n	<li>8 GB DDR4 Ram</li>\r\n	<li>1TB HDD</li>\r\n	<li>20&quot; WLED-backlit (1600 x 900) Monitor</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel Core i5-8500T Processor (9M Cache,2.10 GHz up to 3.50 GHz)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Motherboard</td>\r\n			<td>Intel&reg; Q370</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>8 GB DDR4-2666 SDRAM (1 x 8 GB)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics Card</td>\r\n			<td>Intel&reg; UHD Graphics 630</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB 7200 RPM HDD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Monitor</td>\r\n			<td>20&quot; diagonal HD+ widescreen Non Touch LCD anti-glare WLED-backlit (1600 x 900) Monitor</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Conexant CX3601 codec, 2 W internal stereo speaker, headset and headphone side port (3.5 mm), multi-streaming capable</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Power Supply</td>\r\n			<td>120 W external power adapter, up to 89% efficiency</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Network &amp; Wireless Connectivity</td>\r\n			<td>LAN: Intel&reg; I219LM GbE<br />\r\n			WLAN: Realtek RTL8821CE-CG 802.11a/b/g/n/ac (1x1) with Bluetooth&reg; 4.2 M.2 PCIe</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Operating System</td>\r\n			<td>Free Dos</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>HP Wireless Keyboard</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mouse</td>\r\n			<td>HP Wireless Mouse</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>HP 9.5 mm Slim DVD-Writer</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>3 Years HP Standard Warranty</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 8, 6, 2),
(14, 'Asus AIO A4321UKH Core i3 7th Gen PC', 40500, 'pics/pic5d0a8bba2cf427.73560266.jpg', '<h1>Asus AIO A4321UKH Core i3 7th Gen PC</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>48,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>49,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>7732</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Asus</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Intel&reg; Core&trade; i3-7100U (2.40 GHz,3 MB SmartCache)</li>\r\n	<li>4 GB DDR4 Ram</li>\r\n	<li>1 TB HDD</li>\r\n	<li>19.5&quot; HD Monitor</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Intel&reg; Core&trade; i3-7100U (2.40 GHz,3 MB SmartCache, Core 2 Threads 4&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Motherboard</td>\r\n			<td>Intel&reg; H110</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>4GB DDR 4 2400 MHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics Card</td>\r\n			<td>Intel&reg; HD Graphics 620</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB 7200 RPM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Monitor</td>\r\n			<td>19.5&quot; HD Monitor</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Network &amp; Wireless Connectivity</td>\r\n			<td>802.11 a/b/g/n/ac, 802.11 a/b/g/n</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Input Devices</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Keyboard</td>\r\n			<td>USB Optical Keyboard</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mouse</td>\r\n			<td>USB Optical Mouse</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Optical Drive</td>\r\n			<td>Tray-in DVD RW 8X (Optional)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>01 Year Warranty</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 7, 8, 2),
(15, 'Apple Mac Mini (MGEN2) Core i5 Pc with 8gb ram & 1tb Hdd', 65000, 'pics/pic5d0a8c3f999eb6.56811635.jpg', '<h1>Apple Mac Mini (MGEN2) Core i5 Pc with 8gb ram &amp; 1tb Hdd</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>65,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>68,250à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>7047</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Processor 2.6GHz dual-core Intel Core i5</li>\r\n	<li>Storage 1TB (5400-rpm) hard drive</li>\r\n	<li>Memory 8GB of 1600MHz LPDDR3 memory</li>\r\n	<li>Graphics Intel Iris Graphics</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Basic Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Processor</td>\r\n			<td>Processor 2.6GHz dual-core Intel Core i5 (Turbo Boost up to 3.1GHz) with 3MB on-chip shared L3 cache</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>8GB of 1600MHz LPDDR3 Memory</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Graphics Card</td>\r\n			<td>Intel Iris Graphics</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Storage</td>\r\n			<td>1TB (5400-rpm) hard drive</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Audio</td>\r\n			<td>Audio Built-in speaker,Audio line in minijack (digital/analog)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Power Supply</td>\r\n			<td>Line voltage 100-240V AC</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Network &amp; Wireless Connectivity</td>\r\n			<td>802.11ac Wi-Fi wireless networking; IEEE 802.11a/g/b/n compatible, Bluetooth 4.0 wireless technology, 10/100/1000BASE-T Ethernet (RJ-45 connector)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Warranty Information</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>Limited Warranty and Service One year International Limited Warranty (parts &amp; labor)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 3, 1, 2),
(16, 'Canon EOS 1100D DSLR Camera With 18-55mm Lens', 23500, 'pics/pic5d0a8cb5b44336.12904603.jpg', '<h1>Canon EOS 1100D DSLR Camera With 18-55mm Lens</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>23,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>24,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8829</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Canon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Type CMOS sensor</li>\r\n	<li>Effective pixels: 12.20 megapixels</li>\r\n	<li>File size 1280 x 720 (30p/25p)</li>\r\n	<li>DIGIC 4 Image Processor</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE SENSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>CMOS sensor</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pixels</td>\r\n			<td>Effective pixels: Approx. 12.20 megapixels<br />\r\n			Total pixels: Approx. 12.60 megapixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Aspect Ratio</td>\r\n			<td>3:2</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FOCUSING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>AF Point</td>\r\n			<td>9 (Cross type at center)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Modes</td>\r\n			<td>One-Shot AF (ONE SHOT)<br />\r\n			AI Servo AF (AI SERVO)<br />\r\n			AI Focus AF (AI FOCUS)<br />\r\n			Manual focusing (MF)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">EXPOSURE CONTROL</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Metering Modes</td>\r\n			<td>63-zone TTL full aperture metering<br />\r\n			Evaluative metering (linkable to any AF point)<br />\r\n			Partial metering (approx. 10% of viewfinder at center)<br />\r\n			Center-weighted average metering</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ISO Sensitivity</td>\r\n			<td>Basic Zone modes: ISO 100-3200 set automatically<br />\r\n			Creative Zone modes:&nbsp;<br />\r\n			ISO 100-6400 set manually (1-stop increments),&nbsp;<br />\r\n			ISO 100-6400 set automatically,&nbsp;<br />\r\n			maximum ISO speed settable for ISO Auto</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHUTTER</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Shutter Speed</td>\r\n			<td>1/4000 to 1/60sec. (Full Auto mode),&nbsp;<br />\r\n			X-sync at 1/200 sec.<br />\r\n			1/4000 to 30 sec., bulb (Total shutter speed range, available range varies by shooting mode)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHOOTING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Color Space</td>\r\n			<td>sRGB, Adobe RGB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Continuous Shooting</td>\r\n			<td>JPEG: Max. approx. 3.0 shots/sec.<br />\r\n			RAW: Max. approx. 2.0 shots/sec.<br />\r\n			RAW+JPEG (Large/Fine): Approx 0.8shot/sec (averaged value)<br />\r\n			With RAW+JPEG Large/Fine, the continuous shooting speed will be slower after the third shot.</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FILE TYPE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Image Type</td>\r\n			<td>JPEG, RAW (14-bit, Canon original)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Image Size</td>\r\n			<td>RAW 5184x3456</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie Type</td>\r\n			<td>MOV</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie size</td>\r\n			<td>HD: 1280 x 720; 30p/25p<br />\r\n			* 30p: 29.97fps, 25p: 25.0fps</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LCD MONITOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>TFT color liquid-crystal monitor</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">STORAGE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Storage Type</td>\r\n			<td>SD/SDHC/SDXC card</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FLASH</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Built-in Flash</td>\r\n			<td>Retractable, auto pop-up flash</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Red-Eye Reduction</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n		<tr>\r\n			<td>External Flash Compatibility</td>\r\n			<td>External flash control, Flash C.Fn settings</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">PHYSICAL SPECIFICATIONS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x H x D)</td>\r\n			<td>129.9 x 99.7 x 77.9 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight (Body Only)</td>\r\n			<td>Approx. 450 g (Body only)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LENS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Lens Mount</td>\r\n			<td>EF/EF-S</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Focal Length</td>\r\n			<td>18-55mm IS II</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Manufacture Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>01 year warranty.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 5, 10, 4);
INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_thumb`, `product_description`, `product_stock`, `product_brand_id`, `product_catagory_id`) VALUES
(17, 'Canon EOS 600D 18-55 Lens DSLR Camera', 3000, 'pics/pic5d0a8d1744c720.50655285.jpg', '<h1>Canon EOS 600D 18-55 Lens DSLR Camera</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>30,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>31,950à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>7076</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Canon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>18 MP APS-C CMOS sensor</li>\r\n	<li>Powerful DIGIC processor</li>\r\n	<li>ISO 100-6400 sensitivity</li>\r\n	<li>Up to 3.7fps continuous shooting</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE SENSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>22.3 x 14.9mm CMOS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pixels</td>\r\n			<td>Approx. 18.0 megapixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Aspect Ratio</td>\r\n			<td>3:2</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE PROCESSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>DIGIC 4</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FOCUSING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>AF Point</td>\r\n			<td>9 AF points (f/5.6 cross type at centre, extra sensitivity at f/2.8)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Modes</td>\r\n			<td>AI Focus<br />\r\n			One Shot<br />\r\n			AI Servo</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">EXPOSURE CONTROL</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Metering Modes</td>\r\n			<td>TTL full aperture metering with 63-zone SPC<br />\r\n			(1) Evaluative metering (linked to all AF points)<br />\r\n			(2) Partial metering at center (approx. 9% of viewfinder)<br />\r\n			(3) Spot metering (approx. 4% of viewfinder at center)<br />\r\n			(4) Center weighted average metering</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ISO Sensitivity</td>\r\n			<td>AUTO (100-6400), 100-6400 Expandable to H (approx 12800) in 1-stop increments</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHUTTER</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Shutter Speed</td>\r\n			<td>30-1/4000 sec (1/2 or 1/3 stop increments), Bulb (Total shutter speed range. Available range varies by shooting mode)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHOOTING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Color Space</td>\r\n			<td>sRGB and Adobe RGB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Continuous Shooting</td>\r\n			<td>Max. Approx. 3.7fps for approx. 34 JPEG images&sup1;&sup3;, 6 images RAW</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FILE TYPE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Image Type</td>\r\n			<td>JPEG: Fine, Normal (Exif 2.30 compliant) / Design rule for Camera File system (2.0),&nbsp;<br />\r\n			RAW: RAW (14bit, Canon original RAW 2nd edition),&nbsp;<br />\r\n			Digital Print Order Format [DPOF] Version 1.1 compliant</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Image Size</td>\r\n			<td>JPEG 3:2: (L) 5184x3456, (M) 3456x2304, (S1) 2592x1728, (S2) 1920x1280, (S3) 720x480<br />\r\n			JPEG 4:3: (L) 4608x3456, (M) 3072x2304, (S1) 2304x1728, (S2) 1696x1280, (S3) 640x480<br />\r\n			JPEG 16:9: (L) 5184x2912, (M) 3456x1944, (S1) 2592x1456 (S2) 1920x1080, (S3) 720x400<br />\r\n			JPEG 1:1: (L) 3456x3456, (M) 2304x2304, (S1) 1728x1728, (S2) 1280x1280, (S3) 480x480<br />\r\n			RAW: (RAW) 5184x3456</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie Type</td>\r\n			<td>MOV (Video: H.264, Sound: Linear PCM)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie size</td>\r\n			<td>1920 x 1080 (29.97, 25, 23.976 fps)<br />\r\n			1280 x 720 (59.94, 50 fps)<br />\r\n			640 x 480 (30, 25 fps)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LCD MONITOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>Vari angle 7.7cm (3.0&quot;) 3:2 Clear View TFT, approx. 1040K dots</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Viewing Angle</td>\r\n			<td>Approx 170&deg;</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">STORAGE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Storage Type</td>\r\n			<td>SD card, SDHC card or SDXC card</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FLASH</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Built-in Flash</td>\r\n			<td>GN (ISO 100, meters)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Red-Eye Reduction</td>\r\n			<td>Yes - with red eye reduction lamp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>External Flash Compatibility</td>\r\n			<td>E-TTL II with EX series Speedlites, wireless multi-flash support</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">POWER SOURCE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Batteries</td>\r\n			<td>1 x Rechargeable Li-ion Battery LP-E8</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">PHYSICAL SPECIFICATIONS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x H x D)</td>\r\n			<td>133.1 x 99.5 x 79.7 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight (Body Only)</td>\r\n			<td>Approx. 570g (CIPA testing standard, including battery and memory card)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LENS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Lens Mount</td>\r\n			<td>EF/EF-S</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Focal Length</td>\r\n			<td>18 - 55 mm</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Manufacture Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>01 Year Warranty</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 3, 10, 4),
(18, 'Canon EOS 77D DSLR Camera With 18-55MM Lens', 55000, 'pics/pic5d0a8d907702b0.76651269.jpg', '<h1>Canon EOS 77D DSLR Camera With 18-55MM Lens</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>55,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>58,510à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>8987</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Canon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>24.2MP APS-C CMOS Sensor</li>\r\n	<li>DIGIC 7 Image Processor</li>\r\n	<li>TFT color, liquid-crystal monitor</li>\r\n	<li>Full HD 1080p Video Recording</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE SENSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>CMOS sensor (supporting Dual Pixel CMOS AF)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pixels</td>\r\n			<td>Effective pixels: Approx. 24.2 Megapixels<br />\r\n			Total pixels: Approx. 25.8 Megapixels</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Aspect Ratio</td>\r\n			<td>3:2 (Horizontal: Vertical)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE PROCESSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>DIGIC7</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">EXPOSURE CONTROL</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Metering Modes</td>\r\n			<td>Evaluative metering (315-zone)<br />\r\n			Partial metering (center, approx. 6.0% of viewfinder)<br />\r\n			Spot metering (center, approx. 2.6% of viewfinder)<br />\r\n			Center-weighted average metering</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ISO Sensitivity</td>\r\n			<td>Auto, 100 to 25600 (Extended Mode:100 to 51200)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHUTTER</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Shutter Speed</td>\r\n			<td>1/4000 to 30 sec., bulb (total shutter speed range. Available range varies by shooting mode.)<br />\r\n			X-sync at 1/200 sec.</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHOOTING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Color Space</td>\r\n			<td>sRGB and Adobe RGB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Continuous Shooting</td>\r\n			<td>Up to 6 fps at 24.2 MP for up to 190 Frames in JPEG Format<br />\r\n			Up to 6 fps at 24.2 MP for up to 21 Frames in Raw Format<br />\r\n			Up to 3 fps at 24.2 MP for up to 190 Frames in JPEG Format<br />\r\n			Up to 3 fps at 24.2 MP for up to 21 Frames in Raw Format</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FILE TYPE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Image Type</td>\r\n			<td>JPEG, RAW</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie Type</td>\r\n			<td>AVC/H.264, MP4</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LCD MONITOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>TFT color, liquid-crystal monitor</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Viewing Angle</td>\r\n			<td>Approx. 170 degrees</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">STORAGE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Storage Type</td>\r\n			<td>SD, SDHC or SDXC (UHS-I)card</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FLASH</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Built-in Flash</td>\r\n			<td>Auto pop-up, retractable built-in flash at the pentamirror</td>\r\n		</tr>\r\n		<tr>\r\n			<td>External Flash Compatibility</td>\r\n			<td>Hot Shoe</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">POWER SOURCE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Batteries</td>\r\n			<td>Battery Pack LP-E17 x 1 With the AC Adapter AC-E6N and DC Coupler DR-E18, AC power operation is possible.</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">PHYSICAL SPECIFICATIONS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x H x D)</td>\r\n			<td>Approx. 5.16 x 3.93 x 3.00 in. (131.0 x 99.9 x 76.2mm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight (Body Only)</td>\r\n			<td>Approx. 17.39 oz. / 493g</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LENS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Lens Mount</td>\r\n			<td>Canon EF mount</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 2, 10, 4),
(19, 'Nikon D3100 DSLR Camera With 18-55mm Lens', 23500, 'pics/pic5d0a8e370dfb24.49722547.jpg', '<h1>Nikon D3100 DSLR Camera With 18-55mm Lens</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>23,500à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>25,145à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>5827</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Nikon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>DX-format CMOS sensor</li>\r\n	<li>14.2 megapixel</li>\r\n	<li>IS0 100-3200 range</li>\r\n	<li>3 FPS Continuous Shooting</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Digital Camera</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>01 Year Warranty</td>\r\n		</tr>\r\n		<tr>\r\n			<td>LCD</td>\r\n			<td>3.0 in. diagonal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lens</td>\r\n			<td>18mm-55mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Video Resolution</td>\r\n			<td>Full HD 1,920x1,080 / 24 fps |<br />\r\n			HD 1,280x720 / 30 fps |<br />\r\n			HD 1,280x720 / 24 fps |<br />\r\n			VGA 640x424 / 30 fps |<br />\r\n			Movie with sound |</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Card Slot</td>\r\n			<td>SD |<br />\r\n			SDHC |<br />\r\n			SDXC |</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Battery Life</td>\r\n			<td>One EN-EL14a Rechargeable Li-ion Battery</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Other Features</td>\r\n			<td>Sensor Size- 23.1 mm x 15.4 mm |<br />\r\n			Image Sensor Format- DX |<br />\r\n			Effective Pixels (Megapixels)- 14.2 million |</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 10, 12, 4),
(20, 'Nikon D7500 DSLR Camera with 18-140mm Lens', 95000, 'pics/pic5d0a8e8eeb33d8.66353821.jpg', '<h1>Nikon D7500 DSLR Camera with 18-140mm Lens</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>95,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>99,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>9425</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Nikon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>20.9MP DX-Format CMOS Sensor</li>\r\n	<li>EXPEED 5 Image Processor</li>\r\n	<li>3.2&quot; 922k-Dot Tilting Touchscreen LCD</li>\r\n	<li>4K UHD Video Recording at 30 fps</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Specification</li>\r\n	<li>Description</li>\r\n	<li>Questions</li>\r\n	<li>Reviews (0)</li>\r\n</ul>\r\n\r\n<h3>Specification:</h3>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\">\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE SENSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>CMOS, 23.5 x 15.6 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pixels</td>\r\n			<td>Actual: 21.51 Megapixel<br />\r\n			Effective: 20.9 Megapixel</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Aspect Ratio</td>\r\n			<td>3:2, 16:9</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">IMAGE PROCESSOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>EXPEED 5 Image Processor</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FOCUSING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Modes</td>\r\n			<td>Automatic (A), Continuous-Servo AF (C), Manual Focus (M), Single-servo AF (S)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">EXPOSURE CONTROL</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Metering Modes</td>\r\n			<td>Center-Weighted Average Metering, Matrix, Spot Metering, Highlight Weighted<br />\r\n			Metering Range: EV 3.0 to EV 20.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ISO Sensitivity</td>\r\n			<td>Auto, 100 to 51200 (Extended Mode:50 to 1640000)</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHUTTER</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Shutter Speed</td>\r\n			<td>30 Second</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">SHOOTING</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Continuous Shooting</td>\r\n			<td>Up to 8 fps at 20.9 MP for up to 50 Frames in Raw Format<br />\r\n			Up to 8 fps at 20.9 MP for up to 100 Frames in JPEG Format</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FILE TYPE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Image Type</td>\r\n			<td>Still Images: JPEG, RAW</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Movie Type</td>\r\n			<td>AVC/H.264, MOV, MP4</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LCD MONITOR</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Type</td>\r\n			<td>3.2&quot; Rear Touchscreen Tilting LCD (922,000)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Viewing Angle</td>\r\n			<td>170.0&deg;</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">STORAGE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Storage Type</td>\r\n			<td>SD<br />\r\n			SDHC<br />\r\n			SDXC</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">FLASH</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Built-in Flash</td>\r\n			<td>Yes</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Red-Eye Reduction</td>\r\n			<td>Red-Eye Reduction<br />\r\n			Fill-In<br />\r\n			Slow Sync/Red-Eye Reduction<br />\r\n			Off<br />\r\n			Slow Sync<br />\r\n			Rear Curtain/Slow Sync<br />\r\n			Auto/Red-Eye Reduction<br />\r\n			Rear Sync<br />\r\n			Auto</td>\r\n		</tr>\r\n		<tr>\r\n			<td>External Flash Compatibility</td>\r\n			<td>Hot Shoe</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">POWER SOURCE</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Batteries</td>\r\n			<td>1 x EN-EL15a Rechargeable Lithium-Ion Battery Pack</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">PHYSICAL SPECIFICATIONS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Dimensions (W x H x D)</td>\r\n			<td>5.3 x 4.1 x 2.9&quot; / 135.5 x 104.0 x 72.5 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Weight (Body Only)</td>\r\n			<td>1.41 lb / 640 g body only</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">LENS</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Focal Length</td>\r\n			<td>18 to 140mm<br />\r\n			Comparable 35mm Focal Length: 27 to 210 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Maximum Aperture</td>\r\n			<td>Maximum: f/3.5 to 5.6<br />\r\n			Minimum: f/22 to 38</td>\r\n		</tr>\r\n	</tbody>\r\n	<thead>\r\n		<tr>\r\n			<td colspan=\"3\">Manufacture Warranty</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Warranty</td>\r\n			<td>01 year warranty.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 5, 12, 4),
(21, 'Canon EF 40mm f/2.8 STM Prime Lens', 16000, 'pics/pic5d0a8f35115220.67651719.jpg', '<h1>Canon EF 40mm f/2.8 STM Prime Lens</h1>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Price</td>\r\n			<td>16,000à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Regular Price</td>\r\n			<td>16,507à§³</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Status</td>\r\n			<td>In Stock</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Product Code</td>\r\n			<td>10140</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Canon</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Features</h2>\r\n\r\n<ul>\r\n	<li>Focal Length: 40mm</li>\r\n	<li>Maximum Aperture: f/2.8</li>\r\n	<li>Angle of View: 57&deg;</li>\r\n	<li>Focusing Distance: 11.81&quot; / 30 cm</li>\r\n</ul>\r\n', 3, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `img_id` int(11) NOT NULL,
  `img_product_id` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`img_id`, `img_product_id`, `img_url`) VALUES
(1, 1, 'pics/img-5ceacd5b16f33.jpeg'),
(2, 1, 'pics/img-5ceacd5b19097.jpeg'),
(3, 1, 'pics/img-5ceacd5b1b371.jpeg'),
(7, 5, 'pics/img-5d0a81b5f3719.jpg'),
(8, 6, 'pics/img-5d0a8304d4d3f.jpg'),
(9, 7, 'pics/img-5d0a83c41604b.jpg'),
(10, 8, 'pics/img-5d0a84a2d7ed9.jpg'),
(12, 10, 'pics/img-5d0a8886f0521.jpg'),
(13, 11, 'pics/img-5d0a8a32493f0.jpg'),
(14, 12, 'pics/img-5d0a8aa6cbce7.jpg'),
(15, 13, 'pics/img-5d0a8b36192d9.jpg'),
(16, 14, 'pics/img-5d0a8bba2d574.jpg'),
(17, 15, 'pics/img-5d0a8c3f9a1ec.jpg'),
(18, 16, 'pics/img-5d0a8cb5b4bb8.jpg'),
(19, 17, 'pics/img-5d0a8d1745319.jpg'),
(20, 18, 'pics/img-5d0a8d90775b9.jpg'),
(21, 19, 'pics/img-5d0a8e370e600.jpg'),
(22, 20, 'pics/img-5d0a8e8eeb859.jpg'),
(23, 21, 'pics/img-5d0a8f3511bb1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pruduct_catagory`
--

CREATE TABLE `pruduct_catagory` (
  `product_catagory_id` int(11) NOT NULL,
  `product_catagory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pruduct_catagory`
--

INSERT INTO `pruduct_catagory` (`product_catagory_id`, `product_catagory_name`) VALUES
(10, 'Accessories'),
(4, 'Camera'),
(2, 'Desktop'),
(6, 'Hard Disk'),
(1, 'Laptop'),
(9, 'Laptop Accessories'),
(3, 'Mobile'),
(8, 'Mobile Accessories'),
(7, 'Monitor'),
(5, 'Storage'),
(11, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `first_name`, `last_name`, `pwd`, `zip_code`, `address`, `active`, `phone`) VALUES
(0, 'jobaierhosen.4314@gmail.com', 'J', 'H ', '$2y$10$Ry8vgtjmdO140LJonM27meK2zmisbLy0OjIIXC.30MElyLp.m8Eki', 4314, 'Kumira, Chittagong.', 0, '01851838044'),
(1, 'kelsi89@example.com', 'Zachary', 'Green', '4', 61001, '9762 Emard Squares\nNorth Ervinburgh, MN 30437-6143', 1, '(972)541-3589'),
(2, 'dtorphy@example.com', 'Zion', 'Lockman', '', 4726, '8251 Keebler Key\nWest Vestatown, AR 14140', 0, '+12(9)2133398512'),
(3, 'keebler.carlos@example.org', 'Agnes', 'Paucek', '3', 91007, '4566 Sharon Keys Suite 514\nKayleeberg, OH 82493-7795', 0, '697.204.9588x99389'),
(4, 'jkoss@example.com', 'Martine', 'Donnelly', '1', 88049, '93056 Kyleigh Springs\nWest Nathanialberg, NC 49171', 0, '(676)034-6200'),
(5, 'tbradtke@example.org', 'Shanie', 'Altenwerth', '2', 88608, '85492 Gottlieb Keys\nAdamsville, NE 65313-3323', 1, '658.539.2383x7378'),
(6, 'troy.nitzsche@example.net', 'Freeman', 'Keeling', '1', 65624, '443 Allen Shore Apt. 141\nEast Diamond, AR 35425', 0, '(970)415-2622'),
(7, 'armstrong.nyasia@example.net', 'Dena', 'Schinner', '5', 82422, '1760 Bradtke Square Suite 521\nPredovicchester, IA 19956', 1, '1-734-199-0484x8964'),
(8, 'derek.greenholt@example.com', 'Melody', 'Price', '', 11536, '82543 Zieme Lake Suite 671\nMullerton, AZ 33236', 1, '015.828.3460'),
(9, 'otis.wolff@example.org', 'Pansy', 'Rath', '2', 32272, '65224 Orn Loaf Apt. 436\nNorth Kristy, WA 67028', 0, '(638)725-5370'),
(10, 'cara.dubuque@example.org', 'Esther', 'Torphy', '9', 52302, '75206 Prosacco Hollow Suite 631\nWestleychester, SD 61696', 1, '1-817-631-1024x613'),
(11, 'margot.grady@example.net', 'Tyson', 'Halvorson', '6', 73212, '87652 Bashirian Forest Apt. 008\nWest Armand, WV 46580-1308', 0, '590.038.2104x2586'),
(12, 'litzy.abbott@example.net', 'Lorna', 'VonRueden', '6', 12905, '305 Ziemann Throughway\nMagalihaven, WI 13723', 1, '(871)530-9305x47969'),
(13, 'ianderson@example.org', 'Devin', 'Gerhold', '5', 36606, '067 Sipes Port\nLake Rosaport, IL 23505-4158', 0, '+54(4)0388313821'),
(14, 'andres.murray@example.com', 'Javon', 'Hagenes', '5', 66879, '0256 Beau Ways Suite 030\nNitzschechester, WY 60138', 0, '119-096-9572x9088'),
(15, 'champlin.arden@example.net', 'Herbert', 'Berge', '1', 95330, '0884 Fadel Hill Apt. 892\nSchoenville, AL 85078-5303', 0, '1-104-149-6207x458'),
(16, 'salvatore47@example.net', 'Viva', 'Bernier', '', 76863, '98523 Taylor Canyon\nNew Simoneville, KY 86683-9416', 0, '(096)417-7220'),
(17, 'annabel.sporer@example.net', 'Isobel', 'Abernathy', '3', 78402, '22353 Strosin Course Suite 873\nDouglasport, TX 12072-2390', 0, '(926)175-6692'),
(18, 'steuber.katrina@example.com', 'Uriel', 'Lowe', '1', 85342, '03153 Homenick Stravenue Suite 196\nMonamouth, MD 81610-1359', 0, '(418)936-8745x014'),
(19, 'xwest@example.org', 'Keeley', 'Brakus', '8', 7348, '60464 Abigayle Shoals Apt. 811\nNew Gertrudefurt, MI 73149', 0, '1-016-383-8735x3017'),
(20, 'yanderson@example.net', 'Emely', 'Parker', '3', 71128, '88869 Helene Island Suite 671\nMcDermottland, ND 83714-4703', 0, '1-805-652-5106x4263'),
(21, 'ijohns@example.net', 'Jeremy', 'Muller', '2', 18722, '2788 Jarvis Points\nEast Frederikside, WI 26689-3797', 0, '085-073-8733'),
(22, 'ulises.becker@example.com', 'Halle', 'Moen', '8', 71285, '8748 Maddison Mountains\nMadieview, NJ 57747-8508', 1, '408.713.8709'),
(23, 'moises.ritchie@example.com', 'Gladys', 'Zulauf', '4', 27843, '288 Charity Flats\nErdmanport, GA 00366-5148', 1, '(596)858-0702'),
(24, 'alexis.aufderhar@example.com', 'Tiara', 'Dooley', '1', 49089, '809 Jolie Corners Apt. 329\nPfefferland, SC 66346', 0, '1-775-952-5822x668'),
(25, 'xarmstrong@example.net', 'Lillian', 'Nicolas', '9', 40444, '8056 Stracke Common Apt. 756\nArnoldbury, AL 39457', 0, '724.359.7277x585'),
(26, 'hudson.estella@example.org', 'Willow', 'O\'Connell', '6', 45135, '5006 Teagan Mills\nBirdieshire, WA 26729', 1, '879.310.6463'),
(27, 'nkulas@example.org', 'Manuel', 'Hartmann', '9', 49793, '92039 Tyree Neck Suite 152\nWoodrowberg, NE 66145', 0, '+47(5)7666945975'),
(28, 'moshe.reilly@example.org', 'Buford', 'Lowe', '', 39457, '06393 Aron Brooks Suite 368\nLake Tatumport, PA 27235', 0, '+74(9)0406965348'),
(29, 'glover.mikayla@example.com', 'Dewayne', 'Daugherty', '8', 91519, '02228 Bruce Fall Suite 003\nLindbury, WY 23380', 1, '202.297.1495x47942'),
(30, 'ernser.isabel@example.com', 'Jedidiah', 'King', '4', 31268, '7976 Leonard Station\nWest Sventon, SD 25712-2746', 1, '258.413.7927x62187'),
(31, 'claudine.corkery@example.org', 'Nels', 'Legros', '6', 39487, '61550 Schaden Lake\nHerthahaven, CA 20348', 1, '1-645-683-5118'),
(32, 'feeney.nedra@example.net', 'Sydney', 'Schneider', '4', 22662, '07556 Raina Ranch Suite 862\nRhodaberg, MA 14320-8010', 0, '749.952.2916'),
(33, 'wisozk.rosanna@example.org', 'Bette', 'Jenkins', '5', 46486, '46688 Elna Landing Apt. 886\nWest Yasmin, NM 72457', 0, '(932)672-4039x81793'),
(34, 'hailie.schamberger@example.org', 'Sebastian', 'Towne', '5', 6316, '851 Sipes Alley Apt. 289\nWest Beulah, CA 75899', 0, '663.007.2397'),
(35, 'abbigail.koss@example.com', 'Dalton', 'Littel', '2', 32446, '443 Waelchi Mall Suite 581\nWunschstad, CO 62774', 0, '211-243-4353x0288'),
(36, 'jonas39@example.com', 'Luigi', 'McLaughlin', '3', 94220, '811 Sophia Summit\nPort Dakota, MT 63730-2183', 0, '491.850.3020'),
(37, 'jast.frederick@example.org', 'Juliet', 'Mitchell', '6', 26991, '67277 Wyatt Alley Suite 579\nCrooksborough, AR 45917', 1, '043-578-6393'),
(38, 'audrey73@example.com', 'Earnestine', 'Wolf', '3', 9013, '1965 Schmeler Highway Apt. 781\nLake Dinafurt, KS 94768-7085', 0, '1-094-793-3138x016'),
(39, 'amayert@example.org', 'Mckayla', 'Torphy', '3', 66271, '99838 Morar Path\nBatzburgh, PA 39344', 1, '(575)650-6852x463'),
(40, 'heaney.paula@example.com', 'Alessia', 'Roob', '1', 93571, '9486 Daren Parks Apt. 196\nJohanberg, CO 00547', 0, '+81(8)8497285379'),
(41, 'runte.karson@example.com', 'Mervin', 'Bartoletti', '4', 16713, '24118 Dach Mills\nRomagueraside, FL 20549-9814', 1, '+84(4)9761134578'),
(42, 'ottis.huel@example.com', 'Candice', 'Hickle', '5', 13053, '3846 Kohler Radial\nKrajcikberg, CA 73773', 1, '02014889139'),
(43, 'hayden05@example.com', 'Octavia', 'Witting', '4', 80382, '7921 Ashtyn Springs\nWest Anna, OR 14679-0224', 1, '967-398-9986'),
(44, 'flarson@example.com', 'Mercedes', 'Kulas', '2', 23886, '0462 Marlene Crest\nGaylordmouth, ID 91718-4193', 0, '455-007-7033x120'),
(45, 'emmet65@example.com', 'Dannie', 'Franecki', '3', 565, '70580 Ransom Greens Suite 656\nBalistrerimouth, PA 44382-5814', 1, '02410494977'),
(46, 'dicki.gillian@example.com', 'Janelle', 'Lubowitz', '5', 82124, '417 Johnson Gateway\nWest Abelardo, NE 34023', 0, '475-284-8519x2639'),
(47, 'jgoyette@example.com', 'Henry', 'Watsica', '2', 95252, '68182 Welch Route Apt. 303\nWest Beatricehaven, IA 83784-1209', 0, '+64(5)3688377000'),
(48, 'clarissa.schaden@example.net', 'Erika', 'Greenholt', '3', 5297, '9772 Jacquelyn Curve\nHarveyview, IA 99087', 0, '303-031-4377'),
(49, 'elza.gerhold@example.net', 'Cleta', 'Gutkowski', '7', 11389, '65370 Juana Mount\nNew Gregory, WY 90047', 1, '1-541-234-8323'),
(50, 'daija.kub@example.com', 'Willie', 'Crooks', '6', 98260, '9516 Prosacco Alley\nNorth Douglasstad, TN 32109-3969', 1, '07325162124'),
(51, 'isidro.dach@example.net', 'Yolanda', 'Bednar', '', 604, '7377 Sipes Mission\nRogahnburgh, KS 02702-5190', 0, '067-365-9071x651'),
(52, 'wiza.nia@example.com', 'Gerardo', 'Stracke', '7', 17565, '7414 Tatum Dam\nWest Zolachester, ND 41068-4468', 1, '1-910-033-6725x6619'),
(53, 'torey.ledner@example.org', 'Furman', 'King', '9', 20699, '02362 Evan Gardens Suite 610\nAbbottchester, VA 15277-5809', 1, '537-446-0232x896'),
(54, 'dare.nyasia@example.org', 'Adrien', 'Murray', '2', 23577, '795 Bartoletti Bridge Suite 136\nSouth Justyn, TN 61125', 0, '298.501.2704x88274'),
(55, 'konopelski.damion@example.org', 'Bria', 'Sipes', '4', 74353, '16086 Stamm Green Apt. 469\nJessburgh, MA 90544', 0, '09316012818'),
(56, 'fritz.stokes@example.org', 'Hanna', 'Rodriguez', '', 66887, '110 Schmitt Bridge Suite 450\nFrancesport, NC 54859', 1, '432.561.7430x79838'),
(57, 'connor.halvorson@example.org', 'Marge', 'Lehner', '3', 25032, '81288 Delmer Mountains\nEmiechester, ID 07485-1302', 1, '(707)923-0228'),
(58, 'yo\'conner@example.org', 'Darrick', 'Nader', '4', 20081, '36999 Nyasia Inlet Apt. 452\nNorth Samantafort, ID 81818', 0, '1-881-937-1137'),
(59, 'emilia.collins@example.net', 'Rhett', 'Abbott', '7', 36405, '9500 Bogan Ridge Apt. 151\nSuzannemouth, PA 73999-4795', 0, '01849344429'),
(60, 'wilber.macejkovic@example.org', 'Agustina', 'Kohler', '5', 99672, '8569 Odie Expressway\nDarrelltown, MS 30238-5960', 0, '1-190-731-5908'),
(61, 'jaiden13@example.org', 'Marquise', 'Conn', '2', 44426, '488 Cedrick Knolls Suite 031\nJazmynetown, LA 65036', 0, '771-777-8469'),
(62, 'spencer.dejah@example.net', 'Francis', 'Gottlieb', '5', 77267, '907 Harris Causeway Apt. 050\nMcLaughlinchester, IL 19647-9425', 0, '618-332-1463'),
(63, 'camden92@example.org', 'Leta', 'Skiles', '6', 10548, '9048 Gislason Well\nCristobalberg, AR 80352-0958', 1, '(661)509-2707x666'),
(64, 'torey67@example.org', 'Gust', 'Hirthe', '7', 9749, '6361 Vernie Drives\nPollichton, NY 27925', 0, '265.650.3571'),
(65, 'ephraim.schuster@example.org', 'Corine', 'Toy', '8', 9062, '692 Crist Walks Apt. 775\nSabrinahaven, CA 94476', 1, '283-370-3266'),
(66, 'andy.weimann@example.org', 'Deondre', 'Zulauf', '9', 68522, '994 Koepp Forks Suite 675\nKoeppfurt, CT 61726-9254', 1, '1-141-440-6668'),
(67, 'sbashirian@example.org', 'Earline', 'Jones', '7', 46281, '7261 Breanna Forge\nWaterston, ND 33737-1546', 1, '909.554.2287x752'),
(68, 'estel21@example.net', 'Tamara', 'McCullough', '8', 80364, '9875 Bergstrom Roads Apt. 950\nAuerburgh, TX 92310-6833', 1, '(435)483-0779'),
(69, 'linda.christiansen@example.org', 'Jarret', 'Klocko', '2', 85355, '2229 Maggio Park\nBerniermouth, AL 92431', 1, '1-151-738-2477'),
(70, 'neha.murray@example.net', 'Olen', 'Stehr', '2', 67557, '008 Rath Inlet\nLake Lucas, WY 81837', 0, '458-795-1208x5721'),
(71, 'grolfson@example.net', 'Trinity', 'Hilll', '4', 93667, '843 Kulas Oval\nNew Jeanie, CA 66093-2157', 0, '1-162-923-0580'),
(72, 'hubert46@example.org', 'Amara', 'Buckridge', '2', 84462, '06340 Ottis Mountain\nNew Cheyannehaven, AK 95863-9806', 0, '(501)608-1893'),
(73, 'qbergstrom@example.com', 'Savanna', 'Kris', '9', 38147, '8338 Brain Islands Suite 820\nFritschtown, MN 60109-2610', 0, '(180)333-7625x17578'),
(74, 'assunta.beier@example.net', 'Kane', 'Legros', '', 34950, '047 Johnathan Union Apt. 789\nPaulineburgh, OK 02843-0883', 1, '419-133-3336x97236'),
(75, 'arjun.koepp@example.org', 'Bernita', 'Pfeffer', '5', 66757, '92328 Fisher Trace\nDonnellstad, CT 40933-6102', 0, '1-383-036-3937x66273'),
(76, 'murazik.piper@example.net', 'Dasia', 'Willms', '3', 97415, '30995 Fay Via\nElizabethborough, SC 45416', 0, '(252)997-9073'),
(77, 'hkuhn@example.com', 'Erik', 'Reynolds', '2', 62719, '94467 Dianna Island Apt. 371\nPearlinechester, KY 29813', 1, '1-653-722-7184x5627'),
(78, 'jimmy62@example.com', 'Glenna', 'Haag', '', 97094, '24863 Haley Orchard Apt. 002\nHintzfort, WA 84844-0274', 1, '1-589-421-3270x98516'),
(79, 'walker.lane@example.org', 'Daisy', 'Runolfsson', '7', 84277, '96161 Germaine Wells Apt. 601\nWest Coramouth, OR 35742', 1, '1-818-597-7931x8341'),
(80, 'xbrakus@example.net', 'Clair', 'Balistreri', '9', 8475, '86458 Thad Expressway\nNew Sydniborough, RI 30489', 1, '+56(2)9092229981'),
(81, 'grimes.abraham@example.net', 'Kiley', 'Baumbach', '9', 58586, '20984 Heloise Pine Apt. 728\nWest Tillman, NJ 43253', 1, '065.825.0044'),
(82, 'seth.wisozk@example.com', 'Tabitha', 'Wyman', '4', 87474, '7676 Runte Glens\nJohnsmouth, SC 28281', 1, '575.881.5679x0201'),
(83, 'alfred.upton@example.org', 'Manley', 'Heathcote', '', 75195, '1077 Savion Shore\nWest Chesterfort, MN 78511', 0, '536.592.7180x1202'),
(84, 'ngerlach@example.net', 'Thea', 'Tromp', '7', 60254, '991 Raymond Isle\nAdrianside, OR 57617', 0, '1-964-038-7960x1591'),
(85, 'camryn34@example.org', 'Malachi', 'Fay', '3', 51572, '85049 Chasity Plaza Suite 495\nEast Noah, NC 84344-4594', 0, '588.985.2196'),
(86, 'gpouros@example.org', 'Kiley', 'Wyman', '3', 67516, '7820 Harris Courts\nMarleebury, HI 50299-4892', 0, '855.252.4156x66450'),
(87, 'green.hayden@example.net', 'Genevieve', 'Flatley', '5', 39946, '36053 Jonathan Shore Suite 895\nConsidineberg, WY 73419', 1, '420-225-5287'),
(88, 'nathan33@example.com', 'Dereck', 'Schimmel', '8', 82643, '20564 Anahi Street Suite 809\nShemarside, NJ 93889', 0, '429-975-8352'),
(89, 'vita.batz@example.org', 'Harold', 'Bernier', '8', 10759, '087 Lawrence Flat Apt. 798\nRoobfurt, PA 38649-8293', 0, '903-061-3939'),
(90, 'herman.roderick@example.com', 'Mina', 'Koss', '3', 94406, '559 Feeney Meadow Suite 363\nSouth Ben, NY 12510-8362', 0, '(142)459-3559x7878'),
(91, 'zhayes@example.net', 'Evelyn', 'Doyle', '3', 96091, '2911 Everett Harbors\nNorth Emily, KY 56168', 1, '(196)002-1638x2798'),
(92, 'jarrett79@example.org', 'Jewel', 'Durgan', '7', 61478, '42208 Bertram Cove\nSouth Thad, MO 32901', 0, '364.028.6706x266'),
(93, 'herman.sven@example.net', 'Mack', 'Vandervort', '3', 24707, '558 Johnson Corners\nWilfordton, TX 29344', 1, '499.030.8987'),
(94, 'tberge@example.com', 'Gregg', 'Dare', '4', 37860, '84365 Ima Way\nElainatown, NE 93235', 0, '+24(8)4580163616'),
(95, 'bkirlin@example.com', 'Reta', 'O\'Kon', '9', 5697, '14165 Curt Course Suite 567\nJamaalfurt, AZ 54685', 0, '584.484.5302x34641'),
(96, 'farrell.raegan@example.com', 'Laurine', 'Cassin', '1', 87831, '98331 Dooley Route\nOmaton, NM 80015', 0, '1-154-615-9581'),
(97, 'feil.aiden@example.org', 'Harmon', 'Wilkinson', '9', 65306, '94048 David Lodge\nNew Lavonne, IN 15555-7189', 1, '1-952-234-3375x02755'),
(98, 'mayra.macejkovic@example.com', 'Desiree', 'Zulauf', '4', 28891, '047 Jazmyne Parkways Apt. 324\nMillsshire, WI 17956', 1, '1-183-364-7173x5059'),
(99, 'taurean.dickens@example.net', 'Shaylee', 'Steuber', '3', 12317, '68173 Maymie Lakes\nLake Nella, FL 74098-6127', 1, '02699836177'),
(100, 'raynor.daisy@example.org', 'Taylor', 'Schinner', '', 16105, '6115 McClure Skyway\nLockmanside, CA 53843', 1, '+05(7)5646373264'),
(101, 'bergstrom.maida@example.net', 'Haley', 'Deckow', '3', 65322, '14637 Wilford Mountain Apt. 932\nKubberg, DC 41505-0234', 0, '740-916-7746x896'),
(102, 'rita.murazik@example.org', 'Webster', 'Reinger', '5', 36399, '10532 Hansen Overpass Apt. 173\nVeronicahaven, ID 63915', 0, '1-508-937-9879'),
(103, 'kaitlyn.roberts@example.net', 'Maximilian', 'Prohaska', '3', 10070, '2672 Marty Curve Apt. 308\nFordville, DC 92698', 1, '1-937-955-5383'),
(104, 'medhurst.keaton@example.net', 'Barrett', 'Adams', '7', 24041, '71351 Janelle Skyway Suite 065\nJoshuahchester, HI 67909-8274', 1, '1-780-523-2223'),
(105, 'quitzon.kenyon@example.com', 'Johan', 'Dach', '8', 94644, '376 Leffler Hollow\nEdwardoburgh, NJ 19211-0863', 0, '1-896-045-1319x609'),
(106, 'zwaters@example.com', 'Chelsea', 'Goyette', '7', 28030, '427 Marvin Parks Suite 335\nNicolettemouth, TX 13912-5586', 0, '(008)036-6773x17237'),
(107, 'dixie41@example.net', 'Newton', 'Runolfsson', '1', 76535, '344 Thea Station Apt. 824\nLefflerhaven, WV 32065', 1, '974.827.1179x930'),
(108, 'claudine.batz@example.com', 'Jakob', 'Bogisich', '1', 16524, '45005 Shanelle Gardens\nEast Elviehaven, ME 93124-7797', 0, '1-801-942-4619'),
(109, 'dashawn.fisher@example.org', 'Ari', 'Bernhard', '1', 71262, '5644 Stoltenberg Hollow Apt. 392\nHettingerbury, NC 37788-9593', 1, '(617)307-5500x072'),
(110, 'dolores.nolan@example.com', 'Albertha', 'Fahey', '1', 99962, '777 Nasir Ways Suite 611\nHellerstad, MA 68803-2825', 0, '258-815-2512x28600'),
(111, 'zreichel@example.org', 'Jacynthe', 'Frami', '6', 42440, '51751 Schinner Rapids Apt. 296\nLake Winifred, PA 15182', 1, '723.332.0742x9969'),
(112, 'crystel.hand@example.com', 'Asia', 'Runte', '6', 71746, '982 Fadel Green Suite 222\nGoyettemouth, OK 05568', 0, '00041055026'),
(113, 'moen.fatima@example.net', 'Destany', 'Boyer', '6', 67290, '815 Rodriguez Knolls\nWest Brownchester, OR 88760', 1, '089.852.0171x370'),
(114, 'alvena91@example.org', 'Ayla', 'McDermott', '6', 30218, '7728 Lonny Lodge Suite 240\nMerlchester, GA 60465-9889', 1, '(742)597-7946'),
(115, 'pablo94@example.org', 'Fae', 'Morar', '5', 19725, '369 Mayer Tunnel Apt. 632\nPort Natalia, CT 45656-9196', 0, '+46(1)6382809423'),
(116, 'elsie75@example.net', 'Kyleigh', 'Sauer', '6', 28071, '24234 Monica Cove\nO\'Connermouth, ME 38046-7869', 1, '+32(1)4626345349'),
(117, 'emerald.ruecker@example.org', 'Damaris', 'Purdy', '7', 31506, '6828 Jaron Forks Apt. 445\nNew Shaniya, WV 30833', 0, '002-425-6781x55480'),
(118, 'xgutmann@example.com', 'Maggie', 'Kiehn', '5', 39653, '1887 Ellie Springs\nNorth Eleonore, MD 12910-0126', 0, '(524)845-5436x393'),
(119, 'terrance.bechtelar@example.org', 'Marley', 'Smith', '2', 25061, '408 Dalton Inlet\nAlfredaport, NV 43954', 0, '1-137-476-8333x7181'),
(120, 'jakayla60@example.com', 'Roderick', 'Stoltenberg', '', 27144, '4867 Mylene Mill\nHowefort, WV 18851-3859', 0, '(051)472-9694x89337'),
(121, 'ywaelchi@example.org', 'Angus', 'Sipes', '4', 35096, '3570 Ole Freeway Apt. 031\nEast Jeremy, SD 37999', 1, '+97(9)5158907270'),
(122, 'mgusikowski@example.com', 'Kaya', 'Romaguera', '5', 83575, '8925 Jones Branch Suite 251\nEast Mitchellburgh, MS 67558', 0, '1-699-597-8431x32268'),
(123, 'hilpert.deanna@example.com', 'Jaydon', 'Collier', '7', 1625, '4242 Herzog Wall Suite 314\nEast Darrinview, UT 51376', 0, '04725972275'),
(124, 'mavis68@example.net', 'Napoleon', 'Blick', '3', 90192, '9512 Koepp Islands Apt. 138\nEast Noelport, LA 18313-0406', 0, '851.966.8457x9201'),
(125, 'stacey.hessel@example.net', 'Shannon', 'Ernser', '9', 78273, '948 Halvorson Parks Apt. 865\nLake Milesview, MA 74518', 0, '1-914-576-2247'),
(126, 'gosinski@example.com', 'Harrison', 'Raynor', '3', 24395, '56416 Towne Fork Apt. 259\nPort Lavina, NV 72301-3831', 0, '594-597-1491x456'),
(127, 'sporer.aisha@example.com', 'Savannah', 'Von', '8', 35436, '128 Phyllis Radial\nAdamberg, TX 33752-2968', 1, '075-404-7490x11165'),
(128, 'jeremie05@example.com', 'Shawna', 'Cartwright', '6', 82022, '55500 Jacobs Unions\nWest Kianatown, MN 43256-5947', 1, '730.160.7209x7936'),
(129, 'cmorar@example.com', 'Maggie', 'Rippin', '', 74738, '04690 Mueller Village\nEldaland, ME 12668-6548', 0, '1-378-029-2524'),
(130, 'mckenzie.jimmy@example.net', 'Lemuel', 'Haley', '2', 78035, '4353 Lilly Overpass\nRohanburgh, MS 09757-3297', 1, '601-727-3430x05644'),
(131, 'pwintheiser@example.com', 'Brandyn', 'Bogan', '', 97195, '1386 Schaden Walks\nPort Tomasstad, FL 32065', 1, '(212)374-1057x0484'),
(132, 'madyson29@example.net', 'Celestine', 'Stamm', '1', 44927, '76908 Jones Mountain Suite 259\nDeliaberg, AZ 88732', 1, '1-688-425-1929x02511'),
(133, 'zmoore@example.com', 'Daphne', 'Stracke', '7', 14913, '7905 Prohaska Springs Apt. 987\nLake Rosaleebury, CT 13524', 1, '688-917-3257'),
(134, 'mkonopelski@example.net', 'Eugene', 'Rath', '2', 62481, '6395 Sasha Haven Suite 975\nAlbaton, MA 70163-1815', 0, '076.219.8808x65607'),
(135, 'josiah.hansen@example.net', 'Giovani', 'Johns', '3', 62354, '3054 Hammes Pine\nNorth Kailyn, SC 03047', 0, '916-802-9828x8119'),
(136, 'reagan.stamm@example.org', 'Patsy', 'Windler', '', 3819, '7525 Brain Plain\nNew Declanhaven, AR 77651-9928', 0, '1-028-405-6523x5193'),
(137, 'geraldine.renner@example.com', 'Karolann', 'Casper', '4', 48727, '8552 Wisoky Oval Suite 848\nIsabelleside, AR 79675', 0, '1-830-034-3605'),
(138, 'aoberbrunner@example.net', 'Eldridge', 'Torphy', '2', 40475, '064 Jones Vista Apt. 051\nKovacektown, TN 93807', 1, '750.689.3825x423'),
(139, 'franecki.felipa@example.net', 'Alexandrine', 'Lesch', '7', 17198, '0266 Adrianna Greens Suite 234\nLuettgenville, HI 02913-1112', 1, '(032)216-1447'),
(140, 'gwyman@example.net', 'Harmon', 'Murray', '1', 70868, '2067 Marley Prairie Apt. 080\nConnorton, IA 69064', 1, '+28(9)6565604044'),
(141, 'kathleen11@example.net', 'Niko', 'Bauch', '', 76748, '6783 Otis Canyon Apt. 567\nCummeratastad, MT 49480-3024', 1, '(395)005-1633x7335'),
(142, 'odeckow@example.net', 'Edgar', 'Daniel', '2', 68795, '29414 Goyette River\nNew Amelyville, DE 89704-9731', 0, '1-563-464-6248x38410'),
(143, 'sroob@example.net', 'Broderick', 'Doyle', '1', 15067, '167 Dewayne Plain Suite 902\nRubiehaven, TX 55028', 1, '05230706468'),
(144, 'ruby.breitenberg@example.org', 'Arch', 'Lemke', '8', 48966, '182 Keenan Cliffs\nRathmouth, IL 77872-7286', 1, '822.624.7835x769'),
(145, 'laila.price@example.net', 'Lisandro', 'Weissnat', '5', 58647, '25538 Rath Spring\nBrekkestad, NC 32992', 0, '501.071.0985'),
(146, 'malcolm64@example.net', 'Delia', 'Heidenreich', '8', 64432, '511 Marcelo Island\nHardyside, AZ 71567', 0, '817-427-6839'),
(147, 'runte.marco@example.com', 'Shyann', 'Hintz', '8', 13568, '858 Lee Plains\nTobyhaven, LA 39610', 1, '1-857-917-0825'),
(148, 'marlee53@example.org', 'Korey', 'Rice', '9', 66182, '27044 Schaefer Plains\nLake Jairoberg, ME 34845', 0, '04633079674'),
(149, 'edyth07@example.net', 'Krystina', 'Roob', '6', 33168, '14633 Candido Viaduct\nNew Alf, CO 17330', 1, '249-275-1450'),
(150, 'tommie04@example.com', 'Chaim', 'Windler', '7', 47183, '7423 Hodkiewicz Knolls\nWest Genevieve, OK 07094', 0, '608.003.9927x61425'),
(151, 'gerhard.kertzmann@example.com', 'Americo', 'Wiza', '4', 75740, '04437 Janessa Neck\nEricachester, ND 95905', 1, '724.523.0819x89700'),
(152, 'jaskolski.camden@example.org', 'Nat', 'Altenwerth', '5', 50972, '70525 Mertie Tunnel\nGorczanymouth, WY 73673', 0, '564-711-0774x35733'),
(153, 'miller.citlalli@example.net', 'Yvonne', 'Toy', '9', 6862, '98473 Kuvalis Corner\nNorth Wilsonmouth, NH 11287-4066', 0, '1-855-484-3813'),
(154, 'haylee.wehner@example.org', 'Philip', 'Schuster', '5', 98755, '004 Weber Walk Apt. 957\nEast Rodolfo, MT 49424-7441', 1, '086.696.3176x412'),
(155, 'considine.tre@example.org', 'Armani', 'Herman', '6', 21071, '4223 Flatley Lodge\nTrishamouth, MD 83305', 0, '1-839-054-1605'),
(156, 'o\'connell.clotilde@example.org', 'Amos', 'Von', '', 33341, '9218 Gutmann Cove Suite 340\nGoodwinton, MS 44066', 0, '478-512-5130x203'),
(157, 'htromp@example.org', 'Lisette', 'Gulgowski', '2', 42286, '8508 Hickle Court\nNorth Annamariemouth, CT 96528-2693', 1, '709.200.5892x4829'),
(158, 'javier.kohler@example.com', 'Wilburn', 'Klein', '9', 58906, '386 Stoltenberg Crossroad\nSouth Katelinview, AL 12560', 0, '06548301104'),
(159, 'weissnat.price@example.com', 'Rodolfo', 'Reichert', '4', 73254, '623 Runolfsdottir Pines\nSouth Claude, GA 83216-4916', 0, '667-584-7878'),
(160, 'carleton.hoeger@example.com', 'Terrance', 'Ondricka', '3', 89535, '1458 Steuber Lodge\nGoldnerstad, ME 23271-5372', 0, '(683)682-6408x64573'),
(161, 'ddenesik@example.com', 'Emory', 'Mann', '8', 24141, '22837 Kylee Row Apt. 000\nCristbury, IN 41304-3650', 0, '641.793.8119x658'),
(162, 'bradly.rowe@example.com', 'Lindsey', 'Waelchi', '8', 77853, '510 Edna Locks\nVellabury, CT 62262-7846', 1, '+79(1)7600033025'),
(163, 'funk.michele@example.net', 'Delfina', 'Green', '', 84761, '334 Irma Summit\nRempelshire, WV 88773', 0, '(788)033-3205x4155'),
(164, 'baby.dicki@example.com', 'Glenna', 'Fay', '6', 28616, '930 Greenholt Plaza\nTristinland, KS 93938', 0, '1-995-056-5086x31758'),
(165, 'vpurdy@example.com', 'Conner', 'Dooley', '2', 30095, '3800 Greenholt Row\nOtiliaton, CO 31687-1291', 0, '(934)017-4266'),
(166, 'destin.goodwin@example.org', 'Nick', 'Ernser', '1', 14083, '8642 Schumm Canyon Apt. 650\nEmeliashire, MS 40640', 1, '1-577-600-7063'),
(167, 'mccullough.anne@example.org', 'Ettie', 'Legros', '8', 80364, '18186 Joy Via Suite 673\nLake Winifredville, IN 09398', 1, '08796898181'),
(168, 'vvandervort@example.org', 'Bobby', 'Wunsch', '6', 80649, '9027 Borer Landing Suite 459\nNorth Imelda, GA 34634-8738', 1, '567.202.7745'),
(169, 'humberto.brekke@example.com', 'Ronny', 'O\'Reilly', '2', 84387, '74150 Meaghan Spur\nNorth Mckennahaven, UT 89238', 0, '(103)752-6561'),
(170, 'ybuckridge@example.com', 'Athena', 'Kozey', '4', 11442, '57335 Jast Common\nPinkshire, IL 88651-4611', 1, '(307)623-7122x903'),
(171, 'vbartell@example.com', 'Alycia', 'Runte', '8', 49186, '81937 Bergstrom Crossing\nModestoburgh, IN 73592', 0, '495-894-9109'),
(172, 'sam56@example.net', 'Kallie', 'Wisozk', '2', 14253, '62577 Schuster Passage Apt. 375\nPort Thoratown, OK 75145-9486', 1, '187-588-8027x46737'),
(173, 'ray.stark@example.com', 'Calista', 'Bauch', '1', 92452, '7652 Hansen Hills Suite 669\nJoseberg, RI 94285-0388', 0, '(242)857-8057'),
(174, 'mcglynn.cristal@example.org', 'Rhoda', 'Sanford', '3', 90733, '020 Watsica Summit Suite 340\nSouth Angusmouth, NJ 43808-2565', 1, '(651)020-8027x3533'),
(175, 'dawn.blanda@example.net', 'Chadrick', 'Conn', '2', 80840, '82867 Darron Port Suite 609\nHayesside, KS 07337', 0, '847.618.6039x698'),
(176, 'smosciski@example.com', 'Duane', 'Hodkiewicz', '7', 94259, '89521 Camylle Walks\nDamianberg, MI 17580-9068', 1, '(735)162-8375'),
(177, 'albertha.swaniawski@example.org', 'Genoveva', 'Legros', '2', 23033, '310 Danial Walks Apt. 652\nStefanieberg, OK 44370', 0, '(825)443-9363x571'),
(178, 'humberto22@example.com', 'Jessica', 'Gulgowski', '2', 82753, '7776 Weissnat Overpass Apt. 371\nPort Eveline, NV 37066', 1, '143-717-0995x3150'),
(179, 'lucas.schneider@example.com', 'Brayan', 'Paucek', '3', 59527, '13867 Nienow Stravenue Apt. 116\nMcCulloughton, AZ 59055-6161', 0, '+52(7)0613371840'),
(180, 'fcollier@example.org', 'Yesenia', 'Barrows', '2', 21121, '148 Sidney Burg Apt. 075\nElyssachester, RI 76472', 0, '1-567-707-7257x002'),
(181, 'thora.eichmann@example.com', 'Anita', 'Thompson', '6', 60103, '9314 Huel Highway Suite 683\nNew Ameliafurt, CA 09884', 1, '245.892.3315'),
(182, 'stehr.yazmin@example.org', 'Darrin', 'Huels', '5', 34181, '54852 Bartoletti Forge\nNew Vernerland, KS 81972-5442', 1, '174-983-5962'),
(183, 'xheaney@example.net', 'Evelyn', 'Rowe', '5', 91930, '667 Nayeli Freeway Suite 221\nLehnerbury, LA 56715', 0, '1-697-902-0119'),
(184, 'daryl43@example.com', 'Frederick', 'Osinski', '4', 482, '17678 Grady Forks Suite 679\nSouth Avis, LA 60632', 0, '269-734-5283x1842'),
(185, 'braulio.ledner@example.org', 'Keshaun', 'Swift', '3', 4756, '44532 Zion Manors Suite 505\nEast Lucious, SD 12636-9232', 1, '(455)438-3213x536'),
(186, 'jackeline.flatley@example.net', 'Ulices', 'Jakubowski', '3', 9925, '586 Evangeline Point\nNorth Reta, NC 76836-4040', 0, '013-124-2505x14332'),
(187, 'paula90@example.org', 'Diana', 'Bradtke', '8', 98400, '63545 Sincere Skyway\nNorth Gregory, NM 79637', 0, '463-998-1624'),
(188, 'chaya37@example.org', 'Wade', 'Littel', '', 16334, '55100 Macejkovic Cliff\nLake Travon, MI 73070-1948', 1, '1-836-347-5603x36132'),
(189, 'madie.glover@example.net', 'Zoey', 'Zieme', '', 61159, '21683 Green Inlet\nBlandaberg, IN 80279', 1, '089.835.3683'),
(190, 'alanis.treutel@example.org', 'Kaden', 'Gaylord', '8', 83230, '79945 Astrid Views Apt. 704\nNorth Idellafurt, WY 32549', 1, '491-048-5867x07013'),
(191, 'opadberg@example.com', 'Jayde', 'Keeling', '3', 34383, '844 Bins Grove\nCortezberg, UT 53890-8268', 0, '312-241-2634'),
(192, 'kreiger.arturo@example.org', 'Savion', 'Konopelski', '4', 29191, '98231 Lebsack Loaf Suite 043\nSouth Greyson, IN 11919', 0, '(829)355-8139x9105'),
(193, 'marjolaine81@example.com', 'Betsy', 'Watsica', '8', 54332, '443 Emmerich Track\nSouth Drake, NJ 63770', 1, '901-272-7407x18505'),
(194, 'colten.lueilwitz@example.org', 'Alayna', 'Kub', '5', 80389, '209 Marcellus Skyway Apt. 230\nLake Aliza, ME 19884-6475', 0, '1-792-890-0270x801'),
(195, 'wquitzon@example.org', 'Lily', 'Zulauf', '6', 85492, '46574 Koelpin Lodge\nNorth Linnie, MO 70789', 0, '(651)673-8413'),
(196, 'jazmin.harber@example.com', 'Destiney', 'Bartell', '6', 59010, '4317 Cheyenne Expressway Apt. 062\nNorth Nellie, SC 26536-2205', 0, '(853)434-1729x51521'),
(197, 'parisian.kane@example.net', 'Kamren', 'Terry', '9', 28623, '1917 Evan Causeway Apt. 522\nNorth Burnice, NM 22472-8511', 1, '687-761-6330'),
(198, 'zcruickshank@example.org', 'Faye', 'Orn', '7', 48263, '498 Oleta Neck Suite 379\nPort Adella, AL 12637', 0, '695.653.4553x9477'),
(199, 'padberg.carley@example.org', 'Richie', 'Toy', '1', 73183, '740 Schmitt Squares\nSouth Averybury, MI 57185', 1, '405.314.7822'),
(200, 'curt.johns@example.net', 'Everett', 'Gleichner', '3', 27806, '021 Simonis Path Suite 898\nNoraview, SD 41785-0151', 1, '846.611.6323x40986'),
(201, 'juba2732@gmail.com', 'Jobayer', 'Hosen      ', '$2y$10$uiyENeDD.HBcKhRS/KUMXO8mVLHRjm9.kEJhqZhaCZcBwSejNG0ja', 4314, 'Maolana Abdul Mannan er Bari, Courtpara, Kumira (4314), Sitakunda, Chittagong, Banngladesh.', 1, '01851838044'),
(202, 'a@gmail.com', 'slfjs', 'aslfjs', 'slfjsalfjsf', 4314, 'sdfjosifjdsiofjsfpoijfoi\r\nsldkfj', 1, '430685760'),
(203, 'juba@gmail.com', 'md', 'juba', '$2y$10$Bmrb.mOgSNgOHnd/9iOOJu8haSI57st4Ghsjc3ij.Ah554UQxJium', 4314, 'chittagong', NULL, '01851838044');

-- --------------------------------------------------------

--
-- Table structure for table `user_verification`
--

CREATE TABLE `user_verification` (
  `hash_id` int(45) NOT NULL,
  `user_id` int(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `hash-time` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_verification`
--

INSERT INTO `user_verification` (`hash_id`, `user_id`, `hash`, `hash-time`) VALUES
(1, 7, 'cfsdafagfsgasdfdsfasdfdsafa', '2019-07-19 01:24:00.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name_UNIQUE` (`brand_name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_has_user` (`cart_user_id`),
  ADD KEY `fk_cart_has_product` (`cart_product_id`);

--
-- Indexes for table `featured-products`
--
ALTER TABLE `featured-products`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_user_id_idx` (`order_user_id`),
  ADD KEY `fk_order_payment_method_id_idx` (`order_payment_method_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_orders_has_products_products1_idx` (`products_product_id`),
  ADD KEY `fk_orders_has_products_orders1_idx` (`orders_order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payment_order_id_idx` (`payment_order_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_products_brands1_idx` (`product_brand_id`),
  ADD KEY `fk_products_pruduct_catagory1_idx` (`product_catagory_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `fk_img_product_id_idx` (`img_product_id`);

--
-- Indexes for table `pruduct_catagory`
--
ALTER TABLE `pruduct_catagory`
  ADD PRIMARY KEY (`product_catagory_id`),
  ADD UNIQUE KEY `product_catagory_name_UNIQUE` (`product_catagory_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `user_verification`
--
ALTER TABLE `user_verification`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `fk_user_has_hash` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
