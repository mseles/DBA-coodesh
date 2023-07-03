-- ### CRIACAO DOS SCHEMA ###

-- ##SALES
-- Tabela: customers
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  street VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50)
);

-- Tabela: orders
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_status VARCHAR(20),
  order_date DATE,
  required_date DATE,
  shipped_date DATE,
  store_id INT,
  staff_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

-- Tabela: staffs
CREATE TABLE staffs (
  staff_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20),
  active BOOLEAN,
  store_id INT,
  manager_id INT,
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (manager_id) REFERENCES staffs(staff_id)
);

-- Tabela: stores
CREATE TABLE stores (
  store_id INT PRIMARY KEY,
  store_name VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(100),
  street VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip_code VARCHAR(10)
);

-- Tabela: order_items
CREATE TABLE order_items (
  order_id INT,
  item_id INT,
  product_id INT,
  quantity INT,
  list_price DECIMAL(10, 2),
  discount DECIMAL(10, 2),
  PRIMARY KEY (order_id, item_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ##PRODUCTION

-- Tabela: categories
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

-- Tabela: products
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  brand_id INT,
  category_id INT,
  model_year INT,
  list_price DECIMAL(10, 2),
  FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Tabela: stocks
CREATE TABLE stocks (
  store_id INT,
  product_id INT,
  quantity INT,
  PRIMARY KEY (store_id, product_id),
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabela: brands
CREATE TABLE brands (
  brand_id INT PRIMARY KEY,
  brand_name VARCHAR(50)
);


-- ### INSERTS:

-- Inserções na tabela customers
INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state)
VALUES (1, 'John', 'Doe', '123456789', 'john.doe@example.com', '123 Main St', 'New York', 'NY'),
       (2, 'Jane', 'Smith', '987654321', 'jane.smith@example.com', '456 Elm St', 'Los Angeles', 'CA'),
       (3, 'Michael', 'Johnson', '555555555', 'michael.johnson@example.com', '789 Oak St', 'Chicago', 'IL');
	   
-- Inserções na tabela stores
INSERT INTO stores (store_id, store_name, phone, email, street, city, state, zip_code)
VALUES (1, 'Main Store', '111111111', 'info@example.com', '123 Main St', 'New York', 'NY', '10001'),
       (2, 'Branch Store', '222222222', 'info@example.com', '456 Elm St', 'Los Angeles', 'CA', '90001');
	   
-- Inserções na tabela staffs
INSERT INTO staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
VALUES (1, 'David', 'Brown', 'david.brown@example.com', '111111111', true, 1, NULL),
       (2, 'Emily', 'Davis', 'emily.davis@example.com', '222222222', true, 2, 1);

-- Inserções na tabela categories
INSERT INTO categories (category_id, category_name)
VALUES (1, 'Electronics'),
       (2, 'Clothing'),
       (3, 'Home');
	   
-- Inserções na tabela categories	  
INSERT INTO brands (brand_id, brand_name)
VALUES (1, 'AVELL'),
	   (2, 'CLOCK'),
	   (3, 'LG');
	   
-- Inserções na tabela products
INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES (1, 'Smartphone', 1, 1, 2023, 499.99),
       (2, 'T-Shirt', 2, 2, NULL, 19.99),
       (3, 'TV', 1, 1, 2023, 999.99);


-- Inserções na tabela orders
INSERT INTO orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
VALUES (1, 1, 'Pending', '2023-07-01', '2023-07-05', NULL, 1, 1),
       (2, 2, 'Shipped', '2023-07-02', '2023-07-07', '2023-07-03', 2, 2),
       (3, 1, 'Completed', '2023-07-03', '2023-07-08', '2023-07-04', 1, 2);



-- Inserções na tabela order_items
INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount)
VALUES (1, 1, 1, 2, 9.99, 0),
       (1, 2, 3, 1, 19.99, 0.1),
       (2, 1, 2, 3, 14.99, 0.05);


-- Inserções na tabela stocks
INSERT INTO stocks (store_id, product_id, quantity)
VALUES (1, 1, 10),
       (1, 2, 20),
       (2, 1, 5);