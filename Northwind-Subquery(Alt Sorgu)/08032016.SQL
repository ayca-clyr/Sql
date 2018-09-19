----- Basit Subquery Örnekleri ----
-- "Nancy" isimli çalýþanýmýn yaptýðý satýþlarý gösteriniz.

SELECT * FROM Orders
	WHERE EmployeeID = (SELECT EmployeeID FROM Employees  WHERE FirstName = 'Nancy')

-- "Federal Shipping" isimli firmanýn taþýdýðý sipariþ sayýsýný gösteriniz.

SELECT * FROM Orders 
	WHERE ShipVia = (SELECT shipperID FROM Shippers WHERE CompanyName = 'Federal Shipping')

-- Tedarikçisi "Karkki Oy" olan ve stokta 10 adetten fazla olan ürünlerin listesini görüntüleyiniz.

SELECT * FROM Products WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Karkki Oy') AND UnitsInStock > 10

-- Fax numarasý olmayan tedarikçilerden aldýðým ürünleri görüntüleyiniz.

SELECT ProductName,ProductID FROM Products WHERE SupplierID IN  ( SELECT SupplierID FROM Suppliers WHERE Fax IS NULL )

-- "a" harfi ile baþlayan müþterilerin sipariþlerini listeleyiniz.

SELECT * FROM Orders WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CompanyName LIKE  'a%')

----- UYGULAMA -------------------
-- Her çalýþanýmýn amirini görüntüleyiniz.

 SELECT 
	Calisan.FirstName + ' ' + Calisan.LastName AS Çalýþan, 
	Amirler.FirstName + ' ' + Amirler.LastName AS Amir FROM Employees Calisan
	JOIN Employees Amirler ON Calisan.ReportsTo = Amirler.EmployeeID

SELECT FirstName+ ' '+ LastName FROM Employees calisan WHERE ReportsTo IN (SELECT EmployeeID FROM Employees amir )

SELECT E.FirstName+ ' ' +E.LastName Calisan,E2.FirstName+ ' '+e2.LastName Amirler FROM  (SELECT * FROM Employees ) e, Employees e2 WHERE E.ReportsTo= E2.EmployeeID					

-- 2 -- Her bir kategoriden kaç ürün satýlmýþ

SELECT CategoryID,COUNT(*) FROM Products 
	GROUP BY CategoryID

SELECT p.CategoryID,COUNT(*) FROM Products P
	JOIN Categories C ON P.CategoryID = C.CategoryID
	GROUP BY p.CategoryID

-- Her bir kategoriden kazandýðým paranýn KDV'sini hesaplayýnýz.

SELECT CategoryName,SUM(OD.UnitPrice * od.Quantity * (1-od.Discount)) * 0.18 FROM Categories c
	JOIN Products P ON C.CategoryID = P.CategoryID
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID
	GROUP BY CategoryName

-- Ayný soyada sahip çalýþanlar ve müþteri yetkililerini tek bir tabloda gösteriniz. (Zaten yapýlan soru ama subquery ile yapýlabilir mi?)

SELECT DISTINCT e.FirstName, e.LastName, c.ContactName FROM Customers C
	CROSS JOIN Orders O 
	CROSS JOIN Employees E 
	WHERE E.LastName = RIGHT(ContactName,(LEN(ContactName)-CHARINDEX(' ',ContactName)))

-- Her bir üründen kazandýðým paranýn toplam kazandýðým paraya oranýný gösteren sorguyu yazýnýz.

SELECT ProductName,SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName
	ORDER BY oran DESC
	