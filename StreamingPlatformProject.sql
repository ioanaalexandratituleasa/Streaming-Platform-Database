
CREATE DATABASE dbProject
ON PRIMARY
(NAME = Project,
FILENAME = 'D:\Project.mdf',
SIZE = 10,
MAXSIZE = 40,
FILEGROWTH = 2)
LOG ON
( NAME =  Project_log,
 FILENAME = 'D:\Project_log.ldf',
 SIZE =10,
 MAXSIZE = 20,
 FILEGROWTH = 2)
 GO

 EXEC sp_helpfile
 
use master
DROP DATABASE dbProject
use dbProject
GO
DROP TABLE tblUsers

CREATE TABLE tblUsers(
	E_mails varchar(200) PRIMARY KEY CLUSTERED ,
	FName varchar(35) NOT NULL,
	LName varchar(40) NOT NULL,
	Country varchar(20) NOT NULL,
	Created_at datetime
	) 

CREATE TABLE tblProfiles(
	Profile_ID  INT PRIMARY KEY,
	E_mails varchar(200) NOT NULL,
	Profile_Name varchar(255) NOT NULL,
	P_Language varchar(50) NOT NULL,
	Maturity_level  varchar(15) NOT NULL  
	CHECK(Maturity_level IN('0-7', 'all_ages', '13+', '14+', '16+', '18+')),
  
	CONSTRAINT fk_profiles_users
        FOREIGN KEY (E_mails) REFERENCES tblUsers(E_mails)
        ON DELETE CASCADE ON UPDATE CASCADE
  )
 GO
  
  drop table tblTV_Shows


CREATE TABLE tblTV_Shows(
	Show_ID INT PRIMARY KEY CLUSTERED,
	S_Description TEXT NOT NULL,
	Release_year varchar(30),
	Title  varchar(40) NOT NULL,
	Maturity_level  varchar(15) NOT NULL
	CHECK(Maturity_level IN('0-7', 'all_ages', '13+', '14+', '16+', '18+')),
	Review_grade varchar(5),
	)

CREATE TABLE tblSeasons(
	Season_ID varchar(8) PRIMARY KEY,
	Show_ID INT NOT NULL,
	Season_Number int NOT NULL,
	Release_year int,
	
	CONSTRAINT FK_SEASON_SHOWS
		FOREIGN KEY(Show_ID) REFERENCES tblTV_Shows(Show_ID)
		ON DELETE CASCADE ON UPDATE CASCADE
	)
drop table tblSubscription
CREATE TABLE tblSubscription(
	Subscription_ID INT PRIMARY KEY,
	E_mails varchar(200) NOT NULL,
	S_Start_date datetime,
	S_End_date datetime,
	S_Status  varchar(15) NOT NULL 
	CHECK(S_Status IN('Active', 'Expired', 'Pending', 'Cancelled')),
	CONSTRAINT fk_subscription_users
		FOREIGN KEY(E_mails) REFERENCES tblUsers(E_mails)
		ON DELETE CASCADE ON UPDATE CASCADE
	)

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('andrei.popescu@gmail.com','Andrei','Popescu','Romania','2023-01-15 08:30:00')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('maria.ionescu@yahoo.com','Maria','Ionescu','Romania','2024-06-20 14:45:10')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('george.stanescu@outlook.com','George','Stanescu','Romania','2022-12-31 23:59:59')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('ioana.dumitru@gmail.com','Ioana','Dumitra','Romania','2025-03-05 00:15:30')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('vlad.tudor@hotmail.com','Vlad','Tudor','Romania','2021-09-10 19:20:00')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('alina.matei@yahoo.com','Alina','Matei','Romania','2020-04-01 12:00:00')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('cristian.neagu@gmail.com','Cristian','Neagu','Romania','2023-11-08 07:10:45')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('bianca.iliescu@outlook.com','Bianca','Iliescu','Romania','2024-02-29 16:25:00')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('razvan.enache@gmail.com','Razvan','Enache','Romania','2022-07-21 21:05:05')

INSERT INTO tblUsers
(E_mails, FName, LName, Country, Created_at)
VALUES
('teodora.voicu@yahoo.com','Teodora','Voicu','Romania','2026-10-12 03:45:59')

SELECT * FROM tblUsers
 exec sp_help tblClients

 INSERT INTO tblProfiles
 (Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
 VALUES
 ('1','andrei.popescu@gmail.com', 'Engleza','13+','Andrei’s Corner')

  INSERT INTO tblProfiles
 (Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
 VALUES
 ('2','maria.ionescu@yahoo.com','Romana','16+','Maria Movie Zone')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('3','george.stanescu@outlook.com', 'Romana','18+','MovieMania')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('4','ioana.dumitru@gmail.com','Spaniola','all_ages','Ioana')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('5','vlad.tudor@hotmail.com', 'Engleza','18+','Vlad')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('6','alina.matei@yahoo.com','Romana','0-7','Alina')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('7','cristian.neagu@gmail.com', 'Romana','14+','PopcornMaster')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('8','bianca.iliescu@outlook.com', 'Engleza','16+','ReginaSerialelor')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('9','razvan.enache@gmail.com', 'Engleza','18+','Razvan')

  INSERT INTO tblProfiles
(Profile_ID, E_mails,  P_Language, Maturity_level, Profile_Name)
VALUES
 ('10','teodora.voicu@yahoo.com','Spaniola','16+','CinematicVibes')

 SELECT * FROM tblProfiles
 

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('1', 'Aang, ultimul "Înduitor al Aerului" și singurul Avatar, trebuie să stăpânească cele patru elemente (apă, pământ, foc, aer) pentru a salva lumea de națiunea Războiului.', '2024', 'Avatar: The Last Airbender', 'all_ages', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('2', 'Șase adolescenți participă într-o tabără de aventuri exclusivă pe Isla Nublar, dar se trezesc blocați și trebuie să supraviețuiască printre dinozaurii evadați.', '2020', 'Jurassic World: Camp Cretaceous', 'all_ages', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('3', 'O tânără zână, Bloom, descoperă că are puteri extraordinare la o școală magică numită Alfea, unde învață să-și controleze magia și să lupte împotriva unor forțe periculoase.', '2021', 'Fate: The Winx Saga', '13+', '7')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('4', 'Povestea lui Anne Shirley, o orfană exuberantă și plină de imaginație, adoptată din greșeală de un frate și o soră mai în vârstă.', '2017', 'Anne with an E', '13+', '9')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('5', 'În anii 80, un grup de copii și o adolescentă cu puteri telekinetice se luptă cu forțe supranaturale dintr-o dimensiune paralelă și cu experimente guvernamentale secrete.', '2016', 'Stranger Things', '16+', '9')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('6', 'Wednesday Addams, excentrica fiică a familiei Addams, investighează o serie de crime înfiorătoare în timp ce încearcă să navigheze viața la Academia Nevermore.', '2022', 'Wednesday', '14+', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('7', 'După moarte, o femeie egoistă ajunge din greșeală în „Locul cel Bun” (paradis) și încearcă să-și ascundă adevărata identitate pentru a nu fi trimisă în „Locul cel Rău”.', '2016', 'The Good Place', '13+', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('8', 'Trei frați orfani, Baudelaire, sunt trimiși la o serie de tutori ciudați în timp ce sunt urmăriți constant de maleficul Conte Olaf, care vrea averea lor.', '2017', 'A Series of Unfortunate Events', '13+', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('9', 'Geralt din Rivia, un vânător de monștri mutant, navighează pe un continent plin de intrigi politice și creaturi malefice, legându-și destinul de o prințesă misterioasă.', '2019', 'The Witcher', '18+', '8')

 INSERT INTO tblTV_Shows
 (Show_ID, S_Description, Release_year, Title, Maturity_level, Review_grade)
 VALUES
 ('10', 'Urmărește viața lui Sam, un adolescent de 18 ani cu tulburare de spectru autist, care decide că este timpul să găsească dragostea, schimbând dinamica întregii sale familii.', '2017', 'Atypical', '14+', '8')

 SELECT * FROM tblTV_Shows

 INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('1', '1', '1', '2024')

  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('2', '2', '1', '2020'),
 ('3', '2', '2', '2021'),
 ('4', '2', '3', '2021'),
 ('5', '2', '4', '2021'),
 ('6', '2', '5', '2022');

  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('7', '3', '1', '2021'),
 ('8', '3', '2', '2022');


  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('9', '4', '1', '2017'),
 ('10', '4', '2', '2018'),
 ('11', '4', '3', '2019');


  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('12', '5', '1', '2016'),
 ('13', '5', '2', '2017'),
 ('14', '5', '3', '2019'),
 ('15', '5', '4', '2022'),
 ('16', '5', '5', '2025')




  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('17', '6', '1', '2022'),
 ('18', '6', '2', '2025');



  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('19', '7', '1', '2016'),
 ('20', '7', '2', '2017'),
 ('21', '7', '3', '2019'),
 ('22', '7', '4', '2022');



  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('23', '8', '1', '2017'),
 ('24', '8', '2', '2018'),
 ('25', '8', '3', '2019');



  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('26', '9', '1', '2019'),
 ('27', '9', '2', '2021'),
 ('28', '9', '3', '2023');

  INSERT INTO tblSeasons (Season_ID, Show_ID, Season_Number, Release_year) 
 VALUES
 ('29', '10', '1', '2017'),
 ('30', '10', '2', '2018'),
 ('31', '10', '3', '2019'),
 ('32', '10', '4', '2021');

 SELECT  Season_ID, Show_ID, Season_Number,Release_year
FROM tblSeasons
ORDER BY Show_ID ASC, Season_Number ASC;

INSERT INTO tblSubscription (Subscription_ID, E_Mails, S_Start_date, S_End_date, S_Status) VALUES
(1, 'andrei.popescu@gmail.com', '2024-11-01', '2025-11-01', 'Active'),
(2, 'maria.ionescu@yahoo.com', '2023-12-20', '2024-12-20', 'Active'),
(3, 'george.stanescu@outlook.com', '2024-08-15', '2025-02-15', 'Active'), 
(4, 'ioana.dumitru@gmail.com', '2023-09-01', '2024-09-01', 'Expired'),
(5, 'vlad.tudor@hotmail.com', '2024-03-10', NULL, 'Pending'),
(6, 'alina.matei@yahoo.com', '2025-01-01', '2026-01-01', 'Active'),
(7, 'cristian.neagu@gmail.com', '2022-05-05', '2023-05-05', 'Cancelled'),
(8, 'bianca.iliescu@outlook.com', '2024-12-01', '2025-12-01', 'Active'),
(9, 'razvan.enache@gmail.com', '2023-06-15', '2024-06-15', 'Expired'),
(10, 'teodora.voicu@yahoo.com', '2024-07-01', '2025-07-01', 'Active');


--1.Seriale Sortate după Rating, Afișând Anul Lansării Primului Sezon
SELECT TOP 10 T.Title, T.Review_grade, S.Release_year AS First_Season_Year
FROM tblTV_Shows T
INNER JOIN
tblSeasons S ON T.Show_ID = S.Show_ID
WHERE S.Season_Number = 1 
ORDER BY CAST(T.Review_grade AS DECIMAL(2,1)) DESC, T.Title;


--2.Detalii despre Profilurile Utilizatorilor cu Abonamente Active
SELECT U.FName + ' ' + U.LName 
AS Full_Name, P.Profile_Name, S.S_End_date
FROM tblUsers U
INNER JOIN tblProfiles P ON U.E_mails = P.E_mails
INNER JOIN tblSubscription S ON U.E_mails = S.E_mails
WHERE
S.S_Status = 'Active'
ORDER BY S.S_End_date ASC;


--3.Seriale Vizionabile de Profilul cu Limba 'Engleză', 
--sortate după nivelul de maturitate al serialului
SELECT P.Profile_Name,P.Maturity_level AS Profile_Maturity,
       T.Title AS Show_Title,
       T.Maturity_level AS Show_Maturity
FROM tblProfiles P
INNER JOIN tblTV_Shows T ON
        CASE P.Maturity_level
            WHEN '0-7' THEN 0
            WHEN 'all_ages' THEN 7
            WHEN '13+' THEN 13
            WHEN '14+' THEN 14
            WHEN '16+' THEN 16
            WHEN '18+' THEN 18
        END
        >=
        CASE T.Maturity_level
            WHEN '0-7' THEN 0
            WHEN 'all_ages' THEN 7
            WHEN '13+' THEN 13
            WHEN '14+' THEN 14
            WHEN '16+' THEN 16
            WHEN '18+' THEN 18
        END
WHERE
    P.P_Language = 'Engleza'
ORDER BY
    P.Profile_Name, T.Maturity_level DESC;


--4.Numărul de Sezoane per Serial
SELECT T.Title, COUNT(S.Season_ID) AS Total_Seasons
FROM tblTV_Shows T
INNER JOIN tblSeasons S ON T.Show_ID = S.Show_ID
GROUP BY T.Title
ORDER BY Total_Seasons DESC;


--5.Distribuția Profilurilor după Limba Preferată
SELECT P_Language,COUNT(Profile_ID) AS Number_of_Profiles
FROM tblProfiles
GROUP BY P_Language
HAVING COUNT(Profile_ID) >= 1
ORDER BY Number_of_Profiles DESC;

--6.Contorizarea Abonamentelor după Status
SELECT S_Status, COUNT(Subscription_ID) AS Total_Subscriptions
FROM tblSubscription
GROUP BY S_Status;


--7.Utilizatorii cu Abonamente Expirate sau Anulate

SELECT U.FName, U.LName, S.S_Status
FROM tblUsers U
INNER JOIN tblSubscription S ON U.E_mails = S.E_mails
WHERE S.S_Status IN ('Expired', 'Cancelled');

--8.Sezoanele Lansate după Anul 2020
SELECT  Season_ID, Show_ID, Season_Number, Release_year
FROM tblSeasons
WHERE Release_year >= 2021
ORDER BY Release_year ASC, Season_Number ASC;

--9.Titlurile Serialelor cu Nivel de Maturitate '13+' și Rating Mare
SELECT Title,Review_grade
FROM tblTV_Shows
WHERE Maturity_level = '13+' AND CAST(Review_grade AS INT) >= 8;

--10.Afișarea Profilurilor cu Limba Spaniolă
SELECT P.Profile_Name, P.E_mails
FROM tblProfiles P
WHERE P.P_Language = 'Spaniola';