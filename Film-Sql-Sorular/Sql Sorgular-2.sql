--1. Tüm filmleri izlesem ne kadar sürer? (Dakika olarak | Saat olarak | Gün olarak)

SELECT SUM(Duration) / 1440 Gün ,(sum(duration) %1440) / 60 Saat, (sum(duration) %60) Dakika FROM movie

--2. Filmlerin aldýðý ortalama puan için View yazýn (55 | Alpha Beta | 7.4)

GO
ALTER VIEW vw_OrtalamaPaun
AS
	SELECT  M.Name,CONVERT(decimal(2,1) ,AVG(CONVERT(float ,Rate))) OrtalamaPuan FROM Rating r
		JOIN movie m ON R.MovieId = M.Id
		GROUP BY M.Name

SELECT * FROM vw_OrtalamaPaun

--3. En genç yaþta yönetmenlik yapan kiþi kimdir?

SELECT TOP 1 FirstName,LastName FROM Duty D
	JOIN MoviePerson MP ON D.Id = MP.MovieId
	JOIN Person P ON MP.MovieId = P.Id
	WHERE d.Id = 1
	ORDER BY DateOfBirth DESC

--4. Ray Malifalitiko'nun son oynadýðý filmdeki rolü nedir?

SELECT TOP 1 mp.PerformedAs,m.Name FROM Movie m
	JOIN MoviePerson mp ON MP.MovieId = M.Id
	JOIN Person p ON P.ID = MP.PersonId
	WHERE p.FirstName +' '+p.LastName= 'Ray Malifalitiko'
	ORDER BY m.Year DESC
		
--5. 2003 yýlýnda çekilmiþ filmlerin aktrisleri ve rolleri nelerdir?

SELECT m.Name,mp.PerformedAs,d.name FROM Movie m
	JOIN MoviePerson mp ON MP.MovieId = M.Id
	JOIN Duty D ON MP.DutyId = D.Id
	JOIN Person P ON mp.PersonId = p.Id
	JOIN GENDER g ON g.Id = p.GenderId
	WHERE m.Year = '2003' AND  p.GenderId = 1
	GROUP BY m.Name,mp.PerformedAs,d.name

--6. En meraklý izleyicim kimdir? (En çok oy veren Kullanýcý)  

SELECT r.Rate,mp.PerformedAs,u.Username FROM MoviePerson mp
	JOIN Movie m ON mp.MovieId = m.Id
	JOIN Rating r ON r.MovieId = m.Id
	JOIN [User] u ON r.UserId = u.Id
	GROUP BY mp.PerformedAs,u.Username,r.Rate
	ORDER BY r.Rate DESC 

--7. Kayýtlý filmlere ortalama kaç tane oy veriliyor?

SELECT COUNT(*)/COUNT(DISTINCT(MovieId)) FROM Rating

--8. Hangi filmlerin yazar sayýsý 2 ve daha fazladýr?

SELECT M.Name FROM Movie m
	JOIN MoviePerson mp ON m.Id = mp.MovieId
	JOIN Duty d ON Mp.DutyId = D.Id
	WHERE  d.Id = 2
	GROUP BY m.Name
	HAVING  COUNT(d.Id) >= 2

--9. Bir filmde oyunculuk (Star, Performer) dýþýnda da görev alan kiþiler kimlerdir?
  -- (Kiþi adý ve film adý þeklinde getirin)

SELECT p.FirstName +' ve '+m.Name FROM Movie m
	JOIN MoviePerson mp ON m.Id =mp.MovieId
	JOIN Duty d ON d.Id = mp.DutyId
	JOIN Person P ON MP.PersonId = p.Id
	WHERE d.Name =  'Star' OR d.name = 'Performer' 
	AND d.name IN ('Writer','Director')  

/*
SELECT 
	CASE d.Name
		WHEN d.Name = 'Star' AND d.Name IN('Writter','Director','Performer') THEN m.Name
		WHEN d.Name = 'Performer' AND d.Name IN('Writter','Director','Star') THEN m.Name
		END
	FROM (SELECT * FROM Movie m
	JOIN MoviePerson mp ON m.Id =mp.MovieId
	JOIN Duty d ON d.Id = mp.DutyId
	JOIN Person P ON MP.PersonId = p.Id
	WHERE d.Name =  'Star' OR d.name = 'Performer' 
	AND d.name IN ('Writer','Director'))
*/

--10.Türlere göre film sayýsý daðýlýmý nasýl?
	--1. Romance | 12
	--2. Horror | 4
	--gibi

SELECT  g.Id, g.Name,COUNT(*) FROM Genre g
	JOIN Movie_Genre mg ON g.Id = mg.GenreId
	JOIN Movie m ON m.Id = mg.MovieId
	GROUP BY g.Name,g.Id
		
--11.En çok baþrol oynayan Aktör kimdir? 

SELECT TOP 1 COUNT(*) [baþrol], p.FirstName FROM Gender g
	JOIN Person p ON g.Id = p.GenderId
	JOIN MoviePerson mp ON mp.PersonId = p.Id
	JOIN Duty d ON D.Id = MP.DutyId
	JOIN Movie m ON M.ID= mp.MovieId
	WHERE g.Id = 2 AND d.name = 'Star'
	GROUP BY p.FirstName
	ORDER BY [baþrol] DESC
	
--12.Kemal Sunal rolünde oynayan aktör ve oynadýðý film hangisidir?

SELECT p.FirstName +' '+p.LastName, m.Name FROM Movie m
	JOIN MoviePerson mp ON m.Id = mp.MovieId 
	JOIN Person p ON p.Id = mp.PersonId
	JOIN Gender g ON g.Id = p.GenderId
	WHERE mp.PerformedAs = 'Kemal Sunal' AND g.Id = 2

--**********

--13.Hiçbir filmde görev almamýþ kiþiler kimlerdir?

SELECT mp.Id,mp.MovieId,mp.PersonId FROM Movie m
	LEFT JOIN MoviePerson mp ON m.Id = mp.MovieId
	JOIN Person p ON mp.PersonId = p.Id
	JOIN Duty d ON d.Id = mp.DutyId
	WHERE  mp.PerformedAs IS NULL 

--14.Þu ana kadar sadece yönetmenlik yapmýþ kiþiler kimlerdir?

SELECT  PersonId,p.FirstName+' '+p.LastName  From Person p
JOIN MoviePerson mp on mp.PersonId=p.Id
JOIN Duty d on d.Id=mp.DutyId
--WHERE d.Id=1  AND ?

--15.Doðuþtan yýldýz olan kiþiler kimlerdir? (Yalnýzca baþrol oynamýþ olanlar)

SELECT  PersonId,p.FirstName+' '+p.LastName  From Person p
JOIN MoviePerson mp on mp.PersonId=p.Id
JOIN Duty d on d.Id=mp.DutyId
--WHERE d.Id=3 AND (SELECT  FROM ?)

--16.Ne iþ olsa yaparým abi diyenler kimler? (Her görevde bulunmuþ kiþiler)

SELECT * FROM Person p
	JOIN MoviePerson mp ON p.Id = mp.PersonId
	JOIN Duty d ON d.Id = mp.MovieId
	--WHERE mp.DutyId IN(SELECT mp.DutyId FROM Duty WHERE   )

	
--17. Adýný girdiðim oyunucunun filmlerini listeleyen SP yazýnýz.

GO
ALTER PROC sp_OyuncuFilmleri
@oyuncuAdý NVARCHAR(50)
AS
BEGIN
	SELECT DISTINCT m.Name FROM Movie m
		JOIN MoviePerson  mp ON m.Id = mp.MovieId
		JOIN Person p ON p.Id = mp.PersonId 
		WHERE @oyuncuAdý = p.FirstName
END

EXEC sp_OyuncuFilmleri 'Nasim'


--18. Bir filme oyuncu ekleyen SP yazýnýz. (Oyuncu yoksa ekleyecek)

GO
ALTER PROC sp_FilmOYuncu
@oyuncuAdý NVARCHAR(50),
@oyuncuSoyadý NVARCHAR(50)
AS
BEGIN
	IF(@oyuncuAdý +' '+ @oyuncuSoyadý NOT IN (SELECT  FirstName+ ' '+LastName Oyuncular FROM Person))
		BEGIN 
			INSERT INTO Person(FirstName,LastName) VALUES(@oyuncuAdý,@oyuncuSoyadý)
			INSERT INTO MoviePerson(MovieId,PersonId) VALUES((SELECT m.Id FROM Person p
														JOIN MoviePerson mp ON mp.PersonId= p.Id  
														JOIN Movie m ON m.Id = mp.MovieId 
														WHERE FirstName +' ' +LastName =@oyuncuAdý +' '+ @oyuncuSoyadý ),																(SELECT p.Id FROM Person p
														JOIN MoviePerson mp ON mp.PersonId= p.Id  
														JOIN Movie m ON m.Id = mp.MovieId 
														WHERE FirstName +' ' +LastName =@oyuncuAdý +' '+ @oyuncuSoyadý))
	END 
END

EXEC sp_FilmOYuncu 'Ayça', 'Calayýr' 

SELECT * FROM MoviePerson

SELECT * FROM Person

--19.1  Bir filme belirsiz sayýda oyuncu ekleyen SP yazýnýz. (Oyuncu yoksa ekleyecek)



--20. Bir oyuncunun birden fazla karakteri canlandýrdýðý filmlerle ilgilenen kullanýcýlarýmý listeleyen SP yazýnýz.
GO
CREATE PROC sp_CokKarakter

AS
BEGIN
	SELECT mP.PersonId, COUNT(mp.PerformedAs) FROM Person p
		JOIN MoviePerson mp ON mp.PersonId = p.Id
		JOIN Movie m ON m.Id = mp.MovieId
		JOIN Rating r ON r.MovieId = m.Id
		JOIN [User] u ON u.Id = R.UserId
		GROUP BY mp.PersonId
		HAVING COUNT(mp.PerformedAs) >= 2
	
		
END 

--21. Devam filminde daha az puan almýþ filmlerimi listeleyen SP yazýnýz.
	
GO
CREATE PROC sp_DevamFilm
AS
BEGIN
	IF((SELECT DISTINCT m.Name, SUM(r.Rate) ToplamOy FROM Movie m
		JOIN Rating r ON r.MovieId = m.Id
		WHERE m.ContinuationOf IS NOT NULL
		GROUP BY m.Name) < (SELECT m.Name,SUM(r.Rate) ToplamOy FROM Movie m
		JOIN Rating r ON r.MovieId = m.Id
		WHERE m.ýd IN (m.ContinuationOf)  
		GROUP BY M.Name))
		BEGIN
			SELECT Name FROM Movie
	END	
END