DROP DATABASE IF EXISTS Testing_system_assignment_2;
CREATE DATABASE Testing_system_assignment_2;
USE Testing_system_assignment_2;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID	TINYINT UNSIGNED PRIMARY KEY,
DepartmentName	VARCHAR(50) UNIQUE KEY
);
INSERT INTO Department (DepartmentID,DepartmentName)
VALUES

(1,		N'Marketing' ),
(2,		N'Design' ),
(3,		N'Bảo vệ' ),
(4,		N'Nhân sự' ),
(5,		N'Kỹ thuật' ),
(6,		N'Tài chính' ),
(7,		N'Thư kí' ),
(8,		N'Hành chính' )
;
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
PositionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionNAme	ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE
KEY
);

INSERT INTO `Position`(PositionID, PositionName)
VALUES 		(1			,		'Dev'),
			(2			,		'Test'),
            (3			, 		'Scrum Master'),
            (4			,		'PM'	);



DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Email		VARCHAR(50)UNIQUE KEY,
UserName	VARCHAR(50) UNIQUE NOT NULL,
Fullname	VARCHAR(50)NOT NULL,
DepartmentID	TINYINT UNSIGNED  NOT NULL,
PositionID		TINYINT UNSIGNED  NOT NULL,
CreateDate		DATE,
FOREIGN KEY(DepartmentID)	REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID)		REFERENCES `Position` (PositionID)
);

INSERT INTO `Account`(Email , Username
, FullName , DepartmentID , PositionID, CreateDate)
VALUES ('lamvanphuc@gmail.com',
'Phúc Lâm' ,'Lâm văn Phúc' , '5' , '1'
,'2021-11-10'),

('thutrangbui11@gmail.com' ,
'Trang Bùi' ,'Bùi Thu Trang' , '1' , '2'
,'2021-11-08'),

('trieuvangau@gmail.com' , 'Gấu Triệu' ,'Triệu Văn Gấu'

, '2' , '3' ,'2021-11-07'),

('mailinh221@gmail.com' , 'Linh Mai' ,'Nguyễn Mai Linh'

, '3' , '4' ,'2021-11-07'),

('Tranhoa122@gmail.com' , 'Hoa Trần' ,'Trần Thị Hoa'

, '4' , '1' ,'2021-04-03'),

('nguyenvancat6@gmail.com' , 'Cát Nguyễn' ,'Nguyễn Văn Cát'

, '6' , '2' ,'2021-04-05'),

('thuynhanl7@gmail.com' , 'Thuy Nhan' ,'Nguyen Thi Thuy Nhan'
, '2' , '3' , '2021-04-09' ),
('lytho@gmail.com' , 'Tho Ly' ,'Ly Van Tho'
, '8' , '4' ,'2021-04-11'),

('dongnnguyen999@gmail.com' , 'Đông Nguyễn' ,'Nguyễn Đông'
, '2' , '2' ,'2021-04-07'),
('haile11710@gmail.com' , 'Hải Lê' ,' Lê Đình Hải'
, '8' , '2' ,'2021-09-02');




DROP TABLE IF EXISTS `Group`;
CREATE TABLE 	`Group` (
GroupID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName 	VARCHAR(50) UNIQUE KEY NOT NULL,
CreatorID	TINYINT UNSIGNED UNIQUE NOT NULL,
CreateDate	DATETIME
);
INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES (N'Testing System' , 5
,'2019-03-05'),

(N'Development' , 1

,'2021/11/07'),
(N'Nhân sự' , 2 ,'2021/11/07'),
(N'Maketing' , 3 ,'2021/07/05'),
(N'Sale' , 4 ,'2021/03/07'),
(N'Báo Cáo' , 6 ,'2021/09/07'),
(N' Marketing 01' , 7 ,'2021/11/07'),
(N'Management' , 8 ,'2021/12/07'),
(N'Nội bộ' , 9 ,'2021/04/07'),
(N'Chat' , 10 ,'2021/11/05');


DROP TABLE IF EXISTS Group_account;
CREATE TABLE Group_Account(
GroupID		TINYINT UNSIGNED AUTO_INCREMENT ,
AccountID	TINYINT UNSIGNED  NOT NULL,
JoinDate	DATE,
FOREIGN KEY(GroupID) REFERENCES`Group`(GroupID)
);
INSERT INTO Group_Account ( GroupID , AccountID , JoinDate )
VALUES ( 1 , 1
,'2021-11-06'),

( 1 , 2

,'2021-11-07'),

( 3 , 3

,'2021-11-08'),

( 3 , 4

,'2021-11-09'),

( 5 , 5

,'2021-11-10'),

( 1 , 3

,'2021-11-05'),

( 1 , 7

,'2021-11-11'),

( 8 , 3

,'2021-11-11'),

( 1 , 9

,'2021-11-12'),

( 10 , 10

,'2021-11-13');

 DROP TABLE IF EXISTS Typequestion;
CREATE TABLE Typequestion (
TypeID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM("Essay","Multiple-Choice")NOT NULL
);
INSERT INTO TypeQuestion (TypeName )
VALUES ('Essay' ),
('Multiple-Choice' );


DROP TABLE IF EXISTS Category_Question;
CREATE TABLE Category_Question (
CategoryID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName	VARCHAR(50) NOT NULL
);
INSERT INTO Category_Question (CategoryName )
VALUES ('Name1' ),
('Name2' ),
('Name3' ),
('Name4' ),
('Name5' ),
('Name6' ),
('Name7' ),
('Name8' ),
('Name9' ),
('Name10' );
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(50) NOT NULL,
CategoryID	TINYINT UNSIGNED  UNIQUE NOT NULL,
TypeID		TINYINT UNSIGNED NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATE,
FOREIGN KEY( CategoryID)	REFERENCES Category_Question(CategoryID),
FOREIGN KEY( CreatorID)		REFERENCES `Group`(CreatorID)
);
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID
, CreateDate )
VALUES (N'Câu hỏi1' , 1 ,
'1' , '2' ,'2020-04-05'),

(N'Câu Hỏi 2' , 10 ,

'2' , '2' ,'2020-04-05'),

(N'Câu hỏi 3' , 9 ,

'2' , '3' ,'2020-04-06'),

(N'Câu hỏi 4' , 6 ,

'1' , '4' ,'2020-04-06'),

(N'Câu hỏi 5' , 5 ,

'1' , '5' ,'2020-04-06'),

(N'Câu hỏi 6' , 3 ,

'2' , '6' ,'2020-04-06'),

(N'Câu hỏi 7' , 2 ,

'1' , '7' ,'2020-04-06'),

(N'Câu hỏi 8' , 8 ,

'1' , '8' ,'2020-04-07'),

(N'Câu hỏi 9' , 4 ,

'2' , '9' ,'2020-04-07'),

(N'Câu hỏi 10' , 7 ,

'1' , '10' ,'2020-04-07');

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(50) NOT NULL,
QuestionID	TINYINT UNSIGNED  NOT NULL,
isCorrect	ENUM('1','0'),
FOREIGN KEY(QuestionID)	REFERENCES Question(QuestionID)
);
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES (N'Trả lời 01' , 1 , '0'
),

(N'Trả lời 02' , 1 , '1'

),
(N'Trả lời 03', 1 , '0' ),
(N'Trả lời 04', 1 , '1' ),
(N'Trả lời 05', 2 , '1' ),
(N'Trả lời 06', 3 , '1' ),
(N'Trả lời 07', 4 , '0' ),
(N'Trả lời 08', 8 , '0' ),
(N'Trả lời 09', 9 , '1' ),
(N'Trả lời 10', 10 , '1' );

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`	VARCHAR(50) UNIQUE NOT NULL,
Title	VARCHAR(50) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
Duration	TINYINT UNSIGNED NOT NULL,
CreatorID	TINYINT UNSIGNED NOT NULL,
CreateDate	DATE,
FOREIGN KEY(CategoryID)		REFERENCES Category_question(CategoryID)

);
INSERT INTO Exam (`Code` , Title , CategoryID
, Duration , CreatorID , CreateDate )
VALUES ('Exam1' , N'Đề thi 1' ,
1 , 60 , '5' ,'2021-11-10'),
('Exam2' , N'Đề thi 2' ,
10 , 60 , '2' ,'2021-11-10'),
('Exam3' , N'Đề thi 3' , 9 ,
120 , '2' ,'2021-11-10'),
('Exam4' , N'Đề thi 4' , 6 , 60

, '3' ,'2021-11-10'),

('Exam5' , N'Đề thi 5' , 5 , 120

, '4' ,'2021-11-10'),

('Exam6' , N'Đề thi 6' , 3 ,
60 , '6' ,'2021-11-10'),
('Exam7' , N'Đề thi 7' , 2 ,
60 , '7' ,'2021-11-10'),
('Exam8' , N'Đề thi 8' , 8 ,
60 , '8' ,'2021-11-10'),
('Exam9' , N'Đề thi 9' , 4 ,
90 , '9' ,'2021-11-10'),
('Exam10' , N'Đề thi 10' , 7 ,
90 , '10' ,'2021-11-10');

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID	TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (QuestionID)	REFERENCES	Question( QuestionID)
);
INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES ( 1 , 5 ),
( 2 , 10 ),
( 3 , 4 ),
( 4 , 3 ),
( 5 , 7 ),
( 6 , 10 ),
( 7 , 2 ),
( 8 , 10 ),
( 9 , 9 ),
( 10 , 8 );

