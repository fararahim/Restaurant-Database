use restaurantPOS;

-- Gets the food ordered from a specific order
SELECT m.food_name, mo.quantity, ROUND(m.food_cost * mo.quantity, 2) as 'Total'
FROM menu_orders mo
JOIN orders o ON mo.order_id = o.order_id
JOIN menu m ON mo.food_id = m.food_id
WHERE o.order_id = 2;


-- Gets information about the food that is from a current table selected
SELECT 
    t.top_id as 'Table Number',
    m.food_name AS 'Dish Name',
    mo.quantity as 'Quantity',
    Round(mo.quantity * m.food_cost, 2) AS 'Subtotal'
FROM top t
JOIN orders o ON t.order_id = o.order_id
JOIN menu_orders mo ON o.order_id = mo.order_id
JOIN menu m ON mo.food_id = m.food_id
WHERE t.isCurrent = TRUE and t.top_id = 1;

-- counts the number of occupied tables
SELECT COUNT(t.top_id) as "Occupied Tables"
FROM top t
WHERE t.isCurrent;

-- counts the number of available tables
SELECT 7 - COUNT(t.top_id) as "Available Tables"
FROM top t
WHERE t.isCurrent;

-- Get the total for a specific order
SELECT ROUND(SUM(((m.food_cost * mo.quantity)) * o.tax) + o.tip , 2) as 'Order Total'
FROM menu_orders mo
JOIN orders o ON mo.order_id = o.order_id
JOIN menu m ON mo.food_id = m.food_id
WHERE o.order_id = 15;

-- Get the total of ALL orders NOT INCLUDING TIPS
SELECT ROUND(SUM(((m.food_cost * mo.quantity)) * o.tax) , 2)  as "Total Revenue"
FROM menu_orders mo
JOIN orders o ON mo.order_id = o.order_id
JOIN menu m ON mo.food_id = m.food_id;

-- Get the total of ALL orders INCLUDING TIPS
SELECT ROUND(SUM((((m.food_cost * mo.quantity)) * o.tax) + o.tip) , 2)  as "Total Revenue (with tips)"
FROM menu_orders mo
JOIN orders o ON mo.order_id = o.order_id
JOIN menu m ON mo.food_id = m.food_id;
