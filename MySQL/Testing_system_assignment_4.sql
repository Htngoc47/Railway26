
USE				Testing_system_assignment_2;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT			UserName, Department.DepartmentID, Department.DepartmentName
FROM			`Account`
INNER JOIN 		Department ON Department.DepartmentID=`Account`.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT			*
FROM			`Account`
WHERE			CreateDate> '2021-10-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT			`Account`.UserName, `Account`.Fullname, `Position`.PositionName
FROM			`Account`
INNER JOIN		`Position` 	ON `Position`.PositionID=`Account`.PositionID
WHERE			PositionName='Dev';
-----------------------
 
 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT			*, COUNT(DepartmentName)
FROM			`Account`
INNER JOIN		Department	ON Department.DepartmentID=`Account`.DepartmentID
GROUP BY		Department.DepartmentID
HAVING 			COUNT(Department.DepartmentID)>3;



-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất
-- danh sách câu hỏi được sử dụng trong đề thi
SELECT 			Question.Content , COUNT(examquestion.ExamID)
FROM			Examquestion
INNER JOIN 		Question ON Question.QuestionID=examquestion.QuestionID
GROUP BY		examquestion.QuestionID
HAVING			COUNT(examquestion.ExamID)= (	SELECT	MAX(A)
												FROM	(SELECT 		COUNT(examquestion.ExamID) AS A
														FROM			Examquestion
														INNER JOIN 		Question ON Question.QuestionID=examquestion.QuestionID
														GROUP BY		Question.QuestionID) AS SQ);



-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT			COUNT(Category_question.CategoryID), Category_question.CategoryID
FROM			Question
INNER JOIN		Category_question	ON Category_question.CategoryID=Question.CategoryID
GROUP BY		Category_question.CategoryID
HAVING			COUNT(Category_question.CategoryID);

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT			COUNT(Question.QuestionID)
FROM			Question
INNER JOIN		Examquestion	ON	Question.QuestionID=Examquestion.QuestionID
INNER JOIN		Exam			ON	Exam.ExamID=Examquestion.ExamID
GROUP BY		Question.QuestionID
HAVING			COUNT(Question.QuestionID);





-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT		COUNT(Question.QuestionID),Question.QuestionID
FROM		Question
INNER JOIN	Answer		ON		Question.QuestionID=Answer.QuestionID
GROUP BY	Question.QuestionID
HAVING		COUNT(Question.QuestionID)=( 
SELECT MAX(A) 
FROM	
( SELECT COUNT(QuestionID) AS A 
FROM Answer 
GROUP BY	QuestionID 
HAVING COUNT(QuestionID)) AS AB);

-- Question 9: Thống kê số lượng account trong mỗi group

 SELECT 	GroupName, COUNT(Group_account.AccountID)
 FROM 		Group_account
 INNER JOIN `Group`		ON 	Group_account.GroupID=`group`.GroupID
 GROUP BY 	`Group`.GroupID;


--   Question 10: Tìm chức vụ có ít người nhất
-- tim chuc vu kem so luong nhan vien 
SELECT		`Position`.PositionName , COUNT(`Account`.AccountID)
FROM		`Position`
INNER JOIN 	`Account`	ON		`Account`.PositionID=`Position`.PositionID 
GROUP BY 	`Position`.PositionID 
HAVING		COUNT(`Account`.AccountID)=( 
										SELECT  MIN(C)
										FROM (	SELECT	COUNT(`Account`.AccountID) AS C
												FROM 	`Account`
                                                GROUP BY `Account`.PositionID) AS P);
                                        


-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, `scrum master`, PM

SELECT 		Department.DepartmentName, `Position`.PositionName, COUNT(`Account`.AccountID)
FROM		Department
INNER JOIN  `Account`		ON 		Department.DepartmentID=	`Account`.DepartmentID
INNER JOIN 	`Position`		ON 		`Position`.PositionID= `Account`.PositionID
GROUP BY	Department.DepartmentName, `Position`.PositionName;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT		 Question.Content, typequestion.TypeID , Question.CreatorID, Answer.AnswerID 
FROM		question
JOIN		Typequestion 	ON 	question.TypeID=Typequestion.TypeID
JOIN		Answer			ON   question.QuestionID=Answer.QuestionID;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT		typeID, typeName,COUNT(Typequestion.TypeName)
FROM 		Typequestion
GROUP BY	Typequestion.typeName;

-- Question 14:Lấy ra group không có account nào
-- Question 15: Lấy ra group không có account nào

SELECT	Group_account.GroupID , `group`.GroupName
FROM	`group`
LEFT JOIN Group_account	ON		group_account.groupID=`group`.groupID
WHERE 		`group`.groupID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT		Question.QuestionID, isCorrect
FROM		Question
RIGHT JOIN 	Answer		ON 	Question.QuestionID=Answer.QuestionID
WHERE		answer.isCorrect IS NULL;
 
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT	*
FROM	`Account`
INNER JOIN	Group_account	ON	`Account`.AccountID= Group_account.AccountID
WHERE	Group_account.GroupID=1;

-- b) Lấy các account thuộc nhóm thứ 3
SELECT	*
FROM	`Account`
INNER JOIN	Group_account	ON	`Account`.AccountID= Group_account.AccountID
WHERE	Group_account.GroupID=3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT	*
FROM	`Account`
INNER JOIN	Group_account	ON	`Account`.AccountID= Group_account.AccountID
WHERE	Group_account.GroupID=1

UNION

SELECT	*
FROM	`Account`
INNER JOIN	Group_account	ON	`Acco m	Junt`.AccountID= Group_account.AccountID
WHERE	Group_account.GroupID=3;



