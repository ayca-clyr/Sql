--Yeni film kaydeden bir prosedür yazýn. Filmi kaydederken film ismini, açýklamasýný, süresini ve kategorilerini (birden fazla olabilir) bir kerede argüman olarak prosedüre geçebilmeliyim.

GO
ALTER PROC sp_FilmKaydeden
@filmIsmi NVARCHAR(50),
@filmAçýklamasý NVARCHAR(50),
@filmSüresi int,
@filmKategorisi NVARCHAR(50),
@sayac int = 0
AS
BEGIN
	IF(@filmIsmi NOT IN (SELECT MovieName FROM Movie)) 
		BEGIN
			INSERT INTO Movie(movieName,Description,Duration) VALUES(@filmIsmi,@filmAçýklamasý,@filmSüresi)
	
	/* WHILE(@sayac = 0) */	
	IF(@filmKategorisi NOT IN (SELECT CategoryName FROM Category))
		INSERT INTO Category(CategoryName) VALUES(@filmKategorisi)
	END
END

/* Fazla Kategori ekleme döngüsünü yapamadým. */

EXEC sp_FilmKaydeden 'Harry Potter','Büyücülük',152,'Fantastik'

SELECT * FROM Category

SELECT * FROM Movie

--Filmlere salon ve seans atamasý yapan bir prosedür yazýn. Argüman olarak film ismi, salon kodu, seans saati ve hafta kodu yazacaðým. Eðer ki prosedüre hafta kodu gönderilmemiþse, salon ve seans atamasý içinde bulunduðum hafta için yapýlacak. Eðer ki istenen salonda ilgili saat içerisinde devam etmekte olan bir film varsa kayýt gerçekleþmemelidir. Ayrýca atama yaptýðým saat, salondaki son gösterilen filmin bitiþ saatinden en az 30 dk sonra olmalýdýr. Temizlikçilere süre ayrýlmasý gerektiði için bir önceki gösterimin bitiminden 30 dk geçmeyen bir atama gerçekleþtirilmemelidir ve iþlem iptal edilecektir.

GO
CREATE PROC sp_SalonSeans
@filmIsmi NVARCHAR(50),
@saloonsName NVARCHAR(50),
@sessionTime int,
@haftaKodu CHAR(3)
AS
BEGIN

	IF(@haftaKodu = (SELECT Week FROM Movie WHERE GETDATE() BETWEEN WeekFirsDay AND WeekLastDay))
		INSERT INTO Saloons(SaloonsAdý) VALUES (@saloonsName)
		INSERT INTO Session(SessionTime) VALUES(@sessionTime) 
	/* Devamýný getiremedim..*/
END