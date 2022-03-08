-- 2022-02-10 11:00:00
SET FOREIGN_KEY_CHECKS = 0;


DROP VIEW IF EXISTS `adm_division`;

DROP TABLE IF EXISTS `archetype`;

DROP TABLE IF EXISTS `area`;

DROP TABLE IF EXISTS `area_policy`;

DROP TABLE IF EXISTS `audit_log`;

DROP TABLE IF EXISTS `banner`;

DROP TABLE IF EXISTS `branch`;

DROP TABLE IF EXISTS `business_type`;

DROP TABLE IF EXISTS `category`;

DROP TABLE IF EXISTS `city`;

DROP TABLE IF EXISTS `code_generator`;

DROP TABLE IF EXISTS `code_generator_referral`;

DROP TABLE IF EXISTS `cogs`;

DROP TABLE IF EXISTS `config_app`;

DROP TABLE IF EXISTS `country`;

DROP TABLE IF EXISTS `courier`;

DROP TABLE IF EXISTS `courier_transaction`;

DROP TABLE IF EXISTS `courier_vendor`;

DROP TABLE IF EXISTS `day_off`;

DROP TABLE IF EXISTS `delivery_koli`;

DROP TABLE IF EXISTS `delivery_order`;

DROP TABLE IF EXISTS `delivery_order_item`;

DROP TABLE IF EXISTS `delivery_return`;

DROP TABLE IF EXISTS `delivery_return_item`;

DROP TABLE IF EXISTS `district`;

DROP TABLE IF EXISTS `division`;

DROP TABLE IF EXISTS `document_temp`;

DROP TABLE IF EXISTS `faq_question`;

DROP TABLE IF EXISTS `faq_topic`;

DROP TABLE IF EXISTS `forecast_demand`;

DROP TABLE IF EXISTS `glossary`;

DROP TABLE IF EXISTS `goods_receipt`;

DROP TABLE IF EXISTS `goods_receipt_item`;

DROP TABLE IF EXISTS `goods_transfer`;

DROP TABLE IF EXISTS `goods_transfer_item`;

DROP TABLE IF EXISTS `jobs`;

DROP TABLE IF EXISTS `koli`;

DROP TABLE IF EXISTS `menu`;

DROP TABLE IF EXISTS `merchant`;

DROP TABLE IF EXISTS `merchant_acc_num`;

DROP TABLE IF EXISTS `merchant_point_log`;

DROP TABLE IF EXISTS `merchant_price_set`;

DROP TABLE IF EXISTS `notification`;

DROP TABLE IF EXISTS `notification_log`;

DROP TABLE IF EXISTS `notification_picking_log`;

DROP TABLE IF EXISTS `notification_sales_log`;

DROP TABLE IF EXISTS `order_type_sls`;

DROP TABLE IF EXISTS `otp_outgoing`;

DROP TABLE IF EXISTS `packing_helper_log`;

DROP TABLE IF EXISTS `packing_order`;

DROP TABLE IF EXISTS `packing_order_item`;

DROP TABLE IF EXISTS `packing_order_item_assign`;

DROP TABLE IF EXISTS `payment_channel`;

DROP TABLE IF EXISTS `payment_group_comb`;

DROP TABLE IF EXISTS `payment_group_sls`;

DROP TABLE IF EXISTS `payment_guide`;

DROP TABLE IF EXISTS `payment_method`;

DROP TABLE IF EXISTS `permission`;

DROP TABLE IF EXISTS `picking_order`;

DROP TABLE IF EXISTS `picking_order_assign`;

DROP TABLE IF EXISTS `picking_order_item`;

DROP TABLE IF EXISTS `price`;

DROP TABLE IF EXISTS `price_log`;

DROP TABLE IF EXISTS `price_schedule`;

DROP TABLE IF EXISTS `price_schedule_dump`;

DROP TABLE IF EXISTS `price_set`;

DROP TABLE IF EXISTS `product`;

DROP TABLE IF EXISTS `product_image`;

DROP TABLE IF EXISTS `prospect_customer`;

DROP VIEW IF EXISTS `prospect_customer_log_view`;

DROP TABLE IF EXISTS `prospect_supplier`;

DROP TABLE IF EXISTS `province`;

DROP TABLE IF EXISTS `purchase_invoice`;

DROP TABLE IF EXISTS `purchase_invoice_item`;

DROP TABLE IF EXISTS `purchase_order`;

DROP TABLE IF EXISTS `purchase_order_item`;

DROP TABLE IF EXISTS `purchase_payment`;

DROP VIEW IF EXISTS `report_agent_view`;

DROP VIEW IF EXISTS `report_delivery_return_item_view`;

DROP VIEW IF EXISTS `report_goods_receipt_item_view`;

DROP VIEW IF EXISTS `report_main_outlet_view`;

DROP VIEW IF EXISTS `report_outlet_view`;

DROP VIEW IF EXISTS `report_product_view`;

DROP VIEW IF EXISTS `report_prospective_view`;

DROP VIEW IF EXISTS `report_purchase_invoice_item_view`;

DROP VIEW IF EXISTS `report_purchase_invoice_view`;

DROP VIEW IF EXISTS `report_purchase_order`;

DROP VIEW IF EXISTS `report_purchase_order_item_view`;

DROP VIEW IF EXISTS `report_purchase_payment`;

DROP VIEW IF EXISTS `report_sales_invoice_view`;

DROP VIEW IF EXISTS `report_sales_payment_view`;

DROP VIEW IF EXISTS `report_sales_person_view`;

DROP VIEW IF EXISTS `report_stock_log_view`;

DROP VIEW IF EXISTS `report_stock_opname_view`;

DROP VIEW IF EXISTS `report_stock_view`;

DROP VIEW IF EXISTS `report_VA_Transaction_view`;

DROP VIEW IF EXISTS `report_voucher_view`;

DROP VIEW IF EXISTS `report_waste_log_view`;

DROP TABLE IF EXISTS `role`;

DROP TABLE IF EXISTS `role_permission`;

DROP TABLE IF EXISTS `sales_group`;

DROP TABLE IF EXISTS `sales_invoice`;

DROP TABLE IF EXISTS `sales_invoice_external`;

DROP TABLE IF EXISTS `sales_invoice_item`;

DROP TABLE IF EXISTS `sales_inv_recap`;

DROP TABLE IF EXISTS `sales_inv_recap_item`;

DROP TABLE IF EXISTS `sales_order`;

DROP TABLE IF EXISTS `sales_order_feedback`;

DROP TABLE IF EXISTS `sales_order_item`;

DROP TABLE IF EXISTS `sales_payment`;

DROP VIEW IF EXISTS `sales_payment_cancelled_view`;

DROP TABLE IF EXISTS `staff`;

DROP TABLE IF EXISTS `stock`;

DROP TABLE IF EXISTS `stock_log`;

DROP TABLE IF EXISTS `stock_opname`;

DROP TABLE IF EXISTS `stock_opname_item`;

DROP TABLE IF EXISTS `sub_district`;

DROP TABLE IF EXISTS `supplier`;

DROP TABLE IF EXISTS `supplier_badge`;

DROP TABLE IF EXISTS `supplier_type`;

DROP TABLE IF EXISTS `tag_customer`;

DROP TABLE IF EXISTS `tag_product`;

DROP TABLE IF EXISTS `temp_courier`;

DROP TABLE IF EXISTS `term_condition`;

DROP TABLE IF EXISTS `term_invoice_sls`;

DROP TABLE IF EXISTS `term_payment_pur`;

DROP TABLE IF EXISTS `term_payment_sls`;

DROP TABLE IF EXISTS `txn_xendit`;

DROP TABLE IF EXISTS `uom`;

DROP TABLE IF EXISTS `user`;

DROP TABLE IF EXISTS `user_merchant`;

DROP TABLE IF EXISTS `user_permission`;

DROP TABLE IF EXISTS `user_temp_new`;

DROP TABLE IF EXISTS `voucher`;

DROP TABLE IF EXISTS `voucher_content`;

DROP TABLE IF EXISTS `voucher_item`;

DROP TABLE IF EXISTS `voucher_log`;

DROP TABLE IF EXISTS `warehouse`;

DROP TABLE IF EXISTS `warehouse_coverage`;

DROP TABLE IF EXISTS `waste_disposal`;

DROP TABLE IF EXISTS `waste_disposal_item`;

DROP TABLE IF EXISTS `waste_entry`;

DROP TABLE IF EXISTS `waste_entry_item`;

DROP TABLE IF EXISTS `waste_log`;

DROP TABLE IF EXISTS `white_list_login`;

DROP TABLE IF EXISTS `wrt`;

DROP TABLE IF EXISTS `adm_division`;

DROP TABLE IF EXISTS `prospect_customer_log_view`;

DROP TABLE IF EXISTS `report_agent_view`;

DROP TABLE IF EXISTS `report_delivery_return_item_view`;

DROP TABLE IF EXISTS `report_goods_receipt_item_view`;

DROP TABLE IF EXISTS `report_main_outlet_view`;

DROP TABLE IF EXISTS `report_outlet_view`;

DROP TABLE IF EXISTS `report_product_view`;

DROP TABLE IF EXISTS `report_prospective_view`;

DROP TABLE IF EXISTS `report_purchase_invoice_item_view`;

DROP TABLE IF EXISTS `report_purchase_invoice_view`;

DROP TABLE IF EXISTS `report_purchase_order`;

DROP TABLE IF EXISTS `report_purchase_order_item_view`;

DROP TABLE IF EXISTS `report_purchase_payment`;

DROP TABLE IF EXISTS `report_sales_invoice_view`;

DROP TABLE IF EXISTS `report_sales_payment_view`;

DROP TABLE IF EXISTS `report_sales_person_view`;

DROP TABLE IF EXISTS `report_stock_log_view`;

DROP TABLE IF EXISTS `report_stock_opname_view`;

DROP TABLE IF EXISTS `report_stock_view`;

DROP TABLE IF EXISTS `report_VA_Transaction_view`;

DROP TABLE IF EXISTS `report_voucher_view`;

DROP TABLE IF EXISTS `report_waste_log_view`;

DROP TABLE IF EXISTS `sales_payment_cancelled_view`;

SET FOREIGN_KEY_CHECKS = 1;

-- 2022-02-10 22:07:32