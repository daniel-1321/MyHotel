CREATE DATABASE HOTEL

USE HOTEL

CREATE TABLE CUSTOMER (
			Cus_ID int IDENTITY(1,1),
			Cus_Name varchar(50) NOT NULL,
			Cus_Phone varchar(15) UNIQUE NOT NULL,
			Cus_Email varchar(30) UNIQUE NOT NULL,
			Cus_Password varchar (50) NOT NULL,
			Cus_Address varchar(100) NOT NULL,
			Cus_DOB varchar(20),
			Cus_Gender varchar (10),
			Cus_Type varchar(10),
			Cus_Join varchar(20)
			Constraint CUSTOMER_Cus_ID primary key (Cus_ID)
			);

CREATE TABLE ROOM (
			Roo_ID int UNIQUE,
			Roo_Name varchar (50),
			Roo_Bed int,
			Roo_Type varchar (50),
			Roo_Price decimal (18,0),
			Roo_Image varchar(50),
			Roo_Person int,
			Constraint ROOM_ROO_ID primary key (Roo_ID)
			);


CREATE TABLE LOCATION (
			Loc_ID int IDENTITY(1,1) NOT NULL,
			Loc_Name varchar (50) UNIQUE NOT NULL,
			Loc_Phone varchar (50) UNIQUE NOT NULL,
			Loc_Address varchar (50) NOT NULL,
			Loc_District varchar (50) NOT NULL,
			Loc_City varchar(50) NOT NULL,
			Constraint LOCATION_Loc_ID primary key (Loc_ID)
			);

CREATE TABLE ROOM_LOCATION (
			Roo_ID int NOT NULL,
			Loc_ID int NOT NULL,
			Status varchar (20),
			Description varchar (500),
			Constraint ROOM_LOCATION_ROO_ID_LOC_ID primary key (ROO_ID,LOC_ID)
			);

CREATE TABLE BOOKING (
			Boo_ID int NOT NULL IDENTITY(1,1),
			Cus_ID int NOT NULL,
			Roo_ID int NOT NULL,
			Loc_ID int NOT NULL,
			Boo_CheckIn varchar(20),
			Boo_CheckOut varchar(20),
			Boo_Quantity int,
			Boo_Price decimal (18,0),
			Boo_Adult int,
			Boo_Children int,
			Boo_Date varchar(20) NOT NULL,
			Boo_Total decimal (18,0) NOT NULL,
			Boo_Note varchar (50),
			Constraint BOOKING_Boo_ID primary key (Boo_ID)
			);

alter table BOOKING add constraint FK_BOOKING_CUSTOMER_CUS_ID foreign key (CUS_ID) references CUSTOMER(CUS_ID)
alter table ROOM_LOCATION add constraint FK_ROOM_LOCATION_LOCATION_LOC_ID foreign key (Loc_ID) references LOCATION(Loc_ID)
alter table ROOM_LOCATION add constraint FK_ROOM_LOCATION_ROOM_ROO_ID foreign key (Roo_ID) references ROOM(Roo_ID)
alter table BOOKING add constraint FK_BOOKING_ROOM_ROO_ID foreign key (Roo_ID) references ROOM(Roo_ID)
alter table BOOKING add constraint FK_BOOKING_LOCATION_LOC_ID foreign key (Loc_ID) references LOCATION(Loc_ID)

INSERT INTO CUSTOMER values ('Ho Trong Dai','0902496647','hotrongdai1011@gmail.com','1321','178 Vo Van Kiet, Quan 1, HCM','10/11/1995','Male','Silver','04/06/2019')
INSERT INTO CUSTOMER values ('Daniel Ho','0767659756','daiht1011@gmail.com','1011','132 Ben Chuong Duong, Quan 1, HCM','10/11/1995','Male','Gold','04/06/2019')



INSERT INTO LOCATION values ('Caravelle Hotel Saigon','(84) 28 3823 4999','19 Cong Truong Lam Son','1','Ho Chi Minh')
INSERT INTO LOCATION values ('Vinpearl Luxury Landmark 81','(84) 28 3971 8888','208 Nguyen Huu Canh','Binh Thanh','Ho Chi Minh')
INSERT INTO LOCATION values ('The Reverie Saigon','(84) 28 3823 6688','22 - 36 Nguyen Hue Boulevard','1','Ho Chi Minh')

INSERT INTO ROOM values (101, 'Club Room',1,'Single',199,'club.jpg',2)

INSERT INTO ROOM values (201, 'Classic Room',2,'Double',399,'classic.jpg',4)

INSERT INTO ROOM values (301, 'Luxury Apartment',3,'Family',599,'luxury.jpg',6)

INSERT INTO ROOM values (401, 'Presidential Suite',5,'Master Suite',799,'presidential.jpg',12)



INSERT INTO ROOM_LOCATION values (101,1,'Available','')

INSERT INTO ROOM_LOCATION values (201,1,'Available','')

INSERT INTO ROOM_LOCATION values (301,1,'Available','')

INSERT INTO ROOM_LOCATION values (401,1,'Available','')


INSERT INTO ROOM_LOCATION values (101,2,'Available','')

INSERT INTO ROOM_LOCATION values (201,2,'Available','')

INSERT INTO ROOM_LOCATION values (301,2,'Available','')

INSERT INTO ROOM_LOCATION values (401,2,'Available','')


INSERT INTO ROOM_LOCATION values (101,3,'Available','')

INSERT INTO ROOM_LOCATION values (201,3,'Available','')

INSERT INTO ROOM_LOCATION values (301,3,'Available','')

INSERT INTO ROOM_LOCATION values (401,3,'Available','')

CREATE PROC CustomerRegister
@Cus_ID	int,
@Cus_Name varchar(50),
@Cus_Phone varchar(15),
@Cus_Email varchar(30),
@Cus_Password varchar(50),
@Cus_Address varchar(100),
@Cus_DOB varchar(20),
@Cus_Gender varchar(10),
@Cus_Type varchar(10),
@Cus_Join varchar(20)

AS
	BEGIN
		INSERT INTO CUSTOMER (Cus_Name,Cus_Phone,Cus_Email,Cus_Password,Cus_Address,Cus_DOB,Cus_Gender,Cus_Type,Cus_Join)
		VALUES (@Cus_Name,@Cus_Phone,@Cus_Email,@Cus_Password,@Cus_Address,@Cus_DOB,@Cus_Gender,@Cus_Type,@Cus_Join)
	END


CREATE PROC InsertBooking
@Boo_ID int,
@Cus_ID int,
@Roo_ID int,
@Loc_ID int,
@Boo_CheckIn varchar(20),
@Boo_CheckOut varchar(20),
@Boo_Quantity int,
@Boo_Price decimal (18,0),
@Boo_Adult int,
@Boo_Children int,
@Boo_Date varchar(20),
@Boo_Total decimal (18,0),
@Boo_Note varchar (50)
AS
	BEGIN
		INSERT INTO BOOKING(Cus_ID,Roo_ID,Loc_ID,Boo_CheckIn,Boo_CheckOut,Boo_Quantity,Boo_Price,Boo_Adult,Boo_Children,Boo_Date,Boo_Total,Boo_Note)
		VALUES (@Cus_ID,@Roo_ID,@Loc_ID,@Boo_CheckIn,@Boo_CheckOut,@Boo_Quantity,@Boo_Price,@Boo_Adult,@Boo_Children,@Boo_Date,@Boo_Total,@Boo_Note)
	END
	
	
CREATE PROC CustomerViewbyID
@Cus_ID int
AS
	SELECT * FROM CUSTOMER WHERE Cus_ID = @Cus_ID

	
	
CREATE PROC UpdateRoom
(
	@Roo_ID	int,
	@Loc_ID	int,
	@Status	varchar(20),
	@Description	varchar(500)
)
AS
	BEGIN
		UPDATE ROOM_LOCATION SET Status = @Status WHERE Roo_ID = @Roo_ID and Loc_ID = @Loc_ID
	END