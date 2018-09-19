--------------------�DEV----------------------------------
SELECT * FROM Orders WHERE EmployeeID = 3 AND CustomerID LIKE '[h-t]%' --�al��an Id = 3 olan ve m��teri Id lerinin h-t aras�ndaki de�erleri listeleyiniz. 

SELECT Title, BirthDate, REVERSE(BirthDate) FROM Employees  WHERE Title LIKE '%Represent%'  -- ��inde Represent ge�en �al��anlara ait i�erik ve tarihleri(tarihleri tersten yazarak) listeleyiniz.

SELECT * FROM Orders WHERE LEFT(CustomerID,2) = 'WH'  OR RIGHT(CustomerID,1) = 'K'-- �lk 2 harfi WH ile ba�layan ve Son harfi K ile biten m��terileri listeleyiniz. 

SELECT QuantityPerUnit,ProductName,UnitPrice FROM Products WHERE Discontinued = 'True' AND UnitPrice > 10 --Discontined True olan Paras� 10 $ dan fazla olan �r�nlerin miktar�n�, ad�n� ve fiyat�n� listeleyiniz.

SELECT * FROM Employees WHERE LEN( FirstName+'.'+LastName+'@gmail.com') > 24 -- ad.soyad@gmail.com maili olu�turup bunun uzunlu�unun 24'ten b�y�k olanlar� listeleyiniz.

-------------------------------------


SELECT * FROM Kisiler

SELECT * FROM Employees

SELECT * FROM Region

INSERT INTO Kisiler(Ad,Soyad,Telefon) VALUES ('Ay�a','Calay�r','5559845') -- Kisiler tablosuna ad�:'ay�a' soyad� : 'calay�r' telefonu : '5559845' olarak ekle.

INSERT INTO Employees (FirstName, LastName) VALUES ('Ay�a','Calay�r')      --�al��an tabl�suna ad� : 'ay�a' soyad� : 'calay�r' olarak veri ekle.

INSERT INTO Region (RegionDescription, RegionID) VALUES('Sorth West','9')    --B�lge tablosuna b�lgesi : 'sorth west' Id: '9' olarak ekle.

INSERT INTO Kisiler(Ad,Telefon) VALUES(Null,'62134234')                      -- Kisiler tablosuna Ad= Bo� telefonu : '62134234' olarak ekle

INSERT INTO Kisiler(Ad,Soyad) VALUES (LEFT('SezerCan',5), RIGHT('SezerCan',3))  --Kisiler tablsouna 'SezerCan' isminin ilk 5 harfini isim on 3 harfini soyad� olacak �ekilde ad, soyad ekleyin.
 
----------------------------------------------


SELECT * FROM Kisiler 

DELETE  FROM Kisiler WHERE LEN(Ad) = 5 -- Ad� 5 karakter uzunlukta olanlar� silin.

DELETE FROM Kisiler WHERE Telefon LIKE '6%' --Telefonu 6 ile ba�layanlar� silin.

DELETE FROM Kisiler WHERE Id = 8 --Kisiler tablosundan Id'si = 8 olanlar� silin. 

DELETE FROM Kisiler WHERE Soyad != 'Can' --Kisiler tablosundan soyad� 'Can' olmayanlar� silin.

DELETE FROM Kisiler WHERE Id BETWEEN 3 AND 8 --Kisiler tablosundan Id = 3-8 aras�ndaki de�erleri silin.


------------------------------------------------------

SELECT * FROM Categories

SELECT * FROM Orders

SELECT * FROM Employees

SELECT * FROM Products

SELECT * FROM Customers

UPDATE Categories SET Description = 'tatl�' WHERE CategoryName LIKE 'C%S' -- Kategori ad� C ile ba�lay�p S ile bitenlerin a��klama k�sm�n� 'tatl�' olarak g�ncelleyiniz.

UPDATE Orders SET ShipAddress = ShipCountry --Sipari�lerin adreslerini �lke ismi olarak g�ncelleyin.

UPDATE Employees SET  FirstName = REVERSE(FirstName) WHERE FirstName LIKE '%a%'  -- A harfi i�eren �al��anlar�n adlar�n� ters yaz�m olarak g�ncelleyiniz. 

UPDATE Products SET ProductName = '' WHERE ProductName LIKE '%Q%' --Ad�nda Q harfi i�eren �r�nlerin ad�n� bo� b�rak�n.

UPDATE Customers SET  Phone = RIGHT(Phone,4) +'-'+LEFT(Fax,4)  --M��terilerin Telefon k�sm�n� telefonun son 4 ve fax'�n ilk 4 hanesi olarak g�ncelleyiniz. 

----------------------------------------------------------

SELECT  Address, Len(Address) FROM Customers -- M��terilerin adreslerinin uzunlar�n� listeleyiniz.

SELECT UPPER(REVERSE('Her�eye Ra�men Ya�amaya De�er!'))  --'Her�eye Ra�men Ya�amaya De�er!' c�mlesini tersten b�y�k harflerle yaz�n�z.

SELECT City, SUBSTRING(City,3,3) FROM Customers -- M��terilerin �ehirlerinin 3.harfinden ba�lay�p 3 harflik k�saltmalar �eklinde listeleyiniz.

SELECT SUBSTRING(QuantityPerUnit,4,LEN(QuantityPerUnit)-3) FROM Products --Birim miktardan ilk 3 uzunlu�u ��kart ve 4.kelimeden ba�layarak tamamla.

SELECT * FROM Orders WHERE SUBSTRING(CustomerID,1,2) = 'Is'  --�lk m��teri �dlerinin 2 harfi 'IS' olan �r�nleri listeleyiniz. 


---------------------------------


SELECT CHARINDEX('m', 'BilgeAdam.com') --'BilgeAdam.com' daki m harfinin konumunu belirtiniz.

SELECT CHARINDEX('ay', 'Ay�a Calay�r') -- 'Ay�a Calay�r' kelimesindeki 'ay' konumunu belirtiniz.

SELECT CHARINDEX('ay', 'Ay�a Calay�r',2) --'Ay�a Calay�r' kelimesindeki 'ay' nin 2. konumu ge�tikten sonraki konumunu listeleyiniz.

SELECT FirstName, CHARINDEX('A',FirstName) FROM Employees -- �al��anlar�n isimlerinden A harfinin ka��nc� konumda oldu�unu belirtiniz.

SELECT FirstName ,CHARINDEX('A',FirstName,5) FROM Employees --�al��anlar�n isimlerinden 5.konumu ge�tikten sonraki A harfinin konumunu listeleyiniz.
