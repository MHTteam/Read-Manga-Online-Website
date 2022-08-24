USE [master]

GO
DROP DATABASE IF EXISTS MANGAHUB

GO
CREATE DATABASE MANGAHUB

GO
USE MANGAHUB

GO
CREATE TABLE UserRoles(
	roleID INT IDENTITY(1,1) NOT NULL,
	roleName VARCHAR(20) NOT NULL,

	CONSTRAINT PK_UserRoles PRIMARY KEY (roleID)
)

GO
INSERT INTO UserRoles(roleName) VALUES('Admin')
INSERT INTO UserRoles(roleName) VALUES('User')
INSERT INTO UserRoles(roleName) VALUES('Translator')

GO
CREATE TABLE Users(
	userName VARCHAR(30) NOT NULL,
	[password] VARCHAR(30) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	avatarURL VARCHAR(300) NULL,
	nickName NVARCHAR(50) UNIQUE NOT NULL,
--	User's gender values: Male, Female, Others
	gender VARCHAR(10) NOT NULL,
--	User's account status values: 0 == Active (Not banned); 1 == inActive (Banned)
	[status] BIT NOT NULL,
	signupDate DATE NOT NULL,
	[role] INT NOT NULL,

	CONSTRAINT PK_Users PRIMARY KEY (userName),
	CONSTRAINT FK_UserRoles_Users FOREIGN KEY ([role])
		REFERENCES UserRoles(roleID),
	CONSTRAINT Email_Check CHECK(email LIKE '%___@___%')
)

GO
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testUser', '111111', 'testUser@gmail.com', NULL, N'Tui là User đó', 'Male', 0, GETDATE(), 2)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testAdmin', '111111', 'testAdmin@gmail.com', NULL, N'Tui là Admin đó', 'Female', 0, GETDATE(), 1)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testTranslator', '111111', 'testTranslator@gmail.com', NULL, N'Tui là Translator đó', 'Others', 0, GETDATE(), 3)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testUser1', '111111', 'testUser1@gmail.com', NULL, N'Tui là User đó ahihi', 'Others', 0, GETDATE(), 2)

GO
CREATE TABLE Groups(
	groupID VARCHAR(50) NOT NULL,
	groupName NVARCHAR(50) NOT NULL,
	groupAvatarURL VARCHAR(300) NULL,
	[description] NVARCHAR(500) NOT NULL,
	creator VARCHAR(30) NOT NULL,
	createDate DATE NOT NULL,

	CONSTRAINT PK_Groups PRIMARY KEY (groupID),
	CONSTRAINT FK_Users_Groups FOREIGN KEY (creator)
		REFERENCES Users(userName)
)

GO
CREATE TABLE UsersGroups(
	userName VARCHAR(30) NOT NULL,
	groupID VARCHAR(50) NOT NULL

	CONSTRAINT FK_NN_Users_UsersGroups FOREIGN KEY (userName)
		REFERENCES Users(userName),
	CONSTRAINT FK_NN_Groups_UsersGroups FOREIGN KEY (groupID)
		REFERENCES Groups(groupID)
)

GO
CREATE TABLE Authors(
	authorID INT IDENTITY(1,1) NOT NULL,
	authorName NVARCHAR(50) NOT NULL,

	CONSTRAINT PK_Authors PRIMARY KEY (authorID)
)

GO
INSERT INTO Authors(authorName) VALUES (N'Ishida Sui')

GO
CREATE TABLE Mangas(
	mangaID INT IDENTITY(1,1) NOT NULL,
	mangaName NVARCHAR(200) NOT NULL,
	coverImageURL VARCHAR(300) NOT NULL,
	[description] NVARCHAR(1000) NULL,
	publishDate DATE NULL,
	updateDate DATE NOT NULL,
	likeNumber INT NOT NULL,
	rating FLOAT NULL,
	[view] INT NOT NULL,
--	Manga's status values: Updating, Completed, Pause
	[status] VARCHAR(10) NULL,
	author INT NULL,
	uploader VARCHAR(30) NOT NULL,
	[group] VARCHAR(50) NULL,

	CONSTRAINT PK_Mangas PRIMARY KEY (mangaID),
	CONSTRAINT FK_Authors_Mangas FOREIGN KEY (author)
		REFERENCES Authors(authorID),
	CONSTRAINT FK_Users_Mangas FOREIGN KEY (uploader)
		REFERENCES Users(userName),
	CONSTRAINT FK_Groups_Mangas FOREIGN KEY ([group])
		REFERENCES Groups(groupID)
)

GO
INSERT INTO Mangas(mangaName, coverImageURL, [description], publishDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group])
VALUES (N'Tokyo Ghoul', 'img/manga/Tokyo-Ghoul/tokyo-ghoul-cover-1.jpeg', N'Hàng loạt những vụ giết người kỳ lạ đang xảy ra ở Tokyo, và nhờ chất lỏng bằng chứng tại hiện trường, cảnh sát kết luận thủ phạm chính là "ghoul" - quỷ ăn thịt người. Kaneki, một sinh viên đại học thích đọc sách bị một con ghoul tấn công, và từ đó, số phận của chàng trai bắt đầu thay đổi...', '2011-9-1', GETDATE(), 0, 0, 0, 'Updating', 1, 'testTranslator', NULL)



GO 
CREATE TABLE Chapters(
	chapterID INT IDENTITY(1,1) NOT NULL,
	chapterNumber INT NOT NULL,
	chapterName NVARCHAR(100) NOT NULL,
	updateDate DATE NOT NULL,
	mangaID INT NOT NULL,

	CONSTRAINT PK_Chapters PRIMARY KEY (chapterID),
	CONSTRAINT FK_Mangas_Chapters FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID)
)

GO
INSERT INTO Chapters(chapterNumber, chapterName, updateDate, mangaID) VALUES (1, N'Chapter 1', GETDATE(), 1)
INSERT INTO Chapters(chapterNumber, chapterName, updateDate, mangaID) VALUES (2, N'Chapter 2', GETDATE(), 1)
INSERT INTO Chapters(chapterNumber, chapterName, updateDate, mangaID) VALUES (3, N'Chapter 3', GETDATE(), 1)

GO 
CREATE TABLE Images(
	imageID INT IDENTITY(1,1) NOT NULL,
	imageNumber INT NOT NULL,
	imageURL VARCHAR(300) NOT NULL,
	chapterID INT NOT NULL,

	CONSTRAINT PK_Images PRIMARY KEY (imageID),
	CONSTRAINT FK_Chapters_Images FOREIGN KEY (chapterID)
		REFERENCES Chapters(chapterID)
)

GO
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (1, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-1.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (2, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-2.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (3, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-3.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (4, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-4.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (5, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-5.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (6, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-6.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (7, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-7.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (8, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-8.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (9, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-9.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (10, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-10.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (11, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-11.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (12, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-12.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (13, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-13.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (14, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-14.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (15, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-15.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (16, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-16.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (17, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-17.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (18, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-18.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (19, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-19.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (20, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-20.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (21, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-21.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (22, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-22.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (23, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-23.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (24, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-24.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (25, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-25.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (26, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-26.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (27, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-27.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (28, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-28.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (29, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-29.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (30, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-30.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (31, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-31.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (32, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-32.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (33, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-33.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (34, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-34.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (35, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-35.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (36, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-36.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (37, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-37.jpg', 1)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (38, 'img/manga/Tokyo-Ghoul/chap1/tokyo-ghoul-chap1-38.jpg', 1)

INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (1, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-1.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (2, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-2.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (3, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-3.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (4, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-4.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (5, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-5.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (6, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-6.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (7, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-7.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (8, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-8.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (9, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-9.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (10, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-10.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (11, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-11.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (12, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-12.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (13, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-13.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (14, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-14.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (15, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-15.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (16, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-16.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (17, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-17.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (18, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-18.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (19, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-19.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (20, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-20.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (21, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-21.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (22, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-22.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (23, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-23.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (24, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-24.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (25, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-25.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (26, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-26.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (27, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-27.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (28, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-28.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (29, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-29.jpg', 2)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (30, 'img/manga/Tokyo-Ghoul/chap2/tokyo-ghoul-chap2-30.jpg', 2)

INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (1, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-1.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (2, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-2.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (3, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-3.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (4, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-4.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (5, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-5.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (6, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-6.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (7, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-7.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (8, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-8.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (9, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-9.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (10, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-10.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (11, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-11.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (12, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-12.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (13, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-13.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (14, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-14.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (15, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-15.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (16, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-16.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (17, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-17.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (18, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-18.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (19, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-19.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (20, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-20.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (21, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-21.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (22, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-22.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (23, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-23.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (24, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-24.jpg', 3)
INSERT INTO Images(imageNumber, imageURL, chapterID) VALUES (25, 'img/manga/Tokyo-Ghoul/chap3/tokyo-ghoul-chap3-25.jpg', 3)

GO 
CREATE TABLE Categories(
	cateID INT IDENTITY(1,1) NOT NULL,
	cateName NVARCHAR(30) NOT NULL,

	CONSTRAINT PK_Categories PRIMARY KEY (cateID)
)

GO
INSERT INTO Categories(cateName) VALUES (N'Action')
INSERT INTO Categories(cateName) VALUES (N'Adventure')
INSERT INTO Categories(cateName) VALUES (N'Comedy')
INSERT INTO Categories(cateName) VALUES (N'Crime')
INSERT INTO Categories(cateName) VALUES (N'Drama')
INSERT INTO Categories(cateName) VALUES (N'Fantasy')
INSERT INTO Categories(cateName) VALUES (N'Historical')
INSERT INTO Categories(cateName) VALUES (N'Horror')
INSERT INTO Categories(cateName) VALUES (N'Isekai')
INSERT INTO Categories(cateName) VALUES (N'Mecha')
INSERT INTO Categories(cateName) VALUES (N'Medical')
INSERT INTO Categories(cateName) VALUES (N'Mystery')
INSERT INTO Categories(cateName) VALUES (N'Philosophical')
INSERT INTO Categories(cateName) VALUES (N'Psychological')
INSERT INTO Categories(cateName) VALUES (N'Romance')
INSERT INTO Categories(cateName) VALUES (N'Sci-Fi')
INSERT INTO Categories(cateName) VALUES (N'Slice of Life')
INSERT INTO Categories(cateName) VALUES (N'Sports')
INSERT INTO Categories(cateName) VALUES (N'Superhero')
INSERT INTO Categories(cateName) VALUES (N'Thriller')
INSERT INTO Categories(cateName) VALUES (N'Tragedy')


GO
CREATE TABLE Mangas_Categories(
	mangaID INT NOT NULL,
	cateID INT NOT NULL,

	CONSTRAINT FK_NN_Mangas_MangasCategories FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID),
	CONSTRAINT FK_NN_Categories_MangasCategories FOREIGN KEY (cateID)
		REFERENCES Categories(cateID)
)

GO
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 1)
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 8)
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 12)
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 14)
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 5)
INSERT INTO Mangas_Categories(mangaID, cateID) VALUES (1, 21)


GO
CREATE TABLE Comments(
	commentID INT IDENTITY(1,1) NOT NULL,
	content NVARCHAR(500) NOT NULL,
	commentDate DATE NOT NULL,
	[status] BIT NOT NULL,
	userName VARCHAR(30) NOT NULL,
	mangaID INT NOT NULL,

	CONSTRAINT PK_Comments PRIMARY KEY (commentID),
	CONSTRAINT FK_Users_Comments FOREIGN KEY (userName)
		REFERENCES Users(userName),
	CONSTRAINT FK_Mangas_Comments FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID)
)

GO
CREATE TABLE CommentReplies(
	[index] INT NOT NULL,
	content NVARCHAR(500) NOT NULL,
	parentComment INT NOT NULL,
	userName VARCHAR(30) NOT NULL,

	CONSTRAINT FK_Comments_CommentReplies FOREIGN KEY (parentComment)
		REFERENCES Comments(commentID),
	CONSTRAINT FK_Users_CommentReplies FOREIGN KEY (userName)
		REFERENCES Users(userName)
)

GO
CREATE TABLE Likes(
--	If liked == 1, prevent the user like the manga again (spam like)
	liked BIT NOT NULL,
	userName VARCHAR(30) NOT NULL,
	mangaID INT NOT NULL,

	CONSTRAINT FK_Users_Likes FOREIGN KEY (userName)
		REFERENCES Users(userName),
	CONSTRAINT FK_Mangas_Likes FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID)
)

GO
CREATE TABLE Ratings(
	rating INT NOT NULL,
	userName VARCHAR(30) NOT NULL,
	mangaID INT NOT NULL,

	CONSTRAINT FK_Users_Ratings FOREIGN KEY (userName)
		REFERENCES Users(userName),
	CONSTRAINT FK_Mangas_Ratings FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID)
)

GO
CREATE TABLE UserFavorites(
	userName VARCHAR(30) NOT NULL,
	mangaID INT NOT NULL,

	CONSTRAINT FK_Users_UserFavorites FOREIGN KEY (userName)
		REFERENCES Users(userName),
	CONSTRAINT FK_Mangas_UserFavorites FOREIGN KEY (mangaID)
		REFERENCES Mangas(mangaID)
)