------------------------------------------ÖDEV--------------------------------------------------
-- gecikme tarihleri 2  ile 5 arasýnda olan sipariþleri görüntüleyiniz.

SELECT  OrderId, DATEDIFF(HOUR,RequiredDate,ShippedDate) 'Gecikme' FROM Orders WHERE DATEDIFF(DAY,RequiredDate,ShippedDate) BETWEEN 2 AND 3
 
-- Adýnýn içerisinde en çok A harfi olan ürünüm hangisi?

SELECT TOP 1 ProductName FROM Products WHERE CHARINDEX('A',ProductName,1) < LEN(ProductName)--Sonuca ulaþamadým.

-- Paris için alýnan son sipariþ ve sipariþ tarihi ile teslim tarihi arasýndaki gün farkýyla beraber hesaplayan sorgu
 
 SELECT DATEDIFF(DAY,RequiredDate,OrderDate), DATEDIFF(DAY,RequiredDate,ShippedDate) FROM Orders WHERE ShipCity= 'Paris' 

 SELECT TOP 1 DATEDIFF(DAY,OrderDate,ShippedDate) FROM Orders WHERE ShipCity = 'Paris' ORDER BY OrderDate DESC

-- Kargo ücretleri en pahalý olan 10 sipariþ hangi ülkelere gönderilmiþtir?
 
 SELECT TOP 10 ShipCountry  FROM Orders ORDER BY Freight DESC

-- þirket olarak küçülme kararý aldým. ürünlerimin %30 unun üretimini durdurmak istiyorum. Tekrar sipariþ edilme seviyesi (ReorderLevel) en düþük ilk %30luk kýsmý listeleyin.

SELECT TOP 30 PERCENT * FROM Products WHERE Discontinued = 'True' ORDER BY ReorderLevel

-- Depomdaki her ürünü satsam, ürün bazýndan kaç para kazanýrým.
 
 SELECT UnitsInStock, (UnitsInStock * UnitPrice) [kazanç] FROM Products 

-- Tedarikçi þirketlerimde çalýþan her yetkili için bir Kullanýcýadý ve Password oluþturmak istiyorum. Kullanýcý adý ve þifre aþaðýdaki gibi oluþacak :
       -- Kullanýcý adý: küçük harflerle isim ve soyisim arasýnda nokta(.) ile birleþetek olacak.
       -- Þifre : Þirket adýnýn ilk 3 harfi ile telefon bilgisinin son 3 karakterini birleþtirerek oluþacak
/* ÖRNEK ÇIKTI
ContactName                       UserNAme                           Password
----------------------------------------------------------------------------------
Charlotte Cooper                  charlotte.cooper                  Exo222
Shelley Burke                     shelley.burke                     New822
Regina Murphy                     regina.murphy                     Gra735
Yoshi Nagase                      yoshi.nagase                      Tok011
Antonio del Valle Saavedra        antonio.del.valle.saavedra        Coo 54
Mayumi Ohno                       mayumi.ohno                       May877
Ian Devling                       ian.devling                       Pav343
Peter Wilson                      peter.wilson                      Spe448
*/
 
 SELECT 'Kullanýcý Adý : ' + LOWER(REPLACE(ContactName,' ','.')) + '   Þifresi : '+ LEFT(CompanyName,3)+''+RIGHT(Phone,3) FROM Suppliers
-- Þimdiye kadarki satýþlarýmda indirim miktarý en çok olan ürünümün Idsi nedir?

SELECT TOP 1 ProductID  FROM [Order Details] ORDER BY Quantity DESC

-- Ýndirim oraný 0,2den yüksek olan ürün satýþlarýmdan en çok kazandýðým 5 tanesini?
 
 SELECT TOP 5 * FROM [Order Details] WHERE  Discount > 0.2 ORDER BY UnitPrice DESC

-- Posta kodu içerisinde harf olan müþterilerim hangi ülkelerde?

SELECT Country FROM Customers WHERE PostalCode LIKE '%[A-Z]%' 
 
-- Þirket bütçesinde problem çýktý. Bu sebeple kargo ücreti 200den büyük olan ve Kargocunun Id'si 2 haricindeki bütün sipariþlerin teslim tarihini 5 gün öteleyen UPDATE kodunu yazýnýz.

UPDATE Orders SET ShippedDate = DATEADD(DAY,5,ShippedDate) FROM Orders WHERE Freight > 200 AND ShipVia !=2 
--(Haricindeki kelimesi 200'den büyükleri kapsamýyorsa)
UPDATE Orders SET ShippedDate = DATEADD(DAY,5,ShippedDate) FROM Orders WHERE Freight < 200 AND ShipVia !=2 
--(Haricindeki kelimesi 200'den büyükleri kapsýyorsa)