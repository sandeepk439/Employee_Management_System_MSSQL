create schema EMS

CREATE TABLE EMS.Departments (
DepartmentID INT IDENTITY(1,1),
DepartmentName	NVARCHAR(100) NOT NULL,
ManagerID INT,
PRIMARY KEY(DepartmentID)
--FOREIGN KEY(ManagerID) REFERENCES Employees(EmployeeID)
)

CREATE TABLE EMS.Salaries (
SalaryID INT IDENTITY(1,1),
Amount MONEY,
EffectiveDate DATE
PRIMARY KEY(SalaryID)
)

CREATE TABLE EMS.Employees (
EmployeeID INT IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
DateOfBirth DATE,
HireDate DATE,
Position NVARCHAR(100),
DepartmentID INT,
SalaryID INT,
PRIMARY KEY(EmployeeID),
FOREIGN KEY(DepartmentID) REFERENCES EMS.Departments(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE,--FOR DELETE AND UPDATION IN FOREIGN KEY VALUES IN EVERY TABLE
FOREIGN KEY(SalaryID) REFERENCES EMS.Salaries(SalaryID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE EMS.PerformanceReviews (
ReviewID INT IDENTITY(1,1),
EmployeeID INT,
ReviewDate DATE NOT NULL,
Ratings INT CHECK(Ratings BETWEEN 1 AND 5),
Comments NVARCHAR(MAX),
PRIMARY KEY(ReviewID),
FOREIGN KEY(EmployeeID) REFERENCES EMS.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE EMS.Attendance (
AttendanceID INT IDENTITY(1,1),
EmployeeID INT,
Date DATE,
Status NVARCHAR(10) CHECK(Status IN('Present', 'Absent')),
PRIMARY KEY(AttendanceID),
FOREIGN KEY(EmployeeID) REFERENCES EMS.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)

ALTER TABLE EMS.Departments
add constraint FK_Dept_Manager
FOREIGN KEY(ManagerID) REFERENCES Employees(EmployeeID) on delete cascade on update cascade


CREATE TABLE EMS.EmployeeAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    OldFirstName NVARCHAR(50),
    NewFirstName NVARCHAR(50),
    OldLastName NVARCHAR(50),
    NewLastName NVARCHAR(50),
    ChangeDate DATETIME DEFAULT GETDATE()
)
SELECT * FROM EMS.EmployeeAudit

