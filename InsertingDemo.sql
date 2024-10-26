INSERT INTO EMS.Departments
(DepartmentName,ManagerID)
VALUES
('HR', 2),
('IT', 3),
('Finance', 5),
('Marketing',6),
('Sales',7)

INSERT INTO EMS.Employees
(FirstName,LastName,DateOfBirth,HireDate,Position,DepartmentID,SalaryID)
VALUES
('John','Doe','1985-05-12',	'2020-06-15','Developer',2,1),
('Jane','Smith','1990-07-22','2019-08-01','HR Manager',1,2),
('Michael','	Johnson','	1987-11-04','	2021-03-12','	IT Manager',	2,	3),
('Sarah','	Brown','	1992-01-15','	2018-04-21','	Marketing Coordinator',	4,	4),
('James','	Davis','	1988-09-23','	2020-07-19','	Finance Analyst',	3,	5),
('Emily','	Wilson','	1991-02-18','	2019-02-10','	Marketing Manager',	4,	6),
('Robert','	Miller','	1983-10-30','	2017-11-23','	Sales Executive',	5,	7),
('Jessica','	Moore','	1995-06-12','	2022-05-14','	HR Executive',	1,	8),
('David','	Taylor','	1986-04-28','	2021-09-08','	IT Analyst',	2,	9),
('Laura','	Anderson','	1993-12-05','	2018-12-13','	Sales Manager',	5,	10)

INSERT INTO EMS.Salaries
(Amount,EffectiveDate)
VALUES
(60000,'	2021-01-01'),
(75000,'	2022-01-01'),
(80000	,'2023-01-01'),
(55000	,'2020-06-15'),
(90000	,'2021-09-01'),
(70000	,'2020-02-10'),
(65000	,'2020-11-23'),
(60000	,'2022-05-14'),
(85000	,'2021-09-08'),
(78000	,'2018-12-13')

INSERT INTO EMS.PerformanceReviews
(EmployeeID,ReviewDate,Ratings,Comments)
VALUES
(1	,'2022-12-15',	4	,'Good performance overall.'),
(2	,'2022-12-15',	5	,'Excellent performance, promotion recommended.'),
(3	,'2023-01-10	',4	,'Consistent and reliable.'),
(4	,'2022-07-21	',3	,'Needs improvement in communication skills.'),
(5	,'2023-03-18	',5	,'Outstanding in financial analysis.'),
(6	,'2022-11-05	',4	,'Meets expectations.'),
(7	,'2022-10-23	',3	,'Improvement needed in meeting sales targets.'),
(8	,'2023-04-14	',4	,'Great team player.'),
(9	,'2023-06-09	',5,	'Exceeds in IT project management.'),
(10	,'2023-08-12	',4,	'Achieved sales targets consistently.')


INSERT INTO EMS.Attendance
(EmployeeID,Date,Status)
VALUES
(1,'2024-01-05','Present'),
(2,'2024-01-05','Present'),
(3,'2024-01-06','Absent'),
(4,'2024-01-06','Present'),
(5,'2024-01-07','Present'),
(6,'2024-01-07','Absent'),
(7,'2024-01-08','Present'),
(8,'2024-01-08','Present'),
(9,'2024-01-09','Present'),
(10,'2024-01-09','Absent')

