--Yeni film kaydeden bir prosed�r yaz�n. Filmi kaydederken film ismini, a��klamas�n�, s�resini ve kategorilerini (birden fazla olabilir) bir kerede arg�man olarak prosed�re ge�ebilmeliyim.

GO
ALTER PROC sp_FilmKaydeden
@filmIsmi NVARCHAR(50),
@filmA��klamas� NVARCHAR(50),
@filmS�resi int,
@filmKategorisi NVARCHAR(50),
@sayac int = 0
AS
BEGIN
	IF(@filmIsmi NOT IN (SELECT MovieName FROM Movie)) 
		BEGIN
			INSERT INTO Movie(movieName,Description,Duration) VALUES(@filmIsmi,@filmA��klamas�,@filmS�resi)
	
	/* WHILE(@sayac = 0) */	
	IF(@filmKategorisi NOT IN (SELECT CategoryName FROM Category))
		INSERT INTO Category(CategoryName) VALUES(@filmKategorisi)
	END
END

/* Fazla Kategori ekleme d�ng�s�n� yapamad�m. */

EXEC sp_FilmKaydeden 'Harry Potter','B�y�c�l�k',152,'Fantastik'

SELECT * FROM Category

SELECT * FROM Movie

--Filmlere salon ve seans atamas� yapan bir prosed�r yaz�n. Arg�man olarak film ismi, salon kodu, seans saati ve hafta kodu yazaca��m. E�er ki prosed�re hafta kodu g�nderilmemi�se, salon ve seans atamas� i�inde bulundu�um hafta i�in yap�lacak. E�er ki istenen salonda ilgili saat i�erisinde devam etmekte olan bir film varsa kay�t ger�ekle�memelidir. Ayr�ca atama yapt���m saat, salondaki son g�sterilen filmin biti� saatinden en az 30 dk sonra olmal�d�r. Temizlik�ilere s�re ayr�lmas� gerekti�i i�in bir �nceki g�sterimin bitiminden 30 dk ge�meyen bir atama ger�ekle�tirilmemelidir ve i�lem iptal edilecektir.

GO
CREATE PROC sp_SalonSeans
@filmIsmi NVARCHAR(50),
@saloonsName NVARCHAR(50),
@sessionTime int,
@haftaKodu CHAR(3)
AS
BEGIN

	IF(@haftaKodu = (SELECT Week FROM Movie WHERE GETDATE() BETWEEN WeekFirsDay AND WeekLastDay))
		INSERT INTO Saloons(SaloonsAd�) VALUES (@saloonsName)
		INSERT INTO Session(SessionTime) VALUES(@sessionTime) 
	/* Devam�n� getiremedim..*/
END