----- Basit Subquery �rnekleri ----
-- "Nancy" isimli �al��an�m�n yapt��� sat��lar� g�steriniz.

SELECT * FROM Orders
	WHERE EmployeeID = (SELECT EmployeeID FROM Employees  WHERE FirstName = 'Nancy')

-- "Federal Shipping" isimli firman�n ta��d��� sipari� say�s�n� g�steriniz.

SELECT * FROM Orders 
	WHERE ShipVia = (SELECT shipperID FROM Shippers WHERE CompanyName = 'Federal Shipping')

-- Tedarik�isi "Karkki Oy" olan ve stokta 10 adetten fazla olan �r�nlerin listesini g�r�nt�leyiniz.

SELECT * FROM Products WHERE SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Karkki Oy') AND UnitsInStock > 10

-- Fax numaras� olmayan tedarik�ilerden ald���m �r�nleri g�r�nt�leyiniz.

SELECT ProductName,ProductID FROM Products WHERE SupplierID IN  ( SELECT SupplierID FROM Suppliers WHERE Fax IS NULL )

-- "a" harfi ile ba�layan m��terilerin sipari�lerini listeleyiniz.

SELECT * FROM Orders WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CompanyName LIKE  'a%')

----- UYGULAMA -------------------
-- Her �al��an�m�n amirini g�r�nt�leyiniz.

 SELECT 
	Calisan.FirstName + ' ' + Calisan.LastName AS �al��an, 
	Amirler.FirstName + ' ' + Amirler.LastName AS Amir FROM Employees Calisan
	JOIN Employees Amirler ON Calisan.ReportsTo = Amirler.EmployeeID

SELECT FirstName+ ' '+ LastName FROM Employees calisan WHERE ReportsTo IN (SELECT EmployeeID FROM Employees amir )

SELECT E.FirstName+ ' ' +E.LastName Calisan,E2.FirstName+ ' '+e2.LastName Amirler FROM  (SELECT * FROM Employees ) e, Employees e2 WHERE E.ReportsTo= E2.EmployeeID					

-- 2 -- Her bir kategoriden ka� �r�n sat�lm��

SELECT CategoryID,COUNT(*) FROM Products 
	GROUP BY CategoryID

SELECT p.CategoryID,COUNT(*) FROM Products P
	JOIN Categories C ON P.CategoryID = C.CategoryID
	GROUP BY p.CategoryID

-- Her bir kategoriden kazand���m paran�n KDV'sini hesaplay�n�z.

SELECT CategoryName,SUM(OD.UnitPrice * od.Quantity * (1-od.Discount)) * 0.18 FROM Categories c
	JOIN Products P ON C.CategoryID = P.CategoryID
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID
	GROUP BY CategoryName

-- Ayn� soyada sahip �al��anlar ve m��teri yetkililerini tek bir tabloda g�steriniz. (Zaten yap�lan soru ama subquery ile yap�labilir mi?)

SELECT DISTINCT e.FirstName, e.LastName, c.ContactName FROM Customers C
	CROSS JOIN Orders O 
	CROSS JOIN Employees E 
	WHERE E.LastName = RIGHT(ContactName,(LEN(ContactName)-CHARINDEX(' ',ContactName)))

-- Her bir �r�nden kazand���m paran�n toplam kazand���m paraya oran�n� g�steren sorguyu yaz�n�z.

SELECT ProductName,SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName
	ORDER BY oran DESC
	