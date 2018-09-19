--------------------- SQL UYGULAMA ----------------------------
-- 1 -- Her bir çalýþaným her ürünü kaçar tane satmýþ

SELECT e.FirstName,od.Quantity FROM Employees e
	LEFT JOIN Orders O ON e.EmployeeID = o.EmployeeID
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	RIGHT JOIN Products P ON OD.ProductID = P.ProductID GROUP BY e.FirstName,od.Quantity

-- 2 -- ayný soyada sahip çalýþanlar ve müþteri yetkililerini tek bir tablo sonucu olarak listeleyiniz.

-- 3 -- hangi sipariþi, hangi çalýþan, hangi tarihte, hangi müþteriye satmýþ, sipariþ hangi kargo þirketi ile gönderilmiþ, sipariþ içerisinde geçen ürünlerin isimleri ve bu ürünlerin kategori isimleri nedir?

SELECT * FROM Orders O
	JOIN Employees E ON O.EmployeeID = E.EmployeeID
	JOIN [Order Details] OD ON OD.OrderID = O.OrderID
	JOIN Customers C ON 
	


-- 4 -- en geç teslim edilen sipariþi hangi müþteri almýþ ve hangi çalýþan satmýþ

SELECT TOP 1 O.CustomerID,E.FirstName,C.ContactName FROM Employees E 
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	JOIN Customers C ON C.CustomerID = O.CustomerID
	ORDER BY ShippedDate DESC 

-- 5 -- kendi ülkesine sipariþ gönderen çalýþanlar

SELECT DISTINCT e.FirstName FROM Orders O
	JOIN Employees E ON O.EmployeeID= E.EmployeeID
	WHERE e.Country = O.ShipCountry

-- 6 -- 1997 yýlýnýn hangi aylarýnda sipariþ alýnmýþ? (ingilizce ay isimleri)

SELECT OrderID,CustomerID,LEFT(REPLACE(OrderDate,'01','January'),3) FROM Orders
 WHERE YEAR(OrderDate) = 1997

-- 7 -- ismi 4 harften fazla olan ve 5.harfi C olan ürünlerden kaç tane vardýr?

SELECT UnitsInStock,COUNT(*) FROM Products WHERE ProductName LIKE '____C%' GROUP BY UnitsInStock

-- 8 -- London ve Seattle' lý olan çalýþanlarýn yaþlarý toplamý kaçtýr?

SELECT SUM(DATEDIFF(YEAR,BirthDate,GETDATE())) FROM Employees WHERE City IN ('London','Seattle')

-- 9 -- stoðu en fazla olan ürünün kategorisinin 4üncü harfi nedir?

SELECT TOP 1 SUBSTRING(C.CategoryName,4,1)  FROM Products p
	JOIN Categories c ON P.CategoryID=C.CategoryID
	ORDER BY p.UnitsInStock DESC

-- 10 -- En çok para kazandýðým ilk 5 müþteriye Özel Üyelik vermek istiyorum. Bu müþterilerim kimlerdir? (Bu soruyu derste geliþtireceðim :) )

--NOT : HOCAM DÝAGRAM SIKINTISI OLDUÐU ÝÇÝN ÖNCEKÝ ÖRNEKLERE BAKARAK YAPABÝLDÝÐÝMÝ YAPTIM DÝÐERLERÝNÝ YAPAMADIM TABLO BAÐLANTILARINI GÖREMEDÝÐÝMDEN DOLAYI.. 