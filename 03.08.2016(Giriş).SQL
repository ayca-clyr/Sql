--Yorum Satýrý--

/*
çoklu
yorum 
satýrý
*/

--masterDB(farklý bir db kodlarý)

USE Northwind -- Denirse veritabaný deðiþtirip Northwind'e geçiþ yapýlýr. Yazýlan kodlar Northwind için çalýþýr

--DML (Data Manipulation Language) [Veri Düzenleme Dili]
/*
SELECT
INSERT
UPDATE
DELETE
*/


-- SELECT: okuma iþlemi için kullanýlýr.
-- syntax (söz dizimi) : 
/*

SELECT [column_name(s)] FROM [table_name]

*/
-- Bütün çalýþanlarýmý listeleyen T-Sql kodu:
SELECT * FROM Employees  --( * ) bütün kolonlarý görüntülemek istediðimi belirtir.

--Bütün çalýþanlarýmýn sadece adýný ve soyadýný görüntülemek istersek:

SELECT FirstName,LastName FROM Employees

SELECT 4

SELECT 'V sýnýfý akþam seansý'

SELECT 'AYDIN' + ' ' + 'ayaydýn' -- bu þekilde birleþtirme yapabiliriz.

SELECT FirstName + ' ' + LastName FROM Employees -- Kolonlar da kendi içerisinde birleþtirilebilir.

--ALIAS ( Takma Ad )

SELECT FirstName + ' ' + LastName  AS AdSoyad FROM Employees -- Takma ad verme þekli
SELECT FirstName + ' ' + LastName  AS 'AdSoyad' FROM Employees -- Takma ad verme þekli
SELECT FirstName + ' ' + LastName  AS [Ad Soyad] FROM Employees -- Takma ad verme þekli
SELECT FirstName + ' ' + LastName  AS 'Ad Soyad' FROM Employees -- Takma ad verme þekli
SELECT FirstName + ' ' + LastName  AdSoyad FROM Employees -- Takma ad verme þekli

--Ürünleri listeleyen SQL kodu:

SELECT * FROM Products

--Stok miktarý 20'nin altýnda olan ürünlerin listesi:

SELECT * FROM Products WHERE UnitsInStock < 20

SELECT * FROM Products WHERE UnitsInStock <20

--Chang ürününün bilgilerini çeken select sorgusu:

SELECT * FROM Products WHERE ProductName='Chang'

--CategoryID=2 olan verileri getiren sorgu:

SELECT * FROM Products WHERE CategoryID=2

--Stok adedi 20 ile 50 arasýnda olan ürünlerin listesi:

SELECT * FROM Products WHERE UnitsInStock<50 AND UnitsInStock>20

SELECT * FROM Products WHERE UnitsInStock BETWEEN 20 AND 50 -- BETWEEN verilen sýnýrlarý da aramaya dahil eder 

-----------------------

--INSERT: Veri eklemek
/* syntax:

	INSERT INTO[table_name] ([column_name1], [column_name2],....)
	VALUES (@value1, @value2,...)

*/

SELECT * FROM Kisiler

INSERT INTO Kisiler(Ad, Soyad, Telefon) VALUES('Gökhan', 'Fidan', '5551234') -- Kolon ismi verilerek kayýt

INSERT Kisiler VALUES('Turgay', 'Kaya', '5559876') -- Kolon ismi verilmeden yapýlan kayýt ( Ufak ayrýntý kolon sayýsý ve girilen verilerin sayýsý eþit olmazsa sorgu hata verir.

INSERT Kisiler VALUES('Yiðit', 'Taþ','55512345')

INSERT Kisiler VALUES('Yiðit', 'Taþ','55512345')

INSERT INTO Kisiler (Ad) VALUES('Aydýn') -- Kiþiler tablosuna sadece Ad kolonuna veri giriþi yapma sorgusu:

INSERT INTO Employees(FirstName,LastName) VALUES('Can', 'Ateþ') -- Employess tablosuna Ýsmi ve soy ismi Can ateþ olan veri giriþini ekleyen sorgu:

SELECT * FROM Employees

INSERT INTO Products (ProductName, UnitPrice, UnitsInStock, QuantityPerUnit) VALUES('Asprin',1.4, 250, '1 adet 20 mg x 20')

SELECT * FROM Products

-------------------------

--UPDATE : veri güncellemek için kullanýlýr.

/* syntax:
	UPDATE [table_name] SET [column_name1]= [@value1], [column_name2]=[@value2],..., 
		WHERE [column_name] [operatör] [value]

*/

--
UPDATE Employees SET Address='Bakýrköy þubesi' 
	WHERE EmployeeID=10 -- ID'si 10 olan kiþinin adresini güncelleyen sorgu:

SELECT * FROM Employees

UPDATE Employees SET LastName='Su' 
	WHERE LastName='Ateþ' -- Soyadý Ateþ olan kiþinin verisini soyadýný Su olarak deðiþtiren sorgu:

SELECT * FROM Employees

--Nancy Ýsimli çalýþaným müslüman oldu. Adýný Nesrin Davaro olarak deðiþtirdi. Bu güncellemeyi yapan sql kodunu yazýnýz:

UPDATE Employees SET FirstName='Nesrin', LastName='Davarooo' 
	WHERE EmployeeID=2 -- Ýsmi Nancy Davalio olan kiþinin adýný Nesrin soyadýný Davarooo olarak deðiþtiren sorgu:

SELECT * FROM Employees


------------------------------
--DELETE
/* syntax:
	DELETE FROM [table_name] WHERE [column_name] [operatör] [value]
*/

DELETE FROM Kisiler WHERE Ad='Gökhan'

SELECT * FROM Kisiler

DELETE  FROM Kisiler

SELECT * FROM Employees

DELETE  FROM Employees WHERE EmployeeID=10

INSERT INTO Employees ( FirstName, LastName) 
	VALUES('Mehmet', 'avcý')

--
INSERT INTO Kisiler(Ad,Soyad)
	 Values('Ali', 'veli')

/* ----- OUT OF RECORD : Delete Rules---*/ -- Araþtýr

TRUNCATE TABLE Kisiler -- Bu komut tabloyu olduðu gibi silip yeniden oluþturur.

--------------------------------------------------------
 /*

  1)Fiyatý 20 Tl Üzerinde olam ürünlerin stoklarýna 5 ekleyin
  2)CategoryId di 4 olan satýrlarýn adýný Meyve yapýn
  3)Stoðu 60'dan fazla olan ürünleri listeleyin
  4)City'si Kirklan olan çalýþanlarýn Cit'lerini Kýrklareli yapýn
  5)fiyatý 40 ile 75 arasýnda olan ürünleri listeleyin
  6)Çalýþan mail oluþtur.
  Select ile her çalýþanýn mail adresini aþagýdaki þekilde  oluþturun
  isim.soyisim@northwind.com
  7)1997 yýlýna ait sipariþleri listeleyin.
  8) "Konbu" ürününden sonra gelen ürünleri listeleyiniz.

  */

SELECT * FROM Products 

UPDATE Products SET UnitsInStock = UnitsInStock + 5    --1
	WHERE UnitPrice > 20                                    

UPDATE Products SET ProductName = 'Meyve'              --2
	WHERE CategoryID = 4

SELECT * FROM Products WHERE UnitsInStock > 60         --3

UPDATE Employees SET City = 'Kýrklareli'               --4
	WHERE City = 'London'

SELECT * FROM Products WHERE UnitPrice BETWEEN 40 AND 75  --5

SELECT FirstName+ '.'+ LastName+'@notwind.com' FROM Employees   --6

SELECT * FROM Orders WHERE OrderDate BETWEEN '01-01-1997' AND '12-31-1997'

SELECT * FROM Products WHERE ProductName>'Konbu'   --8

--Fransaya giden sipariþlerimin listesi nedir 

SELECT * FROM Orders WHERE ShipCountry = 'France'

--Fransa dýþýndaki ülkelere gönderdiðim 5 numaralý çalýþanýmýn sipariþlerin listesi

SELECT * FROM Orders WHERE EmployeeID = 5 AND ShipCountry != 'France'

-- 3, 7 ve 5 numaralý kategorilerin ürünlerini listeleyiniz.

SELECT * FROM Products WHERE CategoryID = 3 OR CategoryID = 5 OR CategoryID = 7 

SELECT * FROM Products WHERE CategoryID IN (3,5,7)

-- Piyasaya yeni çýkardýðým Chai,Konbu ve Chang ürünlerinin stock miktarlarýný merak ediyorum. Bu stock miktarlarýný listeleyiniz.

SELECT ProductName,UnitsInStock FROM Products WHERE ProductName = 'Chai' OR ProductName = 'Konbu' OR ProductName = 'Chang' 

SELECT ProductName, UnitsInStock FROM Products WHERE ProductName IN ('Chai', 'Konbu','Chang')

-- Chai, Konbu ve Chang ürünlerinin dýþýndaki ürünlerimizin stok miktarlarý

SELECT ProductName,UnitsInStock FROM Products WHERE ProductName != 'Chai' AND ProductName != 'Konbu' AND ProductName != 'Chang' 
SELECT ProductName, UnitsInStock FROM Products WHERE ProductName NOT IN ('Chai', 'Konbu','Chang')

--Birim fiyatý 30 ve 90 $ arasýndaki ve stock miktarý 50 ile 150 arasýnda olan ürünlerin listesi

SELECT * FROM Products WHERE UnitPrice BETWEEN 30 AND 90 AND UnitsInStock BETWEEN 50 AND 150

--3 numaralý çalýþanýmýn 1997 yýlýnýn Temmuz,Aðustos ve Eylül aylarýndaki sipariþlerinin listesi

SELECT * FROM Orders WHERE EmployeeID = 3 AND OrderDate BETWEEN '01-01-1997' AND '03-01-1997'

-- Henüz teslim edilmemiþ sipariþlerim. Nullarý kontrol aþaðýdaki gibidir.

SELECT * FROM Orders WHERE ShippedDate IS NULL

--Teslim edilmiþ ürünler

SELECT * FROM Orders WHERE ShippedDate IS NOT NULL

------------------------------------------------------
--Müþteri kodlarýmý yenilemek istiyorum. Her müþterimin þirket adýnýn ilk 4 karakterini müþteri kodu olarak ayarlayacaðým. Bu kodlarý listleyen kodlarý yazýnýz.

SELECT * FROM Customers

--SUBSTRING

SELECT SUBSTRING( 'Veri Tabaný',1,4)

SELECT SUBSTRING( 'Veri Tabaný',4,3)

SELECT CompanyName, SUBSTRING(CompanyName,1,4) AS [Yeni Kodlar] FROM Customers 

--LEFT : Bu metot belirtilen karakter sayýsý kadar SOLDAN karakter alýr.

SELECT LEFT('Veri Tabaný', 6)

SELECT CompanyName, LEFT(CompanyName,4) AS [Soldan Kodlar] FROM Customers

--Þirket kodlarýný þirketlerin isimlerinin sondan 4 karakteri ile oluþturmuþ olsaydým :
-- RIGHT : Bu metot belirtilen karakter sayýsý kadar SAÐDAN karakter alýr.

SELECT RIGHT('Veri Tabaný', 5)

SELECT CompanyName, RIGHT(CompanyName,4) AS [Saðdan Kodlar] FROM Customers

--
SELECT UPPER ('Bilge Adam')   --BÜYÜK

--
SELECT LOWER('Bilge Adam')    --küçük

--Þirket kodlarýný büyük harf yapmak

SELECT CompanyName, UPPER (LEFT(CompanyName, 4)) AS [Upper kodlar] FROM Customers

SELECT CompanyName, LEFT(UPPER(CompanyName), 4) AS [Upper kodlar] FROM Customers

-- Þirket olarak mail adreslerimizi güncelliyoruz :
--Örnek : Nancy Davolio : n.davolio@north.com

SELECT FirstName,LastName, LOWER(LEFT(FirstName,1))+'.'+LOWER(LastName)+'@north.com' AS [Email] FROM Employees

SELECT FirstName,LastName, LOWER(LEFT(FirstName,1)+'.'+LastName)+'@north.com' AS [Email] FROM Employees

--Employees tablosundaki bütün çalýþanlarýmýn soyisimlerini büyük harf yapýnýz.

UPDATE Employees SET LastName =  UPPER(LastName) -- WHERE olmak zorunda deðil.

SELECT * FROM Employees

--
SELECT LEN('Aydýn Ayaydýn')

--Her çalýþanýmýn ad ve soyadlarý kaç harften oluþuyor.

SELECT FirstName,LastName, LEN(Lastname+''+FirstName)  FROM Employees

--Çalýþanlarýmýn soyisimlerini tekrar ilk harfi büyük, gerisi küçük olacak þekilde güncelleyin.

SELECT  UPPER(LEFT(LastName,1)) + LOWER(RIGHT(LastName, LEN(LastName)-1)) FROM Employees

SELECT  UPPER(LEFT(LastName,1)) + LOWER(SUBSTRING(LastName,2, LEN(LastName)-1)) FROM Employees

UPDATE  Employees SET LastName = UPPER(LEFT(LastName,1)) + LOWER(RIGHT(LastName, LEN(LastName)-1))

SELECT * FROM Employees

-----------------------

-- LTRIM : Soldaki boþluklarý temizler.

SELECT '     Yazýlým'

SELECT  '|' + LTRIM('      Yazýlým   ') 

--RTRIM : Saðdaki boþluklarý temizler.

SELECT  RTRIM('      Yazýlým   ') + '|'

--Her iki taraftaki boþluklarý temizlemek için :

SELECT '|' + LTRIM(RTRIM('     Yazýlým       ')) + '|'

----------------------------------

-- REVERSE : Bir metni ters çevirir.

SELECT REVERSE('Bilge Adam')

--'ey edip adanada pide ye metnini ters çevirin :

SELECT REVERSE('ey edip adanada pide ye')

-- ürünlerimin isimlerini ters çevirin

SELECT ProductName, REVERSE(ProductName) FROM Products

----------------------------

-- REPLACE : Bir ifade içerisindeki belli kýsýmlarý istenilen kelime ile deðiþtirir.

SELECT REPLACE('Bilge Adam','Adam','Kadýn')

SELECT REPLACE('Ekmek aslanýn aðzýnda', 'aðzýnda','midesinde')

SELECT REPLACE('BilgeAdam sadasdakh BilgeAdam','BilgeAdam','Bilge Adam')

-----------------

--Baþ harfi A, B ve C olan müþterilerime kampanya tanýmlamak istiyorum. Bu müþterilerimin listesini gösteren sorguyu yazýnýz.

SELECT ContactName FROM Customers WHERE LEFT(ContactName,1)='A' OR LEFT(ContactName,1)='B' OR LEFT(ContactName,1)='C' 

SELECT ContactName FROM Customers WHERE LEFT (ContactName,1) IN('A','B','C')

----------------------------
-- LIKE : Metinsel ifadelerde belirli bir þablona göre kayýtlarýn filtrelenmesi için kullanýlýr.

--Önemli Semboller :
-- % : Belirsiz 0 veya birden fazla karakteri temsil eder.
-- _ : Tek bir belirsiz harfi temsil eder.
-- [] : Tek harf için özel þablon tanýmýný temsil eder.
-- ^ : Deðil
------------
-- Açýklamasýnda sweet kelimesi içeren kategorileri listeyeliniz.

SELECT * FROM Categories WHERE Description LIKE '%sweet%' -- % : Baþý ve sonu önemsiz 

-- Açýklamasý sweet kelimesi ile BAÞLAYAN kategorileri listele :

SELECT * FROM Categories WHERE Description LIKE 'sweet%'   -- Description sütun adý

-- Açýklamasý sweet kelimesi ile BÝTEN kategorileri listele :

SELECT * FROM Categories WHERE Description LIKE '%sweet'

--Þirket adý a harfi baþlayan ve e harfi ile biten müþterilein listesi

SELECT * FROM Customers WHERE LEFT(CompanyName,1) = 'A' AND RIGHT(CompanyName,1)= 'E'

SELECT * FROM Customers WHERE CompanyName LIKE 'a%e'

-- Ýlk harfi bilinmeyen ikinci harfi e olan diðer harfleri bilinmeyen müþterileri bulunuz.

SELECT * FROM Customers WHERE CompanyName LIKE '_e%'

--4. harfi R olan þirketlerin listesi

SELECT * FROM Customers WHERE CompanyName LIKE '___R%'

--Ýlk harfi bilinmeyen, ikinci harfi a olan , son harfi s olmayan þirketlerin listesi

SELECT * FROM Customers WHERE CompanyName LIKE '_a%[^s]'

SELECT * FROM Customers WHERE CompanyName LIKE '_a%' AND CompanyName NOT LIKE '%s'

--Ýlk harfi L ve R olan þirketlerin listesi

SELECT * FROM Customers WHERE CompanyName LIKE 'L%' OR CompanyName LIKE 'R%'

SELECT * FROM Customers WHERE CompanyName LIKE '[lr]%'

--Ýlk harfi L ve R arasýndaki harflerden oluþan þirketlerin listesi :

SELECT * FROM Customers WHERE CompanyName LIKE '[l-r]%'

-- Tost yapmayý seven çalýþanýmýn kimdir? ( Anahtar kelime : toast)

SELECT * FROM Employees WHERE Notes LIKE '%toast%'

---------------------------------------ÖDEV--------------------------------------------------------------------------------

SELECT * FROM Orders WHERE EmployeeID = 3 AND CustomerID LIKE '[h-t]%' --Çalýþan Id = 3 olan ve müþteri Id lerinin h-t arasýndaki deðerleri listeleyiniz. 

SELECT Title, BirthDate, REVERSE(BirthDate) FROM Employees  WHERE Title LIKE '%Represent%'  -- Ýçinde Represent geçen çalýþanlara ait içerik ve tarihleri(tarihleri tersten yazarak) listeleyiniz.

SELECT * FROM Orders WHERE LEFT(CustomerID,2) = 'WH' -- Ýlk 2 harfi WH ile baþlayan müþterileri listeleyiniz. 

SELECT QuantityPerUnit,ProductName,UnitPrice FROM Products WHERE Discontinued = 'True' AND UnitPrice > 10 --Discontined True olan Parasý 10 $ dan fazla olan ürünlerin miktarýný, adýný ve fiyatýný listeleyiniz.

SELECT * FROM Employees WHERE LEN( FirstName+'.'+LastName+'@gmail.com') > 24 -- ad.soyad@gmail.com maili oluþturup bunun uzunluðunun 24'ten büyük olanlarý listeleyiniz.

DELETE FROM Kisiler WHERE Id =2

UPDATE Kisiler SET Soyad = LEFT(Ad,3) 

INSERT INTO Kisiler(Ad) VALUES ('Ayça')

SELECT * FROM Kisiler WHERE Id = 1

-- b ve c harfi ile baþlayn ürünlerin listesini çýkartan sorgu

SELECT * FROM Products WHERE ProductName LIKE 'b%' OR ProductName LIKE 'c%'

SELECT * FROM Products WHERE LEFT(ProductName,1) IN ('B','C')

SELECT * FROM Products WHERE ProductName LIKE '[bc]%'

SELECT * FROM Products WHERE ProductName BETWEEN 'B' AND 'D'

INSERT Products (ProductName) VALUES ('Da')

-------------------------------------

--SORTÝNG & FILTERÝNG
--(Sýralama ve Filtreleme)

--ORDER BY : sýralama için kullanýlýr.(varsayýlan olarak küçükten büyüðe sýralar.)
	--ASC : Küçükten büyüðe
	--DESC : Büyükten küçüðe

--Ürünlerimi adlarýna göre alfabetik sýra ile listeleyiniz.

SELECT * FROM Products 
	ORDER BY ProductName ASC

--Ürünlerimi adlarýna göre tersten alfabetik sýra ile listeleyiniz.

SELECT * FROM Products 
	ORDER BY ProductName DESC

--Ürünlerimi fiyatlarýna göre pahalýdan ucuza  doðru sýralayýnýz

SELECT * FROM Products 
	ORDER BY UnitPrice DESC

--Çalýþanlarýmý adlarýna göre sýralayýnýz.

SELECT * FROM Employees
	ORDER BY FirstName 

INSERT INTO Employees(FirstName,LastName) VALUES ('Mehmet','Avcý')

SELECT * FROM Employees
	ORDER BY FirstName DESC, LastName DESC

--Amerikadaki müþterilerimi bulunduklarý þehirlere göre sýralayýnýz.

SELECT * FROM Customers
	WHERE Country = 'USA'
	ORDER BY City

--Amerikada olmayan müþterileri bulunduklarý þehirelere göre sýralayýnýz.

SELECT * FROM Customers
	WHERE NOT Country = 'USA'
	ORDER BY City

SELECT * FROM Customers
	WHERE Country <> 'USA'
	ORDER BY City

--Þiþe ile satýlan ürünlerimi fiyatlarýna göre sýralayýnýz

SELECT ProductName FROM Products
	WHERE QuantityPerUnit LIKE '%bottle%'
	ORDER BY UnitPrice 
 
 /*
	 CustomerId'si FRANK olan,
	 Freight'i 100 ve 150 arasýnda olan,
	 ShipCountry'si Sweden, Franse, Brazil olan,
	 ShipVia'sý 2 veya 3 olan 
	 sipariþlerimin listesi
*/ 

SELECT * FROM Orders
	WHERE CustomerID = 'FRANK'
	 AND Freight BETWEEN 100 AND 150
	 AND ShipCountry IN ('Sweden','France','Brazil') 
	 --AND (ShipVia = 2 OR ShipVia = 3)
	 AND ShipVia IN (2,3)

--Websitemdeki bir problemden dolayý içerisinde ' iþareti geçen ürünlerimin listesini görmek istiyorum.

SELECT * FROM Products WHERE ProductName LIKE '%''%' -- ' Ýþaretini aratmak için '' kullanýyoruz.

SELECT * FROM Products 
	--WHERE CHARINDEX('''',ProductName,1) != 0
	WHERE CHARINDEX('''',ProductName,1) > 0

UPDATE Products SET ProductName = '_hai' WHERE ProductName = 'Chai'

-- _ ile içerin

SELECT * FROM Products
	--WHERE ProductName LIKE '%[_]%'
	--WHERE ProductName LIKE '%_%' -- _ Parantezsiz olunca 1 tane karakter içermesi listeyi getiriyor.
	WHERE ProductName LIKE '%*_*_%' ESCAPE '*' --* ESCPACE tanýmlýyoruz. Buda _ iþaretini özelden çýkarttýk.Tek karakter koyun *,harf,sayý. *_ (1 tane) *_*_ (2 tane)

---------------------------------------------
--DISTINCT : Bütün kolonlarý ile tekrar eden satýrlarý tek bir satýr olarak gösterir.

--Çalýþanlarýma verdiðim ünvanlar nelerdir?

SELECT DISTINCT Title FROM Employees 

--Müþterilerim hangi ülkede?

SELECT DISTINCT Country FROM Customers

--Hangi ülkelere sipariþ gönderiyorum?

SELECT DISTINCT ShipCountry FROM Orders

-------------------------------
--TOP (N) : Sonuç listesindeki ilk N adet kaydý çeker.
--TOP(S) : Sonuç listesindeki kayýtlarýn ilk %S'lik kýsmýný getirir.

--En pahalý 5 ürünüm hangisidir ?

SELECT TOP  5 * FROM Products
	ORDER BY UnitPrice DESCT 

--1998 yýlýna ait ilk 10 sipariþim

SELECT TOP 10 * FROM Orders		
	--WHERE OrderDate LIKE '%1998%'
	WHERE YEAR(OrderDate) = 1998
	ORDER BY OrderDate

--1997 yýlýnýn Haziran ayýna ait sipariþlerin, kargo bedeli en yüksek olaný hangisidir ?

SELECT TOP 1 * FROM Orders
	WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 6
	ORDER BY Freight DESC

--1997 yýlýna ait sipariþlerimin ilk yarýsýný listeliyiniz.
--% lik ifadedir. Yüzde kaç isteniyorsa onu getirir.

SELECT TOP 50 PERCENT  * FROM Orders -- Son 50 si için listesi DESC yap daha sonra gene 50 sini al.
	WHERE YEAR(OrderDate) = 1997
	ORDER BY OrderDate

SELECT TOP 50 PERCENT *  FROM Employees --11 kayýt vardý. Yarýsýný alarak 6 kayýt geldi. 5.5 yuvarlama yaparak 6 kayýt geldi.

--Sipariþ gönderdiðim ülkelerden alfabetik olarak ilk 5 tanesi hangileri ?

SELECT  DISTINCT TOP 5 ShipCountry  FROM Orders
	ORDER BY ShipCountry 

---------------------------------------------
--Þirketimizi Türkiye'ye taþýdýk. Haliyle, çalýþanlarýmýn hitaplarýnýn türkçe olmasýný istiyorum. Nasýl yaparým ?
--Mr. için Bay
--Mrs. ve Ms. için Bayan
--Diðer için Sayýn

SELECT '','' FROM Employees -- --Yeni kolon ekleniyor.Sorgu olarak.

SELECT 
		FirstName AS Ad, 
		LastName Soyad, 
		CASE TitleOfCourtesy 
			WHEN 'Mr.' THEN 'BAY'
			WHEN 'Mrs' THEN 'Bayan'
			WHEN 'Ms.' THEN 'Bayan'
			ELSE 'Sayýn'
		END AS [Hitap]
	FROM Employees 

-- Çalýþanlarýmýn þehirlerini plaka kodlarý ile gösteriniz
	
SELECT
		FirstName,
		LastName
		City,
		PostalCode, 
		[Plaka Kodu]  = CASE City
			WHEN 'Seattle' THEN '41'
			WHEN 'Tacoma' THEN '42'
			WHEN 'Kirkland' THEN '43'
			WHEN 'Redmond' THEN '44'
			WHEN 'London' THEN '45'
			ELSE '00'
		END
	FROM Employees

--
/*
	Fiyatý 
	50'dan küçük ise 'Ucuz',
	50 ile 100 arasýnda ise 'Normal'
	100'den büyük ise 'Pahalý'
	þeklinde fiyat durumunu yansýtan ürün listesini istiyor.
*/

SELECT  
		ProductID,
		ProductName,
		UnitPrice,
		CASE 
			WHEN UnitPrice < 50 THEN 'Ucuz'
			WHEN UnitPrice BETWEEN 50 AND 100 THEN 'Normal'
			WHEN UnitPrice > 100 THEN 'Pahalý'
		END
	FROM Products
-----------------------------------------
--Bugünün tarihi nedir?(Querynin çalýþtýrdýðý SQL Server'ýn kurulu olduðu iþletim sisteminin tarih ve saatini döndürür.)

SELECT GETDATE()

--Bugünden 5 gün sonrasý tarih/saat

SELECT DATEADD(DAY , 5 , GETDATE())
SELECT DATEADD(DAY, 5 ,'07-27-2016') 

--Bugünden 25 yýl sonrasý?
	
SELECT DATEADD(YEAR,25,GETDATE())

--Bugunden 25 yýl öncesi?

SELECT DATEADD(YEAR,-25,GETDATE())

--Ýki tarih arasýndaki fark :

SELECT DATEDIFF(YEAR, '03-07-1994', GETDATE())
SELECT DATEDIFF(MONTH, '03-07-1994', GETDATE())
SELECT DATEDIFF(DAY, '03-07-1994', GETDATE())
SELECT DATEDIFF(HOUR, '03-07-1994', GETDATE())
SELECT DATEDIFF(MINUTE, '03-07-1994', GETDATE())
SELECT DATEDIFF(SECOND, '03-07-1994', GETDATE())

--SELECT DATEDIFF(NANOSECOND, '03-07-1994', GETDATE())

--Çalýþanlarým yaþasaydý kaç yaþýnda olurlardý?

SELECT                                          --([AYNI SORGU ÝÇÝN] SADECE ORDER BY'da TAKMA ÝSÝMLER KULLANILABÝLÝR.)
	TOP 3
	FirstName,
	LastName,
	DATEDIFF(YEAR, BirthDate, GETDATE()) AS Yaþ
	FROM Employees
	ORDER BY Yaþ 

--CAST : Veri tipini deðiþtirir gibi yapar.
--CONVERT : Direk nvarchar'a dönüþtürüyor.

-- Bütün çalýþanlarýmýn adýný ve doðum tarihini ayný kolonda aralarýnda virgül(,) ile listeleyiniz.
--Nancy,{BirthDate}

SELECT FirstName+ ','+CAST(BirthDate AS nvarchar(20)) FROM Employees
SELECT FirstName+ ','+CONVERT(nvarchar(20), BirthDate) FROM Employees

/*
Products tablosundan þu þekilde bir çýktý istiyorum:
{X(stok) adet Z(ürün adý) var, fiyatý da Y}
*/

SELECT CAST(UnitsInStock AS nvarchar(20))+' adet '+ProductName+' var fiyatý da ' +CAST(UnitPrice AS nvarchar(20)) FROM Products

/*
Employees tablsoundan þu þekilde bir çýktý istiyorum:
{X isimli çalýþan Y(saati olmayan tarih) tarihinde doðdu, Z(þehir) 'de yaþýyor}
*/

SELECT FirstName+ ' isimli çalýþan '+ CONVERT(nvarchar(20),BirthDate,3)+' tarihinde doðdu '+City+' ''de yaþýyor' FROM Employees

--En geç teslim ettiðim 5 sipariþ hangileri?*

SELECT TOP 5 DATEDIFF(HOUR,RequiredDate,ShippedDate) FROM Orders ORDER BY DATEDIFF(HOUR,RequiredDate,ShippedDate) DESC

--Sipariþlerimi teslim süresine(gün bazýnda) göre sýralayýnýz.

SELECT DATEDIFF(DAY,OrderDate,ShippedDate) 'Teslim' FROM Orders ORDER BY 'Teslim' DESC

--Bugün doðum günü olan çalýþanlar kimler?

SELECT * FROM Employees WHERE MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) = DAY(GETDATE())
SELECT FirstName,
	 CASE WHEN DATEDIFF(DAY,BirthDate,GETDATE())%365=0 
		THEN 'Bugun Doðum Günü' 
		ELSE 'Bugun Doðum Günü Deðil'
	END  
FROM Employees
	
--Doðum gününe 2'dan daha az ay kalan çalýþanlarýmýn listesi?

SELECT * FROM Employees WHERE DATEDIFF(MONTH,BirthDate,GETDATE()) % 12 >= 10

--Hangi ülkelere ihracat yapýyorum?

SELECT DISTINCT ShipCountry FROM Orders WHERE ShipCountry !='USA'

--Üç kelimeli adý olan ürünlerden en pahalýsý?

SELECT ProductName,UnitPrice FROM Products WHERE LEN(ProductName) - LEN(REPLACE(ProductName,' ','')) = 2 ORDER BY UnitPrice DESC

SELECT ProductName,UnitPrice FROM Products WHERE ProductName LIKE '% % %' AND ProductName NOT LIKE '% % % %' ORDER BY UnitPrice DESC

------------------------------------------ÖDEV--------------------------------------------------
-- Gecikme tarihleri 2  ile 5 arasýnda olan sipariþleri görüntüleyiniz.

SELECT  OrderId, DATEDIFF(HOUR,RequiredDate,ShippedDate) 'Gecikme' FROM Orders WHERE DATEDIFF(DAY,RequiredDate,ShippedDate) BETWEEN 2 AND 3
 
-- Adýnýn içerisinde en çok A harfi olan ürünüm hangisi?

SELECT TOP 1 LEN(ProductName) - LEN(REPLACE(REPLACE(ProductName, 'a', ''), 'â','')) [En Çok] FROM Products ORDER BY [En Çok] DESC

 
-- Paris için alýnan son sipariþ ve sipariþ tarihi ile teslim tarihi arasýndaki gün farkýyla beraber hesaplayan sorgu
 
 SELECT DATEDIFF(DAY,RequiredDate,OrderDate), DATEDIFF(DAY,RequiredDate,ShippedDate) FROM Orders WHERE ShipCity= 'Paris' 
 SELECT TOP 1 DATEDIFF(DAY,OrderDate,ShippedDate) FROM Orders WHERE ShipCity = 'Paris' ORDER BY OrderDate DESC

-- Kargo ücretleri en pahalý olan 10 sipariþ hangi ülkelere gönderilmiþtir?
 
 SELECT DISTINCT TOP 10 ShipCountry  FROM Orders ORDER BY Freight DESC

-- Þirket olarak küçülme kararý aldým. ürünlerimin %30 unun üretimini durdurmak istiyorum. Tekrar sipariþ edilme seviyesi (ReorderLevel) en düþük ilk %30luk kýsmý listeleyin.

SELECT * FROM Products

SELECT TOP 30 PERCENT * FROM Products WHERE Discontinued = 'True' ORDER BY ReorderLevel
SELECT TOP 30 PERCENT * FROM Products ORDER BY ReorderLevel

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
 
 SELECT ContactName ,LOWER(REPLACE(ContactName,' ','.'))  UserName , LEFT(CompanyName,3)+''+RIGHT(Phone,3) [Password] FROM Suppliers
 
-- Þimdiye kadarki satýþlarýmda indirim miktarý en çok olan ürünümün Idsi nedir?

SELECT TOP 1 ProductID  FROM [Order Details] ORDER BY Quantity DESC
SELECT TOP 1 ProductID  FROM [Order Details] ORDER BY Discount DESC

-- Ýndirim oraný 0,2den yüksek olan ürün satýþlarýmdan en çok kazandýðým 5 tanesini?
 
 SELECT TOP 5 *, UnitPrice * Quantity * (1-Discount) [kazanç] FROM [Order Details] WHERE  Discount > 0.2 ORDER BY [kazanç] DESC
 --(Order Details tablosunda UnitPrice olmasýnýn sebebi eski kayýtlarýnda orda duruyor olmadý. Güncelleme durumunda Products'daki UnitPrice güncellenir.)


-- Posta kodu içerisinde harf olan müþterilerim hangi ülkelerde?

SELECT DISTINCT Country FROM Customers WHERE PostalCode LIKE '%[A-Z]%' 
 
-- Þirket bütçesinde problem çýktý. Bu sebeple kargo ücreti 200den büyük olan ve Kargocunun Id'si 2 haricindeki bütün sipariþlerin teslim tarihini 5 gün öteleyen UPDATE kodunu yazýnýz.

UPDATE Orders SET ShippedDate = DATEADD(DAY,5,ShippedDate) FROM Orders WHERE Freight > 200 AND ShipVia !=2 
--(Haricindeki kelimesi 200'den büyükleri kapsamýyorsa)

--------------------------------------------------------------
--------------------------------------------------------------

--JOIN's

SELECT * FROM Products

SELECT * FROM Suppliers

-- * % wildcard
--INNER JOIN

--v1(Versiyon 1)
SELECT * FROM Products 
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	WHERE ProductName = 'Chang'

--v2(Versiyon 2)
SELECT ProductName,CompanyName,Phone FROM Products 
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	WHERE ProductName = 'Chang'

--v3(Versiyon 3)
SELECT ProductName,Products.SupplierID,Phone FROM Products 
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	--WHERE ProductName = 'Chang'

--1997 yýlýna ait sipariþlerimin hangi müþterilerime ait olduðunu gösteren sorgu

SELECT OrderID,CompanyName FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	WHERE YEAR(OrderDate) = 1997

SELECT * FROM Kisiler
	INNER JOIN Departmanlar ON Kisiler.DepartmanId = Departmanlar.Id

--01.01.1998 tarihinden sonra sipariþ veren müþterilerimin isimlerini artandan azalana doðru sýralayýnýz.
-- Tablo kýsaltmalarýna tablonun baþ harfini vererek ALIAS iþlemi yapýlýr.Kolaylýk saðlasýn diye.

SELECT DISTINCT CompanyName FROM Orders O 
	--INNER 
	JOIN Customers c ON O.CustomerID = C.CustomerID
	WHERE OrderDate > '01.01.1998' ORDER BY CompanyName DESC

--ALFKI Id'li müþterimin sipariþlerini hangi kargocu taþýyor ?

SELECT c.CompanyName, o.OrderID,s.CompanyName FROM Customers c
		JOIN Orders o ON C.CustomerID = O.CustomerID JOIN Shippers s ON O.ShipVia = S.ShipperID
		WHERE C.CustomerID = 'ALFKI'

SELECT 
	p.ProductID  'Ürün Numarasý',
	p.ProductName  [Ürün Adý],
	c.CategoryName as 'Kategorisi',
	c.CategoryID as Kategorisi
	from Products p
	INNER JOIN Categories as c on p.CategoryID = c.CategoryID

--Sipariþler ve ilgili sipariþlerde satýlan ürünlerin raporu

SELECT o.OrderID, o.OrderDate,o.OrderID,od.ProductID,od.Quantity, od.UnitPrice,p.ProductName,C.CategoryName FROM Orders o
	INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
	INNER JOIN Products p ON od.ProductID = p.ProductID 
	INNER JOIN Categories c ON C.CategoryID = P.CategoryID

--NULL olan gelmiyor. Bunun için sað sol join yapmamýz gerekiyor.
SELECT man.FirstName+ ' ' +man.LastName as Manager,emp.FirstName+ ' '+ emp.LastName as Employee FROM Employees man
	INNER JOIN Employees emp ON man.EmployeeID = emp.ReportsTo 

--TABLOLARI HEP SAÐA EKLE. 
--INNER : EÞLEÞME SONUCU NULL OLAMAZ.ONLARI EKRANA GETÝRMEZ.
--RIGHT : SAÐDAKÝ TABLONUN HEPSÝ GELSÝN. SOLDAKÝ EÞLEME YOKSA NULL GELÝR. 
--LEFT : SOLDAKÝ TABLONUN HEPSÝ GELÝR. SAÐDA EÞLEÞME YOKSA NULL GELÝR.
--FULL : BÜTÜN HEPSÝNÝ GETÝRÝYOR.

SELECT man.FirstName+ ' ' +man.LastName as Manager,emp.FirstName+ ' '+ emp.LastName as Employee FROM Employees man
	RIGHT JOIN Employees emp ON man.EmployeeID = emp.ReportsTo 

SELECT * FROM Kisiler

SELECT * FROM Departmanlar

SELECT * FROM Kisiler k
	FULL JOIN Departmanlar d ON K.DepartmanId = D.Id

SELECT * FROM Kisiler k
	RIGHT JOIN Departmanlar d ON K.DepartmanId = D.Id

--SELF JOIN : Kendi kendine eþleþme yapar. Ayný topla üzerinden.
--Çalýþanlarýmýn amirleri kimlerdir?

SELECT 
	Calisan.FirstName + ' ' + Calisan.LastName AS Çalýþan, 
	Amirler.FirstName + ' ' + Amirler.LastName AS Amir FROM Employees Calisan
	JOIN Employees Amirler ON Calisan.ReportsTo = Amirler.EmployeeID

SELECT 
	Calisan.FirstName + ' ' + Calisan.LastName AS Çalýþan, 
	Amirler.FirstName + ' ' + Amirler.LastName AS Amir FROM Employees Calisan
	LEFT JOIN Employees Amirler ON Calisan.ReportsTo = Amirler.EmployeeID  --Neden Left

SELECT * FROM Kisiler k
	LEFT JOIN Departmanlar d ON K.DepartmanId = D.Id

SELECT * FROM Kisiler k
	JOIN Departmanlar d ON K.DepartmanId = D.Id

--CROSS JOIN : Kartezyen çarpýmý. Her kiþiyi her departmanla eþleþtiriyor. Her departmanla da her kiþi eþleþtiriyor. Lig durumu.Her takým her takýmla maç yapmak zorunda. Beden-Renk eþleþmesi. Xs-S-M-L  Mavi-Yeþil-Kýrmýzý.

SELECT * FROM Kisiler k 
	CROSS JOIN Departmanlar d 
	--ON k.DepartmanId = d.DepartmanId  --> Bu satýr Cross Joýn için bir anlam ifade etmiyor.

--Aþaðýdaki kodda cross join örneðidir.

SELECT * FROM Kisiler, Departmanlar

-- Her çalýþanýmýn her müþteri ile görüþmesini istiyorum.Haftanýn belli günleri için takvim hazýrlayacaðým. Hergün bir çalýþan bir müþterifi görecekse, bu iþlem kaç gün sürecek?

SELECT 
	e.FirstName + ' ' + e.LastName Çalýþan, c.CompanyName 
	FROM Employees e
	CROSS JOIN  Customers c

SELECT 
	e.FirstName + ' ' + e.LastName Çalýþan, c.CompanyName 
	FROM Employees e, Customers c

--Çalýþanlarýmýn yaptýðý sipariþlerin listesi :

SELECT
	 e.FirstName + ' ' +e.LastName, o.*
	FROM Employees e
	LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID

--Hala daha  teslim edilmemiþ sipariþlerimi hangi çalýþanlarým yapmýþ?

SELECT DISTINCT
	e.FirstName + ' ' + e.LastName Calisan --, o.OrderDate, o.ShippedDate
	FROM Orders o
	JOIN Employees e ON o.EmployeeID = e.EmployeeID WHERE  o.ShippedDate IS NULL
	
--UNION JOIN : Ýki ya da daha fazla sorgunun sonucunu tek bir sonuç kümesi olarak gösterir.
	--Ayný sayýda kolon olmalý
	--Alt alta gelicek bilgilerin ayný kolon için ayný veri tipine sahip olmasý gerekir.

--Hangi þirketlerle çalýþýyorum?

SELECT CompanyName, ContactName, 'C' [Type] FROM Customers 
UNION
SELECT CompanyName, ContactName, 'S' [Type] FROM Suppliers 
UNION
--SELECT CompanyName,'Bilgi Yok','Sh' [Type] FROM Shippers
SELECT CompanyName,NULL,'Sh' [Type] FROM Shippers

--
INSERT Shippers (CompanyName,Phone) VALUES ('Exotic Liquids', '(171) 555-2222')

-- UNION ALL : Ýki tablodada ayný veri varsa CompanyName = 'Exotic Liquids' kayýt ikisindede var. Ama UNION ile sadece biri gelirken, ALL dediðimizde aynýsýndan olsada onlarý ekliyor listeye.

SELECT CompanyName, Phone FROM Suppliers 
UNION ALL
SELECT CompanyName, Phone FROM Shippers

--EXCEPT : Tekrar eden satýrlarý hiç getirmez. Üstteki tabloya bak. Eðer alttaki tabloda ayný satýr varsa üstteki tablodan çýkar. Suppliers'de 29 kayýt vardý 'Exotic Liquids' '(171) 555-2222' tekrar ettiði için 28 kayýt geldi. b      

SELECT CompanyName, Phone FROM Suppliers 
EXCEPT
SELECT CompanyName, Phone FROM Shippers

--INTERSECT : Sadece tekrar eden satýrlarý getirir.

SELECT CompanyName, Phone FROM Suppliers 
INTERSECT
SELECT CompanyName, Phone FROM Shippers

------------------------------ÖRNEKLER-------------------------------------
--Kategorisi 'Beverages' olan ürünlerin listesini bulunuz.

SELECT * FROM Categories c JOIN Products p ON c.CategoryID = p.CategoryID WHERE C.CategoryName = 'Beverages' ORDER BY ProductName

--"Chai" ve "Tofu" ürünlerinin 1997 yýlýndaki sipariþlerinin listesini bulunuz.

SELECT DISTINCT o.OrderID FROM Products p 
	JOIN [Order Details] od ON p.ProductID = od.ProductID 
	JOIN Orders o ON od.OrderID = o.OrderID 
	WHERE p.ProductName IN ('Chai','Tofu') AND YEAR(o.OrderDate) = 1997

--Unit Package þirketinin taþýdýðý ürünleri hangi þirketler tedarik ediyor ?

SELECT DISTINCT sup.CompanyName 
	FROM Suppliers sup 
	JOIN Products P ON SUP.SupplierID = P.SupplierID
	JOIN [Order Details] OD ON P.ProductID = OD.ProductID
	JOIN Orders O ON OD.OrderID = O.OrderID
	JOIN Shippers ship ON O.ShipVia = ship.ShipperID
	WHERE ship.CompanyName = 'United Package'
--Venezuella'ya gönderilecek sipariþlerimi yapan çalýþanlarýmýn amirlerine kullanýcý adý ve þifre oluþturmak istiyorum.
	-- Kullanýcý adý : isim.soyisim
	--Þifre : þehir bilgisinin ilk 3 harfi ile telefon bilgisinin son 3 harfi ?

SELECT  DISTINCT 'Kullanýcý Adý :' +amir.FirstName + '.'+ amir.LastName, 'Þifre : '+ LEFT(amir.City,3)+RIGHT(amir.HomePhone,3) FROM Orders O
	JOIN Employees calisan ON calisan.EmployeeID = o.EmployeeID
	JOIN Employees amir ON calisan.ReportsTo = amir.EmployeeID
	WHERE o.ShipCountry = 'Venezuela'

--1997-05-25 ile 1998-08-08 taihleri arasýnda Janet isimli çalýþanýmýn yapmýþ olduðu ALFKI müþterisine aie sipariþlerdeki ürünlerin stok durumlarý nedir?

SELECT 
	P.ProductName,P.UnitsInStock 
	FROM Employees e
	JOIN Orders O ON e.EmployeeID = o.EmployeeID
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	JOIN Products P ON OD.ProductID = P.ProductID
	WHERE O.OrderDate BETWEEN '1997-05-25' AND '1998-08-08' AND E.FirstName = 'Janet' AND o.CustomerID = 'ALFKI'

--Ürünler tablosundaki stok sayýsý 50'den yüksek olan ürünlerin, müþterileini campanyName a'dan z'ye sýralayanýz.

SELECT DISTINCT C.CompanyName FROM Products P
	JOIN [Order Details] OD ON P.ProductID = OD.ProductID
	JOIN Orders O ON OD.OrderID = O.OrderID
	JOIN Customers C ON O.CustomerID = C.CustomerID
	WHERE P.UnitsInStock > 50  ORDER BY C.CompanyName 

--1995 yýlýndan bugune kadar verilen sipariþlerden USA'e giden ürünlerin isimlerini ve tedarik eden þirketin adýný raporlayan sorgu:

SELECT DISTINCT p.ProductName, S.CompanyName FROM Orders O
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	JOIN Products P ON OD.ProductID = P.ProductID
	JOIN Suppliers S ON P.SupplierID = S.SupplierID
	--WHERE YEAR(OrderDate) >= 1995 AND 
	WHERE O.OrderDate BETWEEN  '1995-01-01' AND '2016-01-08' AND O.ShipCountry = 'USA' 

--Boston bölgesindeki(territories) müþterilerimin sipariþ ettiði ürünleri sipariþ miktarýna göre sýralayýnýz.

SELECT DISTINCT 
	OD.Quantity, ProductID
	FROM Territories T
	JOIN EmployeeTerritories ept ON T.TerritoryID = EPT.TerritoryID
	JOIN Employees E ON EPT.EmployeeID = E.EmployeeID
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	JOIN Customers C ON C.CustomerID = O.CustomerID
	JOIN [Order Details] OD ON OD.OrderID = o.OrderID
	WHERE T.TerritoryDescription = 'Boston' ORDER BY OD.Quantity

----------------------------------------------------------------------------------------------------
-------------AGGREEGATE FUNC's------------------
--Sorgu Sonucuna bakarak iþlem yapabilen fonksiyonlardýr.

--SUM : Ýçerisine verilen sütun deðerlerini toplar.
--COUNT : Ýçerisinde verilen sütun deðerlerini sayar.
--MAX : Ýçerisine verilen sütun deðerlerinden en büyüðünü bulur.
--MIN : Ýçerisine verilen sütun deðerlerinden en küçüðünü bulur.
--AVG : Ýçerisine verilen sütun deðerlerinin ortalamasýný alýr.

--Stoktaki toplam ürün sayýsý :

SELECT SUM(UnitsInStock) FROM Products

--En pahalý ürün

SELECT MAX(UnitPrice)  FROM Products

--En ucuz ürün

SELECT MIN(UnitPrice)  FROM Products

--Ortalama fiyat

SELECT AVG(UnitPrice) FROM Products

--Kaç çeþit ürünüm var?

SELECT COUNT(ProductName) FROM Products -- NULL varsa saymaz o yüzden PK tercih edilir.

SELECT COUNT(ProductID) FROM Products

SELECT COUNT(*) FROM Products

--EXTRA : Standart sapma

SELECT STDEV(UnitPrice) FROM Products

SELECT  
	MAX(UnitPrice),
	MIN(UnitPrice),
	AVG(UnitPrice),
	SUM(UnitPrice),
	COUNT(UnitPrice)
	FROM Products

--------------------GROUP BY-------------------------
-- Aggreegate fonksiyonlar ile elde edilen sonuçlarýn belirli kolon ya da kolonlara göre gruplandýrmak için kullanýlýr.

--Her kategoriden kaç adet ürünüm var.

SELECT CategoryID,COUNT(*) FROM Products  -- Id'ye göre gruplandýrma yapmasý bir ifade etmediði için isme göre gruplandýrmamýz gerekiyor. Buna isim eklememiz içinde JOIN yapýsýný kullanarak ismi ordan çekiyoruz.
	GROUP BY CategoryID

SELECT CategoryName,COUNT(*) ÜrünSayýsý, C.CategoryID FROM  Products P
	JOIN Categories C ON P.CategoryID = C.CategoryID
	GROUP BY CategoryName, C.CategoryID

SELECT ProductName, COUNT(*) ÜrünSayýsý FROM  Products P
	JOIN Categories C ON P.CategoryID = C.CategoryID
	GROUP BY ProductName

SELECT SUM(UnitPrice),c.CategoryID FROM Categories C
	JOIN Products P ON C.CategoryID = P.CategoryID
	GROUP BY c.CategoryID

--Her çalýþaným kaç sipariþ yapmýþtýr?

SELECT FirstName + ' ' + LastName,  COUNT(*) SipariþSayýsý FROM Employees E
	LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
	GROUP BY FirstName + ' ' + LastName  
	ORDER BY SipariþSayýsý

--Her çalýþaným þirketime kaç para kazandýrmýþtýr?

SELECT E.FirstName, SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount)) SATIS  FROM Employees E
	JOIN Orders o ON E.EmployeeID = O.EmployeeID
	JOIN [Order Details] OD ON OD.OrderID = O.OrderID 
	GROUP BY E.FirstName
	ORDER BY SATIS

--Hangi sipariþ bana ne kadar kazandýrmýþ?

SELECT OD.OrderID, SUM(UnitPrice * Quantity*(1-Discount)) kazanç FROM Orders O
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	GROUP BY OD.OrderID

--Þirket adý 3 kelimeden oluþan müþterilemin þirketime þimdiye kadarki kazancý kaç paradýr?

SELECT SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount)),CompanyName  FROM Customers C
	JOIN Orders O ON C.CustomerID = O.CustomerID
	JOIN [Order Details] OD ON o.OrderID = od.OrderID
			WHERE LEN(companyName) - LEN(REPLACE(companyName,' ','')) = 2
			--WHERE CompanyName LIKE '% % %' AND CompanyName NOT LIKE '% % % %'
			GROUP BY CompanyName

--------------------- SQL UYGULAMA ----------------------------
-- Her bir çalýþaným her ürünü kaçar tane satmýþ

SELECT  e.FirstName,P.ProductName,SUM(od.Quantity) FROM Employees e
	LEFT JOIN Orders O ON e.EmployeeID = o.EmployeeID
	JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	RIGHT JOIN Products P ON OD.ProductID = P.ProductID GROUP BY e.FirstName,P.ProductName
	ORDER BY FirstName

-- Ayný soyada sahip çalýþanlar ve müþteri yetkililerini tek bir tablo sonucu olarak listeleyiniz.

/*
	SELECT LastName FROM Employees 
	INTERSECT
	SELECT SUBSTRING(ContactName, CHARINDEX(' ',ContactName, 1)+1,LEN(ContactName) - CHARINDEX(' ',ContactName,1)+1)	FROM Customers
	(Bu sadece soyadýný getiriyor.)

*/

SELECT DISTINCT e.FirstName, e.LastName, c.ContactName FROM Customers C
	CROSS JOIN Orders O 
	CROSS JOIN Employees E 
	WHERE E.LastName = RIGHT(ContactName,(LEN(ContactName)-CHARINDEX(' ',ContactName)))
	--WHERE E.LastName = SUBSTRING(ContactName, CHARINDEX(' ',ContactName, 1)+1,LEN(ContactName) - CHARINDEX(' ',ContactName,1)+1)

-- 3 Hangi sipariþi, hangi çalýþan, hangi tarihte, hangi müþteriye satmýþ, sipariþ hangi kargo þirketi ile gönderilmiþ, sipariþ içerisinde geçen ürünlerin isimleri ve bu ürünlerin kategori isimleri nedir?

SELECT o.OrderID, e.FirstName,o.OrderDate,c.CompanyName FROM Orders O
	JOIN Employees E ON O.EmployeeID = E.EmployeeID
	JOIN [Order Details] OD ON OD.OrderID = O.OrderID
	JOIN Customers C ON o.CustomerID = c.CustomerID
	JOIN Products P ON P.ProductID = OD.ProductID
	JOIN Suppliers S ON S.SupplierID = P.SupplierID
	JOIN Shippers Sh ON Sh.ShipperID = o.ShipVia	


-- En geç teslim edilen sipariþi hangi müþteri almýþ ve hangi çalýþan satmýþ

SELECT TOP 1 DATEDIFF(DAY,RequiredDate ,ShippedDate) gecteslim,o.OrderID,c.CompanyName,e.FirstName FROM Employees E 
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	JOIN Customers C ON C.CustomerID = O.CustomerID
	--WHERE o.ShippedDate > o.RequiredDate
	ORDER BY gecteslim DESC 

-- Kendi ülkesine sipariþ gönderen çalýþanlar

SELECT DISTINCT e.FirstName FROM Orders O
	JOIN Employees E ON O.EmployeeID= E.EmployeeID
	WHERE e.Country = O.ShipCountry

-- 1997 yýlýnýn hangi aylarýnda sipariþ alýnmýþ? (ingilizce ay isimleri)

SELECT DISTINCT DATENAME(MONTH,OrderDate) FROM Orders
 WHERE YEAR(OrderDate) = 1997

-- Ýsmi 4 harften fazla olan ve 5.harfi C olan ürünlerden kaç tane vardýr?

SELECT UnitsInStock,COUNT(*) FROM Products
	-- WHERE ProductName LIKE '____C%' 
	--WHERE LEN(ProductName) > 4 AND SUBSTRING(ProductName,5,1) = 'c'
	WHERE SUBSTRING(ProductName,5,1) = 'c'
	GROUP BY UnitsInStock

-- London ve Seattle' lý olan çalýþanlarýn yaþlarý toplamý kaçtýr?

SELECT SUM(DATEDIFF(YEAR,BirthDate,GETDATE())) FROM Employees WHERE City IN ('London','Seattle')

-- Stoðu en fazla olan ürünün kategorisinin 4üncü harfi nedir?

SELECT TOP 1 SUBSTRING(C.CategoryName,4,1)  FROM Products p
	JOIN Categories c ON P.CategoryID=C.CategoryID
	ORDER BY p.UnitsInStock DESC

-- En çok para kazandýðým ilk 5 müþteriye Özel Üyelik vermek istiyorum. Bu müþterilerim kimlerdir? Bu þirketlere þifre tanýmlamak istiyorum.Telefon numarasýnýn son 4 hanesi.
 
SELECT TOP 5 SUM(Quantity * UnitPrice * (1-Discount)) kazanc,C.CompanyName,RIGHT(c.Phone,4) Sifre FROM Customers C
	JOIN Orders O ON C.CustomerID = O.CustomerID 
	JOIN [Order Details] OD ON OD.OrderID = O.OrderID
	GROUP BY C.CompanyName,Phone
	ORDER BY kazanc DESC
	
-------------------------------------------------
/*
--HAVING : Gruplandýrma yaparken aggreegate fonskiyonlar ile olupþturduðum bir kolon üzerinden filtreleme yapabilmemi saðlar.
--Kýsa HAVING where kelimesinin aggreegate(count) kolonlara uygulanmýþ halidir.
--HAVING varsa Group by olmasý þart.Yoksa HAVING geçersizdir.
--HAVING sözcüðünü izleyen ifadede agreegate fonskiyonlardan en biri kullanýlmalýdýr.
--HAVING sözcüðü sadece ve sadece gruplandýrýlmýþ verilen iþlemleri için kullanýlmalýdýr.
--WHERE ile birlikte tek SELECT sorgusunda kullanýlabilir.
*/

--Sipariþ sayýsý 100'den büyük olan çalýþanlarýmýn listesi

SELECT FirstName, COUNT(*) SipariþSayýsý FROM Orders O
	JOIN Employees e ON o.EmployeeID = e.EmployeeID
	WHERE FirstName NOT LIKE '%Nancy%'
	GROUP BY FirstName
	HAVING COUNT(*) > 100 AND COUNT(*) < 150

--Þirketime 1000 dolardan az para kazandýran þirketlerimin listesi ?

SELECT C.CompanyName, SUM(Quantity * UnitPrice * (1-Discount)) FROM Customers	C
	JOIN Orders O ON C.CustomerID= O.CustomerID
	JOIN [Order Details] OD ON OD.OrderID= O.OrderID
	GROUP BY C.CompanyName
	HAVING SUM(Quantity * UnitPrice * (1-Discount)) < 1000

--------------------------------------------------------------------
-------------SUBQUERY (Alt Sorgu)------------------
--1) Basic Subquery : Ana sogudan baðýmsýz alt sorgulardýr.
--2) Correlated Subquery : Ana sorguya baðýmlý alt sorgulardýr.

-----BASIC-------
--Fiyatý ortalamanýn üstünde olan ürünleri listeleyiniz.

SELECT * FROM Products
	WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

SELECT CategoryID,AVG(UnitPrice) FROM Products
	GROUP BY CategoryID

--------WHERE Clause--------------
--Beverages kategorisine aie ürünlerin listesi

SELECT * FROM Products
	WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages') 

--Michael'ýn veya Laura'nýn hemþerisi olan çalýþanlarým kimlerdir?

SELECT * FROM Employees
	WHERE City IN(SELECT City FROM Employees 
	WHERE FirstName IN ('Michael','Laura'))

-------------CORRELATED-----------------
--Ana sorgudan bir þey aldýðýmýzda CORRELATED olmuþ oluyor.
--Ürünlerimin adý karþýsýna kategori isimlerini yazýnýz.

---------------SELECT Clause----------------------

SELECT 
		ProductName,
		(SELECT * FROM Categories C WHERE C.CategoryID = P.CategoryID)
	FROM Products P

--------------------TABLE Clause----------------

--Çalýþanlarýmýn sipariþ sayýlarýný getiren sorguyu yazýnýz.

SELECT FirstName,COUNT(*) SiparisSayýsý FROM Employees E
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	GROUP BY FirstName

--50'den büyük olanlar

SELECT FirstName,COUNT(*) SiparisSayýsý FROM Employees E
	JOIN Orders O ON E.EmployeeID = O.EmployeeID
	GROUP BY FirstName

SELECT * FROM  (SELECT FirstName,COUNT(*) SiparisSayýsý FROM Employees E
					JOIN Orders O ON E.EmployeeID = O.EmployeeID
					GROUP BY FirstName) Tablo1
	WHERE SiparisSayýsý > 50

-- NOT : JOIN'DE MAX EN ÇOK SATIRA SAHÝP OLAN KADAR SONUÇ ÇIKAR
-- NOT : CROSS JOIN'DE TABLODAKÝ SATIRLARIN ÇARPIMLARI KADAR SONUÇ ÇIKAR 

----- Basit Subquery Örnekleri ----
-- "Nancy" isimli çalýþanýmýn yaptýðý satýþlarý gösteriniz.

SELECT * FROM Orders
	WHERE EmployeeID = (SELECT EmployeeID FROM Employees  WHERE FirstName = 'Nancy')

-- "Federal Shipping" isimli firmanýn taþýdýðý sipariþ sayýsýný gösteriniz.

SELECT COUNT(ShipVia) FROM Orders 
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

SELECT 
		c.FirstName + ' '+c.LastName Çalýþan,
		(SELECT a.FirstName+' '+a.LastName FROM Employees a WHERE c.ReportsTo = a.EmployeeID)
	FROM Employees c				

-- Her bir kategoriden kaç ürün satýlmýþ

SELECT p.ProductName,SUM(Quantity) FROM Products P
	JOIN Categories C ON P.CategoryID = C.CategoryID
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID
	GROUP BY p.ProductName

 SELECT 
		c.CategoryName,
		SUM(OD.Quantity ) 
	FROM 
		Categories c, 
		Products p, --(SELECT * FROM Products) P
		[Order Details] od --(SELECT * FROM [Order Details]) OD  
	WHERE P.ProductID = OD.ProductID AND c.CategoryID = p.CategoryID
	GROUP BY C.CategoryName
--CROSS JOIN!  

-- Her bir kategoriden kazandýðým paranýn KDV'sini hesaplayýnýz.

SELECT CategoryName,SUM(OD.UnitPrice * od.Quantity * (1-od.Discount) * 0.18) FROM Categories c
	JOIN Products P ON C.CategoryID = P.CategoryID
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID
	GROUP BY CategoryName

SELECT 
		CategoryName,
		(SELECT SUM(OD.UnitPrice * od.Quantity * (1-od.Discount) * 0.18) FROM [Order Details] OD WHERE OD.ProductID IN (SELECT P.productID FROM Products P WHERE P.CategoryID = C.CategoryID))
	FROM Categories C

-- Ayný soyada sahip çalýþanlar ve müþteri yetkililerini tek bir tabloda gösteriniz. (Zaten yapýlan soru ama subquery ile yapýlabilir mi?)

SELECT DISTINCT e.FirstName, e.LastName, c.ContactName FROM Customers C
	CROSS JOIN Orders O 
	CROSS JOIN Employees E 
	--WHERE E.LastName = RIGHT(ContactName,(LEN(ContactName)-CHARINDEX(' ',ContactName)))
	WHERE e.LastName = REVERSE(LEFT(REVERSE(c.ContactName),CHARINDEX(' ',REVERSE(c.ContactName))-1))

SELECT 
	E.FirstName + ' '+e.LastName Calisan,
	(SELECT ContactNamE + '(' + CompanyName+') ' FROM Customers c WHERE RIGHT(c.ContactName,CHARINDEX(' ',REVERSE(c.ContactName),1)-1) = e.LastName) YetkiliAdý
	--REVERSE(LEFT(REVERSE(c.ContactName),CHARINDEX(' ',REVERSE(c.ContactName))-1)) = E.LastName) YetkliAdý
	 FROM Employees E

SELECT * FROM (
SELECT 
	E.FirstName + ' '+e.LastName Calisan,
	(SELECT ContactNamE + '(' + CompanyName+') ' FROM Customers c WHERE RIGHT(c.ContactName,CHARINDEX(' ',REVERSE(c.ContactName),1)-1) = e.LastName) YetkiliAdý
	--REVERSE(LEFT(REVERSE(c.ContactName),CHARINDEX(' ',REVERSE(c.ContactName))-1)) = E.LastName) YetkliAdý
	 FROM Employees E) T
	 WHERE YetkiliAdý IS NOT NULL
--ÖNEMLÝ UYARI!!! : Eðer Fuller isimli baþka bir yetkili olsa dahi kod patlar! Çünkü 1 çalýþan için bir sonuç getirmek zorunda.

-- Her bir üründen kazandýðým paranýn toplam kazandýðým paraya oranýný gösteren sorguyu yazýnýz.

/* SELECT ProductName,SUM(OD.UnitPrice*Quantity*(1-Discount)) FROM Products P 
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID 
	GROUP BY ProductName   */--Her üründen kazandýðým para.

/*
SELECT SUM(OD.UnitPrice*Quantity*(1-Discount)) FROM [Order Details]
*/--Toplam kazandýðým para

SELECT ProductName,SUM(OD.UnitPrice*Quantity*(1-Discount)) / (SELECT SUM(UnitPrice*Quantity*(1-Discount)) FROM [Order Details]) FROM Products P 
	JOIN [Order Details] OD ON OD.ProductID = P.ProductID 
	GROUP BY ProductName 

SELECT ProductName,SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName
	ORDER BY oran DESC

-------------------------------------------------------------------------
---------------------------------VÝEW's-----------------------------------

/*
	Bir veya birden fazla tablodan gerekli datanýn gelmesini saðlayan tanýmlanmýþ sorgulardýr.
	Sanal tablolardýr denebilir..
	View'lar data saklamazlar.Sadece istenilen veriye ulaþýrlar.(Sorgu saklar,sonuçlarý deðil.)
	View oluþturulurken isimsiz kolon olmamalý!
	
	Neden View?
		Her seferinde uzun bir sql sorgusunu yazmaktan kurtarýp gereksiz karmaþayý önler.
		Veriye ulaþmada performans saðlar.
		Veri eriþimini sýnýrlamak ve kontrol altýnda tutmak için de kullanýlabilir.
		Viewlarda Order By kullanýlamaz!Kullanýlabilmesi için TOP komutuna ihtiyaç duyar.
*/

/* Syntax :
CREATE VIEW [view_name]
{WITH ENCRYPTION | WITH SHEMABINDING}
AS
	{Query ( Gerekli sorgu)}
{WITH CHECK OPTION}

*/

--DLL : 
	--Create	(Oluþturmak, yenisini eklemek), 
	--Alter		(Düzenlemek, güncellemek), 
	--Drop		(Silmek,düþürmek)

--Müþterilerimin þirket adlarýný ve yetkililerini gösteren View nasýl yazýlýr?
--vw oluþturuyor.
GO
CREATE VIEW vw_SirketYetkilileri
AS
	SELECT 
		CustomerID, 
		CompanyName, 
		ContactName 
		FROM Customers

SELECT * FROM vw_SirketYetkilileri

--Oluþturulan vw'da yeni iþlem olucaksa SELECT SORGUSUNDAKÝ ALTER kullanýlarak böylece güncelleyebiliyoruz.
GO
ALTER VIEW vw_SirketYetkilileri
AS
	SELECT 
		CustomerID [Þirket Kodu], 
		CompanyName [Þirket Adý], 
		ContactName [Yetkili Adý]
		FROM Customers
SELECT * FROM vw_SirketYetkilileri

--
GO
SELECT * FROM vw_SirketYetkilileri
	WHERE [Þirket Adý] LIKE 'a%'

------------------------
--
GO
CREATE VIEW vw_UrunSatýsOranlari
AS
 SELECT 
	 ProductName ,
	 SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName

GO
ALTER VIEW vw_UrunSatýsOranlari
AS
 SELECT TOP 10000
	 ProductName ,
	 SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName
	ORDER BY oran

GO
ALTER VIEW vw_UrunSatýsOranlari
AS
 SELECT TOP 99 PERCENT 
	 ProductName ,
	 SUM(od.UnitPrice * od.Quantity*(1-OD.Discount)) / (SELECT SUM(od2.UnitPrice*od2.Quantity*(1-Discount)) FROM [Order Details] OD2) oran 
	FROM Products p
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY P.ProductName
	ORDER BY oran DESC
/*                   ----VÝEW ÝÇÝNDE ORDER BY KULLANMAK ÝSTÝYORSAK----------
	ORDER BY için TOP kullanmamýz gerekiyor.
	Gelen sonuç satýrýndan yüksek bir deðer olarak(ÖRN: 77 Satýr) TOP 78,... gibi sayý kullanýlmalý. Ama buda gelen satýrý bilmediðimiz için kesin olmaz. 
	TOP 99 PERCENT da 1 tane kaydý almýyor.
	TOP 100 PERCENT dersek de ORDER BY diyemeyiz.

*/
--
SELECT * FROM vw_UrunSatýsOranlari

--VÝEW'lara DML(SELECT,UPDATE,INSERT,DELETE) iþlemleri uygulanabilir!
/*
	View üzerinden INSERT, UPDATE ve DELETE yapýlabilir, Ancak belli koþullarý vardýr:
		--Kural 1 : INSERT,UPDATE ve DELETE için kullanýlacak kolonlarýn View içerisinde olmasý gereklidir.
		--Kural 2 : View'in içerisinde JOIN kullanýldýysa, INSERT yapýlýrken yalnýzca 1 tablodaki kolonlar kullanýlmalýdýr.3 tablonun kolonuna INSERT yapamazsýn.
		--Kural 3 : View içerisinde DISTINCT, GROUP BY kullanýlmamalýdýr.
		--Kural 4 : View üzerinden DML iþlemleri yapýlacak tablonun NULL geçilemeyen kolonlarýný içermelidir.
*/

SELECT * FROM vw_SirketYetkilileri

INSERT INTO vw_SirketYetkilileri
	([Þirket Kodu],[Þirket Adý],[Yetkili Adý])
	VALUES('GGGGG','Google Inc','Burak Kaya')

UPDATE vw_SirketYetkilileri SET [Yetkili Adý] = 'Ali Ozan Piþkin'
	WHERE [Þirket Kodu] = 'GGGGG'

DELETE FROM vw_SirketYetkilileri
	WHERE [Þirket Kodu] = 'GGGGG'

--Müþterilerimin yapmýþ olduðu sipariþ sayýlarýný gösteren view

CREATE VIEW vw_MüsteriSiparisi
AS 
	SELECT CompanyName ,COUNT(*) [Sipariþ Sayýsý] FROM Customers	C
		JOIN Orders O ON C.CustomerID = O.CustomerID
		GROUP BY CompanyName

SELECT * FROM vw_MüsteriSiparisi

--View'lar sanal tablodur dinilebiliyordu. Bu nedenle JOIN de yapýlabilir

SELECT * FROM Customers
	JOIN vw_MüsteriSiparisi ON Customers.CompanyName = vw_MüsteriSiparisi.CompanyName

SELECT * FROM vw_MüsteriSiparisi
	JOIN Customers ON Customers.CompanyName = vw_MüsteriSiparisi.CompanyName

--WITH ENCRYPTION : 
	--Oluþturulan View'ýn kaynak kodunun görülmesini engeller.
	--Bu özelliðin kullanýlmasýnýn sebebi view'ýn verilerin getirmek için kullandýðý tablo ve özel yapýlarýn diðer kullanýcýlar tarafýndan görülmesini engellemektir.

GO
CREATE VIEW vw_CalisanSiparisleri
WITH ENCRYPTION
AS
	SELECT 
			FirstName+ ' ' +LastName [Full Name],
			OrderID [Order Code]
		FROM  Employees e
		JOIN Orders o ON E.EmployeeID = O.EmployeeID

SELECT * FROM vw_CalisanSiparisleri

--WITH SHEMABINDING :
	--Bu özellik kullanýldýðýnda veri çekilen tablonun sütunlarý kitlenmiþ olur.
	--DBO.[tablo_name] dememiz gerekiyor.
GO
CREATE VIEW vw_Kisiler
WITH SCHEMABINDING
AS
	SELECT Id,Ad FROM dbo.Kisiler

SELECT * FROM vw_Kisiler

--Tablodaki kolonlarý kitler derken;Kodla silinmez ancak desing'den silme iþlemini yapabilirsiniz.
ALTER TABLE Kisiler DROP COLUMN Id


-- Prosedür
ALTER PROC sp_AddEmployee
(
@firstName varchar(20),
@lastName varchar(20)
)
AS
BEGIN
	INSERT INTO Employees(FirstName,LastName) VALUES (@firstName,@lastName)
	SELECT EmployeeID FROM Employees WHERE EmployeeID=(SELECT SCOPE_IDENTITY())
END

select * from [Order Details]

select * from Orders
select * from Products




