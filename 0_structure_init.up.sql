SET foreign_key_checks = 0;

CREATE TABLE `archetype` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_type_id` bigint(20) unsigned DEFAULT NULL,
  `customer_group` tinyint(1) DEFAULT '0',
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `name_id` varchar(100) DEFAULT '',
  `abbreviation` varchar(3) DEFAULT '' COMMENT 'NOT USED',
  `note` varchar(250) DEFAULT '',
  `aux_data` tinyint(1) DEFAULT '2' COMMENT 'auxiliary data',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_archetype_1_idx` (`business_type_id`) USING BTREE,
  CONSTRAINT `fk_archetype_1` FOREIGN KEY (`business_type_id`) REFERENCES `business_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `area` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `aux_data` tinyint(1) DEFAULT '2' COMMENT 'auxiliary data',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `area_policy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `min_order` decimal(12,2) DEFAULT '0.00',
  `delivery_fee` decimal(12,2) DEFAULT '0.00',
  `order_time_limit` varchar(5) DEFAULT '',
  `draft_order_time_limit` varchar(5) DEFAULT '',
  `default_price_set` bigint(20) unsigned DEFAULT NULL,
  `cs_phone_number` varchar(20) DEFAULT '',
  `max_day_delivery_date` int(11) DEFAULT '0',
  `weekly_day_off` int(11) DEFAULT '0',
  `main_office_city_name` varchar(30) DEFAULT '' COMMENT 'correspondence needs',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_delivery_config_1_idx` (`area_id`) USING BTREE,
  KEY `fk_area_policy_2` (`default_price_set`) USING BTREE,
  CONSTRAINT `fk_area_policy_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_area_policy_2` FOREIGN KEY (`default_price_set`) REFERENCES `price_set` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_config_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `audit_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned DEFAULT NULL,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(30) DEFAULT '',
  `function` varchar(30) DEFAULT '',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_audit_log_1_idx` (`staff_id`) USING BTREE,
  KEY `fk_audit_log_2_idx` (`merchant_id`) USING BTREE,
  KEY `audit_log_type_ref_id_idx` (`type`,`ref_id`),
  CONSTRAINT `fk_audit_log_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_audit_log_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_product_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `area` varchar(100) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `navigate_type` tinyint(1) DEFAULT '0',
  `navigate_url` varchar(300) DEFAULT '',
  `image_url` varchar(300) DEFAULT '',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `branch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `archetype_id` bigint(20) unsigned DEFAULT NULL,
  `price_set_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `salesperson_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `pic_name` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(100) DEFAULT '',
  `address_name` varchar(100) DEFAULT '',
  `shipping_address` varchar(350) DEFAULT '',
  `latitude` varchar(100) DEFAULT '',
  `longitude` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `main_branch` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_branch_1_idx` (`merchant_id`) USING BTREE,
  KEY `fk_branch_2_idx` (`area_id`) USING BTREE,
  KEY `fk_branch_3_idx` (`archetype_id`) USING BTREE,
  KEY `fk_branch_4_idx` (`price_set_id`) USING BTREE,
  KEY `fk_branch_5_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_branch_6_idx` (`salesperson_id`) USING BTREE,
  KEY `fk_branch_7_idx` (`sub_district_id`) USING BTREE,
  CONSTRAINT `fk_branch_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_3` FOREIGN KEY (`archetype_id`) REFERENCES `archetype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_4` FOREIGN KEY (`price_set_id`) REFERENCES `price_set` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_5` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_6` FOREIGN KEY (`salesperson_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_7` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `business_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `abbreviation` varchar(10) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `aux_data` tinyint(1) DEFAULT '2' COMMENT 'auxiliary data',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='product category';


CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_city_1_idx` (`province_id`) USING BTREE,
  CONSTRAINT `fk_city_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='kabupaten/kota';


CREATE TABLE `code_generator` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ui_code_generator_1_idx` (`code`,`code_name`) USING BTREE,
  KEY `xi_code_generator_1_idx` (`code`) USING BTREE,
  KEY `xi_code_generator_2_idx` (`code_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `code_generator_referral` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_code` (`code`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `cogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `eta_date` date DEFAULT NULL,
  `total_qty` decimal(20,2) DEFAULT NULL,
  `total_subtotal` decimal(20,2) DEFAULT NULL,
  `total_avg` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cogs_1_idx` (`product_id`),
  KEY `fk_cogs_2_idx` (`warehouse_id`),
  CONSTRAINT `fk_cogs_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cogs_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `config_app` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application` tinyint(2) DEFAULT '0',
  `field` varchar(50) DEFAULT '',
  `attribute` varchar(50) DEFAULT '',
  `value` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='application configuration';


CREATE TABLE `country` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='provinsi';


CREATE TABLE `courier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `courier_vendor_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `license_plate` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courier_1` (`warehouse_id`),
  KEY `fk_courier_2` (`courier_vendor_id`),
  CONSTRAINT `fk_courier_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courier_2` FOREIGN KEY (`courier_vendor_id`) REFERENCES `courier_vendor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `courier_transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_order_id` bigint(20) unsigned DEFAULT NULL,
  `latitude` varchar(250) DEFAULT NULL,
  `longitude` varchar(250) DEFAULT NULL,
  `accuracy` varchar(250) DEFAULT NULL,
  `courier_name` varchar(100) DEFAULT NULL,
  `courier_phone_no` varchar(15) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courier_transaction_1` (`delivery_order_id`),
  CONSTRAINT `fk_courier_transaction_1` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `courier_vendor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `day_off` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `off_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `delivery_koli` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL COMMENT 'to shorten way to get koli from sales invoice',
  `koli_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_koli_1_idx` (`sales_order_id`),
  KEY `fk_delivery_koli_2_idx` (`koli_id`),
  CONSTRAINT `fk_delivery_koli_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_koli_2` FOREIGN KEY (`koli_id`) REFERENCES `koli` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='details of koli per delivery';


CREATE TABLE `delivery_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `wrt_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `shipping_address` varchar(350) DEFAULT '',
  `receipt_note` varchar(250) DEFAULT '',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `delta_print` int(3) DEFAULT '0',
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `confirmed_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `cancellation_note` varchar(250) DEFAULT NULL,
  `has_delivered` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_delivery_order_1_idx` (`sales_order_id`) USING BTREE,
  KEY `fk_delivery_order_2_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_delivery_order_3_idx` (`wrt_id`) USING BTREE,
  CONSTRAINT `fk_delivery_order_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_3` FOREIGN KEY (`wrt_id`) REFERENCES `wrt` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `delivery_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_order_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `deliver_qty` decimal(10,2) DEFAULT '0.00',
  `receive_qty` decimal(10,2) DEFAULT '0.00',
  `receipt_item_note` varchar(100) DEFAULT '',
  `order_item_note` varchar(100) DEFAULT '',
  `weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_delivery_order_item_1_idx` (`delivery_order_id`) USING BTREE,
  KEY `fk_delivery_order_item_2_idx` (`sales_order_item_id`) USING BTREE,
  KEY `fk_delivery_order_item_3_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_delivery_order_item_1` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_item_2` FOREIGN KEY (`sales_order_item_id`) REFERENCES `sales_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_item_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `delivery_return` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `delivery_order_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `confirmed_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_delivery_return_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_delivery_return_2_idx` (`delivery_order_id`) USING BTREE,
  CONSTRAINT `fk_delivery_return_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_return_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `delivery_return_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_return_id` bigint(20) unsigned DEFAULT NULL,
  `delivery_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `return_good_qty` decimal(10,2) DEFAULT '0.00',
  `return_waste_qty` decimal(10,2) DEFAULT '0.00',
  `unit_cost` decimal(12,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_delivery_return_item_1_idx` (`delivery_return_id`) USING BTREE,
  KEY `fk_delivery_return_item_2_idx` (`product_id`) USING BTREE,
  KEY `fk_delivery_return_item_3_idx` (`delivery_order_item_id`) USING BTREE,
  CONSTRAINT `fk_delivery_return_item_1` FOREIGN KEY (`delivery_return_id`) REFERENCES `delivery_return` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_return_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_return_item_3` FOREIGN KEY (`delivery_order_item_id`) REFERENCES `delivery_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `district` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_district_1_idx` (`city_id`) USING BTREE,
  CONSTRAINT `fk_district_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='kecamatan';


CREATE TABLE `division` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `document_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_code` varchar(50) DEFAULT NULL,
  `sales_order_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created time of duplicate invoices and payments',
  `from_cronjob` tinyint(1) DEFAULT '0' COMMENT '1 yes 2 no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `faq_question` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_topic_id` bigint(20) unsigned DEFAULT NULL,
  `question` varchar(100) DEFAULT '',
  `answer` mediumtext,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_faq_question_1_idx` (`faq_topic_id`) USING BTREE,
  CONSTRAINT `fk_faq_question_1` FOREIGN KEY (`faq_topic_id`) REFERENCES `faq_topic` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `faq_topic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `forecast_demand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `forecast_date` date DEFAULT NULL,
  `forecast_qty` decimal(10,2) DEFAULT '0.00',
  `demand_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'add qty from created so and subtract when cancelled.',
  PRIMARY KEY (`id`),
  KEY `fk_cogs_1_idx` (`product_id`),
  KEY `fk_cogs_2_idx` (`warehouse_id`),
  CONSTRAINT `fk_forecast_demand_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_forecast_demand_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `glossary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT '',
  `attribute` varchar(30) DEFAULT '',
  `value_int` tinyint(3) DEFAULT '0',
  `value_name` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `goods_receipt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `ata_date` date DEFAULT NULL COMMENT 'actual time arrival',
  `ata_time` varchar(5) DEFAULT '',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `confirmed_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_goods_receipt_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_goods_receipt_2_idx` (`purchase_order_id`) USING BTREE,
  CONSTRAINT `fk_goods_receipt_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_receipt_2` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `goods_receipt_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_receipt_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `deliver_qty` decimal(10,2) DEFAULT '0.00',
  `reject_qty` decimal(10,2) DEFAULT '0.00',
  `receive_qty` decimal(10,2) DEFAULT '0.00',
  `weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_goods_receipt_item_1_idx` (`goods_receipt_id`) USING BTREE,
  KEY `fk_goods_receipt_item_2_idx` (`purchase_order_item_id`) USING BTREE,
  KEY `fk_goods_receipt_item_3_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_goods_receipt_item_1` FOREIGN KEY (`goods_receipt_id`) REFERENCES `goods_receipt` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_receipt_item_2` FOREIGN KEY (`purchase_order_item_id`) REFERENCES `purchase_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_receipt_item_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `goods_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `origin_id` bigint(20) unsigned DEFAULT NULL,
  `destination_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `eta_date` date DEFAULT NULL COMMENT 'estimated time of arrival',
  `eta_time` varchar(5) DEFAULT '' COMMENT 'estimated time of arrival',
  `ata_date` date DEFAULT NULL COMMENT 'actual time of arrival',
  `ata_time` varchar(5) DEFAULT '' COMMENT 'actual time of arrival',
  `addtl_cost` decimal(20,2) DEFAULT '0.00' COMMENT 'additional cost',
  `addtl_cost_note` varchar(250) DEFAULT '' COMMENT 'additional cost note',
  `total_cost` decimal(20,2) DEFAULT '0.00',
  `total_charge` decimal(20,2) DEFAULT '0.00',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_goods_transfer_1_idx` (`origin_id`) USING BTREE,
  KEY `fk_goods_transfer_2_idx` (`destination_id`) USING BTREE,
  CONSTRAINT `fk_goods_transfer_1` FOREIGN KEY (`origin_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_transfer_2` FOREIGN KEY (`destination_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `goods_transfer_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_transfer_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `deliver_qty` decimal(10,2) DEFAULT '0.00',
  `receive_qty` decimal(10,2) DEFAULT '0.00',
  `receive_note` varchar(100) DEFAULT '',
  `unit_cost` decimal(12,2) DEFAULT '0.00',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_goods_transfer_item_1_idx` (`goods_transfer_id`) USING BTREE,
  KEY `fk_goods_transfer_item_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_goods_transfer_item_1` FOREIGN KEY (`goods_transfer_id`) REFERENCES `goods_transfer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_transfer_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endpoint_url` varchar(100) DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL,
  `endpoint_method` varchar(100) DEFAULT NULL,
  `request_body` json DEFAULT NULL,
  `response_body` json DEFAULT NULL,
  `response_code` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `retry_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `koli` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(250) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='delivery unit';


CREATE TABLE `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(50) DEFAULT '',
  `url` varchar(100) DEFAULT '',
  `icon` varchar(100) DEFAULT '',
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `order` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `merchant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_merchant_id` bigint(20) unsigned DEFAULT NULL,
  `payment_group_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_invoice_sls_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `business_type_id` bigint(20) unsigned DEFAULT NULL,
  `finance_area_id` bigint(20) unsigned DEFAULT NULL,
  `prospect_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'registered from prospective customer',
  `customer_group` tinyint(1) DEFAULT '0',
  `tag_customer` varchar(100) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `referral_code` varchar(30) DEFAULT NULL,
  `name` varchar(100) DEFAULT '',
  `gender` tinyint(1) DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `pic_name` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `billing_address` varchar(350) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `reference_info` varchar(50) DEFAULT '',
  `referrer_id` bigint(20) DEFAULT NULL COMMENT 'main_outlet_id',
  `referrer_code` varchar(30) DEFAULT NULL,
  `total_point` decimal(8,1) DEFAULT '0.0',
  `upgrade_status` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_merchant_1_idx` (`user_merchant_id`) USING BTREE,
  KEY `fk_merchant_3_idx` (`term_payment_sls_id`) USING BTREE,
  KEY `fk_merchant_4_idx` (`payment_method_id`) USING BTREE,
  KEY `fk_merchant_5_idx` (`business_type_id`) USING BTREE,
  KEY `fk_merchant_2_idx` (`term_invoice_sls_id`) USING BTREE,
  KEY `fk_merchant_6_idx` (`finance_area_id`) USING BTREE,
  KEY `fk_merchant_7_idx` (`payment_group_sls_id`) USING BTREE,
  CONSTRAINT `fk_merchant_1` FOREIGN KEY (`user_merchant_id`) REFERENCES `user_merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_2` FOREIGN KEY (`term_invoice_sls_id`) REFERENCES `term_invoice_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_3` FOREIGN KEY (`term_payment_sls_id`) REFERENCES `term_payment_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_4` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_5` FOREIGN KEY (`business_type_id`) REFERENCES `business_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_6` FOREIGN KEY (`finance_area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_7` FOREIGN KEY (`payment_group_sls_id`) REFERENCES `payment_group_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `merchant_acc_num` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `payment_channel_id` bigint(20) unsigned DEFAULT NULL,
  `account_number` varchar(100) DEFAULT '',
  `account_name` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_merchant_acc_num_1_idx` (`merchant_id`) USING BTREE,
  KEY `fk_merchant_acc_num_2_idx` (`payment_channel_id`) USING BTREE,
  CONSTRAINT `fk_merchant_acc_num_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_acc_num_2` FOREIGN KEY (`payment_channel_id`) REFERENCES `payment_channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `merchant_point_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL COMMENT 'sales order id related with point',
  `point_value` decimal(8,1) unsigned DEFAULT '0.0',
  `recent_point` decimal(8,1) unsigned DEFAULT '0.0' COMMENT 'last point add or substract with new',
  `status` tinyint(1) DEFAULT '0' COMMENT 'point status',
  `created_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_merchant_point_log_1_idx` (`merchant_id`) USING BTREE,
  KEY `fk_merchant_point_log_2_idx` (`sales_order_id`) USING BTREE,
  CONSTRAINT `fk_merchant_point_log_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_point_log_2` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `merchant_price_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `price_set_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_merchant_price_set_1_idx` (`merchant_id`) USING BTREE,
  KEY `fk_merchant_price_set_2_idx` (`area_id`) USING BTREE,
  KEY `fk_merchant_price_set_3_idx` (`price_set_id`) USING BTREE,
  CONSTRAINT `fk_merchant_price_set_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_price_set_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_price_set_3` FOREIGN KEY (`price_set_id`) REFERENCES `price_set` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `notification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `message` varchar(200) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `notification_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `message` varchar(300) DEFAULT '',
  `read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_notification_log_1_idx` (`merchant_id`) USING BTREE,
  CONSTRAINT `fk_notification_log_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `notification_picking_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `title` text,
  `message` varchar(300) DEFAULT '',
  `read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_notification_picking_log_1_idx` (`staff_id`) USING BTREE,
  CONSTRAINT `fk_notification_picking_log_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `notification_sales_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `title` text,
  `message` varchar(300) DEFAULT '',
  `read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_notification_sales_log_1_idx` (`staff_id`) USING BTREE,
  CONSTRAINT `fk_notification_sales_log_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `order_type_sls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `abbreviation` varchar(3) DEFAULT '',
  `min_order_qty` decimal(5,2) DEFAULT '0.00' COMMENT 'mininum order quantity',
  `min_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT 'minimum unit price',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `otp_outgoing` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) CHARACTER SET utf8 DEFAULT '' COMMENT 'receiver',
  `otp` varchar(6) CHARACTER SET utf8 DEFAULT '',
  `usage_type` tinyint(1) DEFAULT '0',
  `otp_status` tinyint(1) DEFAULT '0',
  `vendor` tinyint(1) DEFAULT '0',
  `application` tinyint(1) DEFAULT '0',
  `vendor_message_id` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `message_type` tinyint(1) DEFAULT '0',
  `message` text CHARACTER SET utf8,
  `delivery_status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


CREATE TABLE `packing_helper_log` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `packing_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `staff_id` bigint(20) unsigned DEFAULT NULL,
  `qty_weight` decimal(10,2) DEFAULT '0.00',
  `qty_pack` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_packing_helper_log_1_idx` (`packing_order_item_id`) USING BTREE,
  KEY `fk_packing_helper_log_2_idx` (`staff_id`) USING BTREE,
  CONSTRAINT `fk_packing_helper_log_1` FOREIGN KEY (`packing_order_item_id`) REFERENCES `packing_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_packing_helper_log_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


CREATE TABLE `packing_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `delivery_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_packing_order_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_packing_order_2_idx` (`area_id`) USING BTREE,
  CONSTRAINT `fk_packing_order_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_packing_order_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `packing_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `packing_order_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `total_order` decimal(10,2) DEFAULT '0.00',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `total_pack` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_packing_order_item_1_idx` (`packing_order_id`) USING BTREE,
  KEY `fk_packing_order_item_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_packing_order_item_1` FOREIGN KEY (`packing_order_id`) REFERENCES `packing_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_packing_order_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `packing_order_item_assign` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `packing_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `staff_id` bigint(20) unsigned DEFAULT NULL,
  `subtotal_weight` decimal(10,2) DEFAULT '0.00',
  `subtotal_pack` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_packing_order_item_assign_1_idx` (`packing_order_item_id`) USING BTREE,
  KEY `fk_packing_order_item_assign_2_idx` (`staff_id`) USING BTREE,
  CONSTRAINT `fk_packing_order_item_assign_1` FOREIGN KEY (`packing_order_item_id`) REFERENCES `packing_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_packing_order_item_assign_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


CREATE TABLE `payment_channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `image_url` varchar(300) DEFAULT '',
  `payment_guide_url` varchar(300) DEFAULT '',
  `note` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `publish_iva` tinyint(1) DEFAULT '0',
  `publish_fva` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_payment_channel_1_idx` (`payment_method_id`) USING BTREE,
  CONSTRAINT `fk_payment_channel_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `payment_group_comb` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_group_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_invoice_sls_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_payment_group_comb_1_idx` (`payment_group_sls_id`) USING BTREE,
  KEY `fk_payment_group_comb_2_idx` (`term_payment_sls_id`) USING BTREE,
  KEY `fk_payment_group_comb_3_idx` (`term_invoice_sls_id`) USING BTREE,
  CONSTRAINT `fk_payment_group_comb_1` FOREIGN KEY (`payment_group_sls_id`) REFERENCES `payment_group_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_group_comb_2` FOREIGN KEY (`term_payment_sls_id`) REFERENCES `term_payment_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_group_comb_3` FOREIGN KEY (`term_invoice_sls_id`) REFERENCES `term_invoice_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `payment_group_sls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `name_id` varchar(100) DEFAULT '',
  `note` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `payment_guide` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_channel_id` bigint(20) unsigned DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `content` mediumtext,
  `order` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `payment_method` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `maintenance` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ui_permission_1_idx` (`value`) USING BTREE,
  UNIQUE KEY `ui_permission_2_idx` (`code`) USING BTREE,
  UNIQUE KEY `ui_permission_3_idx` (`name`) USING BTREE,
  KEY `fk_permission_1_idx` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_permission_1` FOREIGN KEY (`parent_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `picking_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `recognition_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_picking_order_1` (`warehouse_id`),
  CONSTRAINT `fk_picking_order_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `picking_order_assign` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `picking_order_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `staff_id` bigint(20) unsigned DEFAULT NULL COMMENT 'picker_id',
  `courier_id` bigint(20) unsigned DEFAULT NULL,
  `dispatcher_id` bigint(20) unsigned DEFAULT NULL,
  `courier_vendor_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `dispatch_status` tinyint(1) NOT NULL DEFAULT '1',
  `dispatch_timestamp` timestamp NULL DEFAULT NULL,
  `assign_timestamp` timestamp NULL DEFAULT NULL,
  `planning_vendor` varchar(50) DEFAULT NULL,
  `been_rejected` tinyint(1) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `checkin_timestamp` datetime DEFAULT NULL COMMENT 'picker check-in timestamp',
  `checkout_timestamp` datetime DEFAULT NULL COMMENT 'picker check-out timestamp',
  `checker_in_timestamp` datetime DEFAULT NULL COMMENT 'checker check-in timestamp',
  `checker_out_timestamp` datetime DEFAULT NULL COMMENT 'checker check-out timestamp',
  `total_koli` decimal(10,2) DEFAULT NULL,
  `total_scan_dispatch` int(5) DEFAULT NULL,
  `checked_at` timestamp NULL DEFAULT NULL COMMENT 'approved or rejected',
  `checked_by` bigint(20) unsigned DEFAULT NULL COMMENT 'approved or rejected',
  PRIMARY KEY (`id`),
  KEY `fk_picking_order_assign_1` (`picking_order_id`),
  KEY `fk_picking_order_assign_2` (`sales_order_id`),
  KEY `fk_picking_order_assign_3` (`staff_id`),
  KEY `fk_picking_order_assign_4` (`courier_id`),
  KEY `fk_picking_order_assign_5` (`dispatcher_id`),
  KEY `fk_picking_order_assign_6` (`courier_vendor_id`),
  CONSTRAINT `fk_picking_order_assign_1` FOREIGN KEY (`picking_order_id`) REFERENCES `picking_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_assign_2` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_assign_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_assign_4` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_assign_5` FOREIGN KEY (`dispatcher_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_assign_6` FOREIGN KEY (`courier_vendor_id`) REFERENCES `courier_vendor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `picking_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `picking_order_assign_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `order_qty` decimal(10,2) DEFAULT '0.00',
  `pick_qty` decimal(10,2) DEFAULT '0.00',
  `check_qty` decimal(10,2) DEFAULT '0.00',
  `unfullfill_note` varchar(100) DEFAULT '''''',
  `flag_order` tinyint(1) NOT NULL DEFAULT '3' COMMENT 'flag updated order',
  PRIMARY KEY (`id`),
  KEY `fk_picking_order_item_1` (`picking_order_assign_id`),
  KEY `fk_picking_order_item_2` (`product_id`),
  CONSTRAINT `fk_picking_order_item_1` FOREIGN KEY (`picking_order_assign_id`) REFERENCES `picking_order_assign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_picking_order_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `price_set_id` bigint(20) unsigned DEFAULT NULL,
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `shadow_price` decimal(12,2) DEFAULT '0.00',
  `shadow_price_pct` int(3) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_product_price_2_idx` (`price_set_id`) USING BTREE,
  KEY `fk_product_price_1_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_product_price_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_price_2` FOREIGN KEY (`price_set_id`) REFERENCES `price_set` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `price_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price_id` bigint(20) unsigned DEFAULT NULL,
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_price_log_1_idx` (`price_id`) USING BTREE,
  KEY `fk_price_log_2_idx` (`created_by`) USING BTREE,
  CONSTRAINT `fk_price_log_1` FOREIGN KEY (`price_id`) REFERENCES `price` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


SET NAMES utf8mb4;

CREATE TABLE `price_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price_set_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(2) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_time` varchar(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) unsigned NOT NULL,
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_price_schedule_1_idx` (`price_set_id`),
  KEY `fk_price_schedule_2_idx` (`created_by`),
  CONSTRAINT `fk_price_schedule_1` FOREIGN KEY (`price_set_id`) REFERENCES `price_set` (`id`),
  CONSTRAINT `fk_price_schedule_2` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `price_schedule_dump` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `price_schedule_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `price_set_id` bigint(20) unsigned NOT NULL,
  `unit_price` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_price_schedule_dump_1_idx` (`price_schedule_id`),
  KEY `fk_price_schedule_dump_2_idx` (`product_id`),
  KEY `fk_price_schedule_dump_3_idx` (`price_set_id`),
  CONSTRAINT `fk_price_schedule_dump_1` FOREIGN KEY (`price_schedule_id`) REFERENCES `price_schedule` (`id`),
  CONSTRAINT `fk_price_schedule_dump_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_price_schedule_dump_3` FOREIGN KEY (`price_set_id`) REFERENCES `price_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `price_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uom_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_sto` varchar(100) DEFAULT '',
  `warehouse_pur` varchar(100) DEFAULT '',
  `warehouse_sal` varchar(100) DEFAULT '',
  `tag_product` varchar(255) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `up_code` varchar(50) DEFAULT '' COMMENT 'universal product code',
  `name` varchar(100) DEFAULT '',
  `unit_weight` decimal(5,2) DEFAULT '0.00' COMMENT 'conversion to kg',
  `order_min_qty` decimal(5,2) DEFAULT '0.00' COMMENT 'conversion to kg',
  `order_max_qty` decimal(5,2) DEFAULT '0.00' COMMENT 'limit product',
  `spare_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `storability` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'conversion to kg',
  `purchasability` tinyint(1) NOT NULL DEFAULT '0',
  `salability` tinyint(1) NOT NULL DEFAULT '0',
  `packability` tinyint(1) NOT NULL DEFAULT '2',
  `description` varchar(500) DEFAULT '' COMMENT 'external use',
  `note` varchar(250) DEFAULT '' COMMENT 'internal use',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_item_1_idx` (`uom_id`) USING BTREE,
  KEY `fk_item_2_idx` (`category_id`) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `product_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `image_url` varchar(300) DEFAULT '',
  `main_image` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_product_image_1_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_product_image_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `prospect_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `archetype_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT 'merchant who requesting upgrade',
  `term_payment_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_invoice_sls_id` bigint(20) unsigned DEFAULT NULL,
  `payment_group_sls_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `gender` tinyint(1) DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT '',
  `business_type_name` varchar(50) DEFAULT '',
  `pic_name` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(100) DEFAULT '',
  `street_address` varchar(350) DEFAULT '',
  `time_consent` tinyint(1) DEFAULT '0',
  `reference_info` tinyint(2) DEFAULT '0',
  `referrer_code` varchar(30) DEFAULT '',
  `pic_finance_name` varchar(100) DEFAULT '',
  `pic_finance_contact` varchar(15) DEFAULT '',
  `pic_business_name` varchar(100) DEFAULT '',
  `pic_business_contact` varchar(15) DEFAULT '',
  `id_card_number` varchar(16) DEFAULT '',
  `id_card_image` varchar(300) DEFAULT '',
  `selfie_image` varchar(300) DEFAULT '',
  `taxpayer_number` varchar(20) DEFAULT '',
  `taxpayer_image` varchar(300) DEFAULT '',
  `billing_address` varchar(350) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `reg_status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `processed_by` bigint(20) unsigned DEFAULT NULL,
  `outlet_photo` text,
  `salesperson_id` bigint(20) unsigned DEFAULT NULL,
  `decline_type` tinyint(2) DEFAULT NULL,
  `decline_note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_prospect_customer_1_idx` (`archetype_id`) USING BTREE,
  KEY `fk_prospect_customer_2_idx` (`sub_district_id`) USING BTREE,
  KEY `fk_prospect_customer_3_idx` (`merchant_id`) USING BTREE,
  CONSTRAINT `fk_prospect_customer_1` FOREIGN KEY (`archetype_id`) REFERENCES `archetype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospect_customer_2` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospect_customer_3` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='prospective customer';

CREATE TABLE `prospect_supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(50) DEFAULT '',
  `street_address` varchar(350) DEFAULT '',
  `pic_name` varchar(100) DEFAULT '',
  `pic_address` varchar(350) DEFAULT '',
  `pic_phone_number` varchar(15) DEFAULT '',
  `commodity` varchar(250) DEFAULT '',
  `time_consent` tinyint(1) DEFAULT '0',
  `reg_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='prospective supplier';


CREATE TABLE `province` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_province_1_idx` (`country_id`) USING BTREE,
  CONSTRAINT `fk_province_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='provinsi';


CREATE TABLE `purchase_invoice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_pur_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `tax_pct` decimal(5,2) DEFAULT '0.00',
  `delivery_fee` decimal(10,2) DEFAULT '0.00',
  `adjustment` tinyint(1) DEFAULT '0',
  `adj_amount` decimal(20,2) DEFAULT '0.00',
  `adj_note` varchar(250) DEFAULT NULL,
  `total_price` decimal(20,2) DEFAULT '0.00',
  `total_charge` decimal(20,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_purchase_invoice_1_idx` (`purchase_order_id`) USING BTREE,
  KEY `fk_purchase_invoice_2_idx` (`term_payment_pur_id`) USING BTREE,
  CONSTRAINT `fk_purchase_invoice_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_invoice_2` FOREIGN KEY (`term_payment_pur_id`) REFERENCES `term_payment_pur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `purchase_invoice_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_invoice_id` bigint(20) unsigned DEFAULT NULL,
  `purchase_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_qty` decimal(10,2) DEFAULT '0.00',
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_purchase_invoice_item_1_idx` (`purchase_invoice_id`) USING BTREE,
  KEY `fk_purchase_invoice_item_2_idx` (`purchase_order_item_id`) USING BTREE,
  KEY `fk_purchase_invoice_item_3_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_purchase_invoice_item_1` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_invoice_item_2` FOREIGN KEY (`purchase_order_item_id`) REFERENCES `purchase_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_invoice_item_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `purchase_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_pur_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_badge_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `eta_date` date DEFAULT NULL,
  `warehouse_address` varchar(350) DEFAULT '',
  `eta_time` varchar(5) DEFAULT NULL,
  `tax_pct` decimal(5,2) DEFAULT '0.00',
  `delivery_fee` decimal(10,2) DEFAULT '0.00',
  `total_price` decimal(20,2) DEFAULT '0.00',
  `total_charge` decimal(20,2) DEFAULT '0.00',
  `total_invoice` decimal(20,2) DEFAULT '0.00',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT NULL,
  `created_from` tinyint(1) NOT NULL DEFAULT '0',
  `has_finished_gr` tinyint(1) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `committed_at` timestamp NULL DEFAULT NULL,
  `committed_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_purchase_order_1_idx` (`supplier_id`) USING BTREE,
  KEY `fk_purchase_order_2_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_purchase_order_3_idx` (`term_payment_pur_id`) USING BTREE,
  KEY `fk_purchase_order_4` (`supplier_badge_id`),
  CONSTRAINT `fk_purchase_order_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_3` FOREIGN KEY (`term_payment_pur_id`) REFERENCES `term_payment_pur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_4` FOREIGN KEY (`supplier_badge_id`) REFERENCES `supplier_badge` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `purchase_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `order_qty` decimal(10,2) DEFAULT '0.00',
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  `purchase_qty` decimal(10,2) DEFAULT NULL,
  `market_purchase` json DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_purchase_order_item_1_idx` (`purchase_order_id`) USING BTREE,
  KEY `fk_purchase_order_item_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_purchase_order_item_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `purchase_payment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_invoice_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT '0.00',
  `paid_off` tinyint(1) DEFAULT '0',
  `note` varchar(250) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `bank_payment_voucher_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_purchase_payment_1_idx` (`purchase_invoice_id`) USING BTREE,
  KEY `fk_purchase_payment_2_idx` (`payment_method_id`) USING BTREE,
  CONSTRAINT `fk_purchase_payment_1` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_payment_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `division_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_role_1_idx` (`division_id`) USING BTREE,
  CONSTRAINT `fk_role_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_role_permission_1_idx` (`role_id`) USING BTREE,
  KEY `fk_role_permission_2_idx` (`permission_id`) USING BTREE,
  CONSTRAINT `fk_role_permission_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_permission_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_type_id` bigint(20) unsigned DEFAULT NULL,
  `sls_man_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `city` varchar(100) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_group_1_idx` (`business_type_id`) USING BTREE,
  KEY `fk_sales_group_2_idx` (`sls_man_id`) USING BTREE,
  KEY `fk_sales_group_3_idx` (`area_id`) USING BTREE,
  CONSTRAINT `fk_sales_group_1` FOREIGN KEY (`business_type_id`) REFERENCES `business_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_group_2` FOREIGN KEY (`sls_man_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_group_3` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_invoice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `payment_group_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_invoice_sls_id` bigint(20) unsigned DEFAULT NULL,
  `voucher_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `code_ext` varchar(50) DEFAULT '' COMMENT 'external code',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `billing_address` varchar(350) DEFAULT '',
  `delivery_fee` decimal(10,2) DEFAULT '0.00',
  `vou_redeem_code` varchar(20) DEFAULT '',
  `vou_disc_amount` decimal(20,2) DEFAULT '0.00',
  `point_redeem_amount` decimal(20,2) DEFAULT '0.00',
  `adjustment` tinyint(1) DEFAULT '0',
  `adj_amount` decimal(20,2) DEFAULT '0.00',
  `adj_note` varchar(250) DEFAULT '',
  `total_price` decimal(20,2) DEFAULT '0.00',
  `total_charge` decimal(20,2) DEFAULT '0.00',
  `delta_print` int(3) DEFAULT '0',
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_invoice_1_idx` (`sales_order_id`) USING BTREE,
  KEY `fk_sales_invoice_2_idx` (`term_payment_sls_id`) USING BTREE,
  KEY `fk_sales_invoice_3_idx` (`payment_group_sls_id`) USING BTREE,
  KEY `fk_sales_invoice_4_idx` (`term_invoice_sls_id`) USING BTREE,
  CONSTRAINT `fk_sales_invoice_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_2` FOREIGN KEY (`term_payment_sls_id`) REFERENCES `term_payment_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_3` FOREIGN KEY (`payment_group_sls_id`) REFERENCES `payment_group_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_4` FOREIGN KEY (`term_invoice_sls_id`) REFERENCES `term_invoice_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_invoice_external` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `xendit_invoice_id` varchar(35) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_invoice_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_qty` decimal(10,2) DEFAULT '0.00',
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_invoice_item_1_idx` (`sales_invoice_id`) USING BTREE,
  KEY `fk_sales_invoice_item_2_idx` (`sales_order_item_id`) USING BTREE,
  KEY `fk_sales_invoice_item_3_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_sales_invoice_item_1` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_item_2` FOREIGN KEY (`sales_order_item_id`) REFERENCES `sales_order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_item_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_inv_recap` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `issuer_name` varchar(50) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `billing_address` varchar(350) DEFAULT '',
  `grand_total` decimal(20,2) DEFAULT '0.00',
  `amount_in_words` varchar(250) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_inv_recap_1_idx` (`merchant_id`) USING BTREE,
  CONSTRAINT `fk_sales_inv_recap_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='sales invoice recap';


CREATE TABLE `sales_inv_recap_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` bigint(20) unsigned DEFAULT NULL,
  `delivery_order_id` bigint(20) unsigned DEFAULT NULL,
  `branch_id` bigint(20) unsigned DEFAULT NULL,
  `subtotal` decimal(20,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  `sales_inv_recap_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_inv_recap_item_1_idx` (`sales_invoice_id`) USING BTREE,
  KEY `fk_sales_inv_recap_item_2_idx` (`delivery_order_id`) USING BTREE,
  KEY `fk_sales_inv_recap_item_3_idx` (`branch_id`) USING BTREE,
  KEY `fk_sales_inv_recap_item_4_idx` (`sales_inv_recap_id`) USING BTREE,
  CONSTRAINT `fk_sales_inv_recap_item_1` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_inv_recap_item_2` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_inv_recap_item_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_inv_recap_item_4` FOREIGN KEY (`sales_inv_recap_id`) REFERENCES `sales_inv_recap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_sls_id` bigint(20) unsigned DEFAULT NULL,
  `term_invoice_sls_id` bigint(20) unsigned DEFAULT NULL,
  `salesperson_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `wrt_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT '0' COMMENT 'not FK',
  `voucher_id` bigint(20) unsigned DEFAULT '0' COMMENT 'not FK',
  `price_set_id` bigint(20) unsigned DEFAULT '0' COMMENT 'not FK',
  `payment_group_sls_id` bigint(20) unsigned DEFAULT '0' COMMENT 'not FK',
  `archetype_id` bigint(20) unsigned DEFAULT '0' COMMENT 'not FK',
  `order_type_sls_id` bigint(20) unsigned DEFAULT '0',
  `order_channel` tinyint(1) DEFAULT '0',
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `billing_address` varchar(350) DEFAULT '',
  `shipping_address` varchar(400) DEFAULT '',
  `shipping_address_note` varchar(250) DEFAULT '',
  `delivery_fee` decimal(10,2) DEFAULT '0.00',
  `vou_redeem_code` varchar(20) DEFAULT '',
  `vou_disc_amount` decimal(20,2) DEFAULT '0.00',
  `point_redeem_amount` decimal(20,2) DEFAULT '0.00',
  `point_redeem_id` bigint(20) unsigned DEFAULT '0',
  `total_price` decimal(20,2) DEFAULT '0.00',
  `total_charge` decimal(20,2) DEFAULT '0.00',
  `total_weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT '',
  `reload_packing` tinyint(1) DEFAULT '0',
  `payment_reminder` tinyint(1) NOT NULL DEFAULT '2',
  `is_locked` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'SO draft is locked',
  `has_ext_invoice` tinyint(1) DEFAULT '0',
  `has_picking_assigned` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag for picking assignment',
  `cancel_type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` bigint(20) unsigned DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `locked_by` bigint(20) unsigned DEFAULT NULL COMMENT 'draft so is locked temporarily by',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_order_1_idx` (`branch_id`) USING BTREE,
  KEY `fk_sales_order_2_idx` (`term_payment_sls_id`) USING BTREE,
  KEY `fk_sales_order_3_idx` (`term_invoice_sls_id`) USING BTREE,
  KEY `fk_sales_order_4_idx` (`salesperson_id`) USING BTREE,
  KEY `fk_sales_order_5_idx` (`sub_district_id`) USING BTREE,
  KEY `fk_sales_order_6_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_sales_order_7_idx` (`wrt_id`) USING BTREE,
  CONSTRAINT `fk_sales_order_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_2` FOREIGN KEY (`term_payment_sls_id`) REFERENCES `term_payment_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_3` FOREIGN KEY (`term_invoice_sls_id`) REFERENCES `term_invoice_sls` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_4` FOREIGN KEY (`salesperson_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_5` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_6` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_7` FOREIGN KEY (`wrt_id`) REFERENCES `wrt` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_order_feedback` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned NOT NULL,
  `merchant_id` bigint(20) unsigned NOT NULL,
  `sales_order_code` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `rating_score` tinyint(1) unsigned DEFAULT NULL,
  `tags` varchar(100) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `to_be_contacted` tinyint(1) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ui_sales_order_feedback_idx` (`sales_order_id`),
  KEY `fk_sales_order_feedback_2` (`merchant_id`),
  CONSTRAINT `fk_sales_order_feedback_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_sales_order_feedback_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `sales_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `order_qty` decimal(10,2) DEFAULT '0.00',
  `forecast_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'if != with order_qty = order > remaining forecast qty',
  `unit_price` decimal(12,2) DEFAULT '0.00',
  `shadow_price` decimal(12,2) DEFAULT '0.00',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `weight` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_order_item_1_idx` (`sales_order_id`) USING BTREE,
  KEY `fk_sales_order_item_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_sales_order_item_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_order_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sales_payment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payment_channel_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT '0.00',
  `bank_receive_num` varchar(100) DEFAULT '' COMMENT 'bank receive voucher number',
  `paid_off` tinyint(1) DEFAULT '0',
  `image_url` varchar(300) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sales_payment_1_idx` (`sales_invoice_id`) USING BTREE,
  KEY `fk_sales_payment_2_idx` (`payment_channel_id`) USING BTREE,
  KEY `fk_sales_payment_3_idx` (`payment_method_id`) USING BTREE,
  CONSTRAINT `fk_sales_payment_1` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_payment_2` FOREIGN KEY (`payment_channel_id`) REFERENCES `payment_channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_payment_3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `sales_group_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `display_name` varchar(100) DEFAULT '',
  `employee_code` varchar(50) DEFAULT '',
  `role_group` tinyint(1) DEFAULT '0',
  `phone_number` varchar(15) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_staff_1_idx` (`role_id`) USING BTREE,
  KEY `fk_staff_2_idx` (`user_id`) USING BTREE,
  KEY `fk_staff_3_idx` (`area_id`) USING BTREE,
  KEY `fk_staff_4_idx` (`parent_id`) USING BTREE,
  KEY `fk_staff_5_idx` (`warehouse_id`) USING BTREE,
  CONSTRAINT `fk_staff_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_3` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_4` FOREIGN KEY (`parent_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_5` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `available_stock` decimal(10,2) DEFAULT '0.00',
  `waste_stock` decimal(10,2) DEFAULT '0.00',
  `safety_stock` decimal(10,2) DEFAULT '0.00',
  `commited_in_stock` decimal(10,2) DEFAULT '0.00',
  `commited_out_stock` decimal(10,2) DEFAULT '0.00',
  `salable` tinyint(1) DEFAULT '0',
  `purchasable` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_stock_1_idx` (`product_id`) USING BTREE,
  KEY `fk_stock_2_idx` (`warehouse_id`) USING BTREE,
  CONSTRAINT `fk_stock_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `stock_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` bigint(20) unsigned DEFAULT NULL,
  `ref_type` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `initial_stock` decimal(10,2) DEFAULT '0.00',
  `quantity` decimal(10,2) DEFAULT '0.00',
  `final_stock` decimal(10,2) DEFAULT '0.00',
  `unit_cost` decimal(12,2) DEFAULT '0.00',
  `doc_note` varchar(250) DEFAULT '',
  `item_note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_stock_log_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_stock_log_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_stock_log_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_log_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `stock_opname` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_stock_opname_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_stock_opname_2_idx` (`category_id`) USING BTREE,
  CONSTRAINT `fk_stock_opname_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_opname_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `stock_opname_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_opname_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `initial_stock` decimal(20,2) DEFAULT '0.00',
  `adjust_qty` decimal(20,2) DEFAULT '0.00' COMMENT 'adjustment quantity',
  `final_stock` decimal(20,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_stock_opname_item_2_idx` (`product_id`) USING BTREE,
  KEY `fk_stock_opname_item_1_idx` (`stock_opname_id`) USING BTREE,
  CONSTRAINT `fk_stock_opname_item_1` FOREIGN KEY (`stock_opname_id`) REFERENCES `stock_opname` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_opname_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `sub_district` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` bigint(20) unsigned DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `value` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `postal_code` varchar(10) DEFAULT '',
  `concat_no_prefix` varchar(250) DEFAULT '' COMMENT 'concatenated address',
  `concat_address` varchar(250) DEFAULT '' COMMENT 'concatenated address',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sub_district_1_idx` (`district_id`) USING BTREE,
  KEY `fk_sub_district_2_idx` (`area_id`) USING BTREE,
  CONSTRAINT `fk_sub_district_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sub_district_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='kelurahan';


CREATE TABLE `supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_type_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_badge_id` bigint(20) unsigned DEFAULT NULL,
  `term_payment_pur_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(50) DEFAULT '',
  `pic_name` varchar(100) DEFAULT '',
  `address` varchar(350) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_supplier_1_idx` (`supplier_type_id`) USING BTREE,
  KEY `fk_supplier_3_idx` (`payment_method_id`) USING BTREE,
  KEY `fk_supplier_4_idx` (`sub_district_id`) USING BTREE,
  KEY `fk_supplier_2_idx` (`term_payment_pur_id`) USING BTREE,
  KEY `fk_supplier_5` (`supplier_badge_id`),
  CONSTRAINT `fk_supplier_1` FOREIGN KEY (`supplier_type_id`) REFERENCES `supplier_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_2` FOREIGN KEY (`term_payment_pur_id`) REFERENCES `term_payment_pur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_4` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_5` FOREIGN KEY (`supplier_badge_id`) REFERENCES `supplier_badge` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `supplier_badge` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `supplier_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `abbreviation` varchar(3) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `tag_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `tag_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(255) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `image_url` varchar(300) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `temp_courier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(100) DEFAULT NULL,
  `warehouse` varchar(100) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `vehicle_number` varchar(50) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `term_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `application` tinyint(1) DEFAULT '0',
  `version` varchar(50) DEFAULT '',
  `title` varchar(50) DEFAULT '',
  `title_value` varchar(50) DEFAULT '',
  `content` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `term_invoice_sls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `name_id` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `term_payment_pur` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `days_value` int(2) DEFAULT '0',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `term_payment_sls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `name_id` varchar(100) DEFAULT '',
  `days_value` int(2) DEFAULT '0',
  `note` varchar(250) DEFAULT '' COMMENT 'Note also will be display as description in mobile apps',
  `description` varchar(250) DEFAULT '' COMMENT 'Description will be show in mobile apps for detail confirmation',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `txn_xendit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `payment_channel_id` bigint(20) unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `account_number` varchar(100) DEFAULT '',
  `amount` decimal(20,2) DEFAULT '0.00',
  `transaction_date` date DEFAULT NULL,
  `transaction_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_txn_xendit_1_idx` (`merchant_id`) USING BTREE,
  KEY `fk_txn_xendit_2_idx` (`sales_order_id`) USING BTREE,
  KEY `fk_txn_xendit_3_idx` (`payment_channel_id`) USING BTREE,
  CONSTRAINT `fk_txn_xendit_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_txn_xendit_2` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_txn_xendit_3` FOREIGN KEY (`payment_channel_id`) REFERENCES `payment_channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `uom` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `decimal_enabled` tinyint(1) DEFAULT '0',
  `note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='unit of measurement';


CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `password` varchar(250) DEFAULT '',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  `force_logout` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `picking_notif_token` text,
  `salesapp_login_token` text,
  `salesapp_notif_token` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='internal user';


CREATE TABLE `user_merchant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '',
  `login_token` text,
  `firebase_token` text,
  `verification` tinyint(1) DEFAULT '0',
  `tnc_acc_version` varchar(50) DEFAULT '',
  `tnc_acc_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  `force_logout` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `user_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  `permission_value` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_permission_1_idx` (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_permission_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `user_temp_new` (
  `old_user_id` int(11) NOT NULL,
  `new_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `voucher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `archetype_id` bigint(20) unsigned DEFAULT NULL,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `tag_customer` varchar(100) DEFAULT '',
  `code` varchar(50) DEFAULT '',
  `redeem_code` varchar(20) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `start_timestamp` timestamp NULL DEFAULT NULL,
  `end_timestamp` timestamp NULL DEFAULT NULL,
  `overall_quota` int(10) DEFAULT '0',
  `user_quota` int(10) DEFAULT '0',
  `rem_overall_quota` int(10) DEFAULT '0' COMMENT 'remaining overall quota',
  `min_order` decimal(20,2) DEFAULT '0.00' COMMENT 'minimum order',
  `disc_amount` decimal(20,2) DEFAULT '0.00',
  `note` varchar(250) DEFAULT '',
  `void_reason` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `mobile_voucher` tinyint(1) DEFAULT '2' COMMENT 'flagging for voucher will be shown or not in mobile apps',
  `voucher_item` tinyint(1) DEFAULT '2' COMMENT 'flagging for voucher have item products requirement or not',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_voucher_1_idx` (`area_id`) USING BTREE,
  KEY `fk_voucher_2_idx` (`archetype_id`) USING BTREE,
  CONSTRAINT `fk_voucher_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_voucher_2` FOREIGN KEY (`archetype_id`) REFERENCES `archetype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `voucher_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint(20) unsigned NOT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `term_conditions` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_content_voucher_id_IDX` (`voucher_id`) USING BTREE,
  CONSTRAINT `voucher_content_FK` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `voucher_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `min_qty_disc` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_item_voucher_id_IDX` (`voucher_id`) USING BTREE,
  KEY `voucher_item_product_id_IDX` (`product_id`) USING BTREE,
  CONSTRAINT `voucher_item_FK` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`),
  CONSTRAINT `voucher_item_FK_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `voucher_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint(20) unsigned DEFAULT NULL,
  `merchant_id` bigint(20) unsigned DEFAULT NULL,
  `branch_id` bigint(20) unsigned DEFAULT NULL,
  `sales_order_id` bigint(20) unsigned DEFAULT NULL,
  `tag_customer` varchar(100) DEFAULT '',
  `vou_disc_amount` decimal(20,2) DEFAULT '0.00',
  `timestamp` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_voucher_log_1_idx` (`voucher_id`) USING BTREE,
  KEY `fk_voucher_log_2_idx` (`merchant_id`) USING BTREE,
  KEY `fk_voucher_log_3_idx` (`branch_id`) USING BTREE,
  KEY `fk_voucher_log_4_idx` (`sales_order_id`) USING BTREE,
  CONSTRAINT `fk_voucher_log_1` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_voucher_log_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_voucher_log_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_voucher_log_4` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `warehouse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `pic_name` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT '',
  `alt_phone_number` varchar(50) DEFAULT '',
  `street_address` varchar(350) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `aux_data` tinyint(1) DEFAULT '2' COMMENT 'auxiliary data',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_warehouse_1_idx` (`area_id`) USING BTREE,
  KEY `fk_warehouse_2_idx` (`sub_district_id`) USING BTREE,
  CONSTRAINT `fk_warehouse_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_2` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `warehouse_coverage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `sub_district_id` bigint(20) unsigned DEFAULT NULL,
  `main_warehouse` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_warehouse_coverage_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_warehouse_coverage_2_idx` (`sub_district_id`) USING BTREE,
  CONSTRAINT `fk_warehouse_coverage_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_coverage_2` FOREIGN KEY (`sub_district_id`) REFERENCES `sub_district` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `waste_disposal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_waste_disposal_1_idx` (`warehouse_id`) USING BTREE,
  CONSTRAINT `fk_waste_disposal_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `waste_disposal_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `waste_disposal_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `dispose_qty` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_waste_disposal_item_2_idx` (`product_id`) USING BTREE,
  KEY `fk_waste_disposal_item_1_idx` (`waste_disposal_id`) USING BTREE,
  CONSTRAINT `fk_waste_disposal_item_1` FOREIGN KEY (`waste_disposal_id`) REFERENCES `waste_disposal` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_waste_disposal_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `waste_entry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `recognition_date` date DEFAULT NULL,
  `note` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_waste_entry_1_idx` (`warehouse_id`) USING BTREE,
  CONSTRAINT `fk_waste_entry_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `waste_entry_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `waste_entry_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `waste_qty` decimal(10,2) DEFAULT '0.00',
  `note` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_waste_entry_item_2_idx` (`product_id`) USING BTREE,
  KEY `fk_waste_entry_item_1_idx` (`waste_entry_id`) USING BTREE,
  CONSTRAINT `fk_waste_entry_item_1` FOREIGN KEY (`waste_entry_id`) REFERENCES `waste_entry` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_waste_entry_item_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `waste_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `ref_id` bigint(20) unsigned DEFAULT NULL,
  `ref_type` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `initial_stock` decimal(10,2) DEFAULT '0.00',
  `quantity` decimal(10,2) DEFAULT '0.00',
  `final_stock` decimal(10,2) DEFAULT '0.00',
  `doc_note` varchar(250) DEFAULT '',
  `item_note` varchar(250) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_waste_log_1_idx` (`warehouse_id`) USING BTREE,
  KEY `fk_waste_log_2_idx` (`product_id`) USING BTREE,
  CONSTRAINT `fk_waste_log_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_waste_log_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


CREATE TABLE `white_list_login` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `otp` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


CREATE TABLE `wrt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `note` varchar(250) DEFAULT '',
  `aux_data` tinyint(1) DEFAULT '2' COMMENT 'auxiliary data',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_wrt_1_idx` (`area_id`) USING BTREE,
  CONSTRAINT `fk_wrt_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='window receiving time';

-- `adm_division`
CREATE VIEW `adm_division` AS select `a`.`id` AS `area_id`,`a`.`name` AS `area_name`,`a`.`status` AS `area_status`,`sd`.`id` AS `sub_district_id`,`sd`.`name` AS `sub_district_name`,`sd`.`status` AS `sub_district_status`,`sd`.`postal_code` AS `postal_code`,`d`.`id` AS `district_id`,`d`.`name` AS `district_name`,`d`.`status` AS `district_status`,`c`.`id` AS `city_id`,`c`.`name` AS `city_name`,`c`.`status` AS `city_status`,`p`.`id` AS `province_id`,`p`.`name` AS `province_name`,`p`.`status` AS `province_status`,`co`.`id` AS `country_id`,`co`.`name` AS `country_name`,`co`.`status` AS `country_status`,`sd`.`concat_address` AS `concate_address`,`sd`.`concat_no_prefix` AS `concat_no_prefix` from (((((`sub_district` `sd` left join `area` `a` on((`a`.`id` = `sd`.`area_id`))) join `district` `d` on((`d`.`id` = `sd`.`district_id`))) join `city` `c` on((`c`.`id` = `d`.`city_id`))) join `province` `p` on((`p`.`id` = `c`.`province_id`))) join `country` `co` on((`co`.`id` = `p`.`country_id`)));

--  `prospect_customer_log_view`;
CREATE VIEW `prospect_customer_log_view` AS select `pc`.`code` AS `prospect_customer_code`,`pc`.`name` AS `prospect_customer_name`,if(isnull(`pc`.`merchant_id`),'No','Yes') AS `request_upgrade`,date_format(`al`.`timestamp`,'%d-%m-%Y %H:%i:%s') AS `created_at`,if((`pc`.`reg_status` <> 1),date_format(`al2`.`timestamp`,'%d-%m-%Y %H:%i:%s'),'') AS `processed_at`,if((`pc`.`reg_status` <> 1),`s`.`name`,'') AS `processed_by`,`g3`.`value_name` AS `status` from ((((((`prospect_customer` `pc` join `glossary` `g` on(((`g`.`table` = 'prospect_customer') and (`g`.`attribute` = 'time_consent') and (`g`.`value_int` = `pc`.`time_consent`)))) left join `merchant` `m` on((`m`.`id` = `pc`.`merchant_id`))) join `audit_log` `al` on(((`al`.`ref_id` = `pc`.`id`) and (`al`.`type` = 'prospect_customer') and (`al`.`function` in ('create','request'))))) join `glossary` `g3` on(((`g3`.`table` = 'prospect_customer') and (`g3`.`attribute` = 'reg_status') and (`g3`.`value_int` = `pc`.`reg_status`)))) left join `audit_log` `al2` on(((`al2`.`ref_id` = `pc`.`id`) and (`al2`.`type` = 'prospect_customer') and (`al2`.`function` in ('register','upgrade','decline'))))) left join `staff` `s` on((`s`.`id` = `al2`.`staff_id`))) where (cast(`al`.`timestamp` as date) between (curdate() - interval 6 day) and curdate()) order by date_format(`al`.`timestamp`,'%d-%m-%Y %H:%i:%s');

--  `report_agent_view`;
CREATE VIEW `report_agent_view` AS select `m`.`code` AS `agent_code`,`m`.`name` AS `agent_name`,`m`.`pic_name` AS `pic_name`,`m`.`phone_number` AS `phone_number`,`m`.`email` AS `agent_email`,`tps`.`name` AS `payment_term`,`tis`.`name` AS `invoice_term`,`a`.`name` AS `finance_area`,`bt`.`name` AS `customer_type`,`a2`.`name` AS `Archetype`,`tc`.`name` AS `customer_tag`,`b`.`shipping_address` AS `shipping_address`,`w`.`name` AS `Warehouse`,`c`.`name` AS `City`,`d`.`name` AS `District`,`sd`.`name` AS `sub_district`,`ps`.`name` AS `price_set`,`s2`.`name` AS `sales_person`,`g`.`value_name` AS `agent_status`,(case when (`m`.`customer_group` = 1) then 'Outlet' else 'Agent' end) AS `customer_group` from (((((((((((((((`eden_v2`.`merchant` `m` join `eden_v2`.`branch` `b` on((`b`.`merchant_id` = `m`.`id`))) join `eden_v2`.`area` `a` on((`a`.`id` = `m`.`finance_area_id`))) join `eden_v2`.`term_payment_sls` `tps` on((`tps`.`id` = `m`.`term_payment_sls_id`))) join `eden_v2`.`term_invoice_sls` `tis` on((`tis`.`id` = `m`.`term_invoice_sls_id`))) join `eden_v2`.`payment_group_sls` `pgs` on((`pgs`.`id` = `m`.`payment_group_sls_id`))) join `eden_v2`.`business_type` `bt` on((`bt`.`id` = `m`.`business_type_id`))) join `eden_v2`.`glossary` `g` on(((`g`.`value_int` = `m`.`status`) and (`g`.`attribute` = 'status')))) left join `eden_v2`.`archetype` `a2` on((`a2`.`id` = `b`.`archetype_id`))) left join `eden_v2`.`warehouse` `w` on((`w`.`id` = `b`.`warehouse_id`))) left join `eden_v2`.`sub_district` `sd` on((`sd`.`id` = `b`.`sub_district_id`))) left join `eden_v2`.`district` `d` on((`d`.`id` = `sd`.`district_id`))) left join `eden_v2`.`city` `c` on((`c`.`id` = `d`.`city_id`))) left join `eden_v2`.`price_set` `ps` on((`ps`.`id` = `b`.`price_set_id`))) left join `eden_v2`.`staff` `s2` on((`s2`.`id` = `b`.`salesperson_id`))) left join (select `m`.`id` AS `id`,`m`.`tag_customer` AS `tag_customer`,group_concat(`tc`.`name` separator ',') AS `name` from (`eden_v2`.`merchant` `m` join `eden_v2`.`tag_customer` `tc`) where find_in_set(`tc`.`id`,`m`.`tag_customer`) group by `m`.`id`) `tc` on((`tc`.`id` = `m`.`id`))) where (`m`.`customer_group` = 2);

--  `report_delivery_return_item_view`;
CREATE VIEW `report_delivery_return_item_view` AS select `dr`.`recognition_date` AS `Return_Date`,`p`.`code` AS `Product_Code`,`p`.`name` AS `Product_Name`,`u`.`name` AS `Unit`,`dri`.`return_good_qty` AS `Good_Stock_Return_Qty`,`dri`.`return_waste_qty` AS `Waste_Return_Qty`,`dri`.`unit_cost` AS `Product_Price`,`a`.`name` AS `Area`,`w`.`name` AS `Warehouse`,`so`.`code` AS `Order Code`,`do`.`code` AS `Delivery_Code`,`do`.`recognition_date` AS `Delivery_Date`,`b`.`code` AS `Customer_Code`,`b`.`name` AS `Customer_Name`,`dr`.`note` AS `Delivery_Return_Note`,`dri`.`note` AS `Delivery_Return_Item_Note` from ((((((((`delivery_return` `dr` join `delivery_return_item` `dri` on((`dri`.`delivery_return_id` = `dr`.`id`))) join `product` `p` on((`p`.`id` = `dri`.`product_id`))) join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) join `warehouse` `w` on((`w`.`id` = `dr`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) join `delivery_order` `do` on((`do`.`id` = `dr`.`delivery_order_id`))) join `sales_order` `so` on((`so`.`id` = `do`.`sales_order_id`))) join `branch` `b` on((`b`.`id` = `so`.`branch_id`)));

--  `report_goods_receipt_item_view`;
CREATE VIEW `report_goods_receipt_item_view` AS select `po`.`code` AS `Purchase_Order_Code`,`s`.`code` AS `Supplier_Code`,`s`.`name` AS `Supplier_Name`,upper(`g`.`value_name`) AS `Purchase_Order_Status`,`gr`.`code` AS `GR_Code`,upper(`gg`.`value_name`) AS `GR_Status`,`w`.`name` AS `Warehouse`,`po`.`eta_date` AS `Estimated_Arrival_Date`,`po`.`eta_time` AS `Estimated_Arrival_Time`,`gr`.`ata_date` AS `Actual_Arrival_Date`,`gr`.`ata_time` AS `Actual_Arrival_Time`,`gr`.`note` AS `GR_Note`,`p`.`code` AS `Product_Code`,`p`.`name` AS `Product_Name`,`u`.`name` AS `UOM`,`gri`.`note` AS `GR_Item_Note`,`poi`.`order_qty` AS `Ordered_Qty`,`gri`.`deliver_qty` AS `Delivered_Qty`,`gri`.`reject_qty` AS `Reject_Qty`,`gri`.`receive_qty` AS `Received_Qty` from (((((((((`purchase_order_item` `poi` left join `purchase_order` `po` on((`po`.`id` = `poi`.`purchase_order_id`))) left join `goods_receipt` `gr` on((`gr`.`purchase_order_id` = `po`.`id`))) left join `goods_receipt_item` `gri` on(((`gri`.`purchase_order_item_id` = `poi`.`id`) and (`gr`.`id` = `gri`.`goods_receipt_id`)))) join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`))) join `product` `p` on((`p`.`id` = `poi`.`product_id`))) join `uom` `u` on((`p`.`uom_id` = `u`.`id`))) left join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) left join `glossary` `g` on(((`g`.`value_int` = `po`.`status`) and (`g`.`attribute` = 'doc_status')))) left join `glossary` `gg` on(((`gg`.`value_int` = `gr`.`status`) and (`gg`.`attribute` = 'doc_status'))));

--  `report_main_outlet_view`;
CREATE VIEW `report_main_outlet_view` AS select `m`.`code` AS `main_oulet_code`,`m`.`name` AS `main_outlet_name`,`m`.`billing_address` AS `billing_address`,`a`.`name` AS `finance_area`,`m`.`pic_name` AS `pic_name`,`m`.`phone_number` AS `phone_number`,`m`.`email` AS `email`,`tps`.`name` AS `payment_term`,`tis`.`name` AS `invoice_term`,`pgs`.`name` AS `payment_group`,`bt`.`name` AS `business_type`,(case when (`m`.`customer_group` = 1) then 'Outlet' else 'Agent' end) AS `customer_group`,`g`.`value_name` AS `status` from ((((((`merchant` `m` join `area` `a` on((`a`.`id` = `m`.`finance_area_id`))) join `term_payment_sls` `tps` on((`tps`.`id` = `m`.`term_payment_sls_id`))) join `term_invoice_sls` `tis` on((`tis`.`id` = `m`.`term_invoice_sls_id`))) join `payment_group_sls` `pgs` on((`pgs`.`id` = `m`.`payment_group_sls_id`))) join `business_type` `bt` on((`bt`.`id` = `m`.`business_type_id`))) join `glossary` `g` on(((`g`.`value_int` = `m`.`status`) and (`g`.`attribute` = 'status')))) where (`m`.`customer_group` = 1);

--  `report_outlet_view`;
CREATE VIEW `report_outlet_view` AS select `m`.`code` AS `main_outlet_code`,`b`.`code` AS `outlet_code`,`b`.`name` AS `outlet_name`,`b`.`pic_name` AS `pic_name`,`b`.`phone_number` AS `phone_number`,`a`.`name` AS `Archetype`,`tc`.`name` AS `tag_customers`,`b`.`shipping_address` AS `shipping_address`,`w`.`name` AS `Warehouse`,`ar`.`name` AS `customer_area`,`p`.`name` AS `Province`,`c`.`name` AS `City`,`d`.`name` AS `District`,`sd`.`name` AS `sub_district`,`ps`.`name` AS `price_set`,`s`.`name` AS `sales_person`,`g`.`value_name` AS `Status` from ((((((((((((`eden_v2`.`branch` `b` left join `eden_v2`.`merchant` `m` on((`m`.`id` = `b`.`merchant_id`))) left join `eden_v2`.`archetype` `a` on((`a`.`id` = `b`.`archetype_id`))) left join `eden_v2`.`warehouse` `w` on((`w`.`id` = `b`.`warehouse_id`))) left join `eden_v2`.`area` `ar` on((`ar`.`id` = `b`.`area_id`))) left join `eden_v2`.`sub_district` `sd` on((`sd`.`id` = `b`.`sub_district_id`))) left join `eden_v2`.`district` `d` on((`d`.`id` = `sd`.`district_id`))) left join `eden_v2`.`city` `c` on((`c`.`id` = `d`.`city_id`))) left join `eden_v2`.`province` `p` on((`p`.`id` = `c`.`province_id`))) left join `eden_v2`.`price_set` `ps` on((`ps`.`id` = `b`.`price_set_id`))) left join `eden_v2`.`staff` `s` on((`s`.`id` = `b`.`salesperson_id`))) left join `eden_v2`.`glossary` `g` on(((`g`.`value_int` = `b`.`status`) and (`g`.`attribute` = 'status')))) left join (select `m`.`id` AS `id`,`m`.`tag_customer` AS `tag_customer`,group_concat(`tc`.`name` separator ',') AS `name` from (`eden_v2`.`merchant` `m` join `eden_v2`.`tag_customer` `tc`) where find_in_set(`tc`.`id`,`m`.`tag_customer`) group by `m`.`id`) `tc` on((`tc`.`id` = `m`.`id`))) where (`m`.`customer_group` = 1);

--  `report_product_view`;
CREATE VIEW `report_product_view` AS select `p`.`code` AS `product_code`,`p`.`name` AS `product_name`,`c`.`name` AS `Category`,`u`.`name` AS `UOM`,`p`.`unit_weight` AS `total_weight`,`p`.`note` AS `product_note`,`p`.`description` AS `product_description`,`tp`.`name` AS `product_tag`,`g`.`value_name` AS `product_status`,`sal`.`name` AS `warehouse_salability`,`pur`.`name` AS `warehouse_purchasability`,`sto`.`name` AS `warehouse_storability` from (((((((`eden_v2`.`product` `p` left join (select `p`.`id` AS `id`,`p`.`tag_product` AS `tag_product`,group_concat(`tp`.`name` separator ',') AS `name` from (`eden_v2`.`product` `p` join `eden_v2`.`tag_product` `tp`) where find_in_set(`tp`.`value`,`p`.`tag_product`) group by `p`.`id`) `tp` on((`tp`.`id` = `p`.`id`))) join `eden_v2`.`category` `c` on((`c`.`id` = `p`.`category_id`))) left join (select `p`.`id` AS `id`,`p`.`warehouse_sal` AS `warehouse_sal`,group_concat(`w`.`name` separator ',') AS `name` from (`eden_v2`.`product` `p` join `eden_v2`.`warehouse` `w`) where find_in_set(`w`.`id`,`p`.`warehouse_sal`) group by `p`.`id`) `sal` on((`sal`.`id` = `p`.`id`))) left join (select `p`.`id` AS `id`,`p`.`warehouse_pur` AS `warehouse_pur`,group_concat(`w`.`name` separator ',') AS `name` from (`eden_v2`.`product` `p` join `eden_v2`.`warehouse` `w`) where find_in_set(`w`.`id`,`p`.`warehouse_pur`) group by `p`.`id`) `pur` on((`pur`.`id` = `p`.`id`))) left join (select `p`.`id` AS `id`,`p`.`warehouse_sto` AS `warehouse_sto`,group_concat(`w`.`name` separator ',') AS `name` from (`eden_v2`.`product` `p` join `eden_v2`.`warehouse` `w`) where find_in_set(`w`.`id`,`p`.`warehouse_sto`) group by `p`.`id`) `sto` on((`sto`.`id` = `p`.`id`))) join `eden_v2`.`uom` `u` on((`u`.`id` = `p`.`uom_id`))) left join `eden_v2`.`glossary` `g` on(((`g`.`value_int` = `p`.`status`) and (`g`.`attribute` = 'status'))));

--  `report_prospective_view`;
CREATE VIEW `report_prospective_view` AS select `pc`.`code` AS `prospective_code`,`pc`.`name` AS `prospective_name`,`a`.`name` AS `Archetype`,`pc`.`pic_name` AS `pic_name`,`pc`.`phone_number` AS `phone_number`,`ar`.`name` AS `Area`,`pr`.`name` AS `Province`,`c`.`name` AS `City`,`d`.`name` AS `District`,`sd`.`name` AS `sub_district`,`sd`.`postal_code` AS `postal_code`,`g`.`value_name` AS `time_consent`,`m`.`code` AS `existing_customer`,`g2`.`value_name` AS `Status`,if(isnull(`pc`.`merchant_id`),'No','Yes') AS `request_upgrade` from (((((((((`prospect_customer` `pc` left join `merchant` `m` on((`m`.`prospect_customer_id` = `pc`.`id`))) join `archetype` `a` on((`a`.`id` = `pc`.`archetype_id`))) join `sub_district` `sd` on((`sd`.`id` = `pc`.`sub_district_id`))) join `area` `ar` on((`ar`.`id` = `sd`.`area_id`))) join `district` `d` on((`d`.`id` = `sd`.`district_id`))) join `city` `c` on((`c`.`id` = `d`.`city_id`))) join `province` `pr` on((`pr`.`id` = `c`.`province_id`))) join `glossary` `g` on(((`g`.`value_int` = `pc`.`time_consent`) and (`g`.`attribute` = 'time_consent') and (`g`.`table` = 'prospect_customer')))) join `glossary` `g2` on(((`g2`.`value_int` = `pc`.`reg_status`) and (`g2`.`attribute` = 'reg_status') and (`g2`.`table` = 'prospect_customer'))));

--  `report_purchase_invoice_item_view`;
CREATE VIEW `report_purchase_invoice_item_view` AS select `s`.`name` AS `Supplier Name`,`w`.`name` AS `Warehouse Name`,`a`.`name` AS `Area`,`po`.`code` AS `Order Code`,`g`.`value_name` AS `Order Status`,`pi`.`code` AS `Invoice Code`,`g3`.`value_name` AS `Invoice Status`,`gr`.`code` AS `GR Code`,`g2`.`value_name` AS `GR Status`,`po`.`eta_date` AS `Eta Date`,`p`.`code` AS `Product Code`,`p`.`name` AS `Product Name`,`u`.`name` AS `UOM`,`poi`.`unit_price` AS `Unit Price`,`poi`.`order_qty` AS `Order Qty`,`gri`.`deliver_qty` AS `Delivered Qty`,`gri`.`receive_qty` AS `Received Qty`,`pii`.`invoice_qty` AS `Invoice Qty`,`gri`.`reject_qty` AS `Reject Qty`,`pi`.`delivery_fee` AS `Delivery Fee`,`pii`.`subtotal` AS `Total Invoice` from (((((((((((((`purchase_order_item` `poi` join `purchase_order` `po` on(((`po`.`id` = `poi`.`purchase_order_id`) and (`po`.`status` not in (3,4,5))))) left join `purchase_invoice` `pi` on(((`pi`.`purchase_order_id` = `po`.`id`) and (`pi`.`status` not in (3,4))))) left join `purchase_invoice_item` `pii` on(((`pii`.`purchase_order_item_id` = `poi`.`id`) and (`pi`.`id` = `pii`.`purchase_invoice_id`)))) left join `goods_receipt` `gr` on(((`gr`.`purchase_order_id` = `po`.`id`) and (`gr`.`status` = 2)))) left join `goods_receipt_item` `gri` on(((`gri`.`purchase_order_item_id` = `poi`.`id`) and (`gr`.`id` = `gri`.`goods_receipt_id`)))) join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`))) join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) join `product` `p` on((`p`.`id` = `poi`.`product_id`))) join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) left join `glossary` `g` on(((`g`.`value_int` = `po`.`status`) and (`g`.`attribute` = 'doc_status')))) left join `glossary` `g2` on(((`g2`.`value_int` = `gr`.`status`) and (`g2`.`attribute` = 'doc_status')))) left join `glossary` `g3` on(((`g3`.`value_int` = `pi`.`status`) and (`g3`.`attribute` = 'doc_status')))) where (`po`.`eta_date` > '2021-01-01') group by `poi`.`id`;

--  `report_purchase_invoice_view`;
CREATE VIEW `report_purchase_invoice_view` AS select `a`.`name` AS `Area`,`w`.`name` AS `Warehouse`,`po`.`code` AS `Order_Code`,`po`.`recognition_date` AS `Order_Date`,`po`.`eta_date` AS `Order_ETA_Date`,`s`.`code` AS `Supplier_Code`,`s`.`name` AS `Supplier_Name`,`po`.`total_charge` AS `Total_Order`,`pi`.`code` AS `Invoice_Code`,`pi`.`recognition_date` AS `Invoice_Date`,`pi`.`due_date` AS `Invoice_Due_Date`,upper(`g`.`value_name`) AS `Invoice_Status`,`pi`.`note` AS `Invoice_Note`,`pi`.`delivery_fee` AS `Delivery_Fee`,`pi`.`total_charge` AS `Invoice_Amount`,`pi`.`total_price` AS `Total Invoice`,`pi`.`adj_amount` AS `Adjustment_Amount`,`pi`.`adj_note` AS `Adjustment_Note` from (((((`purchase_invoice` `pi` join `purchase_order` `po` on((`po`.`id` = `pi`.`purchase_order_id`))) join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`))) join `glossary` `g` on(((`g`.`value_int` = `pi`.`status`) and (`g`.`attribute` = 'doc_status'))));

--  `report_purchase_order`;
CREATE VIEW `report_purchase_order` AS select `s`.`code` AS `Supplier_Code`,`s`.`name` AS `Supplier_Name`,`w`.`name` AS `Warehouse`,`po`.`code` AS `Order_Code`,`po`.`recognition_date` AS `Order_Date`,`po`.`eta_date` AS `ETA_Date`,`po`.`eta_time` AS `ETA_Time`,`g`.`value_name` AS `Order_Status`,`pur`.`name` AS `Order_Payment_Term`,`po`.`delivery_fee` AS `Order_Delivery_Fee`,round(((`po`.`tax_pct` / 100) * `po`.`total_price`),2) AS `Order_Tax`,`po`.`total_charge` AS `Grand_Total`,`po`.`note` AS `Order_Note`,`po`.`total_price` AS `total_price` from ((((`purchase_order` `po` join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`))) join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) join `glossary` `g` on(((`g`.`value_int` = `po`.`status`) and (`g`.`attribute` = 'doc_status')))) join `term_payment_pur` `pur` on((`pur`.`id` = `po`.`term_payment_pur_id`)));

--  `report_purchase_order_item_view`;
CREATE VIEW `report_purchase_order_item_view` AS select `po`.`code` AS `Purchase Order Code`,`p`.`code` AS `Product Code`,`p`.`name` AS `Product Name`,`u`.`name` AS `UOM`,`po`.`note` AS `Order Item Note`,`poi`.`order_qty` AS `Ordered Qty`,`poi`.`unit_price` AS `Order Unit Price`,`poi`.`subtotal` AS `Subtotal`,`poi`.`weight` AS `Total Weight (Kg)`,`a`.`name` AS `Area`,`w`.`name` AS `Warehouse`,`s`.`code` AS `Supplier Code`,`s`.`name` AS `Supplier Name`,`po`.`recognition_date` AS `Order Date`,`po`.`eta_date` AS `ETA Date`,`pii`.`invoice_qty` AS `Invoiced Qty` from (((((((`purchase_order` `po` join `purchase_order_item` `poi` on((`poi`.`purchase_order_id` = `po`.`id`))) left join `purchase_invoice_item` `pii` on((`pii`.`purchase_order_item_id` = `poi`.`id`))) join `product` `p` on((`p`.`id` = `poi`.`product_id`))) join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`)));

--  `report_purchase_payment`;
CREATE VIEW `report_purchase_payment` AS select `ar`.`name` AS `Area`,`s`.`code` AS `Supplier_Code`,`s`.`name` AS `Supplier_Name`,`pp`.`code` AS `Payment_Code`,`pp`.`recognition_date` AS `Payment_Date`,`pp`.`amount` AS `Payment_Amount`,`pm`.`name` AS `Payment_Method`,upper(`g`.`value_name`) AS `Payment_Status`,`pi`.`code` AS `Invoice_Code`,`pi`.`total_charge` AS `Total_Invoice` from (((((((`purchase_payment` `pp` join `purchase_invoice` `pi` on((`pi`.`id` = `pp`.`purchase_invoice_id`))) join `purchase_order` `po` on((`po`.`id` = `pi`.`purchase_order_id`))) join `warehouse` `w` on((`w`.`id` = `po`.`warehouse_id`))) join `area` `ar` on((`ar`.`id` = `w`.`area_id`))) join `supplier` `s` on((`s`.`id` = `po`.`supplier_id`))) join `payment_method` `pm` on((`pm`.`id` = `pp`.`payment_method_id`))) join `glossary` `g` on(((`g`.`value_int` = `pp`.`status`) and (`g`.`attribute` = 'doc_status'))));

--  `report_sales_invoice_view`;
CREATE VIEW `report_sales_invoice_view` AS select `so`.`code` AS `order_code`,`m`.`code` AS `merchant_code`,`m`.`name` AS `merchant_name`,`b`.`code` AS `branch_code`,`b`.`name` AS `branch_name`,`bt`.`name` AS `type`,`so`.`delivery_date` AS `order_delivery_date`,`si`.`delivery_fee` AS `delivery_fee`,`si`.`total_charge` AS `total_invoice`,`si`.`code` AS `invoice_code`,`si`.`recognition_date` AS `invoice_date`,`si`.`due_date` AS `invoice_due_date`,`g`.`value_name` AS `invoice_status`,sum(`sp`.`amount`) AS `total_confirmed_payment`,`so`.`vou_disc_amount` AS `voucher_amount`,`si`.`adj_note` AS `adjustment_note`,(case when (`si`.`adjustment` = 2) then -(`si`.`adj_amount`) else `si`.`adj_amount` end) AS `adjustment_amount`,`ar`.`name` AS `Archetype`,`tps`.`name` AS `payment_term`,`tis`.`name` AS `invoice_term`,`a`.`name` AS `Area`,`w`.`name` AS `Warehouse` from ((((((((((((`sales_order` `so` left join `sales_invoice` `si` on((`si`.`sales_order_id` = `so`.`id`))) join `branch` `b` on((`b`.`id` = `so`.`branch_id`))) join `merchant` `m` on((`m`.`id` = `b`.`merchant_id`))) join `business_type` `bt` on((`bt`.`id` = `m`.`business_type_id`))) join `sub_district` `sd` on((`sd`.`id` = `b`.`sub_district_id`))) join `area` `a` on((`a`.`id` = `b`.`area_id`))) join `archetype` `ar` on((`ar`.`id` = `so`.`archetype_id`))) left join `glossary` `g` on(((`g`.`value_int` = `si`.`status`) and (`g`.`attribute` = 'doc_status')))) left join `sales_payment` `sp` on(((`si`.`id` = `sp`.`sales_invoice_id`) and (`sp`.`status` not in (3,4))))) left join `term_payment_sls` `tps` on((`tps`.`id` = `so`.`term_payment_sls_id`))) left join `term_invoice_sls` `tis` on((`tis`.`id` = `si`.`term_invoice_sls_id`))) join `warehouse` `w` on((`w`.`id` = `so`.`warehouse_id`))) where (`so`.`delivery_date` >= '2021-01-01') group by `so`.`id`;

--  `report_sales_payment_view`;
CREATE VIEW `report_sales_payment_view` AS select `sp`.`code` AS `payment_code`,`sp`.`recognition_date` AS `payment_date`,`a`.`name` AS `Area`,`g`.`value_name` AS `payment_status`,`pm`.`name` AS `payment_method`,`sp`.`amount` AS `payment_amount`,`so`.`code` AS `order_code`,`si`.`code` AS `invoice_code`,`b`.`code` AS `outlet_code`,`b`.`name` AS `outlet_name` from (((((((`sales_payment` `sp` join `payment_method` `pm` on((`sp`.`payment_method_id` = `pm`.`id`))) left join `payment_channel` `pc` on((`pc`.`id` = `sp`.`payment_channel_id`))) join `sales_invoice` `si` on((`si`.`id` = `sp`.`sales_invoice_id`))) join `sales_order` `so` on((`so`.`id` = `si`.`sales_order_id`))) join `branch` `b` on((`b`.`id` = `so`.`branch_id`))) join `area` `a` on((`a`.`id` = `b`.`area_id`))) left join `glossary` `g` on(((`g`.`value_int` = `sp`.`status`) and (`g`.`attribute` = 'doc_status')))) where (`sp`.`recognition_date` >= '2020-01-01') group by `sp`.`id`;

--  `report_sales_person_view`;
CREATE VIEW `report_sales_person_view` AS select `s`.`code` AS `sales_person_code`,`s`.`name` AS `sales_person_name`,`s`.`phone_number` AS `phone_number`,`r`.`name` AS `role`,`s2`.`name` AS `leader`,`g`.`value_name` AS `Status` from (((`staff` `s` left join `role` `r` on((`r`.`id` = `s`.`role_id`))) left join `staff` `s2` on((`s2`.`id` = `s`.`parent_id`))) left join `glossary` `g` on(((`g`.`value_int` = `s`.`status`) and (`g`.`attribute` = 'status')))) where (`s`.`role_group` = 1);

--  `report_stock_log_view`;
CREATE VIEW `report_stock_log_view` AS select `sl`.`created_at` AS `Timestamp`,(case when (`sl`.`type` = 1) then 'IN' else 'OUT' end) AS `Log_Type`,(case when (`sl`.`ref_type` = 1) then 'delivery order' when (`sl`.`ref_type` = 2) then 'delivery return' when (`sl`.`ref_type` = 3) then 'goods receipt' when (`sl`.`ref_type` = 4) then 'goods transfer' when (`sl`.`ref_type` = 5) then 'stock opname' when (`sl`.`ref_type` = 6) then 'waste entry' end) AS `Ref_Type`,(case when (`sl`.`ref_type` = 1) then `do`.`code` when (`sl`.`ref_type` = 2) then `dr`.`code` when (`sl`.`ref_type` = 3) then `gr`.`code` when (`sl`.`ref_type` = 4) then `gt`.`code` when (`sl`.`ref_type` = 5) then `so`.`code` when (`sl`.`ref_type` = 6) then `we`.`code` end) AS `Reference_Code`,`p`.`code` AS `Product_Code`,`p`.`name` AS `Product_Name`,`u`.`name` AS `UOM`,`sl`.`quantity` AS `Quantity`,`sl`.`final_stock` AS `Final_Stock`,`w`.`name` AS `Warehouse`,`a`.`name` AS `Area`,(case when (`sl`.`ref_type` = 1) then `do`.`note` when (`sl`.`ref_type` = 2) then `dr`.`note` when (`sl`.`ref_type` = 3) then `gr`.`note` when (`sl`.`ref_type` = 4) then `gt`.`note` when (`sl`.`ref_type` = 5) then `so`.`note` when (`sl`.`ref_type` = 6) then `we`.`note` end) AS `Doc_Note`,`sl`.`item_note` AS `Note` from ((((((((((`stock_log` `sl` left join `delivery_order` `do` on((`do`.`id` = `sl`.`ref_id`))) left join `delivery_return` `dr` on((`dr`.`id` = `sl`.`ref_id`))) left join `goods_receipt` `gr` on((`gr`.`id` = `sl`.`ref_id`))) left join `goods_transfer` `gt` on((`gt`.`id` = `sl`.`ref_id`))) left join `stock_opname` `so` on((`so`.`id` = `sl`.`ref_id`))) left join `waste_entry` `we` on((`we`.`id` = `sl`.`ref_id`))) join `product` `p` on((`p`.`id` = `sl`.`product_id`))) join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) join `warehouse` `w` on((`w`.`id` = `sl`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) where (cast(`sl`.`created_at` as date) > '2021-05-01');

--  `report_stock_opname_view`;
CREATE VIEW `report_stock_opname_view` AS select `soi`.`id` AS `stock_opname_item_id`,`so`.`recognition_date` AS `recognition_date`,`so`.`code` AS `stock_code`,`g`.`value_name` AS `status`,`w`.`name` AS `warehouse_name`,`p`.`code` AS `product_code`,`p`.`name` AS `product_name`,`soi`.`initial_stock` AS `initial_stock`,`soi`.`adjust_qty` AS `adjust_qty`,`soi`.`final_stock` AS `final_stock`,`soi`.`note` AS `note` from ((((((`stock_opname_item` `soi` join `stock_opname` `so` on((`so`.`id` = `soi`.`stock_opname_id`))) left join `product` `p` on((`p`.`id` = `soi`.`product_id`))) left join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) left join `category` `c` on((`c`.`id` = `p`.`category_id`))) left join `warehouse` `w` on((`w`.`id` = `so`.`warehouse_id`))) left join `glossary` `g` on(((`g`.`value_int` = `so`.`status`) and (`g`.`attribute` = 'doc_status')))) where (`so`.`recognition_date` >= '2021-01-01') group by `soi`.`id`;

--  `report_stock_view`;
CREATE VIEW `report_stock_view` AS select `p`.`code` AS `product_code`,`p`.`name` AS `product_name`,`w`.`id` AS `warehouse_id`,`w`.`name` AS `warehouse_name`,`stock`.`available_stock` AS `available_stock`,`stock`.`waste_stock` AS `waste_stock`,`stock`.`safety_stock` AS `safety_stock`,`stock`.`commited_in_stock` AS `commited_in_stock`,`stock`.`commited_out_stock` AS `commited_out_stock`,`stock`.`salable` AS `salable`,`stock`.`purchasable` AS `purchasable`,`stock`.`status` AS `status` from ((`stock` join `product` `p` on((`p`.`id` = `stock`.`product_id`))) join `warehouse` `w` on((`w`.`id` = `stock`.`warehouse_id`)));

--  `report_VA_Transaction_view`;
CREATE VIEW `report_VA_Transaction_view` AS select (case when (`m`.`customer_group` = 1) then `m`.`code` else NULL end) AS `Main_Outlet_Code`,(case when (`m`.`customer_group` = 1) then `m`.`name` else NULL end) AS `Main_Outlet_Name`,(case when (`m`.`customer_group` = 2) then `m`.`code` else NULL end) AS `Agent_Code`,(case when (`m`.`customer_group` = 2) then `b`.`name` else NULL end) AS `Agent_Name`,`a`.`name` AS `Finance_Area`,`pc`.`name` AS `Channel`,`tx`.`amount` AS `Total_Amount`,`tx`.`transaction_date` AS `Transaction_Date`,`tx`.`transaction_time` AS `Transaction_Time` from ((((`txn_xendit` `tx` join `merchant` `m` on((`m`.`id` = `tx`.`merchant_id`))) join `branch` `b` on((`b`.`merchant_id` = `m`.`id`))) join `area` `a` on((`a`.`id` = `m`.`finance_area_id`))) join `payment_channel` `pc` on((`pc`.`id` = `tx`.`payment_channel_id`)));

--  `report_voucher_view`;
CREATE VIEW `report_voucher_view` AS select `v`.`redeem_code` AS `redeem_code`,`g`.`value_name` AS `promo_type`,`so`.`code` AS `order_code`,`so`.`recognition_date` AS `order_date`,`g2`.`value_name` AS `order_status`,`vl`.`vou_disc_amount` AS `disc_amount`,`so`.`total_charge` AS `total_order`,`m`.`code` AS `main_outlet_code`,`m`.`name` AS `main_outlet_name`,`b`.`code` AS `outlet_code`,`b`.`name` AS `outletl_name`,(case when (`m`.`customer_group` = 1) then 'Outlet' else 'Agent' end) AS `customer_group`,`a2`.`name` AS `Area`,`a`.`name` AS `Archetype` from ((((((((`voucher_log` `vl` left join `voucher` `v` on((`v`.`id` = `vl`.`voucher_id`))) left join `sales_order` `so` on((`so`.`id` = `vl`.`sales_order_id`))) left join `merchant` `m` on((`m`.`id` = `vl`.`merchant_id`))) left join `branch` `b` on((`b`.`id` = `vl`.`branch_id`))) left join `archetype` `a` on((`a`.`id` = `b`.`archetype_id`))) left join `area` `a2` on((`a2`.`id` = `b`.`area_id`))) left join `glossary` `g` on(((`g`.`value_int` = `v`.`type`) and (`g`.`attribute` = 'type') and (`g`.`table` = 'voucher')))) left join `glossary` `g2` on(((`g2`.`value_int` = `so`.`status`) and (`g2`.`attribute` = 'doc_status'))));

--  `report_waste_log_view`;
CREATE VIEW `report_waste_log_view` AS select `wl`.`created_at` AS `Timestamp`,(case when (`wl`.`type` = 1) then 'IN' when (`wl`.`type` = 2) then 'OUT' end) AS `Log_Type`,(case when (`wl`.`ref_type` = 1) then 'delivery return' when (`wl`.`ref_type` = 2) then 'waste entry' when (`wl`.`ref_type` = 3) then 'waste_disposal' end) AS `Ref_Type`,(case when (`wl`.`ref_type` = 1) then `dr`.`code` when (`wl`.`ref_type` = 2) then `we`.`code` when (`wl`.`ref_type` = 3) then `wd`.`code` end) AS `Reference_Code`,`p`.`code` AS `Product_Code`,`p`.`name` AS `Product_Name`,`u`.`name` AS `UOM`,`wl`.`quantity` AS `Quantity`,`wl`.`final_stock` AS `Final_Stock`,`w`.`name` AS `Warehouse`,`a`.`name` AS `Area`,(case when (`wl`.`ref_type` = 1) then `dr`.`note` when (`wl`.`ref_type` = 2) then `we`.`note` when (`wl`.`ref_type` = 3) then `wd`.`note` end) AS `Doc_Note`,`wl`.`item_note` AS `Item Note` from (((((((`waste_log` `wl` left join `delivery_return` `dr` on((`dr`.`id` = `wl`.`ref_id`))) left join `waste_entry` `we` on((`we`.`id` = `wl`.`ref_id`))) left join `waste_disposal` `wd` on((`wd`.`id` = `wl`.`ref_id`))) join `product` `p` on((`p`.`id` = `wl`.`product_id`))) join `uom` `u` on((`u`.`id` = `p`.`uom_id`))) join `warehouse` `w` on((`w`.`id` = `wl`.`warehouse_id`))) join `area` `a` on((`a`.`id` = `w`.`area_id`))) order by `wl`.`id`;

--  `sales_payment_cancelled_view`;
CREATE VIEW `sales_payment_cancelled_view` AS select `sp`.`id` AS `id`,`so`.`code` AS `order_code`,`sp`.`code` AS `payment_code`,date_format(`sp`.`recognition_date`,'%d-%m-%Y') AS `payment_date`,date_format(`sp`.`created_at`,'%d-%m-%Y %H:%i:%s') AS `paid_at`,`s`.`name` AS `paid_by`,`g`.`value_name` AS `payment_status`,`al2`.`note` AS `cancel_note` from (((((`eden_v2`.`sales_payment` `sp` join `eden_v2`.`sales_invoice` `si` on((`si`.`id` = `sp`.`sales_invoice_id`))) join `eden_v2`.`sales_order` `so` on((`so`.`id` = `si`.`sales_order_id`))) join `eden_v2`.`staff` `s` on((`s`.`id` = `sp`.`created_by`))) join `eden_v2`.`glossary` `g` on(((`g`.`attribute` = 'doc_status') and (`g`.`value_int` = `sp`.`status`)))) join (select `al`.`id` AS `id`,`al`.`staff_id` AS `staff_id`,`al`.`merchant_id` AS `merchant_id`,`al`.`ref_id` AS `ref_id`,`al`.`type` AS `type`,`al`.`function` AS `function`,`al`.`timestamp` AS `timestamp`,`al`.`note` AS `note` from `eden_v2`.`audit_log` `al` where ((`al`.`type` = 'sales_payment') and (`al`.`function` = 'cancel'))) `al2` on((`al2`.`ref_id` = `sp`.`id`))) where (`sp`.`status` = 3);

SET foreign_key_checks = 1;

-- 2022-02-11 10:16:53