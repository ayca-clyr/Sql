--1--Ýçinde bulunduðum haftanýn tüm filmlerini, tüm seanslarýný ve salon detaylarýný getiren bir view oluþturun.

GO
CREATE VIEW vw_BuHaftaFilmleri
AS
	SELECT DISTINCT m.MovieName,s.SessionTime,sa.SaloonsAdý FROM Movie m
		JOIN Movie_Session ms ON m.MovieId = ms.MovieId
		JOIN Session s ON s.SessionId = ms.SessionId
		JOIN Movie_Saloons msa ON  msa.MovieId = m.MovieId
		JOIN Saloons sa ON sa.SaloonsId = msa.SaloonsId
		WHERE GETDATE() <= WeekLastDay AND GETDATE() >= WeekFirsDay 

SELECT * FROM vw_BuHaftaFilmleri

--2--Gelecek hafta gösterime yeni girecek filmleri getiren bir view oluþturun. Filmin hangi salonda ve hangi seansta gösterime gireceðini ayný view üzerinden görebilmeliyim.

GO
CREATE VIEW vw_GelecekHaftaFilmi
AS
	SELECT DATEADD(week,1,GETDATE()) GelecekHaftaFilmleri ,MovieName gelecekHafta FROM Movie WHERE DATEADD(week,1,GETDATE()) >= WeekFirsDay

SELECT * FROM vw_GelecekHaftaFilmi