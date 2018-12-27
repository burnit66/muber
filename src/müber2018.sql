DROP DATABASE IF EXISTS müber;
CREATE DATABASE müber;
USE müber;


--

DROP TABLE IF EXISTS active_users_list;
/*!50001 DROP VIEW IF EXISTS active_users_list*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client
= utf8;
/*!50001 CREATE VIEW active_users_list AS SELECT 
 1 AS TRUCK_NAME,
 1 AS TRUCK_CAPACITY,
 1 AS RENTER_FIRSTNAME,
 1 AS RENTER_LASTNAME,
 1 AS Charges*/;
SET character_set_client
= @saved_cs_client;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS city;
CREATE TABLE city
(
    CityID int(11) NOT NULL
    AUTO_INCREMENT,
  city varchar
    (50) NOT NULL,
  StateAbbr char
    (2) NOT NULL,
  zip int
    (5) NOT NULL,
  latitude double NOT NULL,
  longitude double NOT NULL,
  county varchar
    (50) NOT NULL,
  PRIMARY KEY
    (CityID),
);

LOCK TABLES city WRITE;

    -- ----------------------------
    -- Records 
    -- ----------------------------
    SELECT * FROM city;
    INSERT INTO city
        (city, StateAbbr, zip, latitude, longitude, county)
  
    UNLOCK TABLES;

    --
    -- Table structure for table driver
    --

    DROP TABLE IF EXISTS driver;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE driver
    (
        id int(10)
        unsigned NOT NULL AUTO_INCREMENT,
  UserId int
        (11) NOT NULL,
  SSN varchar
        (15) NOT NULL,
  LicenseNumber varchar
        (15) NOT NULL,
  LicenseExpiryDate date DEFAULT NULL,
  PRIMARY KEY
        (id),
  KEY User_IDX_idx
        (UserId),
  CONSTRAINT User_IDX FOREIGN KEY
        (UserId) REFERENCES users
        (UserID) ON
        DELETE NO ACTION ON
        UPDATE NO ACTION
) ENGINE=InnoDB
        AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table driver
--

LOCK TABLES driver WRITE;
/*!40000 ALTER TABLE driver DISABLE KEYS */;
        INSERT INTO driver
        VALUES
            (1, 8, '16620210-6511', '16960522-5953', NULL),
            (2, 1, '16501115-9356', '16771207-2417', NULL),
            (3, 1, '16310407-3691', '16511207-8612', NULL),
            (4, 1, '16981113-2720', '16981230-8212', NULL),
            (5, 1, '16710330-9295', '16670409-2359', NULL),
            (6, 2, '16961004-3821', '16390105-6436', NULL),
            (7, 1, '16060723-7245', '16080904-3300', NULL),
            (8, 2, '16420724-2654', '16390827-4412', NULL),
            (9, 1, '16890612-7504', '16901229-3115', NULL),
            (10, 1, '16610319-2453', '16110210-2793', NULL),
            (11, 2, '16080410-5476', '16670918-9226', NULL),
            (12, 1, '16150425-1214', '16220226-2966', NULL),
            (13, 1, '16051205-4891', '16600327-6109', NULL),
            (14, 2, '16370421-9355', '16550625-2898', NULL),
            (15, 1, '16550913-6445', '16930127-6508', NULL),
            (16, 1, '16240416-5215', '16421227-3652', NULL),
            (17, 2, '16141105-7571', '16131201-3939', NULL),
            (18, 2, '16000310-3579', '16780422-0775', NULL),
            (19, 2, '16200302-6685', '16470609-1198', NULL),
            (20, 2, '16741112-9278', '16650304-3520', NULL),
            (21, 1, '16930523-8017', '16850911-1376', NULL),
            (22, 1, '16861112-9233', '16240428-4750', NULL),
            (23, 1, '16590119-3317', '16830508-4199', NULL),
            (24, 2, '16701113-8281', '16830304-3254', NULL),
            (25, 2, '16850301-1135', '16311210-3878', NULL),
            (26, 2, '16610714-8634', '16161006-6530', NULL),
            (27, 2, '16190304-6660', '16700916-4257', NULL),
            (28, 1, '16690524-3074', '16230715-8028', NULL),
            (29, 2, '16920910-0800', '16230424-3757', NULL),
            (30, 2, '16531205-8745', '16261020-5367', NULL),
            (31, 2, '16921209-2630', '16760707-0930', NULL),
            (32, 1, '16431015-5348', '16791021-8853', NULL),
            (33, 2, '16081112-9832', '16880412-4249', NULL),
            (34, 1, '16240228-4158', '16001005-9723', NULL),
            (35, 2, '16681126-7936', '16270401-5474', NULL),
            (36, 1, '16700323-5558', '16840423-4067', NULL),
            (37, 1, '16050926-2176', '16971110-2195', NULL),
            (38, 2, '16110529-5891', '16700614-4963', NULL),
            (39, 2, '16000812-2954', '16200313-4711', NULL),
            (40, 2, '16610224-6433', '16240327-6716', NULL),
            (41, 1, '16121011-6305', '16300929-3246', NULL),
            (42, 1, '16051025-9062', '16650405-4054', NULL),
            (43, 1, '16330920-6146', '16001209-9289', NULL),
            (44, 1, '16151117-0415', '16211223-5060', NULL),
            (45, 1, '16640413-4006', '16280413-0025', NULL),
            (46, 1, '16820124-0077', '16490322-8064', NULL),
            (47, 2, '16730111-1873', '16201101-2487', NULL),
            (48, 1, '16730928-7691', '16690117-1063', NULL),
            (49, 2, '16151117-1694', '16240919-2479', NULL),
            (50, 1, '16751202-9047', '16640608-7798', NULL),
            (51, 1, '16361103-0853', '16300912-4151', NULL),
            (52, 1, '16310719-5590', '16060430-8288', NULL),
            (53, 1, '16130624-5117', '16960401-6247', NULL),
            (54, 1, '16420811-2740', '16530213-0827', NULL),
            (55, 2, '16461227-8947', '16860618-1074', NULL),
            (56, 2, '16591125-4943', '16020209-0890', NULL),
            (57, 1, '16540224-7984', '16361107-6450', NULL),
            (58, 2, '16851126-4726', '16260816-8031', NULL),
            (59, 2, '16680517-4783', '16520213-9852', NULL),
            (60, 1, '16861214-9149', '16521110-0861', NULL),
            (61, 1, '16710705-3253', '16720909-5293', NULL),
            (62, 1, '16770403-4623', '16340128-9354', NULL),
            (63, 1, '16881121-4637', '16270419-0467', NULL),
            (64, 1, '16330519-5905', '16310311-4561', NULL),
            (65, 1, '16311113-3744', '16210815-7344', NULL),
            (66, 2, '16540528-8571', '16580409-6435', NULL),
            (67, 2, '16030206-4944', '16661209-6831', NULL),
            (68, 2, '16610909-5551', '16590623-0916', NULL),
            (69, 2, '16750310-2480', '16610623-4070', NULL),
            (70, 2, '16380428-6643', '16610626-4325', NULL),
            (71, 1, '16650722-2971', '16220322-5269', NULL),
            (72, 2, '16741104-7439', '16231119-1015', NULL),
            (73, 1, '16461125-7298', '16810315-6900', NULL),
            (74, 1, '16970904-9606', '16520911-6374', NULL),
            (75, 1, '16550818-5377', '16390922-0273', NULL),
            (76, 1, '16271102-3362', '16431204-6867', NULL),
            (77, 2, '16940516-7876', '16800918-4519', NULL),
            (78, 2, '16171016-8640', '16070818-9428', NULL),
            (79, 1, '16790511-5122', '16121015-1682', NULL),
            (80, 2, '16300401-7335', '16260827-6248', NULL),
            (81, 2, '16581106-9268', '16980507-0464', NULL),
            (82, 1, '16450810-3076', '16771120-8897', NULL),
            (83, 1, '16820205-0509', '16601118-0947', NULL),
            (84, 2, '16860508-9088', '16440430-9892', NULL),
            (85, 2, '16171121-9145', '16970113-4489', NULL),
            (86, 1, '16970127-1307', '16240129-3010', NULL),
            (87, 1, '16680230-0753', '16350902-7433', NULL),
            (88, 2, '16181017-9679', '16931006-6296', NULL),
            (89, 1, '16990201-9836', '16931020-5696', NULL),
            (90, 1, '16891117-9896', '16420305-2958', NULL),
            (91, 1, '16820602-3494', '16781126-3024', NULL),
            (92, 1, '16551206-9302', '16280424-0287', NULL),
            (93, 2, '16980308-3220', '16290420-7160', NULL),
            (94, 2, '16060930-4530', '16770820-7076', NULL),
            (95, 1, '16820225-7989', '16851211-9879', NULL),
            (96, 1, '16630219-9705', '16760925-8822', NULL),
            (97, 1, '16330814-7655', '16261227-3397', NULL),
            (98, 2, '16110808-8665', '16730124-0011', NULL),
            (99, 1, '16170929-9042', '16010525-7380', NULL),
            (100, 2, '16750424-3051', '16470120-1420', NULL),
            (101, 1, '16620210-6511', '16960522-5953', NULL),
            (102, 1, '16620210-6511', '16960522-5953', NULL),
            (103, 132, '1234567896', '123456789', NULL),
            (104, 133, '123123123133', '23423423424', NULL),
            (105, 134, '34534345434', '234234234', NULL),
            (106, 135, 'sdf', 'fcvd', NULL),
            (107, 136, '23432432423', '332532523443', NULL),
            (108, 142, '12312312', '231231212', NULL);
        /*!40000 ALTER TABLE driver ENABLE KEYS */;
        UNLOCK TABLES;

        --
        -- Temporary view structure for view driverbookinghistory
        --

        DROP TABLE IF EXISTS driverbookinghistory;
        /*!50001 DROP VIEW IF EXISTS driverbookinghistory*/;
        SET @saved_cs_client     = @@character_set_client;
        SET character_set_client
        = utf8;
/*!50001 CREATE VIEW driverbookinghistory AS SELECT 
 1 AS TripStartTime,
 1 AS TripEndTime,
 1 AS FirstName,
 1 AS LastName,
 1 AS TripStartLocationStreetName,
 1 AS TripDestinationStreetName,
 1 AS TripTypeName*/;
        SET character_set_client
        = @saved_cs_client;

        --
        -- Table structure for table logindetails
        --

        DROP TABLE IF EXISTS logindetails;
        /*!40101 SET @saved_cs_client     = @@character_set_client */;
        /*!40101 SET character_set_client = utf8 */;
        CREATE TABLE logindetails
        (
            UserId int(11) NOT NULL,
            UserName varchar(255) NOT NULL,
            Password varchar(255) NOT NULL,
            PRIMARY KEY (UserId,UserName),
            UNIQUE
            KEY UserId_UNIQUE
            (UserId),
  CONSTRAINT User_ID1 FOREIGN KEY
            (UserId) REFERENCES users
            (UserID) ON
            DELETE NO ACTION ON
            UPDATE NO ACTION
) ENGINE=InnoDB
            DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table logindetails
--

LOCK TABLES logindetails WRITE;
/*!40000 ALTER TABLE logindetails DISABLE KEYS */;
            INSERT INTO logindetails
            VALUES
                (5, 'et@inlobortistellus.org', 'test'),
                (8, 'CarolKasper@driver.com', 'test'),
                (9, 'lacus@id.com', 'test'),
                (10, 'John@renter.com', 'test'),
                (11, 'tincidunt@Nunc.com', 'test'),
                (12, 'Cum.sociis@quisaccumsan.co.uk', 'test'),
                (13, 'Nunc@tortoratrisus.org', 'test'),
                (14, 'Nullam.ut.nisi@lobortisquispede.org', 'test'),
                (15, 'fringilla.mi.lacinia@Pellentesquehabitant.net', 'test'),
                (16, 'interdum@vulputateposuere.com', 'test'),
                (17, 'Donec.at@ligula.edu', 'test'),
                (18, 'euismod.in.dolor@sitamet.org', 'test'),
                (19, 'molestie.tellus@a.com', 'test'),
                (20, 'conubia@lectus.edu', 'test'),
                (21, 'vitae@pedeblanditcongue.com', 'test'),
                (22, 'diam.Proin.dolor@sedconsequatauctor.com', 'test'),
                (23, 'sit.amet@purusDuiselementum.edu', 'test'),
                (24, 'lectus.a.sollicitudin@enimSednulla.ca', 'test'),
                (25, 'Etiam.bibendum@liberoProin.org', 'test'),
                (26, 'ridiculus.mus@idenimCurabitur.org', 'test'),
                (27, 'sem.magna@Donec.edu', 'test'),
                (28, 'urna.et@Maecenas.co.uk', 'test'),
                (29, 'in@natoque.ca', 'test'),
                (30, 'convallis@rutrumjusto.org', 'test'),
                (31, 'nunc.risus@magnatellusfaucibus.net', 'test'),
                (32, 'nunc.sit.amet@Praesent.org', 'test'),
                (33, 'enim.nisl@necanteMaecenas.co.uk', 'test'),
                (34, 'ante.Nunc@Donecfelisorci.org', 'test'),
                (35, 'lacinia.orci@nostra.ca', 'test'),
                (36, 'diam.dictum.sapien@parturientmontesnascetur.edu', 'test'),
                (37, 'fringilla.porttitor@enimSuspendisse.edu', 'test'),
                (38, 'justo.nec.ante@eratvelpede.edu', 'test'),
                (39, 'Vivamus@Donecegestas.org', 'test'),
                (40, 'aliquam.arcu.Aliquam@interdum.edu', 'test'),
                (41, 'ipsum.nunc.id@liberoProinsed.com', 'test'),
                (42, 'arcu@sedturpisnec.net', 'test'),
                (43, 'malesuada@facilisis.co.uk', 'test'),
                (44, 'a.felis@augue.org', 'test'),
                (45, 'aliquet@tinciduntadipiscingMauris.org', 'test'),
                (46, 'enim@rutrumFuscedolor.org', 'test'),
                (47, 'et.tristique.pellentesque@felispurus.co.uk', 'test'),
                (48, 'cursus.non.egestas@adipiscinglacus.co.uk', 'test'),
                (49, 'vel.convallis.in@Loremipsumdolor.com', 'test'),
                (50, 'mi@enim.org', 'test'),
                (51, 'a.sollicitudin.orci@scelerisqueneque.ca', 'test'),
                (52, 'Suspendisse.commodo@Cras.co.uk', 'test'),
                (53, 'fermentum.vel.mauris@ametdiam.ca', 'test'),
                (54, 'erat.volutpat.Nulla@Nullam.co.uk', 'test'),
                (55, 'pede@dapibus.ca', 'test'),
                (56, 'natoque.penatibus@temporaugue.co.uk', 'test'),
                (57, 'dignissim.tempor.arcu@tinciduntDonec.net', 'test'),
                (58, 'mus@Suspendisseseddolor.co.uk', 'test'),
                (59, 'mollis.lectus@justo.ca', 'test'),
                (60, 'sit.amet.consectetuer@ridiculusmus.com', 'test'),
                (61, 'orci.luctus.et@nuncest.co.uk', 'test'),
                (62, 'dolor@Integervulputate.edu', 'test'),
                (63, 'mauris@elit.edu', 'test'),
                (64, 'libero.et@senectuset.co.uk', 'test'),
                (65, 'fermentum.arcu@magna.com', 'test'),
                (66, 'Etiam@fermentumvelmauris.edu', 'test'),
                (67, 'imperdiet.non@orcilobortisaugue.org', 'test'),
                (68, 'libero@est.edu', 'test'),
                (69, 'fermentum.convallis@elit.com', 'test'),
                (70, 'tincidunt@estmollisnon.ca', 'test'),
                (71, 'ultrices@Aeneaneuismod.ca', 'test'),
                (72, 'ultrices.sit@ligulaAeneaneuismod.com', 'test'),
                (73, 'sit.amet@nonummyultricies.net', 'test'),
                (74, 'accumsan.laoreet@odio.com', 'test'),
                (75, 'ut.odio@eueuismod.org', 'test'),
                (76, 'eu@veliteu.ca', 'test'),
                (77, 'lacus.varius.et@vitaerisusDuis.com', 'test'),
                (78, 'ornare@sedsapien.net', 'test'),
                (79, 'Aenean.gravida@sem.co.uk', 'test'),
                (80, 'sagittis.felis.Donec@aliquamenim.net', 'test'),
                (81, 'ac@velitAliquamnisl.ca', 'test'),
                (82, 'vitae@molestieorci.com', 'test'),
                (83, 'eget.dictum@torquentperconubia.co.uk', 'test'),
                (84, 'et@neccursusa.co.uk', 'test'),
                (85, 'ac.turpis@interdumSed.edu', 'test'),
                (86, 'fringilla.est@enimnec.com', 'test'),
                (87, 'urna.Ut.tincidunt@erategettincidunt.ca', 'test'),
                (88, 'metus.sit.amet@nonummy.org', 'test'),
                (89, 'Mauris@risus.co.uk', 'test'),
                (90, 'sit.amet@DonecestNunc.com', 'test'),
                (91, 'consectetuer@egestasrhoncus.com', 'test'),
                (92, 'Aenean.gravida.nunc@cursus.com', 'test'),
                (93, 'nisi.dictum.augue@nec.org', 'test'),
                (94, 'gravida@adipiscingMaurismolestie.ca', 'test'),
                (95, 'facilisis.lorem.tristique@libero.org', 'test'),
                (96, 'pharetra.Nam@viverraMaecenas.net', 'test'),
                (97, 'faucibus.lectus.a@ultrices.ca', 'test'),
                (98, 'volutpat@dolor.ca', 'test'),
                (99, 'lobortis@ametdiam.ca', 'test'),
                (100, 'Nam.porttitor@ornare.net', 'test');
            /*!40000 ALTER TABLE logindetails ENABLE KEYS */;
            UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@localhost*/ /*!50003 TRIGGER Delete_trigger AFTER DELETE ON logindetails
	FOR EACH ROW
	BEGIN
    delete from trips where RenterUserID=OLD.userID;
    delete from renter where UserID=OLD.userID;
     delete from trucks where UserID=OLD.userID;
    delete from driver where UserID=OLD.userID;
    delete from users where UserID=OLD.userID;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

            --
            -- Table structure for table pricechart
            --

            DROP TABLE IF EXISTS pricechart;
            /*!40101 SET @saved_cs_client     = @@character_set_client */;
            /*!40101 SET character_set_client = utf8 */;
            CREATE TABLE pricechart
            (
                id int(10)
                unsigned NOT NULL AUTO_INCREMENT,
  TripTypeID int
                (11) DEFAULT NULL,
  Capacity int
                (11) DEFAULT NULL,
  Rate varchar
                (100) DEFAULT NULL,
  PRIMARY KEY
                (id),
  KEY TripType_IDX2_idx
                (TripTypeID),
  CONSTRAINT TripType_IDX2 FOREIGN KEY
                (TripTypeID) REFERENCES triptype
                (TripTypeID) ON
                DELETE NO ACTION ON
                UPDATE NO ACTION
) ENGINE=InnoDB
                AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table pricechart
--

LOCK TABLES pricechart WRITE;
/*!40000 ALTER TABLE pricechart DISABLE KEYS */;
                INSERT INTO pricechart
                VALUES
                    (1, 1, 250, '$35'),
                    (2, 1, 300, '$45'),
                    (3, 1, 350, '$55'),
                    (4, 1, 400, '$60'),
                    (5, 1, 450, '$65'),
                    (6, 1, 500, '$70'),
                    (7, 1, 550, '$75'),
                    (8, 1, 600, '$80'),
                    (9, 1, 650, '$85'),
                    (10, 1, 700, '$95'),
                    (11, 2, 250, '$25'),
                    (12, 2, 300, '$35'),
                    (13, 2, 350, '$45'),
                    (14, 2, 400, '$50'),
                    (15, 2, 450, '$55'),
                    (16, 2, 500, '$60'),
                    (17, 2, 550, '$65'),
                    (18, 2, 600, '$70'),
                    (19, 2, 650, '$75'),
                    (20, 2, 700, '$80');
                /*!40000 ALTER TABLE pricechart ENABLE KEYS */;
                UNLOCK TABLES;

                --
                -- Table structure for table renter
                --

                DROP TABLE IF EXISTS renter;
                /*!40101 SET @saved_cs_client     = @@character_set_client */;
                /*!40101 SET character_set_client = utf8 */;
                CREATE TABLE renter
                (
                    id int(10)
                    unsigned NOT NULL AUTO_INCREMENT,
  UserID int
                    (11) DEFAULT NULL,
  CreditCardNumber varchar
                    (255) DEFAULT NULL,
  PRIMARY KEY
                    (id),
  KEY User_IDX1_idx
                    (UserID),
  CONSTRAINT User_IDX1 FOREIGN KEY
                    (UserID) REFERENCES users
                    (UserID) ON
                    DELETE NO ACTION ON
                    UPDATE NO ACTION
) ENGINE=InnoDB
                    AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table renter
--

LOCK TABLES renter WRITE;
/*!40000 ALTER TABLE renter DISABLE KEYS */;
                    INSERT INTO renter
                    VALUES
                        (101, 1, '4556 072 70 8537'),
                        (102, 2, '4929 371 16 3466'),
                        (103, 3, '455 63896 40366 354'),
                        (104, 4, '4539992271380'),
                        (105, 5, '492963 7018779156'),
                        (108, 8, '4539 3493 6855 8543'),
                        (109, 9, '4306959656247'),
                        (110, 10, '402 40071 04308 209'),
                        (111, 11, '4916194415256'),
                        (112, 12, '4716 3311 9873 2253'),
                        (113, 13, '492967 617747 7707'),
                        (114, 14, '4024 007 15 8740'),
                        (115, 15, '4354 685 17 1099'),
                        (116, 16, '4916 946 73 4715'),
                        (117, 17, '4485061706952700'),
                        (118, 18, '453 28188 48123 885'),
                        (119, 19, '453241 9159400028'),
                        (120, 20, '4916882828737'),
                        (121, 21, '492 93795 47383 644'),
                        (122, 22, '4716548056172'),
                        (123, 23, '453904 556012 5673'),
                        (124, 24, '4916197084836'),
                        (125, 25, '4024007135250'),
                        (126, 26, '4556 4881 0604 3257'),
                        (127, 27, '448581 4100363365'),
                        (128, 28, '4716 326 87 4010'),
                        (129, 29, '409 92108 04923 141'),
                        (130, 30, '455629 7748885292'),
                        (131, 31, '4716 749 00 9418'),
                        (132, 32, '4485 8295 7465 1905'),
                        (133, 33, '492957 402121 5078'),
                        (134, 34, '4916075185234'),
                        (135, 35, '4539762797903'),
                        (136, 36, '4049744126270'),
                        (137, 37, '4929 424 90 8727'),
                        (138, 38, '492944 131402 6242'),
                        (139, 39, '4331 7428 0733 9485'),
                        (140, 40, '4556464141186716'),
                        (141, 41, '4916096024404'),
                        (142, 42, '4556116694263'),
                        (143, 43, '4024007196229'),
                        (144, 44, '455686 1224343496'),
                        (145, 45, '4916 6141 5717 0161'),
                        (146, 46, '4539 363 01 2595'),
                        (147, 47, '4707157616976'),
                        (148, 48, '4532 8487 7909 9309'),
                        (149, 49, '4485 944 05 2751'),
                        (150, 50, '455 65349 00249 317');
                    /*!40000 ALTER TABLE renter ENABLE KEYS */;
                    UNLOCK TABLES;

                    --
                    -- Table structure for table state
                    --

                    DROP TABLE IF EXISTS state;
                    /*!40101 SET @saved_cs_client     = @@character_set_client */;
                    /*!40101 SET character_set_client = utf8 */;
                    CREATE TABLE state
                    (
                        StateID int(11) NOT NULL
                        AUTO_INCREMENT,
  StateName varchar
                        (45) NOT NULL,
  StateAbbr varchar
                        (2) NOT NULL,
  PRIMARY KEY
                        (StateID)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table state
--

LOCK TABLES state WRITE;
/*!40000 ALTER TABLE state DISABLE KEYS */;

                        SELECT *
                        FROM state;

                        INSERT INTO state
                        VALUES
                            (StateName, StateAbbr)
                        ('Alaska', 'AK'),
                        ('Alabama', 'AL'),
                        ('Arkansas', 'AR'),
                        ('Arizona', 'AZ'),
                        ('California', 'CA'),
                        ('Colorado', 'CO'),
                        ('Connecticut', 'CT'),
                        ('District of Columbia', 'DC'),
                        ('Delaware', 'DE'),
                        ('Florida', 'FL'),
                        ('Georgia', 'GA'),
                        ('Hawaii', 'HI'),
                        ('Iowa', 'IA'),
                        ('Idaho', 'ID'),
                        ('Illinois', 'IL'),
                        ('Indiana', 'IN'),
                        ('Kansas', 'KS'),
                        ('Kentucky', 'KY'),
                        ('Louisiana', 'LA'),
                        ('Massachusetts', 'MA'),
                        ('Maryland', 'MD'),
                        ('Maine', 'ME'),
                        ('Michigan', 'MI'),
                        ('Minnesota', 'MN'),
                        ('Missouri', 'MO'),
                        ('Mississippi', 'MS'),
                        ('Montana', 'MT'),
                        ('North Carolina', 'NC'),
                        ('North Dakota', 'ND'),
                        ('Nebraska', 'NE'),
                        ('New Hampshire', 'NH'),
                        ('New Jersey', 'NJ'),
                        ('New Mexico', 'NM'),
                        ('Nevada', 'NV'),
                        ('New York', 'NY'),
                        ('Ohio', 'OH'),
                        ('Oklahoma', 'OK'),
                        ('Oregon', 'OR'),
                        ('Pennsylvania', 'PA'),
                        ('Rhode Island', 'RI'),
                        ('South Carolina', 'SC'),
                        ('South Dakota', 'SD'),
                        ('Tennessee', 'TN'),
                        ('Texas', 'TX'),
                        ('Utah', 'UT'),
                        ('Virginia', 'VA'),
                        ('Vermont', 'VT'),
                        ('Washington', 'WA'),
                        ('Wisconsin', 'WI'),
                        ('West Virginia', 'WV'),
                        ('Wyoming', 'WY');

/*!40000 ALTER TABLE state ENABLE KEYS */;
UNLOCK TABLES;

                        --
                        -- Table structure for table trips
                        --

                        DROP TABLE IF EXISTS trips;
                        /*!40101 SET @saved_cs_client     = @@character_set_client */;
                        /*!40101 SET character_set_client = utf8 */;
                        CREATE TABLE trips
                        (
                            TripId int(11) NOT NULL
                            AUTO_INCREMENT,
  TripStartTime datetime
                            (6) DEFAULT NULL,
  TripEndTime datetime
                            (6) DEFAULT NULL,
  TripDate datetime
                            (6) DEFAULT NULL,
  TripTypeId int
                            (11) DEFAULT NULL,
  TruckID int
                            (11) DEFAULT NULL,
  RenterUserID int
                            (11) DEFAULT NULL,
  TripStartLocationStreetName varchar
                            (255) DEFAULT NULL,
  TripStartLocationStateID int
                            (11) DEFAULT NULL,
  TripStartLocationCityID int
                            (11) DEFAULT NULL,
  TripBookingTime varchar
                            (255) DEFAULT NULL,
  TripStartLocationZipcodeID int
                            (11) DEFAULT NULL,
  TripDestinationStreetName varchar
                            (255) DEFAULT NULL,
  TripDestinationStateID int
                            (11) DEFAULT NULL,
  TripDestinationCityID int
                            (11) DEFAULT NULL,
  TripDestinationZipcodeID int
                            (11) DEFAULT NULL,
  PRIMARY KEY
                            (TripId),
  KEY RenterUserIDX_idx
                            (RenterUserID),
  KEY TripTypeIDX_idx
                            (TripTypeId),
  KEY TruckIDX_idx
                            (TruckID),
  KEY TripStartStateIDX1_idx
                            (TripStartLocationStateID),
  KEY TripStartCityIDX1_idx
                            (TripStartLocationCityID),
  KEY TripStartZipcodeIDX1_idx
                            (TripStartLocationZipcodeID),
  KEY TripEndStateIDX1_idx
                            (TripDestinationStateID),
  KEY TripEndCityIDX1_idx
                            (TripDestinationCityID),
  KEY TripEndZipcodeIDX1_idx
                            (TripDestinationZipcodeID),
  KEY RenterUserIDX_idx12
                            (RenterUserID),
  KEY TripTypeIDX_idx12
                            (TripTypeId),
  KEY TruckIDX_idx12
                            (TruckID),
  KEY TripStartStateIDX2_idx
                            (TripStartLocationStateID),
  KEY TripStartCityIDX2_idx
                            (TripStartLocationCityID),
  KEY TripEndStateIDX2_idx
                            (TripDestinationStateID),
  KEY TripEndCityIDX2_idx
                            (TripDestinationCityID),
  CONSTRAINT RenterUserIDX12 FOREIGN KEY
                            (RenterUserID) REFERENCES users
                            (UserID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripEndCityIDX2
                            FOREIGN KEY
                            (TripDestinationCityID) REFERENCES city
                            (CityID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripEndStateIDX2
                            FOREIGN KEY
                            (TripDestinationStateID) REFERENCES state
                            (StateID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripEndZipcodeID12
                            FOREIGN KEY
                            (TripDestinationZipcodeID) REFERENCES zipcode
                            (ID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripStartCityIDX2
                            FOREIGN KEY
                            (TripStartLocationCityID) REFERENCES city
                            (CityID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripStartStateIDX2
                            FOREIGN KEY
                            (TripStartLocationStateID) REFERENCES state
                            (StateID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripStartZipcodeID12
                            FOREIGN KEY
                            (TripStartLocationZipcodeID) REFERENCES zip
                            (ID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TripTypeIDX12
                            FOREIGN KEY
                            (TripTypeId) REFERENCES triptype
                            (TripTypeID) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION,
  CONSTRAINT TruckIDX12
                            FOREIGN KEY
                            (TruckID) REFERENCES trucks
                            (TruckId) ON
                            DELETE NO ACTION ON
                            UPDATE NO ACTION
) ENGINE=InnoDB
                            AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table trips
--

LOCK TABLES trips WRITE;
/*!40000 ALTER TABLE trips DISABLE KEYS */;
                            INSERT INTO trips
                            VALUES
                                (2, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-11 19:53:18.000000', 2, 2, 2, 'P.O. Box 380, 5508 Vulputate Rd.', 1, 1, '2017-09-01 01:51:47', 1, 'Ap #825-761 Phasellus Av.', 1, 1, 3),
                                (5, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-11-23 17:22:59.000000', 2, 5, 5, 'Ap #740-9343 Nulla. Road', 1, 1, '2018-10-01 19:03:14', 1, '695-9425 Faucibus Av.', 1, 1, 3),
                                (8, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-06-13 09:58:41.000000', 2, 8, 8, 'Ap #451-387 Mauris. Rd.', 1, 1, '2018-07-12 16:57:52', 1, '132-461 Odio Road', 1, 1, 3),
                                (9, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-05-24 06:32:44.000000', 2, 9, 9, 'Ap #919-8680 Iaculis Ave', 1, 1, '2018-10-03 19:57:05', 1, 'Ap #518-2043 Enim Street', 1, 1, 3),
                                (10, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-07-06 17:24:07.000000', 2, 10, 10, 'P.O. Box 871, 3450 Nullam St.', 1, 1, '2017-07-19 09:48:14', 1, '745-1075 Nisi Rd.', 1, 1, 3),
                                (12, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-02-01 19:45:05.000000', 1, 12, 12, 'Ap #930-4137 In Street', 1, 1, '2018-12-08 10:44:56', 1, '111-5436 Augue. Rd.', 1, 1, 3),
                                (13, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-09-21 12:17:59.000000', 1, 13, 13, 'P.O. Box 860, 3788 Phasellus St.', 1, 1, '2017-05-03 10:58:42', 1, 'Ap #164-2576 Curabitur St.', 1, 1, 3),
                                (14, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-12-26 07:32:47.000000', 1, 14, 14, '3420 Placerat, Avenue', 1, 1, '2018-11-21 12:06:34', 1, '1181 Luctus. Ave', 1, 1, 3),
                                (15, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-31 09:49:56.000000', 1, 15, 15, 'Ap #495-8411 Aenean St.', 1, 1, '2017-12-24 11:31:42', 1, '203-6390 Lorem St.', 1, 1, 3),
                                (16, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-04-18 21:49:17.000000', 1, 16, 16, '436-123 Vel, Ave', 1, 1, '2017-10-18 11:53:40', 1, '3551 Neque. Road', 1, 1, 3),
                                (17, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-07-08 16:09:22.000000', 1, 17, 17, 'Ap #351-2117 Et Rd.', 1, 1, '2017-04-24 21:53:32', 1, '8580 Consectetuer Ave', 1, 1, 3),
                                (18, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-04-29 01:04:11.000000', 2, 18, 18, 'Ap #580-4286 Et Av.', 1, 1, '2018-12-11 06:29:04', 1, 'P.O. Box 101, 2124 Ultrices Road', 1, 1, 3),
                                (19, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-07-31 07:19:00.000000', 1, 19, 19, 'Ap #882-8652 Posuere Road', 1, 1, '2017-05-16 04:29:39', 1, '211-2546 Vitae Street', 1, 1, 3),
                                (20, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-06-26 01:42:55.000000', 1, 20, 20, '8342 Parturient Street', 1, 1, '2017-07-23 15:51:52', 1, '5204 Ac St.', 1, 1, 3),
                                (21, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-17 05:25:37.000000', 2, 21, 21, 'Ap #433-2501 Luctus Rd.', 1, 1, '2018-08-13 12:15:51', 2, '3253 Ipsum St.', 1, 1, 2),
                                (22, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-28 17:51:17.000000', 1, 22, 22, 'P.O. Box 504, 9254 Hendrerit Ave', 1, 1, '2018-04-21 03:12:13', 2, 'Ap #944-6245 Metus. Avenue', 1, 1, 2),
                                (23, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-01-21 02:45:47.000000', 1, 23, 23, 'P.O. Box 273, 699 Praesent Road', 1, 1, '2017-08-10 21:35:45', 2, '4865 Id, Road', 1, 1, 2),
                                (25, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-11-20 10:15:40.000000', 2, 25, 25, '9893 Egestas. Road', 1, 1, '2017-05-25 14:16:41', 2, '237-3118 Neque Avenue', 1, 1, 2),
                                (27, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-09-17 04:50:56.000000', 1, 27, 27, 'P.O. Box 428, 6188 Vestibulum, Road', 1, 1, '2018-06-22 00:34:36', 2, 'P.O. Box 397, 502 Vel Street', 1, 1, 2),
                                (28, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-09-11 15:33:20.000000', 2, 28, 28, '2350 Sociis Rd.', 1, 1, '2017-12-20 02:54:54', 2, '278-9087 Proin St.', 1, 1, 2),
                                (29, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-11-22 15:55:54.000000', 1, 29, 29, '8729 Orci Rd.', 1, 1, '2017-06-06 18:52:34', 2, '8998 Orci Av.', 1, 1, 2),
                                (30, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-03-03 12:15:27.000000', 2, 30, 30, '650-2712 Nullam Road', 1, 1, '2019-02-17 23:15:42', 2, '956-8494 Aenean Avenue', 1, 1, 2),
                                (31, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-12-21 09:09:35.000000', 2, 31, 31, 'P.O. Box 661, 5226 Neque. Av.', 1, 1, '2018-07-03 00:49:27', 2, '3529 Donec Rd.', 1, 1, 2),
                                (33, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-08-14 22:19:28.000000', 1, 33, 33, 'Ap #776-6607 Dignissim St.', 1, 1, '2018-03-08 16:17:01', 2, '620-9157 Arcu. Rd.', 1, 1, 2),
                                (34, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-11-20 06:34:14.000000', 2, 34, 34, 'Ap #734-7937 A, St.', 1, 1, '2019-03-13 13:41:54', 2, '3439 Mus. Avenue', 1, 1, 2),
                                (35, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-09-08 11:28:52.000000', 1, 35, 35, '935-693 Lacinia. Avenue', 1, 1, '2018-03-12 06:35:05', 2, 'Ap #516-2075 Eu Street', 1, 1, 2),
                                (37, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-08-31 07:50:57.000000', 1, 37, 37, '5113 Mattis. St.', 1, 1, '2017-09-26 23:57:34', 2, '2144 Adipiscing Road', 1, 1, 2),
                                (38, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-03-24 04:40:19.000000', 2, 38, 38, '846-6959 Malesuada Road', 1, 1, '2017-04-06 01:21:55', 2, '832-6390 Sed St.', 1, 1, 2),
                                (39, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-10-12 05:13:15.000000', 1, 39, 39, 'P.O. Box 615, 2246 Felis, Road', 1, 1, '2018-02-28 09:34:40', 2, 'P.O. Box 281, 6936 Duis Ave', 1, 1, 2),
                                (40, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-01-10 08:48:44.000000', 1, 40, 40, 'P.O. Box 722, 2365 Consequat Rd.', 1, 1, '2017-11-12 14:31:17', 2, 'Ap #824-4110 Scelerisque Ave', 1, 1, 2),
                                (41, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-08-09 19:28:52.000000', 1, 41, 41, '804-3399 Ut Avenue', 1, 1, '2018-10-28 14:31:22', 2, 'P.O. Box 716, 1126 Nunc Ave', 1, 1, 2),
                                (42, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-19 11:40:35.000000', 1, 42, 42, '5399 Tellus, Rd.', 1, 1, '2017-12-31 09:31:15', 3, '259-1050 Ipsum St.', 1, 1, 3),
                                (44, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-07-01 23:13:44.000000', 2, 44, 44, '7293 Bibendum St.', 1, 1, '2017-07-03 00:08:06', 3, 'Ap #526-6037 Suspendisse Rd.', 1, 1, 3),
                                (47, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-04-27 11:43:18.000000', 1, 47, 47, 'P.O. Box 544, 3841 Aliquam Road', 1, 1, '2017-08-30 09:15:58', 3, '5432 Duis Road', 1, 1, 3),
                                (48, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-06-08 01:31:21.000000', 2, 48, 48, 'P.O. Box 195, 6958 Sed Ave', 1, 1, '2018-02-22 23:17:35', 3, '6520 Sem, Rd.', 1, 1, 3),
                                (49, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-04-27 18:45:07.000000', 1, 49, 49, '647-8999 Lectus Ave', 1, 1, '2018-11-28 14:05:25', 3, '385-8361 Magnis Av.', 1, 1, 3),
                                (50, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-02-10 11:23:07.000000', 1, 50, 50, '8550 Aliquam Av.', 1, 1, '2019-03-01 16:45:18', 3, '9490 Sed Rd.', 1, 1, 3),
                                (52, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-10-06 15:17:07.000000', 1, 33, 78, 'P.O. Box 948, 2161 Ac, Av.', 1, 1, '2017-11-21 22:29:44', 3, '106-9220 Nec, Rd.', 1, 1, 3),
                                (54, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-09 02:01:08.000000', 1, 100, 85, '7088 Pharetra. Ave', 1, 1, '2018-08-15 14:43:15', 3, 'Ap #464-7554 Dolor, St.', 1, 1, 3),
                                (55, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-06-06 15:39:37.000000', 2, 77, 50, 'P.O. Box 768, 4683 Ornare, Rd.', 1, 1, '2018-06-06 10:10:54', 3, '4848 Lacus Ave', 1, 1, 3),
                                (56, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-01-02 11:24:29.000000', 2, 4, 55, '287-5531 Cursus Ave', 1, 1, '2018-05-27 07:19:23', 3, 'P.O. Box 717, 5371 Feugiat Avenue', 1, 1, 3),
                                (57, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-22 05:42:48.000000', 2, 41, 51, 'Ap #581-5641 Tristique Av.', 1, 1, '2018-10-06 17:29:57', 3, '538-401 Consectetuer Road', 1, 1, 3),
                                (58, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-11-15 11:44:36.000000', 2, 49, 61, 'Ap #761-197 Convallis Av.', 1, 1, '2017-10-09 18:51:42', 3, '798-1854 Convallis Av.', 1, 1, 3),
                                (59, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-08-07 01:36:44.000000', 2, 97, 62, '7294 A, Rd.', 1, 1, '2017-09-18 06:19:14', 3, '160-204 Eu Street', 1, 1, 3),
                                (60, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-09-16 10:47:33.000000', 2, 25, 68, '957-1282 Malesuada Rd.', 1, 1, '2017-08-24 08:22:46', 3, 'P.O. Box 631, 1782 Nam Ave', 1, 1, 3),
                                (61, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-01-10 22:39:02.000000', 2, 14, 38, '801-9408 Ut Street', 1, 1, '2018-11-19 02:18:15', 3, 'Ap #217-4481 Enim. Avenue', 1, 1, 3),
                                (62, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-18 14:12:33.000000', 2, 9, 56, 'Ap #830-6316 Libero Ave', 1, 1, '2019-01-13 18:26:09', 3, '2917 Arcu. Av.', 1, 1, 3),
                                (63, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-06-21 11:02:10.000000', 1, 13, 65, '2459 Maecenas Rd.', 1, 1, '2018-09-13 03:29:16', 3, 'Ap #386-6247 Non Avenue', 1, 1, 3),
                                (64, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-05-21 08:42:35.000000', 2, 96, 74, '7754 Nulla Av.', 1, 1, '2018-09-16 22:27:18', 3, '8847 Velit. Av.', 1, 1, 3),
                                (65, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-04-12 10:30:33.000000', 2, 93, 5, '996-7380 Fermentum Rd.', 1, 1, '2017-12-09 18:18:24', 3, 'Ap #480-8045 Fermentum Street', 1, 1, 3),
                                (66, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-06-09 19:35:52.000000', 1, 14, 77, 'Ap #521-726 Iaculis, Av.', 1, 1, '2018-10-29 16:30:49', 3, '2663 Curabitur Rd.', 1, 1, 3),
                                (67, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-02-01 11:12:22.000000', 2, 51, 21, 'Ap #421-5504 Dui Av.', 1, 1, '2017-06-10 10:12:10', 3, 'P.O. Box 761, 1628 Phasellus Rd.', 1, 1, 3),
                                (68, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-11-26 19:40:42.000000', 2, 96, 16, 'Ap #129-5641 Donec Av.', 1, 1, '2018-01-20 10:45:50', 3, 'P.O. Box 313, 6054 Eros Road', 1, 1, 3),
                                (69, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-12 12:16:10.000000', 1, 1, 15, 'P.O. Box 489, 4890 Bibendum. St.', 1, 1, '2018-03-19 04:15:08', 3, 'P.O. Box 861, 2068 Egestas Rd.', 1, 1, 3),
                                (70, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-07 22:36:52.000000', 2, 72, 75, '415-2168 Vestibulum, Ave', 1, 1, '2018-06-21 02:44:09', 3, '401-9136 Montes, Avenue', 1, 1, 3),
                                (71, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-06-14 11:45:05.000000', 2, 23, 10, '457-774 Tincidunt Ave', 1, 1, '2018-11-24 12:55:14', 3, '783-4803 Non, Av.', 1, 1, 3),
                                (72, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-07-31 15:18:16.000000', 2, 61, 64, '2484 Lectus St.', 1, 1, '2018-01-05 11:44:53', 3, '571-7174 Neque Rd.', 1, 1, 3),
                                (73, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-04-28 19:43:47.000000', 1, 3, 41, '8885 Integer Avenue', 1, 1, '2019-02-23 12:44:34', 3, '3011 Pede Av.', 1, 1, 3),
                                (74, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-15 08:04:57.000000', 1, 97, 20, 'P.O. Box 476, 5378 Iaculis, St.', 1, 1, '2018-06-26 18:56:09', 3, 'Ap #999-6622 Molestie Street', 1, 1, 3),
                                (75, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-12-08 04:48:30.000000', 2, 61, 46, 'Ap #905-8255 Sed, St.', 1, 1, '2018-02-03 14:58:50', 3, 'Ap #836-1833 Arcu. Street', 1, 1, 3),
                                (76, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-07-21 19:58:37.000000', 2, 13, 63, '2905 Iaculis Avenue', 1, 1, '2019-01-17 07:49:28', 3, '824-6400 Aliquet, Rd.', 1, 1, 3),
                                (77, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-31 12:22:38.000000', 1, 63, 90, '9101 Senectus Rd.', 1, 1, '2018-11-09 09:01:48', 3, '4122 Proin Street', 1, 1, 3),
                                (78, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-03-27 07:44:28.000000', 2, 23, 28, 'Ap #598-8364 Neque. Avenue', 1, 1, '2018-04-19 19:31:00', 3, 'P.O. Box 160, 9074 Nulla St.', 1, 1, 3),
                                (80, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-04-26 14:06:47.000000', 1, 25, 42, '9529 Sed Rd.', 1, 1, '2018-07-08 12:03:49', 3, 'Ap #921-6702 Vitae Rd.', 1, 1, 3),
                                (82, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-07-29 13:17:50.000000', 2, 62, 23, '546-7876 Sed St.', 1, 1, '2019-02-22 06:45:15', 3, '852-8918 Mauris Rd.', 1, 1, 3),
                                (85, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-06-07 14:27:21.000000', 2, 67, 64, '643-5866 Augue Avenue', 1, 1, '2018-12-30 14:33:26', 3, 'P.O. Box 851, 1462 Fermentum Street', 1, 1, 3),
                                (86, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-03-10 14:54:55.000000', 1, 50, 12, 'Ap #370-155 Feugiat Rd.', 1, 1, '2017-06-10 01:30:20', 3, 'P.O. Box 691, 2765 Adipiscing Rd.', 1, 1, 3),
                                (88, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-05-25 11:48:57.000000', 1, 66, 11, 'Ap #852-3157 Varius Rd.', 1, 1, '2017-12-25 13:54:29', 3, '910-635 Vitae Road', 1, 1, 3),
                                (90, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-10-18 08:29:41.000000', 2, 90, 91, '1574 Suspendisse Avenue', 1, 1, '2017-05-14 14:48:47', 3, 'Ap #740-2877 Mollis. Rd.', 1, 1, 3),
                                (91, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-10-20 09:21:28.000000', 1, 84, 59, 'Ap #255-2677 Eu St.', 1, 1, '2018-12-10 03:45:57', 3, 'P.O. Box 639, 8757 Etiam Road', 1, 1, 3),
                                (92, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-08-25 03:33:11.000000', 2, 57, 63, 'Ap #519-3854 Proin Av.', 1, 1, '2017-04-15 17:08:39', 3, 'Ap #816-1744 Aenean Avenue', 1, 1, 3),
                                (93, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-01-15 12:26:20.000000', 2, 1, 97, '1872 Tincidunt Ave', 1, 1, '2017-09-10 03:24:38', 3, '202-8885 Vestibulum, St.', 1, 1, 3),
                                (94, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2019-01-18 17:05:21.000000', 2, 3, 25, 'Ap #951-7908 Egestas Street', 1, 1, '2018-12-12 22:34:01', 3, 'Ap #331-5613 Nunc Road', 1, 1, 3),
                                (95, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-08-06 18:28:23.000000', 1, 93, 45, '5121 Ac St.', 1, 1, '2018-01-22 06:32:38', 3, 'P.O. Box 439, 4074 Ut St.', 1, 1, 3),
                                (96, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-04-23 00:15:49.000000', 1, 54, 95, '102-7592 Eget St.', 1, 1, '2018-01-15 13:56:25', 3, 'Ap #184-1658 Et St.', 1, 1, 3),
                                (97, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2017-09-03 02:06:58.000000', 1, 97, 39, 'Ap #680-2613 Ut Avenue', 1, 1, '2017-04-26 13:54:47', 3, 'P.O. Box 465, 3457 Bibendum. St.', 1, 1, 3),
                                (98, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-07-13 23:28:34.000000', 1, 58, 94, 'Ap #128-5745 Neque Av.', 1, 1, '2017-11-08 15:38:05', 3, 'Ap #199-1338 Arcu Road', 1, 1, 3),
                                (99, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-09-12 10:35:28.000000', 2, 21, 91, '7475 Amet, Av.', 1, 1, '2017-07-01 12:18:28', 3, 'Ap #264-7221 Diam Avenue', 1, 1, 3),
                                (100, '2017-04-12 15:44:28.000000', '2017-04-12 20:44:28.000000', '2018-06-17 22:45:36.000000', 2, 62, 27, 'P.O. Box 324, 1025 Nec, Road', 1, 1, '2017-06-11 02:21:42', 3, 'P.O. Box 890, 9469 Tellus Rd.', 1, 1, 3),
                                (101, '2017-04-19 18:04:08.000000', '2017-09-29 07:52:07.000000', '2018-10-20 09:21:28.000000', 1, 84, 59, 'Ap #255-2677 Eu St.', 1, 1, '2018-12-10 03:45:57', 3, 'P.O. Box 639, 8757 Etiam Road', 1, 1, 3),
                                (103, '2017-04-19 18:04:08.000000', '2017-09-29 07:52:07.000000', '2018-10-20 09:21:28.000000', 1, 78, 59, 'Ap #255-2677 Eu St.', 1, 1, '2018-12-10 03:45:57', 3, 'P.O. Box 639, 8757 Etiam Road', 1, 1, 3);
                            /*!40000 ALTER TABLE trips ENABLE KEYS */;
                            UNLOCK TABLES;

                            --
                            -- Table structure for table triptype
                            --

                            DROP TABLE IF EXISTS triptype;
                            /*!40101 SET @saved_cs_client     = @@character_set_client */;
                            /*!40101 SET character_set_client = utf8 */;
                            CREATE TABLE triptype
                            (
                                TripTypeID int(11) NOT NULL
                                AUTO_INCREMENT,
  TripTypeName varchar
                                (45) NOT NULL,
  PRIMARY KEY
                                (TripTypeID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table triptype
--

LOCK TABLES triptype WRITE;
/*!40000 ALTER TABLE triptype DISABLE KEYS */;
                                INSERT INTO triptype
                                VALUES
                                    (1, 'Load With Driver'),
                                    (2, 'Load Without Driver');
                                /*!40000 ALTER TABLE triptype ENABLE KEYS */;
                                UNLOCK TABLES;

                                --
                                -- Table structure for table trucks
                                --

                                DROP TABLE IF EXISTS trucks;
                                /*!40101 SET @saved_cs_client     = @@character_set_client */;
                                /*!40101 SET character_set_client = utf8 */;
                                CREATE TABLE trucks
                                (
                                    TruckId int(11) NOT NULL
                                    AUTO_INCREMENT,
  Model varchar
                                    (20) DEFAULT NULL,
  Make varchar
                                    (255) DEFAULT NULL,
  Year int
                                    (11) DEFAULT NULL,
  Capacity int
                                    (11) DEFAULT NULL,
  UserID int
                                    (11) DEFAULT NULL,
  PRIMARY KEY
                                    (TruckId),
  KEY User_IDX20_idx
                                    (UserID),
  CONSTRAINT User_IDX20 FOREIGN KEY
                                    (UserID) REFERENCES users
                                    (UserID) ON
                                    DELETE NO ACTION ON
                                    UPDATE NO ACTION
) ENGINE=InnoDB
                                    AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table trucks
--

LOCK TABLES trucks WRITE;
/*!40000 ALTER TABLE trucks DISABLE KEYS */;
                                    INSERT INTO trucks
                                    VALUES
                                        (1, '21521360299', 'GMC 15\'
                                    Truck',2018,372,8),(2,'42315145199','Mauris Elit Foundation',2018,150,1),(3,'38745225999','Vovlo',2018,105,8),(4,'71732084999','Tellus Limited',2018,559,1),(5,'49201114399','Nunc Consulting',2018,839,1),(7,'51926358199','Etiam PC',2018,353,3),(8,'35489869199','Duis Mi Enim LLP',2018,906,3),(9,'46607095999','Eget Odio Ltd',2018,541,9),(10,'76352584599','Rutrum Fusce Dolor Company',2018,226,2),(12,'96613150299','Nec Urna Et Inc.',2018,255,2),(13,'90588485899','Libero Mauris Foundation',2018,512,2),(14,'52628676999','Orci In Consequat Foundation',2018,154,9),(15,'64429668299','Ullamcorper PC',2018,796,9),(16,'27737335999','Ac Ipsum LLC',2018,626,8),(17,'06967928399','Mauris Ut Quam Foundation',2018,289,2),(18,'35808308799','Eu Eleifend Nec Associates',2018,588,8),(19,'28753933699','Libero Institute',2018,412,5),(20,'41480096299','Elit Nulla PC',2018,927,5),(21,'39225377499','Tincidunt Nunc Inc.',2018,354,1),(22,'49575018899','Erat Corp.',2018,799,1),(23,'48913094399','Tincidunt Inc.',2018,793,8),(25,'91597598199','Cum Industries',2018,602,4),(27,'36595371899','Suspendisse Sed Consulting',2018,521,8),(28,'62811974499','Blandit Enim Consequat Ltd',2018,173,2),(29,'77668110899','Dui Industries',2018,623,4),(30,'33713133899','Vel Turpis Aliquam Corp.',2018,942,3),(31,'54641106899','Donec PC',2018,562,9),(33,'40660540199','Adipiscing Elit Curabitur Industries',2018,265,9),(34,'51268530699','Malesuada Id Erat Industries',2018,599,8),(35,'93261939599','Nam Porttitor PC',2018,737,5),(37,'96530878199','Amet Company',2018,149,1),(38,'07373334299','Non Hendrerit Company',2018,276,4),(39,'89763225999','Felis Nulla Incorporated',2018,998,5),(40,'11661206999','Integer Urna Associates',2018,290,10),(41,'00955642399','Lorem Corp.',2018,645,9),(42,'23894412399','Montes Corporation',2018,994,2),(44,'78927868999','Nisl Foundation',2018,108,4),(47,'72765025299','Sagittis Duis Corporation',2018,213,1),(48,'74857496899','Non Egestas Associates',2018,552,1),(49,'77614992099','In Lobortis Tellus PC',2018,833,1),(50,'55385546299','Ac Metus Vitae Consulting',2018,206,10),(51,'09951030799','Nibh Sit Amet Foundation',2018,133,9),(54,'06838408499','In Condimentum Donec Company',2018,868,8),(56,'31570124899','Curae; Phasellus Incorporated',2018,559,8),(57,'30942080499','Feugiat Corp.',2018,385,5),(58,'57698962299','Ante Bibendum Ullamcorper Corp.',2018,245,10),(59,'13483790199','Tellus Industries',2018,922,8),(60,'78575181599','Tempor Est Ac Foundation',2018,764,5),(61,'39903000899','Pede Suspendisse Dui Corp.',2018,296,3),(62,'62952477999','Velit Eu PC',2018,448,2),(63,'34764731499','Turpis Inc.',2018,858,9),(64,'50479545999','Curae; Ltd',2018,599,5),(66,'35565654799','Molestie Industries',2018,114,1),(67,'05219663499','Luctus Vulputate PC',2018,613,10),(68,'66653638999','In Faucibus Orci LLC',2018,196,2),(69,'06322563199','Est Corporation',2018,733,5),(70,'18960325499','Morbi Metus Vivamus Institute',2018,356,4),(72,'41577451499','Urna Corp.',2018,833,10),(73,'39357568599','Lacus PC',2018,391,4),(75,'15627882199','Dui Institute',2018,566,3),(77,'32407088999','Ante Iaculis Ltd',2018,540,2),(78,'96232444899','Suscipit Est LLP',2018,150,1),(79,'56937822099','Aliquam Adipiscing Corp.',2018,199,9),(82,'63400971399','Adipiscing Inc.',2018,231,10),(83,'77478317599','Nulla Dignissim PC',2018,399,9),(84,'02850446299','Imperdiet Dictum Magna Foundation',2018,573,4),(85,'71290350199','Urna Incorporated',2018,447,2),(86,'99212596499','Venenatis A Magna Corp.',2018,117,2),(89,'55498751599','Quisque Fringilla LLC',2018,804,5),(90,'80930658299','Velit Company',2018,940,9),(91,'85336680299','Ut Tincidunt Ltd',2018,684,2),(92,'29314356099','Ligula Company',2018,354,9),(93,'24839782499','Nam Tempor Industries',2018,109,2),(94,'65308157299','Consectetuer Euismod Est Incorporated',2018,100,2),(96,'30895273699','Nunc Mauris Industries',2018,325,5),(97,'59278081699','Dolor Limited',2018,411,3),(98,'76809510399','Eleifend Egestas Industries',2018,827,2),(99,'52957577499','Lorem Limited',2018,483,5),(100,'77926995299','Iaculis Industries',2018,477,4),(101,'38745225999','GMC 17\' truck',2015,110,134),
                                    (102,'21521360299','GMC 15\' truck',2016,110,135),(103,'21521360299','GMC 20\' truck',2015,110,135),
                                    (104,'38745225999','GMC 17\' truck',2015,110,142);
/*!40000 ALTER TABLE trucks ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@localhost*/ /*!50003 TRIGGER müber.trucks_BEFORE_DELETE BEFORE DELETE ON trucks FOR EACH ROW
BEGIN
delete from trips where TruckID=OLD.TruckId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table type
--

DROP TABLE IF EXISTS type;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE type (
  TypeID int(11) NOT NULL AUTO_INCREMENT,
  TypeName varchar(45) NOT NULL,
  PRIMARY KEY (TypeID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table type
--

LOCK TABLES type WRITE;
/*!40000 ALTER TABLE type DISABLE KEYS */;
INSERT INTO type VALUES (1,'Renter'),(2,'Driver');
/*!40000 ALTER TABLE type ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table users
--

DROP TABLE IF EXISTS users;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE users (
  UserID int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  Email varchar(255) NOT NULL,
  StreetName varchar(255) DEFAULT NULL,
  StateID int(11) DEFAULT NULL,
  CityID int(11) DEFAULT NULL,
  ZipcodeID int(11) DEFAULT NULL,
  DateOfBirth varchar(255) DEFAULT NULL,
  ContactNo varchar(100) DEFAULT NULL,
  TypeID int(11) NOT NULL,
  PRIMARY KEY (UserID),
  UNIQUE KEY Email_UNIQUE (Email),
  KEY Zipcode_ID_idx (ZipcodeID),
  KEY State_ID_idx (StateID),
  KEY City_ID_idx (CityID),
  KEY Type_ID_idx (TypeID),
  CONSTRAINT City_ID FOREIGN KEY (CityID) REFERENCES city (CityID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT State_ID5 FOREIGN KEY (StateID) REFERENCES state (StateID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT Type_ID FOREIGN KEY (TypeID) REFERENCES type (TypeID) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT Zipcode_ID FOREIGN KEY (ZipcodeID) REFERENCES zipcode (ID) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table users
--

LOCK TABLES users WRITE;
/*!40000 ALTER TABLE users DISABLE KEYS */;
INSERT INTO users VALUES (1,'pogaku','Mechelle','quam@luctusut.org','9233 Velit. Rd.',1,1,1,'12/31/69','1-767-450-4063',1),(2,'Harlan','Wynter','facilisis.lorem@natoque.com','Ap #732-1934 Phasellus Avenue',1,1,1,'12/31/69','1-253-493-0857',1),(3,'Yael','Kaden','adipiscing.lobortis.risus@amet.org','9974 Malesuada St.',1,1,1,'12/31/69','1-724-352-3821',1),(4,'Belle','Edan','per@facilisismagnatellus.com','457-8402 Vulputate Rd.',1,1,1,'12/31/69','1-532-164-8677',1),(5,'John','Armando','et@inlobortistellus.org','9029 Purus Rd.',1,1,1,'12/31/69','1-701-984-7969',1),(8,'Carol','Kasper','CarolKasper@driver.com','Ap #590-8825 Cursus, Av.',1,1,1,'04/20/93','1-938-519-2727',2),(9,'Keith','Burke','lacus@id.com','3999 A Avenue',1,1,1,'12/31/69','1-603-271-3654',1),(10,'Hilel','John','John@renter.com','P.O. Box 538, 562 Arcu. St.',1,1,1,'04/20/93','1-525-916-9203',1),(11,'Molly','Avram','tincidunt@Nunc.com','685-3492 Cursus Av.',1,1,1,'12/31/69','1-996-312-5996',1),(12,'Linus','Brett','Cum.sociis@quisaccumsan.co.uk','Ap #778-2289 Magna Road',1,1,1,'12/31/69','1-277-373-8353',1),(13,'Colin','Jasper','Nunc@tortoratrisus.org','Ap #365-4277 Tempus Ave',1,1,1,'12/31/69','1-249-935-9357',1),(14,'Laith','Bruno','Nullam.ut.nisi@lobortisquispede.org','Ap #409-2889 Augue, Av.',1,1,1,'12/31/69','1-247-695-0812',1),(15,'Wendy','Leilani','fringilla.mi.lacinia@Pellentesquehabitant.net','641-3042 Justo Rd.',1,1,1,'12/31/69','1-436-102-4538',1),(16,'Fredericka','Lani','interdum@vulputateposuere.com','7593 Nibh St.',1,1,1,'12/31/69','1-741-167-4499',1),(17,'Yasir','Sylvester','Donec.at@ligula.edu','135-1335 Pharetra. Rd.',1,1,1,'12/31/69','1-581-870-1761',1),(18,'Rhona','Alec','euismod.in.dolor@sitamet.org','103-3968 Arcu. Rd.',1,1,1,'12/31/69','1-193-484-4200',1),(19,'Samantha','Kirk','molestie.tellus@a.com','1944 Sed Rd.',1,1,1,'12/31/69','1-496-484-8428',1),(20,'Jack','Jolie','conubia@lectus.edu','2084 Non Ave',1,1,1,'12/31/69','1-901-321-4693',1),(21,'Ursula','
                                    Grant','vitae@pedeblanditcongue.com','P.O. Box 489, 6064 Curae; Rd.',1,1,1,'12/31/69','1-343-954-7553',1),(22,'Donna','Jared','diam.Proin.dolor@sedconsequatauctor.com','Ap #450-5485 Cursus, Rd.',1,1,1,'12/31/69','1-425-795-2786',1),(23,'Skyler','Orli','sit.amet@purusDuiselementum.edu','Ap #131-8022 Semper Rd.',1,1,1,'12/31/69','1-243-656-4557',1),(24,'Paula','Vivien','lectus.a.sollicitudin@enimSednulla.ca','Ap #365-2790 Imperdiet Street',1,1,1,'12/31/69','1-717-362-5113',1),(25,'Blossom','Clementine','Etiam.bibendum@liberoProin.org','Ap #389-2857 Mauris Street',1,1,1,'12/31/69','1-470-673-7370',1),(26,'Mark','Christian','ridiculus.mus@idenimCurabitur.org','P.O. Box 683, 3233 Phasellus Street',1,1,1,'12/31/69','1-420-837-9456',1),(27,'Lionel','Ariana','sem.magna@Donec.edu','435 Rutrum Ave',1,1,1,'12/31/69','1-628-869-9419',1),(28,'Levi','Virginia','urna.et@Maecenas.co.uk','3523 Et St.',1,1,1,'12/31/69','1-522-841-9788',1),(29,'Jeanette','Garrett','in@natoque.ca','117-9299 Eget Road',1,1,1,'12/31/69','1-324-252-6651',1),(30,'Martin','Camille','convallis@rutrumjusto.org','276-5920 At St.',1,1,1,'12/31/69','1-221-400-2976',1),(31,'Raphael','Wynne','nunc.risus@magnatellusfaucibus.net','362-7424 Cursus Road',1,1,1,'12/31/69','1-618-855-6144',1),(32,'Blaze','Rooney','nunc.sit.amet@Praesent.org','897-1926 Turpis Rd.',1,1,1,'12/31/69','1-591-748-4908',1),(33,'Destiny','Kenneth','enim.nisl@necanteMaecenas.co.uk','182-3807 Arcu. Rd.',1,1,1,'12/31/69','1-550-392-7415',1),(34,'Coby','Shay','ante.Nunc@Donecfelisorci.org','9792 Per Road',1,1,1,'12/31/69','1-203-839-7401',1),(35,'Linus','Keiko','lacinia.orci@nostra.ca','4158 Molestie Av.',1,1,1,'12/31/69','1-120-840-5757',1),(36,'Thor','Scarlet','diam.dictum.sapien@parturientmontesnascetur.edu','2118 Vehicula Road',1,1,1,'12/31/69','1-994-104-4862',1),(37,'Hakeem','Boris','fringilla.porttitor@enimSuspendisse.edu','P.O. Box 132, 7833 Quis Rd.',1,1,1,'12/31/69','1-633-809-9921',1),(38,'Eaton','Jamalia','justo.nec.ante@eratvelpede.edu','873-7454 Nec Road',1,1,1,'12/31/69','1-158-600-6794',1),(39,'Avram','Nasim','Vivamus@Donecegestas.org','9223 Molestie Ave',1,1,1,'12/31/69','1-941-813-3898',1),(40,'Holmes','Sybill','aliquam.arcu.Aliquam@interdum.edu','P.O. Box 532, 4246 Magna Av.',1,1,1,'12/31/69','1-352-637-7561',1),(41,'Rowan','Imani','ipsum.nunc.id@liberoProinsed.com','1304 Mauris Ave',1,1,1,'12/31/69','1-976-270-1975',1),(42,'Ruby','Stephen','arcu@sedturpisnec.net','4228 Adipiscing Avenue',1,1,1,'12/31/69','1-652-826-9255',1),(43,'Hoyt','Kirk','malesuada@facilisis.co.uk','128-8898 Faucibus St.',1,1,1,'12/31/69','1-990-195-6840',1),(44,'Keaton','Cedric','a.felis@augue.org','P.O. Box 428, 7723 Non Rd.',1,1,1,'12/31/69','1-202-362-7885',1),(45,'Yoko','Willow','aliquet@tinciduntadipiscingMauris.org','2210 Nec Rd.',1,1,1,'12/31/69','1-223-327-4916',1),(46,'Xyla','Finn','enim@rutrumFuscedolor.org','7028 Per St.',1,1,1,'12/31/69','1-275-974-9193',1),(47,'Zenaida','Clementine','et.tristique.pellentesque@felispurus.co.uk','1108 Aliquet, Street',1,1,1,'12/31/69','1-481-616-3368',1),(48,'Mari','Whilemina','cursus.non.egestas@adipiscinglacus.co.uk','Ap #689-4062 Faucibus Road',1,1,1,'12/31/69','1-688-446-9594',1),(49,'Samson','Sigourney','vel.convallis.in@Loremipsumdolor.com','297-5914 Aliquam Road',1,1,1,'12/31/69','1-907-813-4953',1),(50,'Barry','Wyatt','mi@enim.org','6522 Vulputate, St.',1,1,1,'12/31/69','1-357-409-5507',1),(51,'Harrison','Malik','a.sollicitudin.orci@scelerisqueneque.ca','687-1040 Venenatis Rd.',1,1,1,'12/31/69','1-974-446-4512',2),(52,'Paul','Kyla','Suspendisse.commodo@Cras.co.uk','P.O. Box 943, 1240 Integer Road',1,1,1,'12/31/69','1-997-223-4654',2),(53,'Alvin','Dorian','fermentum.vel.mauris@ametdiam.ca','P.O. Box 643, 889 Pede Street',1,1,1,'12/31/69','1-418-386-9454',2),(54,'Lillith','Ria','erat.volutpat.Nulla@Nullam.co.uk','Ap #683-7504 Aliquam, Rd.',1,1,1,'12/31/69','1-716-820-4378',2),(55,'Erasmus','Eugenia','pede@dapibus.ca','Ap #830-9379 Justo Road',1,1,1,'12/31/69','1-246-714-6474',2),(56,'Kaden','Venus','natoque.penatibus@temporaugue.co.uk','8523 Egestas. Avenue',1,1,1,'12/31/69','1-150-372-2018',2),(57,'Ruby','Wendy','dignissim.tempor.arcu@tinciduntDonec.net','Ap #642-856 Nunc St.',1,1,1,'12/31/69','1-831-535-9959',2),(58,'Brenna','Kai','mus@Suspendisseseddolor.co.uk','Ap #798-8621 At St.',1,1,1,'12/31/69','1-495-295-0474',2),(59,'Leigh','Richard','mollis.lectus@justo.ca','P.O. Box 400, 673 Quis St.',1,1,1,'12/31/69','1-228-715-5059',2),(60,'Hunter','Zeph','sit.amet.consectetuer@ridiculusmus.com','P.O. Box 530, 6547 Dignissim Rd.',1,1,1,'12/31/69','1-772-296-7828',2),(61,'Octavius','Calvin','orci.luctus.et@nuncest.co.uk','P.O. Box 647, 1436 Convallis Street',1,1,1,'12/31/69','1-812-311-2223',2),(62,'Eric','Belle','dolor@Integervulputate.edu','1356 Ligula. Avenue',1,1,1,'12/31/69','1-466-490-3365',2),(63,'Ira','Ciara','mauris@elit.edu','P.O. Box 741, 5193 Ut Av.',1,1,1,'12/31/69','1-468-495-1565',2),(64,'George','Molly','libero.et@senectuset.co.uk','P.O. Box 667, 8815 Non St.',1,1,1,'12/31/69','1-362-760-8768',2),(65,'Brady','Caesar','fermentum.arcu@magna.com','303-887 Dolor Road',1,1,1,'12/31/69','1-780-794-6686',2),(66,'Zachery','Veda','Etiam@fermentumvelmauris.edu','P.O. Box 667, 8593 Lectus Ave',1,1,1,'12/31/69','1-205-889-1513',2),(67,'Melanie','Xenos','imperdiet.non@orcilobortisaugue.org','Ap #378-2055 A St.',1,1,1,'12/31/69','1-146-548-2926',2),(68,'Signe','Yvonne','libero@est.edu','649-5787 Sit St.',1,1,1,'12/31/69','1-701-720-8616',2),(69,'Winter','Brittany','fermentum.convallis@elit.com','P.O. Box 773, 8686 Tortor Road',1,1,1,'12/31/69','1-280-809-3983',2),(70,'Zenia','Hiram','tincidunt@estmollisnon.ca','Ap #636-3057 Pharetra. Road',1,1,1,'12/31/69','1-140-886-1909',2),(71,'Fatima','Abigail','ultrices@Aeneaneuismod.ca','617-4062 Tincidunt Rd.',1,1,1,'12/31/69','1-488-577-9283',2),(72,'Xenos','Drake','ultrices.sit@ligulaAeneaneuismod.com','9495 Tortor, Street',1,1,1,'12/31/69','1-326-124-0185',2),(73,'Brandon','Lacota','sit.amet@nonummyultricies.net','5497 Tempor Road',1,1,1,'12/31/69','1-955-995-6377',2),(74,'Desirae','Lars','accumsan.laoreet@odio.com','827-2181 Lorem. St.',1,1,1,'12/31/69','1-295-860-4679',2),(75,'Jamal','Christen','ut.odio@eueuismod.org','4091 Auctor. Avenue',1,1,1,'12/31/69','1-254-888-3350',2),(76,'Emerald','Upton','eu@veliteu.ca','Ap #822-6364 Ante Avenue',1,1,1,'12/31/69','1-475-616-4750',2),(77,'Brock','Ciaran','lacus.varius.et@vitaerisusDuis.com','7807 Lorem, St.',1,1,1,'12/31/69','1-711-256-4256',2),(78,'Amal','Bruno','ornare@sedsapien.net','7719 Id St.',1,1,1,'12/31/69','1-786-975-6422',2),(79,'Jameson','Jena','Aenean.gravida@sem.co.uk','P.O. Box 312, 1165 Auctor Road',1,1,1,'12/31/69','1-249-906-9984',2),(80,'Brandon','Jolie','sagittis.felis.Donec@aliquamenim.net','Ap #404-6288 Sapien. Rd.',1,1,1,'12/31/69','1-153-884-8893',2),(81,'Thomas','Joshua','ac@velitAliquamnisl.ca','Ap #816-3150 Sit Street',1,1,1,'12/31/69','1-477-338-0449',2),(82,'Alfreda','Tanner','vitae@molestieorci.com','P.O. Box 665, 9442 Suspendisse Rd.',1,1,1,'12/31/69','1-471-906-0199',2),(83,'Isabella','Whitney','eget.dictum@torquentperconubia.co.uk','6593 Lorem Rd.',1,1,1,'12/31/69','1-366-651-0394',2),(84,'Vincent','Gisela','et@neccursusa.co.uk','Ap #446-9815 Semper Av.',1,1,1,'12/31/69','1-317-918-0411',2),(85,'Kimberley','Grace','ac.turpis@interdumSed.edu','7673 Tempor, Rd.',1,1,1,'12/31/69','1-861-326-8071',2),(86,'Georgia','Thomas','fringilla.est@enimnec.com','P.O. Box 778, 5388 Vitae, Street',1,1,1,'12/31/69','1-927-592-7412',2),(87,'Tatum','Dillon','urna.Ut.tincidunt@erategettincidunt.ca','Ap #305-6297 Enim. St.',1,1,1,'12/31/69','1-110-653-4452',2),(88,'Shaine','Myra','metus.sit.amet@nonummy.org','540-6764 Porttitor St.',1,1,1,'12/31/69','1-726-691-7363',2),(89,'Isaac','Nayda','Mauris@risus.co.uk','Ap #725-7980 Nisl. St.',1,1,1,'12/31/69','1-877-228-0684',2),(90,'Cameron','Yvonne','sit.amet@DonecestNunc.com','P.O. Box 464, 8313 Consequat Street',1,1,1,'12/31/69','1-548-440-7692',2),(91,'Quinn','Cheyenne','consectetuer@egestasrhoncus.com','670-1306 In St.',1,1,1,'12/31/69','1-239-970-6428',2),(92,'Theodore','Samuel','Aenean.gravida.nunc@cursus.com','959-2208 Vel, St.',1,1,1,'12/31/69','1-245-643-5936',2),(93,'Dane','Ayanna','nisi.dictum.augue@nec.org','Ap #576-1903 Odio. St.',1,1,1,'12/31/69','1-975-112-7439',2),(94,'Prescott','Gail','gravida@adipiscingMaurismolestie.ca','Ap #167-408 Aliquam Road',1,1,1,'12/31/69','1-174-876-1415',2),(95,'Jade','Justina','facilisis.lorem.tristique@libero.org','Ap #964-5327 Libero Avenue',1,1,1,'12/31/69','1-417-785-7686',2),(96,'Leandra','Alfreda','pharetra.Nam@viverraMaecenas.net','1087 Mollis Rd.',1,1,1,'12/31/69','1-167-339-1705',2),(97,'Scarlett','Lesley','faucibus.lectus.a@ultrices.ca','P.O. Box 741, 4193 Nec, Street',1,1,1,'12/31/69','1-493-935-1143',2),(98,'Shoshana','Tanek','volutpat@dolor.ca','Ap #824-3481 Laoreet Avenue',1,1,1,'12/31/69','1-898-687-2232',2),(99,'Joshua','Oliver','lobortis@ametdiam.ca','P.O. Box 265, 3984 Et Rd.',1,1,1,'12/31/69','1-228-967-9817',2),(100,'Skyler','Nora','Nam.porttitor@ornare.net','384-499 Natoque St.',1,1,1,'12/31/69','1-707-967-9655',2),(101,'Alekhya','Pogaku','apogaku@uncc.edu','9233 Velit. Rd.',1,1,1,'08/09/1993','1-767-450-4063',1),(102,'Nithin','kalva','nithin@test.com','tesmp',1,1,1,NULL,'1231212312',1),(112,'askhdf','adfh','asf@hedk.svo','asfdnb',1,1,1,NULL,'2323431312',1),(113,'adafsd','sdfsd','sdfsd@sdfd.com','defds',1,1,1,NULL,'2342342343',1),(125,'adafsd','sdfsd','test@test.com','defds',1,1,1,'08/09/1993','2342342343',1),(127,'adafsd','sdfsd','test1@test.com','defds',1,1,1,'08/09/1993','2342342343',1),(128,'Alekhya','Test','alk@test.vom','segdsd',1,1,1,'2018-04-11','1231231234',1),(129,'Aravind','Pogaku','aravindpogaku@uncc.edu','test1',1,1,1,'2018-04-03','1231232112',1),(130,'Suresh','test','suresh@test.com','asdfad',1,1,1,'2018-04-11','12312312345',1),(131,'Alekhya','Drivetest','user2@test.com','9505apt l',1,1,1,'2018-04-27','1231234567',1),(132,'AlekhyaDriver','Pogaku','user3@test.com','9505',1,1,1,'2018-04-27','1234567889',1),(133,'Nithin','Kalva','nithindriver@test.com','1386 E barstow',1,1,1,'2018-04-27','1231234567',1),(134,'Suresh','d1','user6@test.com','9505aptl',1,1,1,'2018-04-28','234234234',1),(135,'sdf','jsd','kjsed@hsd.com','sdf',1,1,1,'2018-12-31','sdf',1),(136,'Nithin','driver','user7@test.com','adfhsd',1,1,1,'2018-04-26','23423423423',1),(140,'Alekhya','Pogaku','user8@test.com','Laoreet Avenue',1,1,1,'2018-12-31','1231234',2),(142,'Alekhya','Pogaku','user9@test.com','Ap Laoreet Avenue',1,1,1,'2018-12-31','1231234',2);
/*!40000 ALTER TABLE users ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table zipcode
--

DROP TABLE IF EXISTS zipcode;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE zipcode (
  ID int(11) NOT NULL,
  Zipcode varchar(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table zipcode
--

LOCK TABLES zipcode WRITE;
/*!40000 ALTER TABLE zipcode DISABLE KEYS */;
INSERT INTO zipcode VALUES (1,'28262'),(2,'28261'),(3,'26748'),(4,'45545'),(5,'54545'),(6,'76777');
/*!40000 ALTER TABLE zipcode ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'müber'
--

--
-- Dumping routines for database 'müber'
--
/*!50003 DROP PROCEDURE IF EXISTS calculateRate */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE calculateRate(
	in start_time datetime,
    in end_time datetime,
    in cap int,
    in triptype int,
    out rateVal float)
BEGIN
	declare hours float(22);
    set hours = calculateTimeDiff(start_time, end_time);
    
    select (hours * (
					select rate
                    from pricechart
                    where capacity = cap and
                    TripTypeID = triptype)) into rateVal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS DriverEarnings */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE DriverEarnings(IN param1 INT)
BEGIN

Select p.Rate from müber.trucks t,müber.pricechart p where t.UserID= param1 and t.Capacity=p.Capacity;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS retrieveTripDetails */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE retrieveTripDetails(
	in first_Name varchar(255),
    in last_Name varchar(255))
BEGIN
	select *
    from trips
    where RenterUserID in
		(
			select UserID
            from users
            where FirstName = first_Name and
            LastName = last_Name
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view active_users_list
--

/*!50001 DROP VIEW IF EXISTS active_users_list*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW active_users_list AS select t.Make AS TRUCK_NAME,t.Capacity AS TRUCK_CAPACITY,u.FirstName AS RENTER_FIRSTNAME,u.LastName AS RENTER_LASTNAME,p.Rate AS Charges from ((trucks t join users u) join pricechart p) where ((t.UserID = u.UserID) and (p.Capacity = t.Capacity)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view driverbookinghistory
--

/*!50001 DROP VIEW IF EXISTS driverbookinghistory*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW driverbookinghistory AS select trips.TripStartTime AS TripStartTime,trips.TripEndTime AS TripEndTime,users.FirstName AS FirstName,users.LastName AS LastName,trips.TripStartLocationStreetName AS TripStartLocationStreetName,trips.TripDestinationStreetName AS TripDestinationStreetName,triptype.TripTypeName AS TripTypeName from ((trips join users) join triptype) where ((users.UserID = '1') and (trips.TripTypeId = triptype.TripTypeID)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
