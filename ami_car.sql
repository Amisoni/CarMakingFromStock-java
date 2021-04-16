-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2021 at 08:24 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ami_car`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_inv`(IN `no` INT(5), IN `name` VARCHAR(20), IN `product` VARCHAR(20), IN `qtv` INT(10), IN `rate` INT(10), IN `price` INT(10))
    NO SQL
INSERT INTO `pur`(`no`, `name`, `product`, `qty`, `rate`, `price`) VALUES (no,name,pname,qty,price,qty*rate)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sales`(IN `name` VARCHAR(20), IN `pname` VARCHAR(20), IN `qty` INT(5), IN `price` INT(5))
INSERT INTO `sales`(`name`, `pname`, `qty`, `price`, `total`) VALUES (name,pname,qty,price,qty*price)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inv`
--

CREATE TABLE IF NOT EXISTS `inv` (
  `no` int(3) NOT NULL,
  `iname` varchar(20) NOT NULL,
  `inven` int(5) NOT NULL,
  `u_zen` int(5) NOT NULL,
  `s_swift` int(5) NOT NULL,
  `car3` int(11) NOT NULL,
  `car4` int(11) NOT NULL,
  `car5` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv`
--

INSERT INTO `inv` (`no`, `iname`, `inven`, `u_zen`, `s_swift`, `car3`, `car4`, `car5`) VALUES
(1, 'tyre', 410, 4, 4, 0, 0, 0),
(2, 'break', 270, 2, 3, 0, 0, 0),
(3, 'cluch', 330, 1, 2, 0, 0, 0),
(4, 'gear', 200, 1, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `make_swift`
--
CREATE TABLE IF NOT EXISTS `make_swift` (
`total_car` decimal(48,4)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `make_zen`
--
CREATE TABLE IF NOT EXISTS `make_zen` (
`total_car` decimal(48,4)
);
-- --------------------------------------------------------

--
-- Table structure for table `pur`
--

CREATE TABLE IF NOT EXISTS `pur` (
  `no` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `product` varchar(20) NOT NULL,
  `qty` int(3) NOT NULL,
  `rate` int(3) NOT NULL,
  `price` int(3) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `pur`
--

INSERT INTO `pur` (`no`, `name`, `product`, `qty`, `rate`, `price`) VALUES
(16, 'dfd', 'tyre', 10, 2, 2),
(17, 'fgf', 'cluch', 30, 2, 2),
(18, 'yuyu', 'break', 20, 2, 2);

--
-- Triggers `pur`
--
DROP TRIGGER IF EXISTS `update_inv`;
DELIMITER //
CREATE TRIGGER `update_inv` AFTER INSERT ON `pur`
 FOR EACH ROW update inv set inv.inven=IF((select pur.product from pur where pur.no=new.no)='tyre',400+(SELECT qt.qty from qt where qt.product='tyre'),IF((select pur.product from pur where pur.no=new.no)='break',250+(SELECT qt.qty from qt where qt.product='break'),IF((select pur.product from pur where pur.no=new.no)='cluch',300+(SELECT qt.qty from qt where qt.product='cluch'),IF((select pur.product from pur where pur.no=new.no)='gear',200+(SELECT qt.qty from qt where qt.product='gear'),0)))) where inv.iname=(select pur.product FROM pur where pur.no=new.no)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `qt`
--
CREATE TABLE IF NOT EXISTS `qt` (
`product` varchar(20)
,`qty` decimal(32,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `r_inv`
--
CREATE TABLE IF NOT EXISTS `r_inv` (
`no` int(3)
,`iname` varchar(20)
,`use_qty` decimal(43,0)
,`remain` decimal(44,0)
);
-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `no` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` int(5) NOT NULL,
  `total` int(5) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`no`, `name`, `pname`, `qty`, `price`, `total`) VALUES
(4, 'aa', 'zen', 10, 10, 10),
(5, 'bb', 'swift', 10, 10, 10),
(6, 'abc', 'zen', 2, 2000, 4000),
(7, 'RRR', 'zen', 2, 2000, 4000),
(8, 'ww', 'zen', 20, 100, 0),
(9, 'aa', 'swift', 2, 20, 22000),
(10, 'ami', 'tyre', 20, 200, 4000),
(12, 'aryan', 'tyre', 5, 50, 250),
(13, 'aa', 'tyre', 2, 2, 4);

-- --------------------------------------------------------

--
-- Structure for view `make_swift`
--
DROP TABLE IF EXISTS `make_swift`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `make_swift` AS select min((`r_inv`.`remain` / `inv`.`s_swift`)) AS `total_car` from (`r_inv` join `inv`) where (`r_inv`.`no` = `inv`.`no`);

-- --------------------------------------------------------

--
-- Structure for view `make_zen`
--
DROP TABLE IF EXISTS `make_zen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `make_zen` AS select min((`r_inv`.`remain` / `inv`.`u_zen`)) AS `total_car` from (`r_inv` join `inv`) where (`r_inv`.`no` = `inv`.`no`);

-- --------------------------------------------------------

--
-- Structure for view `qt`
--
DROP TABLE IF EXISTS `qt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qt` AS select `pur`.`product` AS `product`,sum(`pur`.`qty`) AS `qty` from `pur` group by `pur`.`product`;

-- --------------------------------------------------------

--
-- Structure for view `r_inv`
--
DROP TABLE IF EXISTS `r_inv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `r_inv` AS select `inv`.`no` AS `no`,`inv`.`iname` AS `iname`,(((select sum(`sales`.`qty`) from `sales` where (`sales`.`pname` = 'zen')) * `inv`.`u_zen`) + ((select sum(`sales`.`qty`) from `sales` where (`sales`.`pname` = 'swift')) * `inv`.`s_swift`)) AS `use_qty`,(`inv`.`inven` - (((select sum(`sales`.`qty`) from `sales` where (`sales`.`pname` = 'zen')) * `inv`.`u_zen`) + ((select sum(`sales`.`qty`) from `sales` where (`sales`.`pname` = 'swift')) * `inv`.`s_swift`))) AS `remain` from `inv`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
