SELECT 
ord.order_id,
ord.customer_id,
ord.store_id,
CONCAT(cus."FirstName", ' ',cus."LastName" ) AS "Cust_Name",
cus.city,
cus.state,
ord.order_date,
prod.product_name,
cat.category_name,
stor.store_name,
CONCAT(staff.first_name, ' ', staff.last_name) AS "sales_rep",
brd.brand_name,
ordid.discount,
ordid.item_id,
SUM(ordid.quantity) AS "total_sold",
SUM(ordid.quantity * ordid.list_price) AS "total_rev"
FROM "Order" AS ord
JOIN "Customer" AS cus 
on ord.customer_id = cus.customer_id
JOIN "Orderid" AS ordid
on ord.order_id = ordid.order_id
JOIN "Product" AS prod
on ordid.product_id = prod.product_id
JOIN "Category" AS cat
on prod.category_id = cat.category_id
JOIN "Stores" AS stor
ON ord.store_id = stor.store_id
JOIN "Staff" AS staff
ON ord.staff_id =staff.staff_id
JOIN "Brands" as brd
ON prod.brand_id = brd.brand_id
GROUP BY 
ord.order_id,
ord.customer_id,
ord.store_id,
CONCAT(cus."FirstName", ' ',cus."LastName" ),
cus.city,
cus.state,
ord.order_date,
prod.product_name,
cat.category_name,
stor.store_name,
CONCAT(staff.first_name, ' ', staff.last_name),
brd.brand_name,
ordid.discount,
ordid.item_id;