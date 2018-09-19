--1--��inde bulundu�um haftan�n t�m filmlerini, t�m seanslar�n� ve salon detaylar�n� getiren bir view olu�turun.

GO
CREATE VIEW vw_BuHaftaFilmleri
AS
	SELECT DISTINCT m.MovieName,s.SessionTime,sa.SaloonsAd� FROM Movie m
		JOIN Movie_Session ms ON m.MovieId = ms.MovieId
		JOIN Session s ON s.SessionId = ms.SessionId
		JOIN Movie_Saloons msa ON  msa.MovieId = m.MovieId
		JOIN Saloons sa ON sa.SaloonsId = msa.SaloonsId
		WHERE GETDATE() <= WeekLastDay AND GETDATE() >= WeekFirsDay 

SELECT * FROM vw_BuHaftaFilmleri

--2--Gelecek hafta g�sterime yeni girecek filmleri getiren bir view olu�turun. Filmin hangi salonda ve hangi seansta g�sterime girece�ini ayn� view �zerinden g�rebilmeliyim.

GO
CREATE VIEW vw_GelecekHaftaFilmi
AS
	SELECT DATEADD(week,1,GETDATE()) GelecekHaftaFilmleri ,MovieName gelecekHafta FROM Movie WHERE DATEADD(week,1,GETDATE()) >= WeekFirsDay

SELECT * FROM vw_GelecekHaftaFilmi