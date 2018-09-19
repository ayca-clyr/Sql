--------------------ÖDEV----------------------------------
SELECT * FROM Orders WHERE EmployeeID = 3 AND CustomerID LIKE '[h-t]%' --Çalýþan Id = 3 olan ve müþteri Id lerinin h-t arasýndaki deðerleri listeleyiniz. 

SELECT Title, BirthDate, REVERSE(BirthDate) FROM Employees  WHERE Title LIKE '%Represent%'  -- Ýçinde Represent geçen çalýþanlara ait içerik ve tarihleri(tarihleri tersten yazarak) listeleyiniz.

SELECT * FROM Orders WHERE LEFT(CustomerID,2) = 'WH'  OR RIGHT(CustomerID,1) = 'K'-- Ýlk 2 harfi WH ile baþlayan ve Son harfi K ile biten müþterileri listeleyiniz. 

SELECT QuantityPerUnit,ProductName,UnitPrice FROM Products WHERE Discontinued = 'True' AND UnitPrice > 10 --Discontined True olan Parasý 10 $ dan fazla olan ürünlerin miktarýný, adýný ve fiyatýný listeleyiniz.

SELECT * FROM Employees WHERE LEN( FirstName+'.'+LastName+'@gmail.com') > 24 -- ad.soyad@gmail.com maili oluþturup bunun uzunluðunun 24'ten büyük olanlarý listeleyiniz.

-------------------------------------


SELECT * FROM Kisiler

SELECT * FROM Employees

SELECT * FROM Region

INSERT INTO Kisiler(Ad,Soyad,Telefon) VALUES ('Ayça','Calayýr','5559845') -- Kisiler tablosuna adý:'ayça' soyadý : 'calayýr' telefonu : '5559845' olarak ekle.

INSERT INTO Employees (FirstName, LastName) VALUES ('Ayça','Calayýr')      --Çalýþan tablýsuna adý : 'ayça' soyadý : 'calayýr' olarak veri ekle.

INSERT INTO Region (RegionDescription, RegionID) VALUES('Sorth West','9')    --Bölge tablosuna bölgesi : 'sorth west' Id: '9' olarak ekle.

INSERT INTO Kisiler(Ad,Telefon) VALUES(Null,'62134234')                      -- Kisiler tablosuna Ad= Boþ telefonu : '62134234' olarak ekle

INSERT INTO Kisiler(Ad,Soyad) VALUES (LEFT('SezerCan',5), RIGHT('SezerCan',3))  --Kisiler tablsouna 'SezerCan' isminin ilk 5 harfini isim on 3 harfini soyadý olacak þekilde ad, soyad ekleyin.
 
----------------------------------------------


SELECT * FROM Kisiler 

DELETE  FROM Kisiler WHERE LEN(Ad) = 5 -- Adý 5 karakter uzunlukta olanlarý silin.

DELETE FROM Kisiler WHERE Telefon LIKE '6%' --Telefonu 6 ile baþlayanlarý silin.

DELETE FROM Kisiler WHERE Id = 8 --Kisiler tablosundan Id'si = 8 olanlarý silin. 

DELETE FROM Kisiler WHERE Soyad != 'Can' --Kisiler tablosundan soyadý 'Can' olmayanlarý silin.

DELETE FROM Kisiler WHERE Id BETWEEN 3 AND 8 --Kisiler tablosundan Id = 3-8 arasýndaki deðerleri silin.


------------------------------------------------------

SELECT * FROM Categories

SELECT * FROM Orders

SELECT * FROM Employees

SELECT * FROM Products

SELECT * FROM Customers

UPDATE Categories SET Description = 'tatlý' WHERE CategoryName LIKE 'C%S' -- Kategori adý C ile baþlayýp S ile bitenlerin açýklama kýsmýný 'tatlý' olarak güncelleyiniz.

UPDATE Orders SET ShipAddress = ShipCountry --Sipariþlerin adreslerini ülke ismi olarak güncelleyin.

UPDATE Employees SET  FirstName = REVERSE(FirstName) WHERE FirstName LIKE '%a%'  -- A harfi içeren çalýþanlarýn adlarýný ters yazým olarak güncelleyiniz. 

UPDATE Products SET ProductName = '' WHERE ProductName LIKE '%Q%' --Adýnda Q harfi içeren ürünlerin adýný boþ býrakýn.

UPDATE Customers SET  Phone = RIGHT(Phone,4) +'-'+LEFT(Fax,4)  --Müþterilerin Telefon kýsmýný telefonun son 4 ve fax'ýn ilk 4 hanesi olarak güncelleyiniz. 

----------------------------------------------------------

SELECT  Address, Len(Address) FROM Customers -- Müþterilerin adreslerinin uzunlarýný listeleyiniz.

SELECT UPPER(REVERSE('Herþeye Raðmen Yaþamaya Deðer!'))  --'Herþeye Raðmen Yaþamaya Deðer!' cümlesini tersten büyük harflerle yazýnýz.

SELECT City, SUBSTRING(City,3,3) FROM Customers -- Müþterilerin þehirlerinin 3.harfinden baþlayýp 3 harflik kýsaltmalar þeklinde listeleyiniz.

SELECT SUBSTRING(QuantityPerUnit,4,LEN(QuantityPerUnit)-3) FROM Products --Birim miktardan ilk 3 uzunluðu çýkart ve 4.kelimeden baþlayarak tamamla.

SELECT * FROM Orders WHERE SUBSTRING(CustomerID,1,2) = 'Is'  --Ýlk müþteri ýdlerinin 2 harfi 'IS' olan ürünleri listeleyiniz. 


---------------------------------


SELECT CHARINDEX('m', 'BilgeAdam.com') --'BilgeAdam.com' daki m harfinin konumunu belirtiniz.

SELECT CHARINDEX('ay', 'Ayça Calayýr') -- 'Ayça Calayýr' kelimesindeki 'ay' konumunu belirtiniz.

SELECT CHARINDEX('ay', 'Ayça Calayýr',2) --'Ayça Calayýr' kelimesindeki 'ay' nin 2. konumu geçtikten sonraki konumunu listeleyiniz.

SELECT FirstName, CHARINDEX('A',FirstName) FROM Employees -- Çalýþanlarýn isimlerinden A harfinin kaçýncý konumda olduðunu belirtiniz.

SELECT FirstName ,CHARINDEX('A',FirstName,5) FROM Employees --Çalýþanlarýn isimlerinden 5.konumu geçtikten sonraki A harfinin konumunu listeleyiniz.
