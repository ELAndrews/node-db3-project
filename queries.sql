-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM Product as p
JOIN Category as c
    on p.CategoryId = c.id
ORDER BY c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id as Order_ID, s.CompanyName as Shipper_Company_Name
FROM "Order" as o
JOIN "Shipper" as s
    on s.Id = o.ShipVia
WHERE o.OrderDate < "2012-8-9"
ORDER BY s.Id

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, od.Quantity
FROM OrderDetail as od
JOIN Product as p
    on p.Id = od.ProductId
WHERE od.OrderId = "10251"

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as Order_ID, c.CompanyName, e.LastName as Employee_LastName
FROM "Order" as o
JOIN Customer as c
    on o.CustomerId = c.Id
JOIN Employee as e
    on o.EmployeeId = e.Id



---------------------- STRETCH ------------------- (Set within lecture)

---Find the number of shipments by each shipper---

SELECT s.CompanyName, COUNT(o.id) as shipments
FROM "Order" as o
JOIN "Shipper" as s
    on o.ShipVia = s.id
GROUP BY s.CompanyName

---Find the top 5 best and 5 least performing employees measured in number of orders---

------ 5 Best

SELECT e.FirstName, e.LastName, COUNT(o.id) as Number_of_Orders
FROM "Order" as o
JOIN "Employee" as e
    on o.EmployeeId = e.Id
GROUP BY e.LastName
ORDER BY Number_of_Orders desc
LIMIT 5;

------ 5 Worst

SELECT e.FirstName, e.LastName, COUNT(o.id) as Number_of_Orders
FROM "Order" as o
JOIN "Employee" as e
    on o.EmployeeId = e.Id
GROUP BY e.LastName
ORDER BY Number_of_Orders asc
LIMIT 5;

---Find the top 5 best performing employees measured in revenue---

SELECT e.FirstName as Employee, SUM((od.UnitPrice*od.Quantity)-od.Discount) as Revenue
FROM "OrderDetail" as od
JOIN "Order" as o
    on o.id = od.OrderId
JOIN "Employee" as e
    on e.id = o.EmployeeId
GROUP BY Employee
ORDER BY Revenue desc
LIMIT 5

---Find the category that brings in the most and least revenue---



---Find the customer country with the most orders---


---Find the shipper that moves the most cheese measured in units---