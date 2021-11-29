CREATE DATABASE Testing_system_Assignment3;
USE				Testing_system_Asignment_2;

--------------Câu 1: Lấy ra tất cả các phòng ban-----------


SELECT			*
FROM			Department;

---------------Lấy ra ID của phòng ban Sale--------------


SELECT			DepartmentID
FROM			Department
WHERE			DeparmentName='Sale';

----------------------Lấy ra `account` có fullname dài nhất----------------

SELECT			*
FROM			`Account`
WHERE			LENGTH(FullName)=(SELECT MAX (LENGTH(FullName))	FROM `Acccount`);

---------Lấy ra `account` có fullname dài nhất và có ID bằng 3-----------

SELECT			MAX(FullName)
FROM			`account`
WHERE			LENGTH(FullName)=(SELECT MAX (LENGTH(FullName))FROM `Account`) AND DepartmentID=3;

----------Lấy ra `group` đã tham gia trước ngày 20-12-2019--------

SELECT			GroupName
FROM			`Group`
WHERE			CreateDate>2019/20/12;

Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT 			QuestionID
FROM			Answer
WHERE			
-------------Lấy ra các mã đề thi có thời gian thi >=60 phút và có ngày tạo trước 20-12-2019----

SELECT			`Code`
FROM			Exam
WHERE			Duration>=60 AND CreateDate>2019/12/20;

--------Lấy ra 5 `Group` tạo gần đây nhất----------

SELECT			GroupName
FROM			`Group`
WHERE			CreateDate DESC LIMIT=5;

---------Đếm số nhân viên thuộc department có ID=2-------

SELECT			COUNT(`account`)
FROM			`Account`
WHERE			DepartmentID=2;

----------Tìm Nhân viên có tên bắt đầu bằng chữ D và kết thúc bằng o--------

SELECT			UserName
FROM			`account`
WHERE			FullName=(D%o);

------- Xóa các Exam có ngày tạo trước 20-12-2019----------------

DELETE	FROM	Exam
WHERE			Createdate<2019/20/12;

----------Xóa tất cả những Question có nội dung bắt đầu bằng "Câu hỏi"--------

DELETE	FROM	Question
WHERE			Content('Câu hỏi'%);

----------Câu 14 `Update` thông tin cuẩ `account` có thông tin id= 5 thành tên Nguyễn Bá Lộc và email thành locnguyenba@gmail.com.vn----

UPDATE 			`account`
SET				FullName=N'Nguyễn Bá Lộc' AND email ='locnguyenba@gamil.com.vn',
WHERE			AccountID=5;

Câu 15 `Update` `account` có ID=5 sẽ thuộc `group` có ID = 4

UPDATE		`Account`
SET			














