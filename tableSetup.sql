CREATE DATABASE IF NOT EXISTS restaurantPOS;

USE restaurantPOS;
drop TABLE if exists menu_orders;
drop Table if exists orders;
drop table if exists top;
drop TABLE if exists employee;
drop table if exists menu;

-- Create the menu table. This stores the food, price and food_id
 CREATE TABLE IF NOT EXISTS menu (
	food_id INT auto_increment,
    food_name VARCHAR(32),
    food_cost FLOAT DEFAULT 10.00,
    PRIMARY KEY(food_id)
 );

-- Create employee table, stores thier ID (chosen by employee), as well as thier salary and name
CREATE TABLE IF NOT EXISTS employee(
	employee_id INT NOT NULL,
    e_name VARCHAR(8) NULL,
    salary FLOAT NULL,
    PRIMARY KEY(employee_id)
);

-- Create the tables, stores if the order on this table is currently active, how many people there are and the Table id
CREATE TABLE IF NOT EXISTS top (
	top_id INT NOT NULL,
    order_id INT NOT NULL,
    guest_num INT NULL,
    isCurrent BOOL DEFAULT false,
    PRIMARY KEY (top_id, order_id)
    
);
-- Creates the order, stores employee info, and a slew of other things
CREATE TABLE IF NOT EXISTS orders (
	order_id INT NOT NULL auto_increment,
    employee INT NULL,
    top_id INT NULL,
    discount FLOAT DEFAULT 0.00,
    tip FLOAT NULL,
    order_date DATE DEFAULT (CURRENT_TIME),
    tax FLOAT DEFAULT 1.1045,
    PRIMARY KEY(order_id),
    FOREIGN KEY(employee) references employee(employee_id),
    FOREIGN KEY(top_id) references top(top_id)
);

-- Creates the food orders for the order.
CREATE TABLE IF NOT EXISTS menu_orders (
	order_id INT NOT NULL,
    food_id INT NOT NULL,
    quantity INT DEFAULT 1,
    PRIMARY KEY (order_id, food_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (food_id) REFERENCES menu(food_id)
);
