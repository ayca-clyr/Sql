--1--"Jenny Curran" ile ilgili a��klama i�eren film hangisidir? Filmin detaylar�n� getirin.

SELECT * FROM Movie WHERE Description LIKE '%Jenny Curran%'

--2--32. haftada hangi filmler g�sterimdedir? Film detaylar�n� s�relerine g�re s�ralayarak getirin.

SELECT * FROM Movie WHERE Week ='W32' ORDER BY Duration DESC

--3--33. haftada hangi filmler g�sterime yeni girmi�tir? (Ge�ti�imiz haftadan farkl� olarak yeni g�sterime giren filmler nelerdir)

SELECT * FROM Movie WHERE week = 'w33' AND MovieName NOT IN (SELECT MovieName FROM Movie WHERE Week ='W32')  

--4--Sinemamdaki salonlar� ve kapasitelerini getirin.

select SaloonsAd�,SalonCapacity from Saloons

--5--Sinemamda toplam ka� salon ve toplam ka� koltuk vard�r?

SELECT SUM(salonCapacity) , COUNT(SaloonsId) FROM Saloons

--6--3 Hafta boyunca ka� farkl� film g�sterime sunulmu�tur?

SELECT  COUNT(DISTINCT MovieName)  FROM Movie 

--7--3 Hafta boyunca sinema salonlar�mda birbirinden farkl� ka� film g�sterilmi�tir? Sinema salon bilgileri yan�nda say� olarak getirin.

SELECT ms.SaloonsId,COUNT(*) Farkl�FilmSay�s�,m.Week FROM Movie m
	JOIN Movie_Saloons ms ON m.MovieId = ms.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	GROUP BY ms.SaloonsId,m.Week

--8--Film ile ilgili detaylar�, filmlerin toplam g�sterim say�s�yla birlikte g�r�nt�leyin. G�sterim say�s�na g�re s�ralay�n.

SELECT MovieName,COUNT(*) * 7 G�sterimSay�s� FROM Movie GROUP BY MovieName ORDER BY G�sterimSay�s� DESC

--9--T�m g�sterimleri kapal� gi�e oynamas� durumunda 33. ve 34. haftalar�n toplam�nda en �ok seyircinin izleyebilece�i ilk 3 film hangisidir?

SELECT TOP 3 m.MovieName,SUM(s.SalonCapacity) * 7 izleyiciSay�s� FROM Movie m
	JOIN Movie_Saloons ms ON ms.MovieId = m.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	WHERE m.week IN ('W33','W34') 
	GROUP BY m.MovieName
	ORDER BY izleyiciSay�s� DESC

--10--Salonlar�mda film g�sterimi olmayan dakikalar� merak ediyorum. 3 haftal�k dilime ay�rarak salon bo� kalma s�relerini haftal�k g�sterim ile ayr� ayr� getirin.

SELECT m.MovieName,M.Week,SUM(Duration) * 7 BosS�re  FROM Movie m
	JOIN Movie_Saloons ms ON ms.MovieId = m.MovieId
	JOIN Saloons s ON s.SaloonsId = ms.SaloonsId
	WHERE MS.MovieId NOT IN (ms.SaloonsId)
	GROUP BY M.Week,m.MovieName
																									

--11-Temizlik i��ilerimin 3 haftal�k son ��k�� saatleri nelerdir? (Sinema g�steriminden sonraki 30dk'l�k temizlik s�resini hesaba kat�n�z)

/* SELECT m.MovieName  FROM Movie m
	JOIN Movie_Session ms ON m.MovieId = ms.MovieId
	JOIN Session s ON s.SessionId = ms.SessionId
	JOIN Movie_Saloons msa ON m.MovieId = ms.MovieId
	JOIN Saloons sa ON sa.SaloonsId = ms.SessionId
	GROUP BY m.MovieName 
	*/


--12--3 ve daha fazla kategoriye sahip filmlerden hangileri bilim kurgu de�ildir?

SELECT mc.MovieId,COUNT(mc.CategoryId),m.MovieName FROM  Movie m
	JOIN Movie_Category mc ON mc.MovieId = m.MovieId
	JOIN Category c ON c.CategoryId = mc.CategoryId
	WHERE mc.CategoryId != 7
	GROUP BY mc.MovieId,m.MovieName
	HAVING COUNT(*) >= 3

--13--Hangi filmler g�ld�r�rken ayn� zamanda d���nd�rm��t�r? (hem komedi hem de drama olan filmler)

SELECT * FROM Movie M
	JOIN Movie_Category mc ON MC.MovieId = M.MovieId
	JOIN Category c ON c.CategoryId = mc.CategoryId
	WHERE mc.CategoryId IN (2,4)

