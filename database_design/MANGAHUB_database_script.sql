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
	avatarURL VARCHAR NULL,
	nickName NVARCHAR(50) UNIQUE NOT NULL,
--	User's gender values: 1 == Male; 0 == Female; NULL == Others
	gender BIT NULL,
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
	VALUES ('testUser', '111111', 'testUser@gmail.com', NULL, N'Tui là User đó', 1, 0, GETDATE(), 2)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testAdmin', '111111', 'testAdmin@gmail.com', NULL, N'Tui là Admin đó', 1, 0, GETDATE(), 1)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testTranslator', '111111', 'testTranslator@gmail.com', NULL, N'Tui là Translator đó', 1, 0, GETDATE(), 3)
INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role])
	VALUES ('testUser1', '111111', 'testUser1@gmail.com', NULL, N'Tui là User đó ahihi', NULL, 0, GETDATE(), 2)

GO
CREATE TABLE Groups(
	groupID VARCHAR(50) NOT NULL,
	groupName NVARCHAR(50) NOT NULL,
	groupAvatarURL VARCHAR NULL,
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
CREATE TABLE Mangas(
	mangaID INT IDENTITY(1,1) NOT NULL,
	mangaName NVARCHAR(200) NOT NULL,
	coverImageURL VARCHAR NOT NULL,
	[description] NVARCHAR(1000) NULL,
	publishDate DATE NULL,
	updateDate DATE NOT NULL,
	likeNumber INT NOT NULL,
	rating FLOAT NULL,
	[view] INT NOT NULL,
--	Manga's status values: 0 == Ongoing; 1 == Completed, NULL == Pause
	[status] BIT NULL,
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
CREATE TABLE Images(
	imageID INT IDENTITY(1,1) NOT NULL,
	imageNumber INT NOT NULL,
	imageURL VARCHAR NOT NULL,
	chapterID INT NOT NULL,

	CONSTRAINT PK_Images PRIMARY KEY (imageID),
	CONSTRAINT FK_Chapters_Images FOREIGN KEY (chapterID)
		REFERENCES Chapters(chapterID)
)

GO 
CREATE TABLE Categories(
	cateID INT IDENTITY(1,1) NOT NULL,
	cateName NVARCHAR(30) NOT NULL,

	CONSTRAINT PK_Categories PRIMARY KEY (cateID)
)

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