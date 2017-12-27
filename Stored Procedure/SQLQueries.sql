--2--istenen tiyatronun oyun �creti
CREATE PROCEDURE PahaliUcret
 @name nvarchar(50)=NULL
AS
SELECT max (Diary.Price)
FROM Diary,Production
WHERE  Diary.PName IN
(select PName from Production where  Production.CName=@name)
GO
exec PahaliUcret @name ='BKM' 


--3--tiyatrolar�n sergiledi�i oyun say�s�
CREATE FUNCTION OyunSayisi
(@name nvarchar(50))
RETURNS int
AS
BEGIN
declare @Return int
SELECT @Return= count(*)
FROM Production
WHERE Production.CName=@name
return @return
end

--fonksiyon �al��t�rma
DECLARE @name nvarchar(50)
SET @name ='SehirTiyatrosu'
SELECT dbo.OyunSayisi(@name)

--4--istenen tiyatronun g�sterim tarihleri tablosu

CREATE VIEW Gosterim AS
SELECT (Diary.Date)
FROM Diary
WHERE  Diary.PName IN(select PName from Production where  Production.CName='DevletDiyatrosu')


--view calistirma

SELECT * FROM Gosterim


--5--eskisehirdeki istenen tiyatronun sergiledi�i oyunlar fonksiyonu

CREATE FUNCTION Oyun�smi
(@name nvarchar(50),
 @country nvarchar(50) )
RETURNS TABLE
AS
RETURN
SELECT PName AS Production_Name
FROM Production
WHERE Production.CName IN (select CName from Company where Company.CName=@name and Company.Country=@country)
GO

--fonksiyonu calistir
SELECT * from dbo.Oyun�smi('SehirTiyatrosu','Eskisehir')



--6--istenen y�netmenin y�netti�i oyunlar�n t�m �cretleri procedure

CREATE PROCEDURE yonetmenucret
 @name nvarchar(50)=NULL
AS
SELECT (Diary.Price)
FROM Diary
WHERE  Diary.PDirector=@name
GO

--procedure calistir
exec yonetmenucret @name ='Haldun Dormen' 

--7--Ankarada sergilenen t�m oyunlar fonksiyonu

CREATE FUNCTION SehirOyun

(@country nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
declare @Return nvarchar(50)
SELECT @Return= Production.PName
FROM Production
WHERE Production.CName IN (select CName from Company where Company.Country=@country)
return @return
end

--fonksiyonu calistir
DECLARE @country nvarchar(50)
SET @country ='Konya'
SELECT dbo.SehirOyun(@country)


--8--istenen tarihteki ve �cretteki oyunlar�n isimleri ve y�netmenlerini getir procedure

CREATE PROCEDURE OyunYonetmen
 @date datetime,
 @price int
AS
SELECT Diary.PName As ProducName,Diary.PDirector As PDirector
FROM Diary
WHERE Date=@date and Price<@price; 
GO

--fonksiyon calistirma
exec OyunYonetmen @date ='2016-06-07',@price=500 

--9--6daki procedure � Date i de parametre olarak g�ncelle

Alter PROCEDURE yonetmenucret
 @name nvarchar(50)=NULL,
 @date datetime
AS
SELECT (Diary.Price)
FROM Diary
WHERE  Diary.PDirector=@name
AND  Diary.Date=@date
GO

--calistir

exec yonetmenucret @name ='Haldun Dormen' ,@date='2016-12-13'

--10--4daki procedure � Director i de parametre olarak g�ncelle

alter VIEW Gosterim AS
SELECT (Diary.Date)
FROM Diary
WHERE  Diary.PName IN(select PName from Production where  Production.CName='DevletDiyatrosu')



SELECT * FROM Gosterim




