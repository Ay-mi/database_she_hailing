CREATE TABLE Customer (
  Customer_ID int(5) NOT NULL,
  Cust_name varchar(20),
  Cust_age int(2),
  Cust_phone varchar(10),
  Cust_points int(5),
  PRIMARY KEY (Customer_ID)
);


CREATE TABLE Promotion (
  Promo_ID varchar(6) not null primary key, 
  Promo_type varchar(10),
  Promo_amount decimal(5,2),
  Points_needed int(5)
 
);


CREATE TABLE Car (
  Car_ID varchar(8) not null,
  Car_type varchar(10),
  Car_name varchar(20),
  Car_model varchar(20),
  Car_colour varchar(10),
  PRIMARY KEY (Car_ID)
);


CREATE TABLE Driver (
  Driver_ID int(5) not null primary key,
  Driver_name varchar(20),
  Driver_phone varchar(10),
  Full_time varchar(3),
  Car_ID varchar(8),
  FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);

CREATE TABLE Booking (
  Booking_ID int(5),
  Destination varchar(50),
  Pickup_loc varchar(50),
  Distance int(4),
  Complete varchar(3),
  Customer_ID int(5),
  Car_ID varchar(8),
  Promo_ID varchar(6),
  
  PRIMARY KEY (Booking_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
  on update cascade on delete restrict,
  FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
  on update cascade on delete restrict,
  FOREIGN KEY (Promo_ID) REFERENCES Promotion(Promo_ID)
  on update cascade on delete restrict
  
);

CREATE TABLE Receipts (
  Receipts_ID varchar(6),
  Booking_ID int(5),
  Promo_ID varchar(6),
  Price decimal(5,2),
  Total_price decimal(5,2),
  PRIMARY KEY (Receipts_ID),
  FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
  on update cascade on delete restrict,
  FOREIGN KEY (Promo_ID) REFERENCES Promotion(Promo_ID)
  on update cascade on delete restrict
);


CREATE TABLE Driver_ratings (
  Drating_no varchar(6),
  Customer_ID int(5),
  Driver_ID int(5),
  Rating int(1),
  PRIMARY KEY (Drating_no),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
  ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
  ON UPDATE CASCADE ON DELETE RESTRICT
  
);


CREATE TABLE Cust_ratings (
  Crating_no varchar(6),
  Driver_ID int(5),
  Customer_ID int(5),
  Rating int(1),
  PRIMARY KEY (Crating_no),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
  on update cascade on delete restrict,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
  ON UPDATE CASCADE ON DELETE RESTRICT
  
);


--Customer table
INSERT INTO Customer (Customer_ID, Cust_name, Cust_age, Cust_phone, Cust_points) VALUES
(1, 'Willie Rose', 25, '0112551489', 58),
(2, 'Magnolia Arias', 24, '0132561847', 45),
(3, 'Alec Hopkins', 35, '0152489567', 74),
(4, 'Gabriela Carson', 47, '0162548795', 125),
(5, 'Ares Pollard', 85, '0125478963', 36),

(6, 'Alice Park', 32, '0147890867', 104),
(7, 'Alexandra Mleux', 21, '0157803539', 87),
(8, 'Nur Fatimah', 55, '0178964263', 67),
(9, 'Hana Humaira', 24, '0198632572', 34),
(10, 'Roseanne Park', 27, '0178265375', 150), 

(11, 'Jennie Kim', 28, '0154789865', 49),
(12, 'Marissa Iman', 16, '01165673009', 11),
(13, 'Havana Liu', 23, '0176540910', 53),
(14, 'Julie Han', 24, '0134421610', 2),
(15, 'Priya Kumar', 60, '0149140444', 66),

(16, 'John Doe', 58, '0116879945', 99),
(17, 'Ashley Graham', 20, '0165563201', 28),
(18, 'Goro Takuma', 42, '0182094857', 76),
(19, 'Mina Mikes', 34, '0115944738', 12),
(20, 'Elizabeth Bell', 63, '0129384755', 130);

--Promotion Table
INSERT INTO Promotion(Promo_ID, Promo_type, Promo_amount, Points_needed) VALUES
('PA0589', 'RM1 off', 1.00, 50),
('PA2031', 'RM5 off', 5.00, 100),
('PA4305', 'RM10 off', 10.00, 150),
('PA2405', 'RM15 off', 15.00, 200),
('PA3505', 'RM20 off', 20.00, 350),

('PA2104', 'RM3 off', 3.00, 80),
('PA2603', 'RM25 off', 25.00, 400),
('PA8506', 'RM8 off', 8.00, 120),
('PA2604', 'RM12 off', 12.00, 160),
('PA8507', 'RM18 0ff', 18.00, 240),

('PA1103', 'RM0.20 off', 0.20, 20),
('PA2203', 'RM0.40 off', 0.40, 40),
('PA1303', 'RM0.60 off', 0.60, 60),
('PA4403', 'RM0.80 off', 0.80, 80),
('PA0503', 'RM0.10 off', 0.10, 10),

('PA1001', 'RM0 off', 0.05, 0),
('PA1511', 'RM0.70 off', 0.70, 70),
('PA1531', 'RM2 off', 2.00, 75),
('PA2051', 'RM28 off', 28.00, 380),
('PA1891', 'RM16 off', 16.00, 220);


--Car table
INSERT INTO Car(Car_ID, Car_type, Car_name, Car_model, Car_colour) values
('A4325602', '4-pax', 'Proton', 'Saga', 'Grey'),
('A7685748', '7-pax', 'Perodua', 'Alza', 'Red'),
('A1975982', '7-pax', 'Proton', 'Exora', 'White'),
('A7891456', '4-pax', 'Perodua', 'Myvi', 'White'),
('A2348745', '4-pax', 'Perodua', 'Axia', 'Blue'),

('A3451234', '4-pax', 'Toyota', 'Yaris', 'Grey'),
('A1876789', '7-pax', 'Kia', 'Carnival', 'Black'),
('A1283078', '4-pax', 'Mercedes Benz', 'C-Class', 'Black'),
('A7061145', '7-pax', 'Mitsubishi', 'Xpander', 'Silver'),
('A2562034', '4-pax', 'Honda', 'Civic', 'White'), 

('A7524487', '4-pax', 'Perodua', 'Bezza', 'Grey'),
('A1489605', '7-pax', 'Toyota', 'Vellfire', 'White'),
('A1713438', '4-pax', 'Hyundai', 'Elantra', 'Silver'),
('A8712319', '4-pax', 'Toyota', 'Prius', 'Black'),
('A1879400', '2-pax', 'Perodua', 'Viva', 'Black'),

('A1168125', '4-pax', 'Proton', 'Iriz', 'Black'),
('A8696315', '4-pax', 'Lexus', 'ES', 'Red'),
('A1269856', '7-pax', 'Toyota', 'Highlander', 'Maroon'),
('A1233254', '7-pax', 'Perodua', 'Aruz', 'White'),
('A7892145', '4-pax', 'Kia', 'Cerato', 'Silver');

--Driver table
INSERT INTO Driver(Driver_ID, Car_ID, Driver_name, Driver_phone, Full_time) VALUES
(1, 'A4325602', 'Felicity Hunt', '0125648796', 'Yes'),
(2, 'A7685748', 'Juan Loenard', '0125648796', 'No'),
(3, 'A1975982', 'Addilynn Salas', '01125678894', 'Yes'),
(4, 'A7891456', 'Zaiden Baker', '00135478965', 'Yes'),
(5, 'A2348745', 'Isla Cabrera', '0125486971', 'Yes'),

(6, 'A3451234','Isabella Haris', '0134786392', 'No'),
(7, 'A1876789', 'Nadia Omar', '0198724665', 'Yes'),
(8, 'A1283078', 'Sarah Holland', '0129374673', 'No'),
(9, 'A7061145', 'Priyanka Chopra', '0198767354', 'No'),
(10, 'A2562034', 'Sofea Alyssa', '0113267629', 'Yes'),

(11, 'A1879400', 'Siti Zainab', '0156564909', 'Yes'),
(12, 'A1713438', 'Umi Halija', '0141198505', 'No'),
(13, 'A8712319', 'Phoebe Bridgers', '0120240906', 'Yes'),
(14, 'A7524487', 'Ethel Cain', '0131445353', 'No'),
(15, 'A1489605', 'Sarah Chow', '0182273234', 'Yes'),

(16, 'A1168125', 'Leila Mansoor', '0118930499', 'Yes'),
(17, 'A8696315', 'Siti Khadijah', '0123984074', 'Yes'),
(18, 'A1269856', 'Jing Yu', '0192036048', 'No'),
(19, 'A1233254', 'Adya Mahendran', '0159284702', 'Yes'),
(20, 'A7892145', 'Amira Yousef', '0112937049', 'No');

--Booking table
INSERT INTO Booking(Booking_ID, Destination, Pickup_loc, Distance, Complete, Customer_ID, Car_ID, Promo_ID) VALUES
(200, 'Masjid Putra', 'MMU Cyberjaya', 15, 'Yes', 1, 'A4325602', 'PA0589'),
(201, 'Suria KLCC', 'Metropoint, Kajang', 30, 'No', 3, 'A1489605', 'PA1001'),
(202, 'Lotuss Ampang', 'Suria KLCC', 15, 'Yes', 6, 'A1975982', 'PA0589'),
(203, 'IOI Putrajaya', 'PV8, Gombak', 40, 'Yes', 5, 'A7891456', 'PA2031'),
(204, 'Exhaustion, Damansara', "Happiness, Putrajaya", 35, 'No', 7, 'A2348745', 'PA1001'),

(205, 'TRX Exchange', 'UOC Cyberjaya', 35, 'Yes', 12, 'A1489605', 'PA2104'),
(206, 'Alamanda Mall', 'MRT station Cyberjaya Utara', 20, 'No', 8, 'A1876789', 'PA2104'),
(207, 'Taman Saujana Hijau', 'Neocyber', 16, 'No', 4, 'A1283078', 'PA0589'),
(208, 'Bukit Bintang', 'MMU Cyberjaya', 36, 'Yes', 2, 'A7061145', 'PA8506'),
(209, 'KLIA Sepang', 'Kota Warisan', 25, 'Yes', 10, 'A2562034', 'PA2031'),

(210, 'Lalaport', 'TRX Exchange', 5, 'Yes', 13, 'A7524487', 'PA2104'),
(211, 'MMU Cyberjaya', 'SS15, Subang Jaya', 30, 'No', 14, 'A1489605', 'PA1001'),
(212, 'The Five, Bukit Damansara', 'Alam Damai', 20, 'No', 12, 'A1713438', 'PA2203'),
(213, 'Jalan Tunku Abdul Rahman', 'Bangi Central', 27, 'Yes', 14, 'A8712319', 'PA1303'),
(214, 'Ampang Point', 'Stadium Bukit Jalil', 11, 'Yes', 15, 'A1879400', 'PA2203'),

(215, 'Dpulze Mall', 'Seria Residence,Cyberjaya', 6, 'Yes', 18, 'A1168125', 'PA2203'),
(216, 'Suria KLCC', 'Tamarind Square,Cyberjaya', 32, 'Yes', 19, 'A8696315', 'PA4305'),
(217, 'Kl Sentral Bus station', 'Berjaya Times square ,Kl', 20, 'Yes', 17, 'A1269856', 'PA0503'),
(218, 'Sunway Pyramid', 'Kl Sentral', 22, 'No', 16, 'A1233254', 'PA1303'),
(219, 'Swiss Hotel', 'Klcc Park, kl', 9, 'No', 20, 'A8696315', 'PA0589'),

(220, 'Aeon Shah Alam', 'Shah Alam', 18, 'Yes',15, 'A7524487', 'PA2104'),
(221, 'Wangsa Walk Mall', 'Wangsa Maju', 15, 'No', 6, 'A1713438', 'PA2203'),
(222, 'Quill City Mall', 'Kampung Baru', 8, 'No', 1, 'A1168125', 'PA2203'),
(223, 'Sungei Wang Plaza', 'Bukit Bintang', 5, 'Yes', 20, 'A8696315', 'PA4305'),
(224, 'Paradigm Mall', 'Kelana Jaya', 15, 'No', 14, 'A1269856', 'PA0503'),
(225, 'Lot 10', 'Bukit Bintang', 8, 'No', 3, 'A7892145', 'PA0589'),

(226, 'The Gardens Mall', 'Mid Valley City', 7, 'Yes', 5, 'A2348745', 'PA4305'),
(227, 'Central Market', 'Kampung Baru', 1, 'Yes', 13, 'A1713438', 'PA2203'),
(228, 'KL Tower', 'Bukit Nanas', 9, 'Yes', 16, 'A8712319', 'PA1303'),
(230, 'Empire Shopping Gallery', 'Subang Jaya', 20, 'Yes', 4, 'A1168125', 'PA2203');


--Receipts Table
INSERT INTO Receipts(Receipts_ID, Booking_ID, Promo_ID, Price, Total_price) VALUES
('RA0401', 200, 'PA0589', 7.5, 6.5),
('RA0402', 201, 'PA1001', 15, 15),
('RA0403', 202, 'PA0589', 7.5, 6.5),
('RA0404', 203, 'PA2031', 20, 15),
('RA0405', 204, 'PA1001', 17.5, 17.5),

('RA0406', 205, 'PA2104', 17.5, 14.5),
('RA0407', 206, 'PA2104', 10, 7),
('RA0408', 207, 'PA0589', 8, 7),
('RA0409', 208, 'PA8506', 18, 10),
('RA0410', 209, 'PA2031', 12.5, 7.5),

('RA0411', 210, 'PA2104', 15, 12),
('RA0412', 211, 'PA1001', 13.5, 12.9),
('RA0413', 212, 'PA2203', 2.5, 2.4),
('RA0414', 213, 'PA1303', 5.5, 5.1),
('RA0415', 214, 'PA2203', 10, 9.6),

('RA0416', 215, 'PA2203', 5, 4.6),
('RA0417', 216, 'PA4305', 20.5, 10.5),
('RA0418', 217, 'PA0503', 10, 9.9),
('RA0419', 218, 'PA1303', 12.5, 11.9),
('RA0420', 219, 'PA0589', 7, 6),

('RA0421', 220, 'PA2104', 11, 8),
('RA0422', 221, 'PA2203', 16, 15.6),
('RA0423', 222, 'PA2203', 19, 18.6),
('RA0424', 223, 'PA4305', 20, 10),
('RA0425', 224, 'PA0503', 5, 4.90),
('RA0426', 225, 'PA0589', 6, 5),
('RA0427', 226, 'PA1303', 7, 6.4),
('RA0428', 227, 'PA2203', 8, 7.6),
('RA0429', 228, 'PA1303', 12, 11.4),
('RA0430', 230, 'PA2203', 15, 14.6);


--Driver Ratings table
INSERT INTO Driver_ratings(Drating_no, Customer_ID, Driver_ID, Rating) VALUES
('DR0001', 1, 1 , 5),
('DR0002', 2, 2 , 4),
('DR0003', 3, 3 , 3),
('DR0004', 4, 4, 4),
('DR0005', 5, 5, 5),

('DR0006', 6, 6, 4),
('DR0007', 7, 7, 5),
('DR0008', 8, 8, 5),
('DR0009', 9, 9, 3),
('DR0010', 10, 10, 4),

('DR0011', 11, 11, 5),
('DR0012', 12, 12, 4),
('DR0013', 13, 13, 5),
('DR0014', 14, 14, 2),
('DR0015', 15, 15, 3),

('DR0016', 16, 16, 5),
('DR0017', 17, 17, 4),
('DR0018', 18, 18, 5),
('DR0019', 19, 19, 3),
('DR0020', 20, 20, 5);


INSERT INTO Cust_ratings(Crating_no, Driver_ID, Customer_ID, Rating) VALUES
('CR0001', 1, 1 , 4),
('CR0002', 2, 2 , 5),
('CR0003', 3, 3 , 3),
('CR0004', 4, 4, 4),
('CR0005', 5, 5, 5),

('CR0006', 6, 6, 3),
('CR0007', 7, 7, 3),
('CR0008', 8, 8, 5),
('CR0009', 9, 9, 4),
('CR0010', 10, 10, 5),

('CR0011', 11, 11, 5),
('CR0012', 12, 12, 5),
('CR0013', 13, 13, 4),
('CR0014', 14, 14, 1),
('CR0015', 15, 15, 5),

('CR0016', 16, 16, 5),
('CR0017', 17, 17, 3),
('CR0018', 18, 18, 5),
('CR0019', 19, 19, 4), 
('CR0020', 20, 20, 5);

-- sql for query 1
SELECT Booking.Booking_ID, Customer.Cust_name AS Customer_name, Car.Car_type AS Car_type
FROM Booking, Customer, Car
WHERE
Booking.Customer_ID = Customer.Customer_ID
AND Booking.Car_ID = Car.Car_ID;


-- sql for query 2
SELECT Driver.Driver_ID, Driver.Driver_name, count(Booking.Booking_ID) as Bookings_Completed
FROM Driver, Booking
WHERE Driver.Car_ID = Booking.Car_ID
AND Booking.Complete = 'Yes' 
GROUP BY Driver.Driver_ID; 

-- sql for query 3
SELECT Customer.Cust_name AS Customer_Name
FROM Booking, Customer
WHERE
Booking.Customer_ID = Customer.Customer_ID
AND Booking.Promo_ID = 'PA0589';

--sql for query #4
SELECT AVG(Rating) AS Average_rating_given_to_drivers
FROM Driver_ratings;


-- sql FOR QUERY #5
SELECT *
FROM Car
WHERE Car_ID IN (
    SELECT Car_ID
    FROM Booking
    GROUP BY Car_ID
    HAVING COUNT(*) > 2
);
