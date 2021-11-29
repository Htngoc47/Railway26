CREATE DATABASE Testing_system_Assignment_5;
USE Testing_system_assignment_2;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW		Danh_sach_NV_Sale	AS
SELECT 			UserName, FullName, email, AccountID
FROM			department
INNER JOIN		`account`	 ON 	`account`.DepartmentID=Department.DepartmentID	
WHERE			DepartmentName='Sale';




-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

CREATE VIEW		Join_many_Group 	AS
SELECT			UserName, FullName, email, `Account`.AccountID
FROM			group_account
INNER JOIN		`account`		ON 		`account`.AccountID=group_account.AccountID
GROUP BY		group_account.AccountID
HAVING			COUNT( group_account.AccountID)=	(SELECT MAX(B)
													FROM	(SELECT COUNT(`Account`.AccountID)	AS B
															FROM			group_account
															INNER JOIN		`account`		ON 		`account`.AccountID=group_account.AccountID
															GROUP BY		group_account.AccountID) AS SQ); 
												




-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (>300 ) và xóa nó đi

CREATE VIEW 	too_long_content 	AS
SELECT			*
FROM			question
WHERE			LENGTH(content)>300;

DELETE		FROM too_long_content;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS nhiu_nv_nhat;
CREATE VIEW		nhiu_nv_nhat	AS
SELECT			department.DepartmentID, department.DepartmentName, COUNT(accountID)
FROM			`account`
INNER JOIN		department 	ON 	Department.DepartmentID=`account`.DepartmentID
GROUP BY		department.DepartmentID
HAVING 			count(`account`.accountID) = (SELECT	MAX(ss)
												FROM	     (SELECT	COUNT(`account`.accountID) AS ss 
															 FROM		 `account`	
															 GROUP BY	`account`.departmentID)	AS N);
                                                             
SELECT	*
FROM	nhiu_nv_nhat;
		
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo

CREATE VIEW	Nguyen_question		AS 

SELECT 	questionid, content, creator_id, a.fullname
FROM 	question q
INNER JOIN `account`a ON a.account_id = q.creator_id
WHERE a.fullname LIKE 'Nguyễn%';

SELECT * FROM Nguyen_question;
