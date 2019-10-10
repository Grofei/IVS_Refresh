CREATE DATABASE Inventar; 

USE Inventar;

CREATE TABLE t_User
(
UID int Auto_Increment PRIMARY KEY,
Surname varchar(50),
GivenName varchar(50),
Office varchar(50),
Department int,
Sector int,
Account varchar(50),
TelephoneNr varchar(20),
MobilephoneNr varchar(20),
ObjectSid varchar(100),
LastConnect date
);

CREATE TABLE t_Department
(
DID int Auto_Increment PRIMARY KEY,
Description varchar(50)
);

Create TABLE t_Sector
(
SID int Auto_Increment PRIMARY KEY,
Description varchar(30),
StreetAddress varchar(30)
);

CREATE TABLE t_User_Computer
(
UID int NOT NULL,
CID int NOT NULL
);

CREATE TABLE t_Computer
(
CID int Auto_Increment PRIMARY KEY,
Hostname varchar(50),
Model varchar(50),
SN varchar(50),
OS varchar(50),
InstallDate DATE,
RAM double,
MAC varchar(50),
CPU varchar(50),
GPU varchar(50),
Storage double,
DiskCount int,
Delivery date,
Supplier varchar(30),
EndWarranty date,
LastConnect date
);

CREATE TABLE t_Notebook
(
NID int Auto_Increment PRIMARY KEY,
Hostname varchar(50),
Category varchar(50),
Model varchar(50),
SN varchar(50),
OS varchar(50),
InstallDate DATE,
RAM double,
MAC_Ethernet varchar(50),
MAC_Wifi varchar(50),
CPU varchar(50),
GPU varchar(50),
Storage double,
DiskCount int,
DisplayResolutionHeight int,
DisplayResolutionWidth int,
Delivery date,
Supplier varchar(30),
EndWarranty date,
LastConnect date
);

CREATE TABLE t_Notebook_Cat
(
CATID int Auto_Increment PRIMARY KEY,
Description varchar(50)    
);

CREATE TABLE t_User_Notebook
(
UID int NOT NULL,
NID int NOT NULL
);

CREATE TABLE t_Monitor
(
MID int Auto_Increment PRIMARY KEY,
Model varchar(50),
Manufacturer varchar(50),
SN varchar(50),
YoM YEAR,
CID int,
Delivery date,
Supplier varchar(30),
EndWarranty date,
LastConnect date
);

CREATE TABLE t_User_MobileDevice
(
UID int NOT NULL,
MDID int NOT NULL
);

CREATE TABLE t_MobileDevice
(
MDID int Auto_Increment PRIMARY KEY,
Hostname varchar(50),
Model varchar(50),
Seriennummer varchar(50),
IMEI varchar(50),
MAC varchar(50),
LastConnect date
);

CREATE TABLE t_Printer
(
PID int Auto_Increment PRIMARY KEY,
Hostname varchar(50),
SN varchar(50),
Office varchar(50),
Type varchar(50),
Manufacturer varchar(50),
PrintedPages int,
LastConnect date
);

Create TABLE t_Switch
(
SHID int Auto_Increment Primary Key,
SN varchar(50),
Hostname varchar(50),
IP varchar(50),
Model varchar(50),
LastConnect date
);

Create TABLE t_Router
(
RID int Auto_Increment Primary Key,
SN varchar(50),
Hostname varchar(50),
IP varchar(50),
Model varchar(50),
LastConnect date
);

Create TABLE t_Server
(
SVID int Auto_Increment Primary Key,
SN varchar(50),
Hostname varchar(50),
IP varchar(50),
Model varchar(50),
Description varchar(100),
LastConnect date
);

Insert INTO t_Sector(Description,StreetAddress) VALUES("Hochbau", "Wittelsbacherstr. 11");
Insert INTO t_Sector(Description,StreetAddress) VALUES("Straßenbau", "Greidererstr. 6");
Insert INTO t_Sector(Description,StreetAddress) VALUES("SM Ampfing","Waldkraiburger Straße 43c");
Insert INTO t_Sector(Description,StreetAddress) VALUES("SM Ebersberg","Wasserbrugerstraße 4");
Insert INTO t_Sector(Description,StreetAddress) VALUES("SM Hausham","Nagelbachstraße 15");
Insert INTO t_Sector(Description,StreetAddress) VALUES("SM Rosenheim","Greidererstraße 10");

Insert INTO t_Department(Description) VALUES("V");
Insert INTO t_Department(Description) VALUES("T");
Insert INTO t_Department(Description) VALUES("R");
Insert INTO t_Department(Description) VALUES("S1");
Insert INTO t_Department(Description) VALUES("S2");
Insert INTO t_Department(Description) VALUES("P");
Insert INTO t_Department(Description) VALUES("K");
Insert INTO t_Department(Description) VALUES("L");
Insert INTO t_Department(Description) VALUES("L1");
Insert INTO t_Department(Description) VALUES("L2");
Insert INTO t_Department(Description) VALUES("L3");
Insert INTO t_Department(Description) VALUES("L4");
Insert INTO t_Department(Description) VALUES("E/M");
INSERT INTO t_Department(Description) VALUES("IuK");


Insert INTO t_Notebook_Cat(Description) VALUES("Schulungslaptop");
Insert INTO t_Notebook_Cat(Description) VALUES("Leihlaptop");
Insert INTO t_Notebook_Cat(Description) VALUES("Heimarbeit");
Insert INTO t_Notebook_Cat(Description) VALUES("Hauptgerät");
Insert INTO t_Notebook_Cat(Description) VALUES("Sondergerät");

CREATE VIEW v_count_pcmodelle As Select Model,Count(CID) as Anzahl from t_computer group by Model;

CREATE VIEW v_count_monitormodelle As Select Manufacturer,Model,Count(MID),YoM as Anzahl from t_monitor group by Model;

CREATE VIEW v_NameKomplett As Select Concat(Surname,' ',GivenName) as NameKomplett from t_user;

CREATE VIEW v_count_userDepartment AS Select d.Description, Count(u.UID) as Anzahl from t_user u, t_department d where u.Department = d.DID group by d.description;

CREATE VIEW v_User_Computer AS Select c.CID,c.Hostname, u.UID,Concat(u.Surname,' ',u.GivenName) as NameKomplett from t_user u, t_computer c, t_user_computer uc  Where uc.UID = u.UID and uc.CID = c.CID;

CREATE VIEW v_Computer_LC AS Select c.Hostname, Concat(u.Surname,' ',u.GivenName) as NameKomplett, c.LastConnect from t_user u, t_computer c, t_user_computer uc Where uc.UID = u.UID and uc.CID = c.CID and c.LastConnect < CURDATE()-Interval 90 Day; 

CREATE VIEW v_Monitor_LC AS Select m.SN, 

CREATE VIEW v_User_LC AS Select

CREATE VIEW v_monitor_older5Y As Select vuc.NameKomplett as Mitarbeiter,M.MID,M.Yom from t_Monitor m, t_Computer c, v_User_Computer vuc Where M.CID = C.CID and c.CID = vuc.CID and M.Yom < CURDATE()-Interval 5 Year order by m.yom desc;

















