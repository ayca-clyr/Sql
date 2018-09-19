--------------------- SQL UYGULAMA ----------------------------
-- 1 -- Her bir �al��an�m her �r�n� ka�ar tane satm��

SELECT e.FirstName,od.Quantity FROM Employees e
	LEFT JOIN Orders O ON e.EmployeeID = o.EmployeeID
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	RIGHT JOIN Products P ON OD.ProductID = P.ProductID GROUP BY e.FirstName,od.Quantity

-- 2 -- ayn� soyada sahip �al��anlar ve m��teri yetkililerini tek bir tablo sonucu olarak listeleyiniz.

-- 3 -- hangi sipari�i, hangi �al��an, hangi tarihte, hangi m��teriye satm��, sipari� hangi kargo �irketi ile g�nderilmi�, sipari� i�erisinde ge�en �r�nlerin isimleri ve bu �r�nlerin kategori isimleri nedir?

SELECT * FROM Orders O
	JOIN Employees E ON O.EmployeeID = E.EmployeeID
	JOIN [Order Details] OD ON OD.OrderID = O.OrderID
	JOIN Customers C ON 
	


-- 4 -- en ge� teslim edilen sipari�i hangi m��teri alm�� ve hangi �al��an satm��

SELECT TOP 1 O.CustomerID,E.FirstName,C.ContactName FROM Employees E 
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	JOIN Customers C ON C.CustomerID = O.CustomerID
	ORDER BY ShippedDate DESC 

-- 5 -- kendi �lkesine sipari� g�nderen �al��anlar

SELECT DISTINCT e.FirstName FROM Orders O
	JOIN Employees E ON O.EmployeeID= E.EmployeeID
	WHERE e.Country = O.ShipCountry

-- 6 -- 1997 y�l�n�n hangi aylar�nda sipari� al�nm��? (ingilizce ay isimleri)

SELECT OrderID,CustomerID,LEFT(REPLACE(OrderDate,'01','January'),3) FROM Orders
 WHERE YEAR(OrderDate) = 1997

-- 7 -- ismi 4 harften fazla olan ve 5.harfi C olan �r�nlerden ka� tane vard�r?

SELECT UnitsInStock,COUNT(*) FROM Products WHERE ProductName LIKE '____C%' GROUP BY UnitsInStock

-- 8 -- London ve Seattle' l� olan �al��anlar�n ya�lar� toplam� ka�t�r?

SELECT SUM(DATEDIFF(YEAR,BirthDate,GETDATE())) FROM Employees WHERE City IN ('London','Seattle')

-- 9 -- sto�u en fazla olan �r�n�n kategorisinin 4�nc� harfi nedir?

SELECT TOP 1 SUBSTRING(C.CategoryName,4,1)  FROM Products p
	JOIN Categories c ON P.CategoryID=C.CategoryID
	ORDER BY p.UnitsInStock DESC

-- 10 -- En �ok para kazand���m ilk 5 m��teriye �zel �yelik vermek istiyorum. Bu m��terilerim kimlerdir? (Bu soruyu derste geli�tirece�im :) )

--NOT : HOCAM D�AGRAM SIKINTISI OLDU�U ���N �NCEK� �RNEKLERE BAKARAK YAPAB�LD���M� YAPTIM D��ERLER�N� YAPAMADIM TABLO BA�LANTILARINI G�REMED���MDEN DOLAYI.. 