SELECT 
stk.quantity,
sto.store_name,
stk.store_id,
prod.product_name,
cat.category_name,
brnd.brand_name,
ordid.list_price,
(stk.quantity * ordid.list_price)AS stock_value
From "Stock" AS stk
JOIN "Stores" AS sto 
ON stk.store_id = sto.store_id
JOIN "Product" AS prod
ON stk.product_id = prod.product_id
JOIN "Brands" AS brnd
on prod.brand_id = brnd.brand_id
JOIN "Category" AS cat
ON prod.category_id = cat.category_id
JOIN "Orderid" AS ordid
ON stk.product_id = ordid.product_id
Group BY
stk.quantity,
sto.store_name,
stk.store_id,
prod.product_name,
cat.category_name,
brnd.brand_name,
ordid.list_price;