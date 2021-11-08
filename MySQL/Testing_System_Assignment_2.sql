DROP DATABASE IF EXISTS Testing_system_assignment_1;
CREATE DATABASE Testing_system_assignment_1;
USE Testing_system_assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID	TINYINT UNSIGNED PRIMARY KEY,
DepartmentName	ENUM("Dev", "Test", "SrumMaster", "PM")  NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
PositionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionNAme	VARCHAR(50)NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Email		VARCHAR(50)UNIQUE KEY,
UserName	VARCHAR(50) UNIQUE NOT NULL,
Fullname	VARCHAR(50)NOT NULL,
DepartmentID	TINYINT UNSIGNED  NOT NULL,
PositionID		TINYINT UNSIGNED UNIQUE NOT NULL,
CreateDate	DATETIME,
FOREIGN KEY(DepartmentID)	REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID)		REFERENCES `Position` (PositionID)
);


DROP TABLE IF EXISTS `Group`;
CREATE TABLE 	`Group` (
GroupID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName 	VARCHAR(50) UNIQUE KEY NOT NULL,
CreatorID	TINYINT UNSIGNED UNIQUE NOT NULL,
CreateDate	DATETIME
);

DROP TABLE IF EXISTS Group_account;
CREATE TABLE Group_Account(
GroupID		TINYINT UNSIGNED AUTO_INCREMENT ,
AccountID	TINYINT UNSIGNED  NOT NULL,
JoinDate	DATETIME,
FOREIGN KEY(GroupID) REFERENCES`Group`(GroupID)
);
 DROP TABLE IF EXISTS Type_question;
CREATE TABLE Type_question (
TypeID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM("Essay","Multiple-Choice")NOT NULL
);

DROP TABLE IF EXISTS Category_Question;
CREATE TABLE Category_Question (
CategoryID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName	VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(50) NOT NULL,
CategoryID	TINYINT UNSIGNED  UNIQUE NOT NULL,
TypeID		TINYINT UNSIGNED NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreatorDate	DATETIME,
FOREIGN KEY( CategoryID)	REFERENCES Category_Question(CategoryID),
FOREIGN KEY( CreatorID)		REFERENCES `Group`(CreatorID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(50) NOT NULL,
QuestionID	TINYINT UNSIGNED  NOT NULL,
isCorrect	ENUM("True","Fault"),
FOREIGN KEY(QuestionID)	REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`	TINYINT UNSIGNED UNIQUE NOT NULL,
Title	VARCHAR(50) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
Duration	TINYINT UNSIGNED UNIQUE NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATETIME,
FOREIGN KEY(CategoryID)		REFERENCES Category_question(CategoryID)

);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID	TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (QuestionID)	REFERENCES	Question( QuestionID)
);

