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
Publisher VARCHAR(150),
Active BIT NOT NULL DEFAULT 1,
PRIMARY KEY(Bookuuid)
);

CREATE TABLE CheckedOutBook(
CheckedOutBooksId INT NOT NULL IDENTITY(1,1),
RegisteredUserId UNIQUEIDENTIFIER NOT NULL,
BookId UNIQUEIDENTIFIER NOT NULL,
ExpirationDate DATETIME NOT NULL,
Expired BIT NOT NULL,
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
VALUES (@newId, 'Game of Thrones (A Song of Ice and Fire, Book 1)', 'http://i.imgur.com/8baeeXu.jpg', GETDATE(), 5, DEFAULT, 'English', 'Long ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister and supernatural forces are massing beyond the kingdom’s protective Wall. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the land they were born to. Sweeping from a land of brutal cold to a distant summertime kingdom of epicurean plenty, here is a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; and a determined woman undertakes the most treacherous of journeys. Amid plots and counterplots, tragedy and betrayal, victory and terror, the fate of the Starks, their allies, and their enemies hangs perilously in the balance, as each endeavors to win that deadliest of conflicts: the game of thrones.', 'Bantam; Mti Rep edition', 1);


--got
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63474', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63474', @newId)

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
VALUES (@newId, 'Age of Ambition - Chasing Fortune. Truth and Faith in the New China', 'http://i.imgur.com/W3oMPpE.jpg', GETDATE(), 5, DEFAULT, 'English', 'A vibrant, colorful, and revelatory inner history of China during a moment of profound transformation. From abroad, we often see China as a caricature: a nation of pragmatic plutocrats and ruthlessly dedicated students destined to rule the global economy—or an addled Goliath, riddled with corruption and on the edge of stagnation. What we don’t see is how both powerful and ordinary people are remaking their lives as their country dramatically changes. As the Beijing correspondent for The New Yorker, Evan Osnos was on the ground in China for years, witness to profound political, economic, and cultural upheaval. In Age of Ambition, he describes the greatest collision taking place in that country: the clash between the rise of the individual and the Communist Party’s struggle to retain control. He asks probing questions: Why does a government with more success lifting people from poverty than any civilization in history choose to put strict restraints on freedom of expression? Why do millions of young Chinese professionals—fluent in English and devoted to Western pop culture—consider themselves “angry youth,” dedicated to resisting the West’s influence? How are Chinese from all strata finding meaning after two decades of the relentless pursuit of wealth? Writing with great narrative verve and a keen sense of irony, Osnos follows the moving stories of everyday people and reveals life in the new China to be a battleground between aspiration and authoritarianism, in which only one can prevail.', 'Farrar, Straus and Giroux; F First Edition edition', 1);


--age of ambition
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63458', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63458', @newId)

INSERT INTO Author(AuthorName, BookId)
VALUES('Evan Osnos', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Social Sciences', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Politics & Government', @newId);

--BOOK THREE
SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Faithful and Virtuous Night', 'http://i.imgur.com/oEp35qy.jpg', GETDATE(), 5, DEFAULT, 'English', ' A luminous, seductive new collection from the “fearless” (The New York Times) Pulitzer Prize–winning poet. Louise Glück is one of the finest American poets at work today. Her Poems 1962–2012 was hailed as “a major event in this country’s literature” in the pages of The New York Times. Every new collection is at once a deepening and a revelation. Faithful and Virtuous Night is no exception. You enter the world of this spellbinding book through one of its many dreamlike portals, and each time you enter it’s the same place but it has been arranged differently. You were a woman. You were a man. This is a story of adventure, an encounter with the unknown, a knight’s undaunted journey into the kingdom of death; this is a story of the world you’ve always known, that first primer where “on page three a dog appeared, on page five a ball” and every familiar facet has been made to shimmer like the contours of a dream, “the dog float[ing] into the sky to join the ball.” Faithful and Virtuous Night tells a single story but the parts are mutable, the great sweep of its narrative mysterious and fateful, heartbreaking and charged with wonder.', 'Farrar, Straus and Giroux; 1St Edition edition', 1);


--virtuous
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63472', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63472', @newId)

INSERT INTO Author(AuthorName, BookId)
VALUES('Louise Gluck', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Poetry', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Religion & Cultural', @newId);

--BOOK FOUR
SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Brown Girl Dreaming', 'http://i.imgur.com/fNWnLOM.jpg', GETDATE(), 5, DEFAULT, 'English', 'Raised in South Carolina and New York, Woodson always felt halfway home in each place. In vivid poems, she shares what it was like to grow up as an African American in the 1960s and 1970s, living with the remnants of Jim Crow and her growing awareness of the Civil Rights movement. Touching and powerful, each poem is both accessible and emotionally charged, each line a glimpse into a child’s soul as she searches for her place in the world. Woodson’s eloquent poetry also reflects the joy of finding her voice through writing stories, despite the fact that she struggled with reading as a child. Her love of stories inspired her and stayed with her, creating the first sparks of the gifted writer she was to become.', 'Nancy Paulsen Books; First Edition edition ', 1);


--brown girl
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63465', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63465', @newId)


INSERT INTO Author(AuthorName, BookId)
VALUES('Jacqueline Woodson', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Biography', @newId);

--BOOK FIVE

SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Redeployment', 'http://i.imgur.com/iAARfck.jpg', GETDATE(), 5, DEFAULT, 'English', 'Phil Klay''s Redeployment takes readers to the frontlines of the wars in Iraq and Afghanistan, asking us to understand what happened there, and what happened to the soldiers who returned. Interwoven with themes of brutality and faith, guilt and fear, helplessness and survival, the characters in these stories struggle to make meaning out of chaos.' + CHAR(13) + 'In "Redeployment", a soldier who has had to shoot dogs because they were eating human corpses must learn what it is like to return to domestic life in suburbia, surrounded by people "who have no idea where Fallujah is, where three members of your platoon died." In "After Action Report", a Lance Corporal seeks expiation for a killing he didn''t commit, in order that his best friend will be unburdened. A Morturary Affairs Marine tells about his experiences collecting remains—of U.S. and Iraqi soldiers both. A chaplain sees his understanding of Christianity, and his ability to provide solace through religion, tested by the actions of a ferocious Colonel. And in the darkly comic "Money as a Weapons System", a young Foreign Service Officer is given the absurd task of helping Iraqis improve their lives by teaching them to play baseball. These stories reveal the intricate combination of monotony, bureaucracy, comradeship and violence that make up a soldier''s daily life at war, and the isolation, remorse, and despair that can accompany a soldier''s homecoming.', 'Penguin Press HC, The; First Edition edition', 1);


--redeployment
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63489', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63489', @newId)

INSERT INTO Author(AuthorName, BookId)
VALUES('Phil Klay', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('War', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Paper Magician',  'http://i.imgur.com/qziVE8S.jpg', GETDATE(), 5, DEFAULT, 'English', 'Ceony Twill arrives at the cottage of Magician Emery Thane with a broken heart. Having graduated at the top of her class from the Tagis Praff School for the Magically Inclined, Ceony is assigned an apprenticeship in paper magic despite her dreams of bespelling metal. And once she’s bonded to paper, that will be her only magic…forever.

Yet the spells Ceony learns under the strange yet kind Thane turn out to be more marvelous than she could have ever imagined—animating paper creatures, bringing stories to life via ghostly images, even reading fortunes. But as she discovers these wonders, Ceony also learns of the extraordinary dangers of forbidden magic.

An Excisioner—a practitioner of dark, flesh magic—invades the cottage and rips Thane’s heart from his chest. To save her teacher’s life, Ceony must face the evil magician and embark on an unbelievable adventure that will take her into the chambers of Thane’s still-beating heart—and reveal the very soul of the man.

From the imaginative mind of debut author Charlie N. Holmberg, The Paper Magician is an extraordinary adventure both dark and whimsical that will delight readers of all ages.', '47North', 1);


--paper
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63503', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63503', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Charlie N. Holmberg', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);

SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Blue is for Nightmares',  'http://i.imgur.com/j5XBYNq.jpg', GETDATE(), 5, DEFAULT, 'English', 'Boarding school junior Stacey Brown has nightmares too real to ignore.  Her nightmares come true. This time they''re about Drea, her best friend who''s become the target of one seriously psycho stalker. To  try and protect her, Stacey''s working with what she knows-candles, cards, incantations, and spells...

In this Deluxe Spellbook Edition you''ll find: Spells created by You and other keepers of secrets-poems, spells and meditations contributed by fans of this popular series. Extras also include an interview with the author.', 'Llewellyn Publications', 1)


--blue is for nightmare
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63464', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63464', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Laurie Faria Stolarz', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Mean Streak',  'http://i.imgur.com/mH0GKpd.jpg', GETDATE(), 5, DEFAULT, 'English', 'From #1 New York Times best-selling author Sandra Brown comes a heart-pounding story of survival, that takes the age-old question, "Does the end justify the means?" and turns it on its head.

Dr. Emory Charbonneau, a pediatrician and marathon runner, disappears on a mountain road in North Carolina. By the time her husband Jeff, miffed over a recent argument, reports her missing, the trail has grown cold. Literally. Fog and ice encapsulate the mountainous wilderness and paralyze the search for her.

While police suspect Jeff of "instant divorce," Emory, suffering from an unexplained head injury, regains consciousness and finds herself the captive of a man whose violent past is so dark that he won''t even tell her his name. She''s determined to escape him, and willing to take any risks necessary to survive. 

Unexpectedly, however, the two have a dangerous encounter with people who adhere to a code of justice all their own. At the center of the dispute is a desperate young woman whom Emory can''t turn her back on, even if it means breaking the law. Wrong becomes right at the hands of the man who strikes fear, but also sparks passion.

As her husband''s deception is revealed, and the FBI closes in on her captor, Emory begins to wonder if the man with no name is, in fact, her rescuer from those who wish her dead - and from heartbreak. Combining the nail-biting suspense and potent storytelling that has made Sandra Brown one of the world''s best loved authors, MEAN STREAK is a wildly compelling novel about love, deceit, and the choices we must make in order to survive.', 'Grand Central Publishing', 1)


--mean streak
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63485', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63485', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Sandra Brown', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Mystery', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Thriller', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Close to Home',  'http://i.imgur.com/IQcZoqf.jpg', GETDATE(), 5, DEFAULT, 'English', 'From #1 New York Times bestselling author Lisa Jackson comes an atmospheric and riveting novel of suspense that uncovers the horrifying secrets buried within a ramshackle house....

Vowing to make a fresh start, Sarah McAdams has come home to renovate the old Victorian mansion where she grew up. Her daughters, Jade and Gracie, aren’t impressed by the rundown property on the shores of Oregon’s wild Columbia River. As soon as they pull up the isolated drive, Sarah too is beset by uneasy memories—of her cold, distant mother, of the half-sister who vanished without a trace, and of a long-ago night when Sarah was found on the widow’s walk, feverish and delirious.

Ever since the original mistress of the house plunged to her death almost a century ago, there have been rumors that the place is haunted. As a girl, Sarah sensed a presence there, and soon Gracie claims to see a lady in white running up the stairs. Still, Sarah has little time to dwell on ghost stories, between overseeing construction and dealing with the return of a man from her past.

But there’s a new, more urgent menace in the small town. One by one, teenage girls are disappearing. Frantic for her daughters’ safety, Sarah feels her veneer cracking and the house’s walls closing in on her again. Somewhere deep in her memory is the key to a very real and terrifying danger. And only by confronting her worst fears can she stop the nightmare roaring back to life once more....', 'Kensington', 1)


--close to home
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63466', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63466', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Lisa Jackson', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Romance', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Mystery', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Hacks for Minecrafters: The Unofficial Guide to Tips and Tricks That Other Guides Won’t Teach You',  'http://i.imgur.com/ytGh8FJ.jpg', GETDATE(), 5, DEFAULT, 'English', 'With more than 100 million registered players, Minecraft has taken control of gamers all over the world. With Hacks for Minecrafters, you''ll be able to take back that control! Only with the help found in Hacks for Minecrafters will you be able to craft your world exactly how you want it to look, all while discovering the hidden gems of the game.

In this hacker''s guide, you''ll find expertise on:
Mining—including diamonds and rare minerals!
Farming—growing tricks, seed hacks, and the best tree-replanting techniques!
Battle—for the best weapons and armor!
Magic—top crafting hacks and book modifiers!

You will never be stuck again! With more than one hundred full-color screenshots of in-game footage, you''ll be able to carefully follow every tip with precision. It doesn’t matter if you’re playing on a PC, mobile device, or home console; with Hacks for Minecrafters, you’ll be beating the game in no time. Every block has been accounted for, all living entities have been taken into consideration, and all modes of game-play are covered!', 'Sky Pony Press', 1)


--hacks
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63475', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63475', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Megan Miller', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Games and Strategy Guides', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Sunday in the Park with Boys',  'http://i.imgur.com/1PfhQzr.jpg', GETDATE(), 5, DEFAULT, 'English', 'Jane Mai will give you advice if you ask for it. With Sunday in the Park with Boys she has given us a poetic account of self-discovery and self-loathing. In this comic as emotional cartography, persona and person collide as Mai contends with loneliness, heartache and herself.', 'Koyama Press', 1)


--sunday
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63490', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63490', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Jane Mai', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Comic', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Little Elliot, Big City',  'http://i.imgur.com/Pi1dBGv.jpg', GETDATE(), 5, DEFAULT, 'English', 'Amid the hustle and bustle of the big city, the big crowds and bigger buildings, Little Elliot leads a quiet life. In spite of the challenges he faces, Elliot finds many wonderful things to enjoy—like cupcakes! And when his problems seem insurmountable, Elliot discovers something even sweeter—a friend.', 'Henry Holt and Co.', 1)


--little elliot
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63482', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63482', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Mike Curato', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Wind in the Willows',  'http://i.imgur.com/rc3Rm0i.jpg', GETDATE(), 5, DEFAULT, 'English', 'Another beautiful book by renowned artist Robert Ingpen in the popular Sterling Illustrated Classics series.
 
For more than a century, The Wind in the Willows and its endearing protagonists- Mole, Mr. Toad, Badger, and Ratty -have enchanted children of all ages. Whether the four friends are setting forth on an exciting adventure, engaging in a comic caper, or simply relaxing by the River Thames, their stories are among the most charming in all English literature. This keepsake edition of Kenneth Grahame''s beloved novel features gorgeous art throughout, making it a must-have for every child''s library.', 'Sterling Children', 1)


--paper
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63504', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63504', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Kenneth Grahame', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Have You Seen My Dragon?',  'http://i.imgur.com/s57Pygx.jpg', GETDATE(), 5, DEFAULT, 'English', 'In the heart of the city, among the taxis and towers, a small boy travels uptown and down, searching for his friend. Readers will certainly spot the glorious beast, plus an array of big-city icons they can count. Is the dragon taking the crosstown bus, or breathing his fiery breath below a busy street? Maybe he took a taxi to the zoo or is playing with the dogs in the park. Steve Light’s masterful pen-and-ink illustrations, decorated with meticulous splashes of color, elevate this counting book (numbers 1–20) to new heights. Maybe the dragon is up there, too!', 'Candlewick', 1)


--dragon
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63478', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63478', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Steve Light', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Catcher in the Rye',  'http://i.imgur.com/Oh7ulZl.jpg', GETDATE(), 5, DEFAULT, 'English', 'Anyone who has read J.D. Salinger''s New Yorker stories ? particularly A Perfect Day for Bananafish, Uncle Wiggily in Connecticut, The Laughing Man, and For Esme ? With Love and Squalor, will not be surprised by the fact that his first novel is fully of children. The hero-narrator of THE CATCHER IN THE RYE is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it. There are many voices in this novel: children''s voices, adult voices, underground voices-but Holden''s voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure. However, like most lovers and clowns and poets of the higher orders, he keeps most of the pain to, and for, himself. The pleasure he gives away, or sets aside, with all his heart. It is there for the reader who can handle it to keep.', 'Little, Brown and Company', 1)


--catcher
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63494', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63494', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('J.D. Salinger', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Lord of the Flies',  'http://i.imgur.com/1hdGNwr.jpg', GETDATE(), 5, DEFAULT, 'English', 'Lord of the Flies remains as provocative today as when it was first published in 1954, igniting passionate debate with its startling, brutal portrait of human nature. Though critically acclaimed, it was largely ignored upon its initial publication. Yet soon it became a cult favorite among both students and literary critics who compared it to J.D. Salinger''s The Catcher in the Rye in its influence on modern thought and literature.

William Golding''s compelling story about a group of very ordinary small boys marooned on a coral island has become a modern classic. At first it seems as though it is all going to be great fun; but the fun before long becomes furious and life on the island turns into a nightmare of panic and death. As ordinary standards of behaviour collapse, the whole world the boys know collapses with them—the world of cricket and homework and adventure stories—and another world is revealed beneath, primitive and terrible.

Labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, even a vision of the apocalypse, Lord of the Flies has established itself as a true classic.', 'Perigee Books', 1)


--lord
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63484', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63484', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('William Golding', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Of Mice and Men',  'http://i.imgur.com/PdVYYje.jpg', GETDATE(), 5, DEFAULT, 'English', 'They are an unlikely pair: George is "small and quick and dark of face"; Lennie, a man of tremendous size, has the mind of a young child. Yet they have formed a "family," clinging together in the face of loneliness and alienation.

Laborers in California''s dusty vegetable fields, they hustle work when they can, living a hand-to-mouth existence. For George and Lennie have a plan: to own an acre of land and a shack they can call their own. When they land jobs on a ranch in the Salinas Valley, the fulfillment of their dream seems to be within their grasp. But even George cannot guard Lennie from the provocations of a flirtatious woman, nor predict the consequences of Lennie''s unswerving obedience to the things George taught him.', 'Penguin Books', 1)


--mice and men
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63487', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63487', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('John Steinbeck', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Great Gatsby',  'http://i.imgur.com/uVLck2S.jpg', GETDATE(), 5, DEFAULT, 'English', 'The Great Gatsby, F. Scott Fitzgerald’s third book, stands as the supreme achievement of his career. This exemplary novel of the Jazz Age has been acclaimed by generations of readers. The story of the fabulously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted “gin was the national drink and sex the national obsession,” it is an exquisitely crafted tale of America in the 1920s.

The Great Gatsby is one of the great classics of twentieth-century literature.', 'Scribner', 1);


--the great gatsby
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63500', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63500', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('F. Scott Fitzgerald', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Tithe: A Modern Faerie Tale',  'http://i.imgur.com/kE6V2uZ.jpg', GETDATE(), 5, DEFAULT, 'English', 'Sixteen-year-old Kaye is a modern nomad. Fierce and independent, she travels from city to city with her mother''s rock band until an ominous attack forces Kaye back to her childhood home. There, amid the industrial, blue-collar New Jersey backdrop, Kaye soon finds herself an unwilling pawn in an ancient power struggle between two rival faerie kingdoms -- a struggle that could very well mean her death.', 'Margaret K. McElderry Books', 1)



--modern
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63505', @newId);

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63505', @newId);

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Holly Black', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Gift of Fear and Other Survival Signals that Protect Us From Violence',  'http://i.imgur.com/NqOhBpn.jpg', GETDATE(), 5, DEFAULT, 'English', 'True fear is a gift. Unwarranted fear is a curse. Learn how to tell the difference.

A date won''t take "no" for an answer. The new nanny gives a mother an uneasy feeling. A stranger in a deserted parking lot offers unsolicited help. The threat of violence surrounds us every day. But we can protect ourselves, by learning to trust—and act on—our gut instincts.

In this empowering book, Gavin de Becker, the man Oprah Winfrey calls the nation''s leading expert on violent behavior, shows you how to spot even subtle signs of danger—before it''s too late. Shattering the myth that most violent acts are unpredictable, de Becker, whose clients include top Hollywood stars and government agencies, offers specific ways to protect yourself and those you love, including...how to act when approached by a stranger...when you should fear someone close to you...what to do if you are being stalked...how to uncover the source of anonymous threats or phone calls...the biggest mistake you can make with a threatening person...and more. Learn to spot the danger signals others miss. It might just save your life.', 'Dell', 1)


--fear and other
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63497', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63497', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Gavin de Becker', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Abuse', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Safety and First Aid', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Violence in Society', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Giver',  'http://i.imgur.com/lmKIQMC.jpg', GETDATE(), 5, DEFAULT, 'English', 'The Giver, the 1994 Newbery Medal winner, has become one of the most influential novels of our time. The haunting story centers on twelve-year-old Jonas, who lives in a seemingly ideal, if colorless, world of conformity and contentment. Not until he is given his life assignment as the Receiver of Memory does he begin to understand the dark, complex secrets behind his fragile community. Lois Lowry has written three companion novels to The Giver, including Gathering Blue, Messenger, and Son.', 'HMH Books for Young Readers', 1)


--the giver
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63499', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63499', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Lois Lowry', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Emotions and Feelings', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Animal Farm',  'http://i.imgur.com/USXmj7o.jpg', GETDATE(), 5, DEFAULT, 'English', 'As ferociously fresh as it was more than a half century ago, this remarkable allegory of a downtrodden society of overworked, mistreated animals and their quest to create a paradise of progress, justice, and equality is one of the most scathing satires ever published. As readers witness the rise and bloody fall of the revolutionary animals, they begin to recognize the seeds of totalitarianism in the most idealistic organization—and in the most charismatic leaders, the souls of the cruelest oppressors.', 'Signet Classics', 1)


--animal farm
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63461', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63461', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('George Orwell', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Dinosaur Kisses',  'http://i.imgur.com/xf22DCh.jpg', GETDATE(), 5, DEFAULT, 'English', 'For newly hatched dinosaur Dinah, the world is an exciting place. There is so much to see and do. She tries this — STOMP! And she tries that — CHOMP! Then she sees a kiss and knows just what she wants to try next. Who can she kiss? And after a few disastrous attempts, can she figure out how to give someone a kiss without whomping, chomping, or stomping them first? Young children will chuckle and cheer when Dinah finds just the right creature for her dinosaur kisses in this funny new picture book from David Ezra Stein.', 'Candlewick', 1)



--dinosaur
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63466', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63467', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('David Ezra Stein', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Children', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'All the Light We Cannot See',  'http://i.imgur.com/P9p3ure.jpg', GETDATE(), 5, DEFAULT, 'English', 'From the highly acclaimed, multiple award-winning Anthony Doerr, the beautiful, stunningly ambitious instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II.

Marie-Laure lives with her father in Paris near the Museum of Natural History, where he works as the master of its thousands of locks. When she is six, Marie-Laure goes blind and her father builds a perfect miniature of their neighborhood so she can memorize it by touch and navigate her way home. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laure’s reclusive great-uncle lives in a tall house by the sea. With them they carry what might be the museum’s most valuable and dangerous jewel.

In a mining town in Germany, the orphan Werner grows up with his younger sister, enchanted by a crude radio they find. Werner becomes an expert at building and fixing these crucial new instruments, a talent that wins him a place at a brutal academy for Hitler Youth, then a special assignment to track the resistance. More and more aware of the human cost of his intelligence, Werner travels through the heart of the war and, finally, into Saint-Malo, where his story and Marie-Laure’s converge.', 'Scribner', 1)


--all of the light
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63459', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63459', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Anthony Doerr', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

INSERT INTO Genre(Genre, BookId)
VALUES('Contemporary', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Metamorphosis',  'http://i.imgur.com/lOd9Aqd.jpg', GETDATE(), 5, DEFAULT, 'English', '"The Metamorphosis" (original German title: "Die Verwandlung") is a short novel by Franz Kafka, first published in 1915. It is often cited as one of the seminal works of fiction of the 20th century and is widely studied in colleges and universities across the western world. The story begins with a traveling salesman, Gregor Samsa, waking to find himself transformed into an insect.', 'Classix Press', 1)


--meta
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63502', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63502', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Franz Kafka', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Maze Runner',  'http://i.imgur.com/wSoGQbx.jpg', GETDATE(), 5, DEFAULT, 'English', 'If you ain''t scared, you ain''t human.

When Thomas wakes up in the lift, the only thing he can remember is his name. He''s surrounded by strangers—boys whose memories are also gone.

Nice to meet ya, shank. Welcome to the Glade.

Outside the towering stone walls that surround the Glade is a limitless, ever-changing maze. It''s the only way out—and no one''s ever made it through alive.

Everything is going to change.

Then a girl arrives. The first girl ever. And the message she delivers is terrifying.

Remember. Survive. Run.', 'Delacorte Press', 1);


--the maze runner
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63501', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63501', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('James Dashner', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Science Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Dystopia', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Action', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Eleanor and Park',  'http://i.imgur.com/yz2LoD3.jpg', GETDATE(), 5, DEFAULT, 'English', 'Two misfits.
One extraordinary love.

Eleanor... Red hair, wrong clothes. Standing behind him until he turns his head. Lying beside him until he wakes up. Making everyone else seem drabber and flatter and never good enough...Eleanor.

Park... He knows she''ll love a song before he plays it for her. He laughs at her jokes before she ever gets to the punch line. There''s a place on his chest, just below his throat, that makes her want to keep promises...Park.

Set over the course of one school year, this is the story of two star-crossed sixteen-year-olds smart enough to know that first love almost never lasts, but brave and desperate enough to try.', 'St. Martin''s Griffin', 1);


--eleanor
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63468', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63468', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Rainbow Rowell', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Romance', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Realistic Fiction', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Alchemist',  'http://i.imgur.com/qQb9oVL.jpg', GETDATE(), 5, DEFAULT, 'English', 'Paulo Coelho''s enchanting novel has inspired a devoted following around the world. This story, dazzling in its powerful simplicity and inspiring wisdom, is about an Andalusian shepherd boy named Santiago who travels from his homeland in Spain to the Egyptian desert in search of a treasure buried in the Pyramids. Along the way he meets a Gypsy woman, a man who calls himself king, and an alchemist, all of whom point Santiago in the direction of his quest. No one knows what the treasure is, or if Santiago will be able to surmount the obstacles along the way. But what starts out as a journey to find worldly goods turns into a discovery of the treasure found within. Lush, evocative, and deeply humane, the story of Santiago is an eternal testament to the transforming power of our dreams and the importance of listening to our hearts.', 'HarperCollins', 1);


--alchemist
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63491', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63491', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Paulo Coelho', @newId);

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Alan R. Clarke', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Cuckoo''s Calling',  'http://i.imgur.com/0boSc7f.jpg', GETDATE(), 5, DEFAULT, 'English', 'A brilliant debut mystery in a classic vein: Detective Cormoran Strike investigates a supermodel''s suicide.

After losing his leg to a land mine in Afghanistan, Cormoran Strike is barely scraping by as a private investigator. Strike is down to one client, and creditors are calling. He has also just broken up with his longtime girlfriend and is living in his office.

Then John Bristow walks through his door with an amazing story: His sister, the legendary supermodel Lula Landry, known to her friends as the Cuckoo, famously fell to her death a few months earlier. The police ruled it a suicide, but John refuses to believe that. The case plunges Strike into the world of multimillionaire beauties, rock-star boyfriends, and desperate designers, and it introduces him to every variety of pleasure, enticement, seduction, and delusion known to man.

You may think you know detectives, but you''ve never met one quite like Strike. You may think you know about the wealthy and famous, but you''ve never seen them under an investigation like this.

Introducing Cormoran Strike, this is the acclaimed first crime novel by J.K. Rowling, writing under the pseudonym Robert Galbraith.', 'Mulholland Books', 1);


--cuckoo
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63495', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63495', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Robert Galbraith', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Mystery', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Adult Fiction', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Mrs. Dalloway',  'http://i.imgur.com/qGSBf4m.jpg', GETDATE(), 5, DEFAULT, 'English', 'In this vivid portrait of one day in a woman''s life, Clarissa Dalloway is preoccupied with the last-minute details of party preparation while in her mind she is much more than a perfect society hostess. As she readies her house, she is flooded with far-away remembrances. And, met with the realities of the present, Clarissa reexamines the choices she has made, hesitantly looking ahead to growing old. Undeniably triumphant, this is the inspired novelistic outline of human consciousness.', 'A Harvest Book / Harcourt, Inc.', 1);


--dalloway
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63486', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63486', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Virginia Woolf', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Literary Fiction', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Fault in Our Stars',  'http://i.imgur.com/KAKZEvH.jpg', GETDATE(), 5, DEFAULT, 'English', 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel''s story is about to be completely rewritten.

Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning author John Green''s most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.', 'Dutton Books', 1);


--fault
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63496', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63496', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('John Green', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Boy in the Striped Pajamas',  'http://i.imgur.com/f3j3cVn.jpg', GETDATE(), 5, DEFAULT, 'English', 'When Bruno returns home from school one day, he discovers that his belongings are being packed in crates. His father has received a promotion and the family must move from their home to a new house far far away, where there is no one to play with and nothing to do. A tall fence running alongside stretches as far as the eye can see and cuts him off from the strange people he can see in the distance.

But Bruno longs to be an explorer and decides that there must be more to this desolate new place than meets the eye. While exploring his new environment, he meets another boy whose life and circumstances are very different to his own, and their meeting results in a friendship that has devastating consequences.', 'David Fickling Books', 1);


--striped pajama
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63492', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63492', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('John Bonye', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Historical Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Bossypants',  'http://i.imgur.com/CupcbXD.jpg', GETDATE(), 5, DEFAULT, 'English', 'Before Liz Lemon, before Weekend Update, before Sarah Palin, Tina Fey was just a young girl with a dream: a recurring stress dream that she was being chased through a local airport by her middle-school gym teacher. She also had a dream that one day she would be a comedian on TV.

She has seen both these dreams come true.

At last, Tina Fey''s story can be told. From her youthful days as a vicious nerd to her tour of duty on Saturday Night Live; from her passionately halfhearted pursuit of physical beauty to her life as a mother eating things off the floor; from her one-sided college romance to her nearly fatal honeymoon—from the beginning of this paragraph to this final sentence.

Tina Fey reveals all, and proves what we''ve all suspected: you''re no one until someone calls you bossy.', 'Hachette Audio', 1);


--bossypants
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63461', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63461', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Tina Fey', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Nonfiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Humor', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Autobiography', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'A Long Way Down',  'http://i.imgur.com/kLTpDKi.jpg', GETDATE(), 5, DEFAULT, 'English', 'In his eagerly awaited fourth novel, New York Times-bestselling author Nick Hornby mines the hearts and psyches of four lost souls who connect just when they''ve reached the end of the line. 

Meet Martin, JJ, Jess, and Maureen. Four people who come together on New Year''s Eve: a former TV talk show host, a musician, a teenage girl, and a mother. Three are British, one is American. They encounter one another on the roof of Topper''s House, a London destination famous as the last stop for those ready to end their lives. 

In four distinct and riveting first-person voices, Nick Hornby tells a story of four individuals confronting the limits of choice, circumstance, and their own mortality. This is a tale of connections made and missed, punishing regrets, and the grace of second chances. 

Intense, hilarious, provocative, and moving, A Long Way Down is a novel about suicide that is, surprisingly, full of life. ', 'Riverhead Trade', 1);


--a long way down
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63462', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63462', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Nick Hornby', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Divergent',  'http://i.imgur.com/zi1xhZt.jpg', GETDATE(), 5, DEFAULT, 'English', 'In Beatrice Prior''s dystopian Chicago world, society is divided into five factions, each dedicated to the cultivation of a particular virtue--Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). On an appointed day of every year, all sixteen-year-olds must select the faction to which they will devote the rest of their lives. For Beatrice, the decision is between staying with her family and being who she really is -she can''t have both. So she makes a choice that surprises everyone, including herself.

During the highly competitive initiation that follows, Beatrice renames herself Tris and struggles alongside her fellow initiates to live out the choice they have made. Together they must undergo extreme physical tests of endurance and intense psychological simulations, some with devastating consequences. As initiation transforms them all, Tris must determine who her friends really are--and where, exactly, a romance with a sometimes fascinating, sometimes exasperating boy fits into the life she''s chosen. But Tris also has a secret, one she''s kept hidden from everyone because she''s been warned it can mean death. And as she discovers unrest and growing conflict that threaten to unravel her seemingly perfect society, Tris also learns that her secret might help her save the ones she loves . . . or it might destroy her.', 'Katherine Tegen Books', 1);

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.megafileupload.com/en/file/588736/Divergent-pdf.html', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.megafileupload.com/en/file/588736/Divergent-pdf.html', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Veronica Roth', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Science Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Dystopia', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);





SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Insurgent',  'http://i.imgur.com/ADqCe84.jpg', GETDATE(), 5, DEFAULT, 'English', 'One choice can transform you—or it can destroy you. But every choice has consequences, and as unrest surges in the factions all around her, Tris Prior must continue trying to save those she loves—and herself—while grappling with haunting questions of grief and forgiveness, identity and loyalty, politics and love.

Tris''s initiation day should have been marked by celebration and victory with her chosen faction; instead, the day ended with unspeakable horrors. War now looms as conflict between the factions and their ideologies grows. And in times of war, sides must be chosen, secrets will emerge, and choices will become even more irrevocable—and even more powerful. Transformed by her own decisions but also by haunting grief and guilt, radical new discoveries, and shifting relationships, Tris must fully embrace her Divergence, even if she does not know what she may lose by doing so.', 'HarperCollins Children''s Books' , 1);


--insurgent
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63479', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63479', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Veronica Roth', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Science Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Dystopia', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Allegiant',  'http://i.imgur.com/VdkLPlj.jpg', GETDATE(), 5, DEFAULT, 'English', 'The faction-based society that Tris Prior once believed in is shattered—fractured by violence and power struggles and scarred by loss and betrayal. So when offered a chance to explore the world past the limits she''s known, Tris is ready. Perhaps beyond the fence, she and Tobias will find a simple new life together, free from complicated lies, tangled loyalties, and painful memories. 

But Tris''s new reality is even more alarming than the one she left behind. Old discoveries are quickly rendered meaningless. Explosive new truths change the hearts of those she loves. And once again, Tris must battle to comprehend the complexities of human nature—and of herself—while facing impossible choices about courage, allegiance, sacrifice, and love. ', 'HarperCollins Children''s Books', 1);


--allegient
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63460', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63461', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Veronica Roth', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Young Adult', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Science Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Dystopia', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Emma',  'http://i.imgur.com/kgeYCoq.jpg', GETDATE(), 5, DEFAULT, 'English', 'Emma, when first published in 1816, was written when Jane Austen was at the height of her powers. In it, we have her two greatest comic creations - the eccentric Mr. Woodhouse and that quintissential bore, Miss Bates. In it, too, we have her most profound characterization: the witty, imaginative, self-deluded Emma, a heroine the author declared no one but myself will much like,  but who has been much loved by generations of readers.', 'Bantam Books', 1);


--emma
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63471', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63471', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Jane Austen', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Farewell My Concubine',  'http://i.imgur.com/RACSd2t.jpg', GETDATE(), 5, DEFAULT, 'English', 'Beginning amid the decadent glamour of China in the 1930s and ending in the 1980s in Hong Kong, this brilliant novel, which formed the basis for the award-winning movie, is the passionate story of an opera student who falls in love with his best friend, and the beautiful woman who comes between them.', 'Harper Perennial', 1);


--farewell
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63473', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63473', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Lilian Lee', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Historical Fiction', @newId);




SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Jane Eyre',  'http://i.imgur.com/jAaZRgA.jpg', GETDATE(), 5, DEFAULT, 'English', 'Charlotte Bronte''s impassioned novel is the love story of Jane Eyre, a plain yet spirited governess, and her arrogant, brooding Mr. Rochester. Published in 1847, under the pseudonym of Currer Bell, the book heralded a new kind of heroine—one whose virtuous integrity, keen intellect and tireless perseverance broke through class barriers to win equal stature with the man she loved. Hailed by William Makepeace Thackeray as the masterwork of great genius, Jane Eyre is still regarded, over a century later, as one of the finest novels in English literature.', 'Broadview Press', 1);


--jane

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63481', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63481', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES(' Charlotte Brontë', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Classic', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('English Literature', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Is Everyone Hanging Out Without Me?',  'http://i.imgur.com/m8SA3zF.jpg', GETDATE(), 5, DEFAULT, 'English', 'Mindy Kaling has lived many lives: the obedient child of immigrant professionals, a timid chubster afraid of her own bike, a Ben Affleck–impersonating Off-Broadway performer and playwright, and, finally, a comedy writer and actress prone to starting fights with her friends and coworkers with the sentence “Can I just say one last thing about this, and then I swear I''ll shut up about it?” 
 
Perhaps you want to know what Mindy thinks makes a great best friend (someone who will fill your prescription in the middle of the night), or what makes a great guy (one who is aware of all elderly people in any room at any time and acts accordingly), or what is the perfect amount of fame (so famous you can never get convicted of murder in a court of law), or how to maintain a trim figure (you will not find that information in these pages). If so, you''ve come to the right book, mostly!
 
In Is Everyone Hanging Out Without Me?, Mindy invites readers on a tour of her life and her unscientific observations on romance, friendship, and Hollywood, with several conveniently placed stopping points for you to run errands and make phone calls. Mindy Kaling really is just a Girl Next Door—not so much literally anywhere in the continental United States, but definitely if you live in India or Sri Lanka.', 'Crown Archetype', 1);


--hanging out
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63480', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63480', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Mindy Kaling', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Nonfiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Humor', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Autobiography', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Casual Vacancy',  'http://i.imgur.com/dEkKx8Y.jpg', GETDATE(), 5, DEFAULT, 'English', 'When Barry Fairbrother dies in his early forties, the town of Pagford is left in shock.

Pagford is, seemingly, an English idyll, with a cobbled market square and an ancient abbey, but what lies behind the pretty façade is a town at war.

Rich at war with poor, teenagers at war with their parents, wives at war with their husbands, teachers at war with their pupils ... Pagford is not what it first seems.

And the empty seat left by Barry on the parish council soon becomes the catalyst for the biggest war the town has yet seen. Who will triumph in an election fraught with passion, duplicity and unexpected revelations?', 'Little, Brown and Company', 1);


--casual vacancy
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63493', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63493', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('J.K. Rowling', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);



SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'Outlander',  'http://i.imgur.com/BaRoALz.jpg', GETDATE(), 5, DEFAULT, 'English', 'The year is 1945. Claire Randall, a former combat nurse, is just back from the war and reunited with her husband on a second honeymoon when she walks through a standing stone in one of the ancient circles that dot the British Isles. Suddenly she is a Sassenach—an “outlander”—in a Scotland torn by war and raiding border clans in the year of Our Lord...1743.

Hurled back in time by forces she cannot understand, Claire is catapulted into the intrigues of lairds and spies that may threaten her life, and shatter her heart. For here James Fraser, a gallant young Scots warrior, shows her a love so absolute that Claire becomes a woman torn between fidelity and desire—and between two vastly different men in two irreconcilable lives.', 'Deli Publishing Company', 1);


--outlander
INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.freeuploadsite.com/do.php?id=63488', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.freeuploadsite.com/do.php?id=63488', @newId)

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Diana Gabaldon', @newId);


-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Historical Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Science Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Romance', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fantasy', @newId);


SET @newId = NEWID();
INSERT INTO Book 
VALUES (@newId, 'The Girl with the Dragon Tattoo',  'http://i.imgur.com/oSCrirA.jpg', GETDATE(), 5, DEFAULT, 'English', 'Mikael Blomkvist, a once-respected financial journalist, watches his professional life rapidly crumble around him. Prospects appear bleak until an unexpected (and unsettling) offer to resurrect his name is extended by an old-school titan of Swedish industry. The catch—and there''s always a catch—is that Blomkvist must first spend a year researching a mysterious disappearance that has remained unsolved for nearly four decades. With few other options, he accepts and enlists the help of investigator Lisbeth Salander, a misunderstood genius with a cache of authority issues. Little is as it seems in Larsson''s novel, but there is at least one constant: you really don''t want to mess with the girl with the dragon tattoo.', 'Knopf Publishing Group', 1);


INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.pdf', 'http://www.megafileupload.com/en/file/588735/The-Girl-with-the-Dragon-Tattoo-pdf.html', @newId)

INSERT INTO BookFileType(FileType, DownloadLink, BookId)
VALUES('.epub', 'http://www.megafileupload.com/en/file/588735/The-Girl-with-the-Dragon-Tattoo-pdf.html', @newId)


-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Stieg Larsson', @newId);

-- You need a new 1 for every author
INSERT INTO Author(AuthorName, BookId)
VALUES('Reg Keeland', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Fiction', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Mystery', @newId);

-- You need a new 1 for every genre.
INSERT INTO Genre(Genre, BookId)
VALUES('Thriller', @newId);
--dragon tattoo



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
