-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2018 at 05:25 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsacs`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `CheckIn_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `Description` mediumtext,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `is_head` varchar(45) DEFAULT NULL,
  `govtIDNumber` varchar(100) NOT NULL,
  `govtIDTypeDesc` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `family_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clientlog`
--

CREATE TABLE `clientlog` (
  `Client_id` int(11) NOT NULL,
  `fieldModified` varchar(45) DEFAULT NULL,
  `OldValue` varchar(1000) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `family_id` int(11) NOT NULL,
  `familyName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foodbank`
--

CREATE TABLE `foodbank` (
  `Request_id` int(11) NOT NULL,
  `sFoodBank_id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foodbank_inventory`
--

CREATE TABLE `foodbank_inventory` (
  `Item_id` int(11) NOT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `sFoodBank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foodpantry`
--

CREATE TABLE `foodpantry` (
  `sFoodPantry_id` int(11) NOT NULL,
  `description` mediumtext,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numberOfUnits` int(11) NOT NULL DEFAULT '1',
  `expirationDate` date DEFAULT NULL,
  `subCategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemcategory`
--

CREATE TABLE `itemcategory` (
  `category_id` int(11) NOT NULL,
  `categoryName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemsubcategory`
--

CREATE TABLE `itemsubcategory` (
  `subCategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `source_user_id` int(11) NOT NULL,
  `destination_user_id` int(11) NOT NULL,
  `Item_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  `RequestedItemCount` int(11) DEFAULT NULL,
  `Items_provided` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roomwaitlist`
--

CREATE TABLE `roomwaitlist` (
  `shelter_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `sName` varchar(255) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelter`
--

CREATE TABLE `shelter` (
  `sShelter_id` int(11) NOT NULL,
  `hoursOfOperation` varchar(255) DEFAULT '7PM to 7AM',
  `bunkType` varchar(2) DEFAULT NULL,
  `bunkAvailableCount` int(11) DEFAULT NULL,
  `familyRoomAvailableCount` int(11) DEFAULT NULL,
  `description` mediumtext,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `site_id` int(11) NOT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  `addressLine1` varchar(500) DEFAULT NULL,
  `addressLine2` varchar(500) DEFAULT NULL,
  `city` varchar(90) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `soupkitchen`
--

CREATE TABLE `soupkitchen` (
  `sSoupKitchen_id` int(11) NOT NULL,
  `Description` mediumtext,
  `totalSeatAvailable` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`CheckIn_id`,`client_id`,`user_id`,`service_id`),
  ADD KEY `fk_CheckIn_Client1_idx` (`client_id`),
  ADD KEY `fk_CheckIn_User1_idx` (`user_id`),
  ADD KEY `fk_CheckIn_Service1_idx` (`service_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`,`family_id`),
  ADD KEY `fk_Client_Family1_idx` (`family_id`);

--
-- Indexes for table `clientlog`
--
ALTER TABLE `clientlog`
  ADD PRIMARY KEY (`Client_id`),
  ADD KEY `fk_ClientLog_Client1_idx` (`Client_id`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`family_id`);

--
-- Indexes for table `foodbank`
--
ALTER TABLE `foodbank`
  ADD PRIMARY KEY (`Request_id`,`sFoodBank_id`),
  ADD KEY `fk_FoodBank_Request1_idx` (`Request_id`),
  ADD KEY `fk_FoodBank_Service1_idx` (`sFoodBank_id`);

--
-- Indexes for table `foodbank_inventory`
--
ALTER TABLE `foodbank_inventory`
  ADD PRIMARY KEY (`Item_id`,`sFoodBank_id`),
  ADD KEY `fk_Item_FoodBank_Item1_idx` (`Item_id`),
  ADD KEY `fk_FoodBank_Inventory_FoodBank1_idx` (`sFoodBank_id`);

--
-- Indexes for table `foodpantry`
--
ALTER TABLE `foodpantry`
  ADD PRIMARY KEY (`sFoodPantry_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Item_id`,`subCategory_id`,`category_id`),
  ADD KEY `fk_Item_subCategory1_idx` (`subCategory_id`,`category_id`);

--
-- Indexes for table `itemcategory`
--
ALTER TABLE `itemcategory`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `table1_id_UNIQUE` (`category_id`);

--
-- Indexes for table `itemsubcategory`
--
ALTER TABLE `itemsubcategory`
  ADD PRIMARY KEY (`subCategory_id`,`category_id`),
  ADD KEY `fk_subCategory_Category1_idx` (`category_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`,`source_user_id`),
  ADD KEY `fk_Request_User1_idx` (`source_user_id`);

--
-- Indexes for table `roomwaitlist`
--
ALTER TABLE `roomwaitlist`
  ADD PRIMARY KEY (`shelter_id`,`family_id`),
  ADD KEY `fk_RoomWaitList_Shelter1_idx` (`shelter_id`),
  ADD KEY `fk_RoomWaitList_Family1_idx` (`family_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`,`site_id`),
  ADD KEY `fk_Service_Site1_idx` (`site_id`);

--
-- Indexes for table `shelter`
--
ALTER TABLE `shelter`
  ADD PRIMARY KEY (`sShelter_id`),
  ADD KEY `fk_Shelter_Service1_idx` (`sShelter_id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`site_id`);

--
-- Indexes for table `soupkitchen`
--
ALTER TABLE `soupkitchen`
  ADD PRIMARY KEY (`sSoupKitchen_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`site_id`),
  ADD KEY `fk_User_Site1_idx` (`site_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `Item_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itemcategory`
--
ALTER TABLE `itemcategory`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `fk_CheckIn_Client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CheckIn_Service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CheckIn_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Family1` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clientlog`
--
ALTER TABLE `clientlog`
  ADD CONSTRAINT `fk_ClientLog_Client1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodbank`
--
ALTER TABLE `foodbank`
  ADD CONSTRAINT `fk_FoodBank_Request1` FOREIGN KEY (`Request_id`) REFERENCES `request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_FoodBank_Service1` FOREIGN KEY (`sFoodBank_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodbank_inventory`
--
ALTER TABLE `foodbank_inventory`
  ADD CONSTRAINT `fk_FoodBank_Inventory_FoodBank1` FOREIGN KEY (`sFoodBank_id`) REFERENCES `foodbank` (`sFoodBank_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Item_FoodBank_Item1` FOREIGN KEY (`Item_id`) REFERENCES `item` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodpantry`
--
ALTER TABLE `foodpantry`
  ADD CONSTRAINT `fk_FoodPantry_Service1` FOREIGN KEY (`sFoodPantry_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_Item_subCategory1` FOREIGN KEY (`subCategory_id`,`category_id`) REFERENCES `itemsubcategory` (`subCategory_id`, `category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemsubcategory`
--
ALTER TABLE `itemsubcategory`
  ADD CONSTRAINT `fk_subCategory_Category1` FOREIGN KEY (`category_id`) REFERENCES `itemcategory` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_Request_User1` FOREIGN KEY (`source_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roomwaitlist`
--
ALTER TABLE `roomwaitlist`
  ADD CONSTRAINT `fk_RoomWaitList_Family1` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RoomWaitList_Shelter1` FOREIGN KEY (`shelter_id`) REFERENCES `shelter` (`sShelter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_Service_Site1` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shelter`
--
ALTER TABLE `shelter`
  ADD CONSTRAINT `fk_Shelter_Service10` FOREIGN KEY (`sShelter_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soupkitchen`
--
ALTER TABLE `soupkitchen`
  ADD CONSTRAINT `fk_SoupKitchen_Service1` FOREIGN KEY (`sSoupKitchen_id`) REFERENCES `service` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_User_Site1` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
