CREATE TABLE Person(
PersonUuid UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
Email VARCHAR(50) NOT NULL UNIQUE,
Password VARCHAR(100)NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
IsAdmin BIT NOT NULL DEFAULT 0,
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
BookLanguage VARCHAR(30),
BookDescription VARCHAR(MAX),
Publisher VARCHAR(150)
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
Genre VARCHAR(30) NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY(GenreId),
FOREIGN KEY (BookId) REFERENCES Book(BookUuid)
);

CREATE TABLE Author(
AuthorId INT NOT NULL IDENTITY(1,1),
AuthorName VARCHAR(50) NOT NULL,
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
SET @newId = NEWID();
INSERT INTO Person
VALUES (DEFAULT, 'Test1@testing.com', 'password1', 'Ryan', 'Hothan', 1), (@newId, 'Test2@testing.com', 'password2', 'Javier', 'Lee', 0);

INSERT INTO RegisteredUser
VALUES (@newId, '1234567890', 1);
--BOOK ONE

SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Game of Thrones (A Song of Ice and Fire, Book 1)', 'http://i.imgur.com/8baeeXu.jpg', GETDATE(), 5, DEFAULT, 'English', 'Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom’s protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones.', 'Bantam; Mti Rep edition');

INSERT INTO Author(AuthorName, BookId)
VALUES('George R. R. Martin', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Action & Adventure', @newId);

--BOOK TWO
SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Age of Ambition - Chasing Fortune. Truth and Faith in the New China', 'http://i.imgur.com/W3oMPpE.jpg', GETDATE(), 5, DEFAULT, 'English', 'A vibrant, colorful, and revelatory inner history of China during a moment of profound transformation. From abroad, we often see China as a caricature: a nation of pragmatic plutocrats and ruthlessly dedicated students destined to rule the global economy—or an addled Goliath, riddled with corruption and on the edge of stagnation. What we don’t see is how both powerful and ordinary people are remaking their lives as their country dramatically changes. As the Beijing correspondent for The New Yorker, Evan Osnos was on the ground in China for years, witness to profound political, economic, and cultural upheaval. In Age of Ambition, he describes the greatest collision taking place in that country: the clash between the rise of the individual and the Communist Party’s struggle to retain control. He asks probing questions: Why does a government with more success lifting people from poverty than any civilization in history choose to put strict restraints on freedom of expression? Why do millions of young Chinese professionals—fluent in English and devoted to Western pop culture—consider themselves “angry youth,” dedicated to resisting the West’s influence? How are Chinese from all strata finding meaning after two decades of the relentless pursuit of wealth? Writing with great narrative verve and a keen sense of irony, Osnos follows the moving stories of everyday people and reveals life in the new China to be a battleground between aspiration and authoritarianism, in which only one can prevail.', 'Farrar, Straus and Giroux; F First Edition edition');

INSERT INTO Author(AuthorName, BookId)
VALUES('Evan Osnos', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Social Sciences', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Politics & Government', @newId);

--BOOK THREE
SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Faithful and Virtuous Night', 'http://i.imgur.com/oEp35qy.jpg', GETDATE(), 5, DEFAULT, 'English', ' A luminous, seductive new collection from the “fearless” (The New York Times) Pulitzer Prize–winning poet. Louise Glück is one of the finest American poets at work today. Her Poems 1962–2012 was hailed as “a major event in this country’s literature” in the pages of The New York Times. Every new collection is at once a deepening and a revelation. Faithful and Virtuous Night is no exception. You enter the world of this spellbinding book through one of its many dreamlike portals, and each time you enter it’s the same place but it has been arranged differently. You were a woman. You were a man. This is a story of adventure, an encounter with the unknown, a knight’s undaunted journey into the kingdom of death; this is a story of the world you’ve always known, that first primer where “on page three a dog appeared, on page five a ball” and every familiar facet has been made to shimmer like the contours of a dream, “the dog float[ing] into the sky to join the ball.” Faithful and Virtuous Night tells a single story but the parts are mutable, the great sweep of its narrative mysterious and fateful, heartbreaking and charged with wonder.', 'Farrar, Straus and Giroux; 1St Edition edition');

INSERT INTO Author(AuthorName, BookId)
VALUES('Louise Gluck', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Poetry', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Religion & Cultural', @newId);

--BOOK FOUR
SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Brown Girl Dreaming', 'http://i.imgur.com/fNWnLOM.jpg', GETDATE(), 5, DEFAULT, 'English', 'Raised in South Carolina and New York, Woodson always felt halfway home in each place. In vivid poems, she shares what it was like to grow up as an African American in the 1960s and 1970s, living with the remnants of Jim Crow and her growing awareness of the Civil Rights movement. Touching and powerful, each poem is both accessible and emotionally charged, each line a glimpse into a child’s soul as she searches for her place in the world. Woodson’s eloquent poetry also reflects the joy of finding her voice through writing stories, despite the fact that she struggled with reading as a child. Her love of stories inspired her and stayed with her, creating the first sparks of the gifted writer she was to become.', 'Nancy Paulsen Books; First Edition edition ');

INSERT INTO Author(AuthorName, BookId)
VALUES('Jacqueline Woodson', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Biography', @newId);

--BOOK FIVE

SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Redeployment', 'http://i.imgur.com/iAARfck.jpg', GETDATE(), 5, DEFAULT, 'English', 'Phil Klay''s Redeployment takes readers to the frontlines of the wars in Iraq and Afghanistan, asking us to understand what happened there, and what happened to the soldiers who returned. Interwoven with themes of brutality and faith, guilt and fear, helplessness and survival, the characters in these stories struggle to make meaning out of chaos.' + CHAR(13) + 'In "Redeployment", a soldier who has had to shoot dogs because they were eating human corpses must learn what it is like to return to domestic life in suburbia, surrounded by people "who have no idea where Fallujah is, where three members of your platoon died." In "After Action Report", a Lance Corporal seeks expiation for a killing he didn''t commit, in order that his best friend will be unburdened. A Morturary Affairs Marine tells about his experiences collecting remains—of U.S. and Iraqi soldiers both. A chaplain sees his understanding of Christianity, and his ability to provide solace through religion, tested by the actions of a ferocious Colonel. And in the darkly comic "Money as a Weapons System", a young Foreign Service Officer is given the absurd task of helping Iraqis improve their lives by teaching them to play baseball. These stories reveal the intricate combination of monotony, bureaucracy, comradeship and violence that make up a soldier''s daily life at war, and the isolation, remorse, and despair that can accompany a soldier''s homecoming.', 'Penguin Press HC, The; First Edition edition');

INSERT INTO Author(AuthorName, BookId)
VALUES('Phil Klay', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('War', @newId);

CREATE FULLTEXT CATALOG Book_catalog;

CREATE UNIQUE INDEX ui_Book ON Book(BookUuid);
CREATE UNIQUE INDEX ui_Author ON Author(AuthorId);
CREATE UNIQUE INDEX ui_Genre ON Genre(GenreId);

CREATE FULLTEXT INDEX ON Book
(
	Title, BookDescription, BookLanguage, Publisher
	Language 1033

)
KEY INDEX ui_Book ON Book_catalog
WITH CHANGE_TRACKING AUTO;

CREATE FULLTEXT INDEX ON Author
(
	AuthorName
	Language 1033

)
KEY INDEX ui_Author ON Book_catalog
WITH CHANGE_TRACKING AUTO;

CREATE FULLTEXT INDEX ON Genre
(
	Genre
	Language 1033

)
KEY INDEX ui_Genre ON Book_catalog
WITH CHANGE_TRACKING AUTO;