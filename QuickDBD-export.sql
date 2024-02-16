-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Customer" (
    "customer_id" int   NOT NULL,
    "FirstName" string   NOT NULL,
    "LastName" string   NOT NULL,
    "Phone" varchar(50)   NOT NULL,
    "Email" varchar(50)   NOT NULL,
    "city" string   NOT NULL,
    "state" string   NULL,
    "zip_code" string   NULL,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "Order" (
    "order_id" int   NOT NULL,
    "customer_id" int   NOT NULL,
    "order_date" DATE   NOT NULL,
    "required_date" DATE   NOT NULL,
    "shipped_date" DATE   NOT NULL,
    "store_id" int   NOT NULL,
    "staff_id" int   NOT NULL,
    CONSTRAINT "pk_Order" PRIMARY KEY (
        "order_id"
     )
);

CREATE TABLE "Brands" (
    "brand_id" int   NOT NULL,
    "brand_name" string   NOT NULL,
    CONSTRAINT "pk_Brands" PRIMARY KEY (
        "brand_id"
     )
);

CREATE TABLE "Category" (
    "category_id" int   NOT NULL,
    "category_name" string   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Orderid" (
    "order_id" int   NOT NULL,
    "item_id" int   NOT NULL,
    "product_id" int   NOT NULL,
    "quantity" int   NOT NULL,
    "list_price" money   NOT NULL,
    "discount" decimal(3,2)   NOT NULL
);

CREATE TABLE "Product" (
    "product_id" int   NOT NULL,
    -- Field documentation comment 3
    "product_name" varchar(200)   NOT NULL,
    "Price" money   NOT NULL,
    "brand_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "model_year" int   NOT NULL,
    "list_price" money   NOT NULL,
    CONSTRAINT "pk_Product" PRIMARY KEY (
        "product_id"
     ),
    CONSTRAINT "uc_Product_product_name" UNIQUE (
        "product_name"
    )
);

CREATE TABLE "Staff" (
    "staff_id" int   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    "email" varchar   NOT NULL,
    "phone" varchar(50)   NOT NULL,
    "active" int   NOT NULL,
    "store_id" int   NOT NULL,
    "manager_id" int   NOT NULL,
    CONSTRAINT "pk_Staff" PRIMARY KEY (
        "staff_id"
     )
);

CREATE TABLE "Stores" (
    "store_id" int   NOT NULL,
    "store_name" varchar(50)   NOT NULL,
    "phone" varchar(50)   NOT NULL,
    "email" varchar   NOT NULL,
    "street" string   NOT NULL,
    "city" string   NOT NULL,
    "state" string   NULL,
    "zip_code" string   NULL,
    CONSTRAINT "pk_Stores" PRIMARY KEY (
        "store_id"
     )
);

CREATE TABLE "Stock" (
    "store_id" int   NOT NULL,
    "product_id" int   NOT NULL,
    "quantity" int   NOT NULL
);

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customer" ("customer_id");

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_store_id" FOREIGN KEY("store_id")
REFERENCES "Stores" ("store_id");

ALTER TABLE "Order" ADD CONSTRAINT "fk_Order_staff_id" FOREIGN KEY("staff_id")
REFERENCES "Staff" ("staff_id");

ALTER TABLE "Orderid" ADD CONSTRAINT "fk_Orderid_order_id" FOREIGN KEY("order_id")
REFERENCES "Order" ("order_id");

ALTER TABLE "Orderid" ADD CONSTRAINT "fk_Orderid_product_id_list_price" FOREIGN KEY("product_id", "list_price")
REFERENCES "Product" ("product_id", "list_price");

ALTER TABLE "Product" ADD CONSTRAINT "fk_Product_brand_id" FOREIGN KEY("brand_id")
REFERENCES "Brands" ("brand_id");

ALTER TABLE "Product" ADD CONSTRAINT "fk_Product_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Staff" ADD CONSTRAINT "fk_Staff_store_id" FOREIGN KEY("store_id")
REFERENCES "Stores" ("store_id");

ALTER TABLE "Stock" ADD CONSTRAINT "fk_Stock_store_id" FOREIGN KEY("store_id")
REFERENCES "Stores" ("store_id");

ALTER TABLE "Stock" ADD CONSTRAINT "fk_Stock_product_id" FOREIGN KEY("product_id")
REFERENCES "Product" ("product_id");

CREATE INDEX "idx_Customer_FirstName"
ON "Customer" ("FirstName");

CREATE INDEX "idx_Customer_LastName"
ON "Customer" ("LastName");

CREATE INDEX "idx_Staff_last_name"
ON "Staff" ("last_name");

