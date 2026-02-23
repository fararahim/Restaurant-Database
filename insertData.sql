use restaurantPOS;

-- Delete previous uses so that the most recent Data goes into the tables.
DELETE FROM menu_orders;
DELETE FROM orders;
DELETE FROM employee;
DELETE FROM top;
DELETE FROM menu;

-- Create the menu.
ALTER TABLE menu AUTO_INCREMENT = 1;
INSERT INTO menu (food_name, food_cost) VALUES
	("Soft Drink", 1.65), -- 1
	("Chicken Hibachi", 14.75),
	("Steak Hibachi", 16.50),
    ("Shrimp Hibachi", 15.99),
	("Edemame", 4.50), -- 5
    ("Egg Rolls", 5.50),
	("California Roll", 9.00),
    ("Salmon Roll", 7.50),
    ("Tuna Roll", 7.50), 
    ("Crunchy Roll", 7.50), -- 10
    ("Rainbow Roll", 10.50),
    ("Green Tea", 2.50),
    ("Sake", 12.00)
;

INSERT INTO employee (employee_id, e_name, salary) VALUES
	(1089, "Bella", 12.00),
    (8888, "Top", 10.50),
    (0504, "Caitlin", 12.00),
    (2222, "Christia", 2.15),
    (0000, "Issac", 2.15)
;
-- Create each of the tables, a new one should be created any time an order is made

-- DEV NOTE: if i could do this different i would... i SHOULD have only made 8 entries that were static...
-- Instead Im effectively extending the orders table. This makes querying a lot harder. its a bit too late now though, 
-- So i will just have to lie in the bed i made.

INSERT INTO top (top_id, order_id, guest_num, isCurrent) VALUES
	(1, 1, 4, false),
    (2, 2, 2, false),
    (3, 3, 3, false),
    (4, 4, 4, false),
    (5, 5, 6, false),
    (6, 6, 5, false),
    (7, 7, 1, false),
    (8, 8, 1, false),
    
    (1, 9, 5, true),
    (2, 10, 2, true),
    (3, 11, 3, false),
    (4, 12, 3, true),
    (5, 13, 4, false),
    (6, 14, 1, true),
	(7, 15, 3, true),
    (8, 16, 1, true)

;
-- Create each of the orders that are in the table. (more can be added if needed)
ALTER TABLE orders AUTO_INCREMENT = 1;
INSERT INTO orders (employee, top_id, tip) VALUES
	(1089,1, 5.47),
    (8888,2,10),
    (2222,3,7),
    (0000,4,4),
    (8888,5,0),
    (0504,6,20),
    (2222,7,5),
    (0000,8,10),
    
    (8888,1,5),
    (0504,2,5),
    (1089,3,NULL),
    (1089,4,10),
    (0504,5,NULL),
    (8888,6,10),
    (1089,7, 10),
    (0000,8, 20)
    
;
-- Put in the food that each order... orders
INSERT INTO menu_orders (order_id ,food_id, quantity) VALUES
	-- Order 1
    (1, 1, 2),
    (1, 3, 1),
    (1, 4, 1),
    (1, 7, 2),
    (1, 11, 2),
    
	-- Order 2
    (2, 1, 1),
    (2, 8, 3),
    (2, 10, 1),
    
    -- Order 3
    (3,2,3),
    
    -- Order 4
    (4, 1, 4),
    (4, 13, 1),
    (4, 4, 1),
    (4, 7, 4),
   
    -- Order 5
    (5, 1, 4),
    (5, 2, 2),
    (5, 5, 2),
    (5, 12, 1),
    (5, 7, 2),
    (5, 8, 1),
    (5, 9, 2),
    
    -- Order 6
    (6, 1, 5),
    (6, 6, 1),
    (6, 2, 1),
    (6, 3, 1 ),
    (6, 4, 2),
     
    -- Order 7
    (7, 1, 1),
    (7, 13, 1),
	(7, 10, 2),
    
    -- Order 8
    (8, 2, 1),
    
    -- Order 9
    (9, 1, 5),
    (9, 10, 6),
    (9, 5, 1),
    (9, 6, 1),
    
    -- Order 10
    (10, 1, 2),
    (10, 5, 1),
    (10, 2, 1),
    (10, 3, 1),
    
    -- Order 11
    (11, 10, 2),
    (11, 9, 2),
    (11, 8, 2),
    
    -- Order 12
    (12, 1, 1),
    (12, 5, 1),
    (12, 10, 2),
    (12, 7, 2),
    (12, 2, 1),
    
    -- Order 13
    (13, 2, 3),
    
    -- Order 14
    (14, 6, 1),
    (14, 4, 1),

    -- Order 15
    (15, 1, 3),
    (15, 13, 3),
    (15, 5, 2),
    (15, 11, 4),
	
    -- Order 16
    (16, 11, 2)
;