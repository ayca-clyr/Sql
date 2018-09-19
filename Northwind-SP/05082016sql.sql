----------------------------------------------ÖDEV------------------------------------------------------
--1--Adýný yazdýðým ürüne ait ciromu hesaplayan proc ?

GO
CREATE PROC sp_CiroHesapla
@ürünadý NVARCHAR(50)
AS
BEGIN
	SELECT ProductName,SUM(Quantity*od.UnitPrice*(1-discount)) kazanç FROM Products p
		JOIN [Order Details] od ON p.ProductID =od.ProductID
		WHERE @ürünadý = ProductName
		GROUP BY ProductName
END

EXEC sp_CiroHesapla'Chai'

--2--Adýný yazdýðým ürünü veritabanýna kaydeden, eðer ayný isimde kayýt varsa kaydetmeyip o isimdeki ürün kaydýný sonuç olarak döndüren proc yazýnýz.

GO
CREATE PROC sp_urunKaydi
@ürünAdý NVARCHAR(50)
AS
BEGIN	
	IF(@ürünAdý NOT IN (SELECT ProductName FROM Products))
		BEGIN
			INSERT INTO Products(ProductName)  VALUES (@ürünAdý)
	END
	ELSE
		BEGIN
			SELECT * FROM Products WHERE @ürünAdý = ProductName 
	END 
END

EXEC sp_urunKaydi 'Nugget'

SELECT * FROM Products


--3--Belirsiz sayýda ürünü ismim ürünler tablosuna insert eden proc yazýnýz.

GO
ALTER PROC sp_Belirsiz
@sayac int = 0,
@ürünismi NVARCHAR(20),
@istenilensayi int
AS
BEGIN
		WHILE(@sayac <= @istenilensayi)
			BEGIN
				INSERT INTO Products(ProductName) SELECT(@ürünismi)
			END
				SET @sayac = @sayac + 1
END

EXEC sp_Belirsiz 'Nugget' ,5

--4--Parametre olarak kategori adý ve ürün adý alan PROC yazýnýz. Adý girilen kategori yoksa eklenecek,adý girilen ürün yoksa eklenecek ve ürünün kategoriID si adýný yazdýðým kategorinin ID'si olacak.

GO
CREATE PROC sp_KategoriÜrün
@ürünAdý NVARCHAR(50),
@katAdý NVARCHAR(50)
AS
BEGIN
	IF(@ürünAdý NOT IN (SELECT ProductName FROM Products))
		BEGIN
			INSERT INTO Products(ProductName)  VALUES (@ürünAdý)
	END
	IF(@katAdý NOT IN (SELECT CategoryName FROM Categories))
		BEGIN
			INSERT INTO Categories(CategoryName) VALUES(@katAdý)
			--UPDATE Categories SET CategoryID = @katAdý.CategoryID
	END
END

	

--5--EXTRA : Idsini ve miktarýný yazdýðým ürünü, yine Id'sini yazdýðým müþterime sipariþ oluþturan PROC yazýnýz.

GO
CREATE PROC sp_IdMiktarSiparis
@ürünId1 int,
@ürünMiktar int,
@müþteriId NVARCHAR(20)
AS
BEGIN
	INSERT INTO (SELECT * FROM Products p 
		JOIN [Order Details] od ON P.ProductID = OD.ProductID
		JOIN Orders O ON  O.OrderID = OD.OrderID
		JOIN Customers C ON C.CustomerID = O.CustomerID	
		WHERE @ürünId1 = P.ProductId AND @müþteriId = c.CustomerID)(Od.Quantity) VALUES(@ürünMiktar)		
END

EXEC sp_IdMiktarSiparis 2,3,'ALFKI'


/*
	  NOT :	1 ve 2 tamam
		  :	4 eksik ID kodunu anlayamadým. 
		  : 3 ve 5 ile uðraþtým ama sonucu elde edemedim.
*/