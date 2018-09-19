--1--"Jenny Curran" ile ilgili açýklama içeren film hangisidir? Filmin detaylarýný getirin.

SELECT * FROM Movie WHERE Description LIKE '%Jenny Curran%'

--2--32. haftada hangi filmler gösterimdedir? Film detaylarýný sürelerine göre sýralayarak getirin.

SELECT * FROM Movie WHERE Week ='W32' ORDER BY Duration DESC

--3--33. haftada hangi filmler gösterime yeni girmiþtir? (Geçtiðimiz haftadan farklý olarak yeni gösterime giren filmler nelerdir)

SELECT * FROM Movie WHERE week = 'w33' AND MovieName NOT IN (SELECT MovieName FROM Movie WHERE Week ='W32')  

--4--Sinemamdaki salonlarý ve kapasitelerini getirin.

select SaloonsAdý,SalonCapacity from Saloons

--5--Sinemamda toplam kaç salon ve toplam kaç koltuk vardýr?

SELECT SUM(salonCapacity) , COUNT(SaloonsId) FROM Saloons

--6--3 Hafta boyunca kaç farklý film gösterime sunulmuþtur?

SELECT  COUNT(DISTINCT MovieName)  FROM Movie 

--7--3 Hafta boyunca sinema salonlarýmda birbirinden farklý kaç film gösterilmiþtir? Sinema salon bilgileri yanýnda sayý olarak getirin.

SELECT ms.SaloonsId,COUNT(*) FarklýFilmSayýsý,m.Week FROM Movie m
	JOIN Movie_Saloons ms ON m.MovieId = ms.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	GROUP BY ms.SaloonsId,m.Week

--8--Film ile ilgili detaylarý, filmlerin toplam gösterim sayýsýyla birlikte görüntüleyin. Gösterim sayýsýna göre sýralayýn.

SELECT MovieName,COUNT(*) * 7 GösterimSayýsý FROM Movie GROUP BY MovieName ORDER BY GösterimSayýsý DESC

--9--Tüm gösterimleri kapalý giþe oynamasý durumunda 33. ve 34. haftalarýn toplamýnda en çok seyircinin izleyebileceði ilk 3 film hangisidir?

SELECT TOP 3 m.MovieName,SUM(s.SalonCapacity) * 7 izleyiciSayýsý FROM Movie m
	JOIN Movie_Saloons ms ON ms.MovieId = m.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	WHERE m.week IN ('W33','W34') 
	GROUP BY m.MovieName
	ORDER BY izleyiciSayýsý DESC

--10--Salonlarýmda film gösterimi olmayan dakikalarý merak ediyorum. 3 haftalýk dilime ayýrarak salon boþ kalma sürelerini haftalýk gösterim ile ayrý ayrý getirin.

SELECT m.MovieName,M.Week,SUM(Duration) * 7 BosSüre  FROM Movie m
	JOIN Movie_Saloons ms ON ms.MovieId = m.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	WHERE MS.MovieId NOT IN (ms.SaloonsId)
	GROUP BY M.Week,m.MovieName
																									

--11-Temizlik iþçilerimin 3 haftalýk son çýkýþ saatleri nelerdir? (Sinema gösteriminden sonraki 30dk'lýk temizlik süresini hesaba katýnýz)

/* SELECT m.MovieName  FROM Movie m
	JOIN Movie_Session ms ON m.MovieId = ms.MovieId
	JOIN Session s ON s.SessionId = ms.SessionId
	JOIN Movie_Saloons msa ON m.MovieId = ms.MovieId
	JOIN Saloons sa ON sa.SaloonsId = ms.SessionId
	GROUP BY m.MovieName 
	*/


--12--3 ve daha fazla kategoriye sahip filmlerden hangileri bilim kurgu deðildir?

SELECT mc.MovieId,COUNT(mc.CategoryId),m.MovieName FROM  Movie m
	JOIN Movie_Category mc ON mc.MovieId = m.MovieId
	JOIN Category c ON c.CategoryId = mc.CategoryId
	WHERE mc.CategoryId != 7
	GROUP BY mc.MovieId,m.MovieName
	HAVING COUNT(*) >= 3

--13--Hangi filmler güldürürken ayný zamanda düþündürmüþtür? (hem komedi hem de drama olan filmler)

SELECT * FROM Movie M
	JOIN Movie_Category mc ON MC.MovieId = M.MovieId
	JOIN Category c ON c.CategoryId = mc.CategoryId
	WHERE mc.CategoryId IN (2,4)

