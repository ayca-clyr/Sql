------------------------------------------�DEV--------------------------------------------------
-- gecikme tarihleri 2  ile 5 aras�nda olan sipari�leri g�r�nt�leyiniz.

SELECT  OrderId, DATEDIFF(HOUR,RequiredDate,ShippedDate) 'Gecikme' FROM Orders WHERE DATEDIFF(DAY,RequiredDate,ShippedDate) BETWEEN 2 AND 3
 
-- Ad�n�n i�erisinde en �ok A harfi olan �r�n�m hangisi?

SELECT TOP 1 ProductName FROM Products WHERE CHARINDEX('A',ProductName,1) < LEN(ProductName)--Sonuca ula�amad�m.

-- Paris i�in al�nan son sipari� ve sipari� tarihi ile teslim tarihi aras�ndaki g�n fark�yla beraber hesaplayan sorgu
 
 SELECT DATEDIFF(DAY,RequiredDate,OrderDate), DATEDIFF(DAY,RequiredDate,ShippedDate) FROM Orders WHERE ShipCity= 'Paris' 

 SELECT TOP 1 DATEDIFF(DAY,OrderDate,ShippedDate) FROM Orders WHERE ShipCity = 'Paris' ORDER BY OrderDate DESC

-- Kargo �cretleri en pahal� olan 10 sipari� hangi �lkelere g�nderilmi�tir?
 
 SELECT TOP 10 ShipCountry  FROM Orders ORDER BY Freight DESC

-- �irket olarak k���lme karar� ald�m. �r�nlerimin %30 unun �retimini durdurmak istiyorum. Tekrar sipari� edilme seviyesi (ReorderLevel) en d���k ilk %30luk k�sm� listeleyin.

SELECT TOP 30 PERCENT * FROM Products WHERE Discontinued = 'True' ORDER BY ReorderLevel

-- Depomdaki her �r�n� satsam, �r�n baz�ndan ka� para kazan�r�m.
 
 SELECT UnitsInStock, (UnitsInStock * UnitPrice) [kazan�] FROM Products 

-- Tedarik�i �irketlerimde �al��an her yetkili i�in bir Kullan�c�ad� ve Password olu�turmak istiyorum. Kullan�c� ad� ve �ifre a�a��daki gibi olu�acak :
       -- Kullan�c� ad�: k���k harflerle isim ve soyisim aras�nda nokta(.) ile birle�etek olacak.
       -- �ifre : �irket ad�n�n ilk 3 harfi ile telefon bilgisinin son 3 karakterini birle�tirerek olu�acak
/* �RNEK �IKTI
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
 
 SELECT 'Kullan�c� Ad� : ' + LOWER(REPLACE(ContactName,' ','.')) + '   �ifresi : '+ LEFT(CompanyName,3)+''+RIGHT(Phone,3) FROM Suppliers
-- �imdiye kadarki sat��lar�mda indirim miktar� en �ok olan �r�n�m�n Idsi nedir?

SELECT TOP 1 ProductID  FROM [Order Details] ORDER BY Quantity DESC

-- �ndirim oran� 0,2den y�ksek olan �r�n sat��lar�mdan en �ok kazand���m 5 tanesini?
 
 SELECT TOP 5 * FROM [Order Details] WHERE  Discount > 0.2 ORDER BY UnitPrice DESC

-- Posta kodu i�erisinde harf olan m��terilerim hangi �lkelerde?

SELECT Country FROM Customers WHERE PostalCode LIKE '%[A-Z]%' 
 
-- �irket b�t�esinde problem ��kt�. Bu sebeple kargo �creti 200den b�y�k olan ve Kargocunun Id'si 2 haricindeki b�t�n sipari�lerin teslim tarihini 5 g�n �teleyen UPDATE kodunu yaz�n�z.

UPDATE Orders SET ShippedDate = DATEADD(DAY,5,ShippedDate) FROM Orders WHERE Freight > 200 AND ShipVia !=2 
--(Haricindeki kelimesi 200'den b�y�kleri kapsam�yorsa)
UPDATE Orders SET ShippedDate = DATEADD(DAY,5,ShippedDate) FROM Orders WHERE Freight < 200 AND ShipVia !=2 
--(Haricindeki kelimesi 200'den b�y�kleri kaps�yorsa)