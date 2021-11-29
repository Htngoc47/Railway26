DROP DATABASE IF EXISTS Testing_system_assignment_1;
CREATE DATABASE Testing_system_assignment_1;
USE Testing_system_assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID	INT,
DepartmentName	VARCHAR(50)
);
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
PositionID	INT,
PositionNAme	VARCHAR(50)
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID	INT,
Email		VARCHAR(50),
UserName	VARCHAR(50),
Fullname	VARCHAR(50),
DepartmentID	INT,
UserID		INT,
CreateDate	DATE
);


DROP TABLE IF EXISTS `Group`;
CREATE TABLE 	`Group` (
GroupID		INT,
GroupName 	VARCHAR(50),
CreatorID	INT,
CreateDate	DATE
);

DROP TABLE IF EXISTS Group_account;
CREATE TABLE Group_Account(
GroupID		INT,
AccountID	INT,
JoinDate	DATE
);
 DROP TABLE IF EXISTS Type_question;
CREATE TABLE Type_question (
TypeID	INT,
TypeName VARCHAR(50)
);

DROP TABLE IF EXISTS Category_Question;
CREATE TABLE Category_Question (
CategoryID	INT,
CategoryName	VARCHAR(50)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID	INT,
Content		VARCHAR(50),
CategoryID	INT,
TypeID		INT,
CreatorID	INT,
CreatorDate	DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID 	INT,
Content		VARCHAR(50),
QuestionID	INT,
isCorrect	VARCHAR(10)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID	INT,
`Code`	INT,
Title	VARCHAR(50),
CategoryID INT,
Duration	INT,
CreatorID	INT,
CreatorDate	DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID		INT,
QuestionID	INT
);


