--NATIONNN DA TABLEEE
CREATE TABLE Nation(
	nationID VARCHAR(5)PRIMARY KEY,
	nationName NVARCHAR(50)NOT NULL,
	prefix VARCHAR(10)NULL,
	alliance VARCHAR(10)DEFAULT'None',

	--logic
	CONSTRAINT nationcheckally CHECK(alliance IN('None','Allies','Axis'))
);

--NATIONNN DA DATAAA
INSERT INTO Nation (nationID, nationName, prefix, alliance) VALUES
(N'US', N'U.S.A.', N'USS', N'Allies'),
(N'UK', N'U.K.', N'HMS', N'Allies'),
(N'UR', N'U.S.S.R.', N'SN', N'Allies'),
(N'FR', N'France', N'MNF/FFNF', N'Allies'),
(N'ASA', N'Pan-Asia', N'Various', N'Allies'),
(N'AME', N'Pan-America', N'Various', N'Allies'),
(N'EU', N'Europe', N'Various', NULL),
(N'CW', N'Commonwealth', N'Various', N'Allies'),
(N'JP', N'Japan', N'IJN', N'Axis'),
(N'GE', N'Germany', N'SMS/KMS', N'Axis'),
(N'IT', N'Italy', N'RM', N'Axis'),
(N'NL', N'Netherlands', N'HNLMS', NULL),
(N'ES', N'Spain', N'SPS', NULL);

--CLASSS DA TABLEEE
CREATE TABLE Class(
	classID VARCHAR(30)PRIMARY KEY,
	className NVARCHAR(50)NOT NULL,
	type VARCHAR(16)NOT NULL,
	displacement INT NULL,
	maxspeed DECIMAL(5,2)NULL,
	[primary] NVARCHAR(100)NULL,
	[secondary] NVARCHAR(100)NULL,
	torpedo NVARCHAR(100)NULL,

	--foreign
	nationID VARCHAR(5) NOT NULL,

	--foconst
	CONSTRAINT Class_Nation FOREIGN KEY(nationID)REFERENCES Nation(nationID)
);

--CLASS DA DATAAA
INSERT INTO Class (classID, className, type, displacement, maxspeed, [primary], [secondary], torpedo, nationID) VALUES
(N'iowa', N'Iowa', N'Battleship', 45000, 33.0, N'3 x 3 406 mm/50 16" Mk. 7 in a turret', N'10 x 2 127 mm/38 5" Mk. 12 on a Mk. 32 mount', NULL, N'US'),
(N'yamato', N'Yamato', N'Battleship', 65000, 27.0, N'3 x 3 460 mm/45 Type 94 in a turret', N'2 x 3 155 mm/60 3rd Year Type in a turret', NULL, N'JP'),
(N'kongo', N'Kongou', N'Battleship', 36600, 30.0, N'4 x 2 356 mm/45 14" Vickers in a turret', N'16 x 1 152 mm/50 6" Vickers on a casemate mount', NULL, N'JP'),
(N'kinggeorgev', N'King George V', N'Battleship', 35000, 28.0, N'2 x 4, 1 x 2 356 mm/45 14" Mk. VII in a turret', N'8 x 2 133 mm/50 5.25" QF Mk. I on a HA/LA Mk I mount', NULL, N'UK'),
(N'admiral', N'Admiral', N'Battleship', 42100, 31.0, N'4 x 2 381 mm/42 15" Mk. I on a Mk. II mount', N'12 x 1 140 mm/50 5.5" Mk. I on a shielded mount', NULL, N'UK'),
(N'bismarck', N'Bismarck', N'Battleship', 41700, 30.0, N'4 x 2 380 mm/52 SK C/34 on a Drh LC/34 mount', N'6 x 2 150 mm/55 SK C/28 on a Dop. L. C/34 Mount', NULL, N'GE'),
(N'vittorioveneto', N'Vittorio Veneto', N'Battleship', 40724, 30.0, N'3 x 3 381 mm/50 Model 1934 in a turret', N'4 x 3 152 mm/55 Model 1934 in a turret', NULL, N'IT'),
(N'essex', N'Essex', N'Aircraft Carrier', 27100, 33.0, N'90-100 Aircraft', N'4 x 2, 4 x 1 127 mm/38 5" Mk. 12 on a Mk. 32 mount', NULL, N'US'),
(N'yorktown', N'Yorktown', N'Aircraft Carrier', 19800, 32.5, N'80-90 Aircraft', N'8 x 1 127 mm/38 5" Mk. 12 on a pedestal mount', NULL, N'US'),
(N'casablanca', N'Casablanca', N'Aircraft Carrier', 7800, 19.0, N'28 Aircraft', N'1 x 1 127 mm/38 5" Mk. 12 on a pedestal mount', NULL, N'US'),
(N'shokaku', N'Shoukaku', N'Aircraft Carrier', 25675, 34.2, N'72-84 Aircraft', N'8 x 2 127 mm/40 Type 89 on a shielded mount', NULL, N'JP'),
(N'illustrious', N'Illustrious', N'Aircraft Carrier', 23000, 30.5, N'36-57 Aircraft', N'8 x 2 114 mm/45 4.5" QF Mk I on a BD Mk. II mount', NULL, N'UK'),
(N'takao', N'Takao', N'Cruiser', 9850, 35.5, N'5 x 2 203 mm/50 20 cm 3rd Year Type No. 2 in a turret', N'4 x 2 127 mm/40 Type 89 on a shielded mount', N'4 x 4 610 mm Type 92', N'JP'),
(N'town', N'Town', N'Cruiser', 11550, 32.0, N'4 x 3 152 mm/50 6" Mk XXIII on a Mk. XXII mount', N'4 x 2 102 mm/45 4" QF Mk XVI on a HA/LA Mk. XIX mount', N'2 x 3 533 mm 21" TR Mk. IV', N'UK'),
(N'leander', N'Leander', N'Cruiser', 7270, 32.5, N'4 x 2 152 mm/50 6" Mk XXIII on a Mk. XXI mount', N'4 x 1 102 mm/45 4" QF Mk V on a HA/LA Mk. IV mount', N'2 x 4 533 mm 21" QR Mk. IV', N'CW'),
(N'zara', N'Zara', N'Cruiser', 11680, 32.0, N'4 x 2 203 mm/53 Model 1927 in a turret', N'6 x 2 100 mm/47 Model 1928 on a shielded mount', NULL, N'IT'),
(N'deutschland', N'Deutschland', N'Cruiser', 12100, 28.5, N'2 x 3 283 mm/52 28 cm SK C/28 on a C/28 mount', N'8 x 1 150 mm/55 SK C/28 on a MPL C/28 mount', N'2 x 4 533 mm', N'GE'),
(N'deruyter', N'De Ruyter', N'Cruiser', 6442, 32.0, N'3 x 2, 1 x 1 150 mm/50 Bofors No. 9 in a turret', NULL, NULL, N'NL'),
(N'fletcher', N'Fletcher', N'Destroyer', 2050, 35.0, N'5 x 1 127 mm/38 5" Mk. 12 on a Mk. 30 mount', NULL, N'2 x 5 533 mm 21" Mk. 15', N'US'),
(N'fubuki', N'Fubuki', N'Destroyer', 1750, 38.0, N'3 x 2 127 mm/50 Type 3 on a Model A mount', NULL, N'3 x 3 610 mm Type 90', N'JP'),
(N'tribal', N'Tribal', N'Destroyer', 1850, 36.5, N'4 x 2 120 mm/45 4.7" QF Mk XII on a CP Mk XIX mount', NULL, N'1 x 4 533 mm 21" QR Mk. IX', N'UK'),
(N'typevii', N'Type VII', N'Submarine', 769, 17.7, N'1 x 1 88 mm/45 SK C/35 on a Ubts L C/35 deck mount', NULL, N'4 + 1 533 mm', N'GE'),
(N'gato', N'Gato', N'Submarine', 1525, 21.0, N'1 x 1 76 mm/50 3" Mk. 21 on a deck mount', NULL, N'6 + 4 533 mm 21"', N'US');

--SHIPPP DA TABLEEE
CREATE TABLE Ship(
	shipID VARCHAR(30)PRIMARY KEY,
	shipName NVARCHAR(50)NOT NULL,
	hullNum VARCHAR(20)NULL,
	commDate DATE NULL,
	decomDate DATE NULL,
	status NVARCHAR(50)DEFAULT'Sunk',
	sunkcoord NVARCHAR(20),

	--foreign
	classID VARCHAR(30) NOT NULL,
	nationID VARCHAR(5) NOT NULL,

	--foconst
	CONSTRAINT Ship_Class FOREIGN KEY(classID)REFERENCES Class(classID),
	CONSTRAINT Ship_Nation FOREIGN KEY(nationID)REFERENCES Nation(nationID),

	--logic
	CONSTRAINT shipcheckdate CHECK(commDate IS NULL OR decomDate IS NULL OR decomDate>=commDate),
	CONSTRAINT shipcheckstatus CHECK(status IN('Sunk','Survived','Not Survived','Unknown'))
);

--SHIPPP DA DATAAA
INSERT INTO Ship (shipID, shipName, hullNum, commDate, decomDate, status, sunkcoord, classID, nationID) VALUES
(N'usjohnston43', N'Johnston', N'DD-557', '1943-10-27', '1944-10-25', N'Sunk', N'11°46''N 126°09''E', N'fletcher', N'US'),
(N'ushoel43', N'Hoel', N'DD-533', '1943-07-29', '1944-10-25', N'Sunk', N'11°46''N 126°13''E', N'fletcher', N'US'),
(N'uslo43', N'St. Lo', N'CVE-63', '1943-10-23', '1944-10-25', N'Sunk', N'11°13''N 126°05''E', N'casablanca', N'US'),
(N'jpyamato41', N'Yamato', N'1', '1941-12-16', '1945-04-07', N'Sunk', N'30°22''N 128°04''E', N'yamato', N'JP'),
(N'jpkongo13', N'Kongou', N'1', '1913-08-16', '1944-11-21', N'Sunk', N'26°09''N 121°23''E', N'kongo', N'JP'),
(N'jptakao32', N'Takao', N'1', '1932-05-31', '1946-10-27', N'Not Survived', NULL, N'takao', N'JP'),
(N'jpchokai32', N'Choukai', N'3', '1932-06-30', '1944-10-25', N'Sunk', N'11°22''N 126°22''E', N'takao', N'JP'),
(N'usenterprise38', N'Enterprise', N'CV-6', '1938-05-12', '1947-02-17', N'Not Survived', NULL, N'yorktown', N'US'),
(N'usyorktown37', N'Yorktown', N'CV-5', '1937-09-30', '1942-06-07', N'Sunk', N'30°36''N 176°34''W', N'yorktown', N'US'),
(N'ushornet41', N'Hornet', N'CV-8', '1941-10-20', '1942-10-26', N'Sunk', N'08°38''S 166°43''E', N'yorktown', N'US'),
(N'jpshokaku41', N'Shoukaku', N'1', '1941-08-08', '1944-06-19', N'Sunk', N'12°00''N 137°46''E', N'shokaku', N'JP'),
(N'jpzuikaku41', N'Zuikaku', N'2', '1941-09-25', '1944-10-25', N'Sunk', N'19°20''N 125°51''E', N'shokaku', N'JP'),
(N'ukhood20', N'Hood', N'51', '1920-05-15', '1941-05-24', N'Sunk', N'63°20''N 31°50''W', N'admiral', N'UK'),
(N'ukwalesprince41', N'Prince of Wales', N'53', '1941-01-19', '1941-12-10', N'Sunk', N'03°33''N 104°28''E', N'kinggeorgev', N'UK'),
(N'gebismarck40', N'Bismarck', N'1', '1940-08-24', '1941-05-27', N'Sunk', N'48°10''N 16°12''W', N'bismarck', N'GE'),
(N'gescharnhorst39', N'Scharnhorst', N'1', '1939-01-07', '1943-12-26', N'Sunk', N'72°16''N 28°41''E', N'bismarck', N'GE'),
(N'ukyorkduke41', N'Duke of York', N'17', '1941-11-04', '1957-05-18', N'Not Survived', NULL, N'kinggeorgev', N'UK'),
(N'ukbelfast39', N'Belfast', N'C35', '1939-08-05', '1963-08-24', N'Survived', NULL, N'town', N'UK'),
(N'gegrafspee36', N'Graf Spee', N'1', '1936-01-06', '1939-12-17', N'Sunk', N'34°58''S 56°18''W', N'deutschland', N'GE'),
(N'nlderuyter36', N'De Ruyter', N'1', '1936-10-03', '1942-02-27', N'Sunk', N'06°08''S 112°08''E', N'deruyter', N'NL'),
(N'cwperth39', N'Perth', N'D29', '1939-06-29', '1942-03-01', N'Sunk', N'05°51''S 106°07''E', N'leander', N'CW'),
(N'jpfubuki28', N'Fubuki', N'1', '1928-08-10', '1942-10-11', N'Sunk', N'09°06''S 159°38''E', N'fubuki', N'JP'),
(N'itzara31', N'Zara', N'1', '1931-10-20', '1941-03-29', N'Sunk', N'35°20''N 20°57''E', N'zara', N'IT'),
(N'itpola32', N'Pola', N'4', '1932-12-21', '1941-03-29', N'Sunk', N'35°18''N 20°55''E', N'zara', N'IT'),
(N'itveneto40', N'Vittorio Veneto', N'1', '1940-04-28', '1948-02-01', N'Not Survived', NULL, N'vittorioveneto', N'IT'),
(N'geu9640', N'U-96', N'U-96', '1940-09-14', '1945-03-30', N'Sunk', N'53°33''N 08°35''E', N'typevii', N'GE'),
(N'uscavalla44', N'Cavalla', N'SS-244', '1944-02-29', '1969-12-30', N'Survived', NULL, N'gato', N'US');

--BATTLEEE DA TABLEEE
CREATE TABLE Battle(
	battleID VARCHAR(30)PRIMARY KEY,
	battleName NVARCHAR(100)NOT NULL,
	startDate DATE NULL,
	endDate DATE NULL,
	location NVARCHAR(100)NULL
);

--BATTLEEE DA DATAAA
INSERT INTO Battle (battleID, battleName, startDate, endDate, location) VALUES
(N'samar44', N'Battle off Samar', '1944-10-25', '1944-10-25', N'Philippine Sea, Philippines'),
(N'midway42', N'Battle of Midway', '1942-06-04', '1942-06-07', N'Pacific Ocean'),
(N'guadalcanal42', N'Naval Battle of Guadalcanal', '1942-11-12', '1942-11-15', N'Solomon Islands, United Kingdom'),
(N'coralsea42', N'Battle of the Coral Sea', '1942-05-04', '1942-05-08', N'Coral Sea, Australia'),
(N'javasea42', N'Battle of the Java Sea', '1942-02-27', '1942-03-01', N'Java Sea, Indonesia'),
(N'atlantic39', N'Battle of the Atlantic', '1939-09-03', '1945-05-08', N'Atlantic Ocean'),
(N'denmarkstrait42', N'Battle of the Denmark Strait', '1941-05-24', '1941-05-24', N'Denmark Strait, Iceland'),
(N'northcape43', N'Battle of North Cape', '1943-12-26', '1943-12-26', N'Barents Sea, Norway'),
(N'riverplate39', N'Battle of the River Plate', '1939-12-13', '1939-12-13', N'South Atlantic, Uruguay'),
(N'matapan41', N'Battle of Cape Matapan', '1941-03-28', '1941-03-29', N'Mediterranean Sea, Greece'),
(N'taranto40', N'Battle of Taranto', '1940-11-11', '1940-11-12', N'Ionian Sea, Italy'),
(N'oppedestal42', N'Operation Pedestal', '1942-08-11', '1942-08-15', N'Mediterranean Sea, United Kingdom');

--PARTICIPANTTT DA TABLEEE
CREATE TABLE BattleParticipant(
	CONSTRAINT PK_BattleParticipant PRIMARY KEY (battleID, shipID),

	--foreign
	battleID VARCHAR(30) NOT NULL,
	shipID VARCHAR(30) NOT NULL,

	--foconst
	CONSTRAINT BP_Battle FOREIGN KEY(battleID)REFERENCES Battle(battleID),
	CONSTRAINT BP_Ship FOREIGN KEY(shipID)REFERENCES Ship(shipID)
);

--PARTICIPANTTT DA DATAAA
INSERT INTO BattleParticipant (battleID, shipID) VALUES
(N'samar44', N'usjohnston43'),
(N'samar44', N'ushoel43'),
(N'samar44', N'uslo43'),
(N'samar44', N'jpyamato41'),
(N'samar44', N'jpkongo13'),
(N'samar44', N'jptakao32'),
(N'samar44', N'jpchokai32'),
(N'midway42', N'usenterprise38'),
(N'midway42', N'usyorktown37'),
(N'midway42', N'jpshokaku41'),
(N'midway42', N'jpzuikaku41'),
(N'coralsea42', N'usyorktown37'),
(N'coralsea42', N'jpshokaku41'),
(N'coralsea42', N'jpzuikaku41'),
(N'guadalcanal42', N'usenterprise38'),
(N'guadalcanal42', N'jpkongo13'),
(N'guadalcanal42', N'jpfubuki28'),
(N'denmarkstrait42', N'ukhood20'),
(N'denmarkstrait42', N'ukwalesprince41'),
(N'denmarkstrait42', N'gebismarck40'),
(N'northcape43', N'gescharnhorst39'),
(N'northcape43', N'ukyorkduke41'),
(N'northcape43', N'ukbelfast39'),
(N'riverplate39', N'gegrafspee36'),
(N'javasea42', N'nlderuyter36'),
(N'javasea42', N'cwperth39'),
(N'matapan41', N'itzara31'),
(N'matapan41', N'itpola32'),
(N'matapan41', N'itveneto40'),
(N'atlantic39', N'geu9640'),
(N'atlantic39', N'uscavalla44');

--===================================
--TESUTAAAAAAAAAAAAAAAAAA

DROP TABLE BattleParticipant;
DROP TABLE Battle;
DROP TABLE Ship;
DROP TABLE Class;
DROP TABLE Nation;

--lists all US warships with commission date
SELECT
	shipName AS[Name],
	hullNum AS[Hull Number],
	commDate AS[Date of Commission],
	status AS[Status]
FROM Ship
WHERE nationID = 'US'
ORDER BY commDate ASC;

--lists all warship classes over 30,000 tons of displacement
SELECT
	Class.className AS[Class],
	Class.type AS[Type],
	Class.displacement AS[Displacement],
	Nation.nationName AS[Nation]
FROM Class
JOIN Nation ON Class.nationID=Nation.nationID
WHERE Class.displacement>30000
ORDER BY Class.displacement DESC;

--lists all ships with classes, nation names, and related information
SELECT
	Ship.shipName AS[Name],
	Ship.hullNum AS[Hull Number],
	Ship.commDate AS[Commission Date],
	Ship.decomDate AS[Decommission Date],
	Class.className AS[Class],
	Class.type AS[Type],
	Class.[primary] AS[Primary Armament],
	Class.[secondary] AS[Secondary Armament],
	Class.torpedo AS[Torpedo Armament],
	Nation.nationName AS[Nation],
	Ship.status AS[Fate],
	Ship.sunkcoord AS[Wreck Coordinates]
FROM Ship
JOIN Class ON Ship.classID=Class.classID
JOIN Nation ON Class.nationID=Nation.nationID

--truy van 1
SELECT 
    s.shipName AS [Name],
    s.hullNum AS [Hull Number],
    c.className AS [Class],
    c.type AS [Type],
    c.[primary] AS [Primary Armament]
FROM BattleParticipant bp
INNER JOIN Ship s ON bp.shipID = s.shipID
INNER JOIN Class c ON s.classID = c.classID
INNER JOIN Nation n ON s.nationID = n.nationID
WHERE bp.battleID = 'samar44' 
  AND n.alliance = 'Allies'
ORDER BY c.type, s.shipName;

--truy van 2
SELECT 
    s.shipName AS [Name],
    n.nationName AS [Nation],
    s.decomDate AS [Date of Sinking],
    s.sunkcoord AS [Wreck Coordinates (Lat/Long)]
FROM Ship s
INNER JOIN Class c ON s.classID = c.classID
INNER JOIN Nation n ON s.nationID = n.nationID
WHERE c.type = 'BB' 
  AND s.status = 'Sunk'
ORDER BY s.decomDate ASC;

--truy van 3
SELECT 
    n.nationName AS [Nation],
    n.alliance AS [Side],
    COUNT(s.shipID) AS [Number of Ships Sunk]
FROM Ship s
INNER JOIN Nation n ON s.nationID = n.nationID
WHERE s.status = 'Sunk'
GROUP BY n.nationName, n.alliance
HAVING COUNT(s.shipID) >= 2
ORDER BY [Number of Ships Sunk] DESC;