SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM user WHERE id = 1;
DELETE FROM staff WHERE id = 222;

TRUNCATE archetype;
TRUNCATE area;
TRUNCATE area_policy;
TRUNCATE business_type;
TRUNCATE category;
TRUNCATE config_app;
TRUNCATE division;
TRUNCATE glossary;
TRUNCATE koli;
TRUNCATE menu;
TRUNCATE notification;
TRUNCATE order_type_sls;
TRUNCATE payment_channel;
TRUNCATE payment_group_comb;
TRUNCATE payment_group_sls;
TRUNCATE payment_method;
TRUNCATE permission;
TRUNCATE price;
TRUNCATE price_set;
TRUNCATE product;
TRUNCATE product_image;
TRUNCATE province;
TRUNCATE role;
TRUNCATE stock;
TRUNCATE supplier_type;
TRUNCATE term_invoice_sls;
TRUNCATE term_payment_pur;
TRUNCATE term_payment_sls;
TRUNCATE uom;
TRUNCATE warehouse;
TRUNCATE warehouse_coverage;
TRUNCATE wrt;


SET FOREIGN_KEY_CHECKS = 1;

