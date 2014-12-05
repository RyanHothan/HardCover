CREATE TABLE Person(
PersonUuid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
Email VARCHAR(50) NOT NULL UNIQUE,
Password VARCHAR(100)NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
IsAdmin BIT NOT NULL,
PRIMARY KEY(PersonUuid));

CREATE TABLE RegisteredUser(
RegisteredUserId UNIQUEIDENTIFIER NOT NULL,
LibraryCardNumber VARCHAR(10) NOT NULL UNIQUE,
Active BIT NOT NULL DEFAULT 1,
FOREIGN KEY (RegisteredUserId) REFERENCES Person(PersonUuid),
PRIMARY KEY(RegisteredUserId)
);

CREATE TABLE Book(
BookUuid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
Title VARCHAR(100) NOT NULL,
Cover VARCHAR(200) NOT NULL,
DateAdded DATETIME NOT NULL,
NumCopies INT NOT NULL,
TimesBorrowed INT NOT NULL DEFAULT 0,
PRIMARY KEY(Bookuuid)
);

CREATE TABLE CheckedOutBook(
CheckedOutBooksId INT NOT NULL IDENTITY(1,1),
RegisteredUserId UNIQUEIDENTIFIER NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
ExpirationDate DATETIME NOT NULL,
PRIMARY KEY(CheckedOutBooksId),
FOREIGN KEY (RegisteredUserId) REFERENCES RegisteredUser(RegisteredUserId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

CREATE TABLE ReservedBook(
ReservedBookId INT NOT NULL IDENTITY(1,1),
RegisteredUserId UNIQUEIDENTIFIER NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
ReserveDate DATETIME NOT NULL,
PRIMARY KEY(ReservedBookId),
FOREIGN KEY (RegisteredUserId) REFERENCES RegisteredUser(RegisteredUserId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

CREATE TABLE Genre(
GenreId INT NOT NULL IDENTITY(1,1),
Genre VARCHAR NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY(GenreId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

CREATE TABLE Author(
AuthorId INT NOT NULL IDENTITY(1,1),
Author VARCHAR(50) NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY(AuthorId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

CREATE TABLE BookFileType(
BookFileTypeId INT NOT NULL IDENTITY(1,1),
FileType VARCHAR(6) NOT NULL,
DownloadLink VARCHAR(200) NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY(BookFileTypeId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

DECLARE @newId UNIQUEIDENTIFIER;
SET @newID = NEWID();
INSERT INTO Person
VALUES (DEFAULT, 'Test1@testing.com', 'password1', 'Ryan', 'Hothan', 1), (@newId, 'Test2@testing.com', 'password2', 'Javier', 'Lee', 0);

INSERT INTO RegisteredUser
VALUES (@newId, '1234567890', 1);



















































