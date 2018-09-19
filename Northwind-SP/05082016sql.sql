----------------------------------------------�DEV------------------------------------------------------
--1--Ad�n� yazd���m �r�ne ait ciromu hesaplayan proc ?

GO
CREATE PROC sp_CiroHesapla
@�r�nad� NVARCHAR(50)
AS
BEGIN
	SELECT ProductName,SUM(Quantity*od.UnitPrice*(1-discount)) kazan� FROM Products p
		JOIN [Order Details] od ON p.ProductID =od.ProductID
		WHERE @�r�nad� = ProductName
		GROUP BY ProductName
END

EXEC sp_CiroHesapla'Chai'

--2--Ad�n� yazd���m �r�n� veritaban�na kaydeden, e�er ayn� isimde kay�t varsa kaydetmeyip o isimdeki �r�n kayd�n� sonu� olarak d�nd�ren proc yaz�n�z.

GO
CREATE PROC sp_urunKaydi
@�r�nAd� NVARCHAR(50)
AS
BEGIN	
	IF(@�r�nAd� NOT IN (SELECT ProductName FROM Products))
		BEGIN
			INSERT INTO Products(ProductName)  VALUES (@�r�nAd�)
	END
	ELSE
		BEGIN
			SELECT * FROM Products WHERE @�r�nAd� = ProductName 
	END 
END

EXEC sp_urunKaydi 'Nugget'

SELECT * FROM Products


--3--Belirsiz say�da �r�n� ismim �r�nler tablosuna insert eden proc yaz�n�z.

GO
ALTER PROC sp_Belirsiz
@sayac int = 0,
@�r�nismi NVARCHAR(20),
@istenilensayi int
AS
BEGIN
		WHILE(@sayac <= @istenilensayi)
			BEGIN
				INSERT INTO Products(ProductName) SELECT(@�r�nismi)
			END
				SET @sayac = @sayac + 1
END

EXEC sp_Belirsiz 'Nugget' ,5

--4--Parametre olarak kategori ad� ve �r�n ad� alan PROC yaz�n�z. Ad� girilen kategori yoksa eklenecek,ad� girilen �r�n yoksa eklenecek ve �r�n�n kategoriID si ad�n� yazd���m kategorinin ID'si olacak.

GO
CREATE PROC sp_Kategori�r�n
@�r�nAd� NVARCHAR(50),
@katAd� NVARCHAR(50)
AS
BEGIN
	IF(@�r�nAd� NOT IN (SELECT ProductName FROM Products))
		BEGIN
			INSERT INTO Products(ProductName)  VALUES (@�r�nAd�)
	END
	IF(@katAd� NOT IN (SELECT CategoryName FROM Categories))
		BEGIN
			INSERT INTO Categories(CategoryName) VALUES(@katAd�)
			--UPDATE Categories SET CategoryID = @katAd�.CategoryID
	END
END

	

--5--EXTRA : Idsini ve miktar�n� yazd���m �r�n�, yine Id'sini yazd���m m��terime sipari� olu�turan PROC yaz�n�z.

GO
CREATE PROC sp_IdMiktarSiparis
@�r�nId1 int,
@�r�nMiktar int,
@m��teriId NVARCHAR(20)
AS
BEGIN
	INSERT INTO (SELECT * FROM Products p 
		JOIN [Order Details] od ON P.ProductID = OD.ProductID
		JOIN Orders O ON  O.OrderID = OD.OrderID
		JOIN Customers C ON C.CustomerID = O.CustomerID	
		WHERE @�r�nId1 = P.ProductId AND @m��teriId = c.CustomerID)(Od.Quantity) VALUES(@�r�nMiktar)		
END

EXEC sp_IdMiktarSiparis 2,3,'ALFKI'


/*
	  NOT :	1 ve 2 tamam
		  :	4 eksik ID kodunu anlayamad�m. 
		  : 3 ve 5 ile u�ra�t�m ama sonucu elde edemedim.
*/