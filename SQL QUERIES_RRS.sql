-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);

-- Create Reservations Table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    table_id INT,
    reservation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    party_size INT
);

-- Create Tables Table
CREATE TABLE Tables (
    table_id INT PRIMARY KEY,
    table_number VARCHAR(20),
    capacity INT,
    availability_status BOOLEAN
);

-- Create Menu Items Table
CREATE TABLE Menuitems (
    menu_item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    description VARCHAR(100),
    price DECIMAL,
    category VARCHAR(20)
);

-- Create Orders Table
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    reservation_id INT,
    menu_item_id INT,
    quantity INT
);

insert into Customers (customer_id, name, phone_number, email) values 
(1, 'Sean', '09081234567', 'sean@gmail.com'),
(2, 'Mark Ian', '09612345678', 'markian@gmail.com'),
(3, 'Brent', '09212345679', 'brent@gmail.com'),
(4, 'Esnyr', '09976543211', 'esnyr@gmail.com'),
(5, 'Jarren', '09613555698', 'jarren@gmail.com');

insert into Reservations (reservation_id, customer_id, table_id, reservation_time, party_size) values 
(1, 4, 4, '2/26/2000 17:02:24', 38),
(2, 1, 5, '7/17/2072 05:01:52', 74),
(3, 5, 1, '12/2/2026 04:02:59', 89),
(4, 2, 5, '12/12/2026 03:22:59', 54),
(5, 3, 1, '6/11/2040 19:36:01', 55); 

insert into Tables (table_id, table_number, capacity, availability_status) values
(1, 36, 78, true),
(2, 6, 16, false),
(3, 62, 59, false),
(4, 67, 29, true),
(5, 92, 26, true);

insert into MenuItems (menu_item_id, item_name, description, price, category) values 
(1, 'Truffle Mac and Cheese Bites', 'Crispy, bite-sized mac and cheese balls infused with aromatic truffle oil, served with a tangy marinara dipping sauce.', 672, 'Appetizer'),
(2, 'Grilled Lemon Herb Salmon', 'Fresh salmon fillet marinated in a zesty lemon and herb blend, grilled to perfection, and served with a side of roasted vegetables and quinoa.', 1344, 'Main Course'),
(3, 'Decadent Chocolate Lava Cake', 'Rich, molten chocolate cake with a gooey center, served warm with a scoop of vanilla bean ice cream and a drizzle of raspberry coulis.',  448, 'Dessert'),
(4, 'Classic Mojito', 'A refreshing cocktail made with wShite rum, fresh mint leaves, lime juice, sugar, and a splash of soda water, garnished with a mint sprig.', 560, 'Drinks'),
(5, 'Garlic Parmesan Fries', 'Crispy, golden fries tossed with garlic, fresh parsley, and grated Parmesan cheese, served with a side of aioli dipping sauce.', 392, 'Side dish');

insert into Orders (order_id, reservation_id, menu_item_id, quantity) values
(1, 1, 5, 2),
(2, 5, 2, 4),
(3, 4, 3, 2),
(4, 5, 4, 2),
(5, 2, 5, 4);

----------------------------------------------------------------------------------------------------------------------------------------------------

--dbdiagram.io

Table Customers {
  customer_id integer [primary key]
  name varchar
  phone_number varchar
  email varchar
}


Table Reservations {
  reservation_id integer [primary key]
  customer_id integer
  table_id integer
  reservation_time timestamp
  party_size integer
}


Table Tables {
    table_id integer [primary key]
    table_number varchar
    capacity integer
    availability_status boolean
}


Table MenuItems {
  menu_item_id integer [primary key]
  item_name varchar
  description varchar
  price decimal
  category varchar
}


Table Orders{
    order_id integer [primary key]
    reservation_id integer
    menu_item_id integer
    quantity integer
}

Ref: "Customers"."customers_id" < "Reservations"."customers_id"

Ref: "Tables"."table_id" < "Reservations"."table_id"

Ref: "Reservations"."reservation_id" < "Orders"."reservation_id"

Ref: "MenuItems"."menu_item_id" < "Orders"."menu_item_id"