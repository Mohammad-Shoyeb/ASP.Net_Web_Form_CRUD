CREATE TABLE testtypes
(	
	typeid INT IDENTITY PRIMARY KEY,
	typename	NVARCHAR(40) NOT NULL UNIQUE
)
GO
CREATE TABLE tests
(	
	testid INT IDENTITY PRIMARY KEY,
	testname	NVARCHAR(40) NOT NULL,
	fee MONEY NOT NULL,
	typeid INT NOT NULL REFERENCES testtypes (typeid)
)
GO
CREATE TABLE testentries
(
	entryid INT NOT NULL IDENTITY PRIMARY KEY,
	patientname NVARCHAR(50) NOT NULL,
	picture NVARCHAR(150) NOT NULL,
	dateofbirth DATE NOT NULL,	
	mobileno NVARCHAR(20) NOT NULL,	
	testdate DATE NOT NULL DEFAULT GETDATE(),
	duedate DATE NOT NULL,
	[status] BIT NOT NULL
)
GO
CREATE TABLE entrytests
(
	entryid INT NOT NULL REFERENCES testentries(entryid),
	testid INT NOT NULL REFERENCES tests(testid),
	PRIMARY KEY (entryid, testid)
)
GO