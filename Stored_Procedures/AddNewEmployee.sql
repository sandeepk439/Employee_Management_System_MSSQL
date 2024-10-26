USE EmplpoyeeManagementSystem
GO

--EXEC AddNewEmployee 'Sandeep','Kumar','2000-01-01','2024-01-01','Developer','IT',75000

CREATE PROCEDURE AddNewEmployee
(
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@DateOfBirth DATE,
@HireDate DATE,
@Position NVARCHAR(100),
@DepartmentName NVARCHAR(100),
@Amount MONEY
)
AS

BEGIN
	DECLARE @DepartmentID INT
	SELECT @DepartmentID=DepartmentID FROM EMS.Departments WHERE DepartmentName=@DepartmentName
	DECLARE @SalaryID INT
	SELECT @SalaryID=SalaryID FROM EMS.Salaries WHERE Amount=@Amount


	INSERT INTO EMS.Employees
	(FirstName,LastName,DateOfBirth,HireDate,Position,DepartmentID,SalaryID)
	SELECT @FirstName,@LastName,@DateOfBirth,@HireDate,@Position,@DepartmentID,@SalaryID
END