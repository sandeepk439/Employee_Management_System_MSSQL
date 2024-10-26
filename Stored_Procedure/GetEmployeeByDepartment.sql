USE EmplpoyeeManagementSystem
GO
--EXEC GetEmployeeByDepartment 2

CREATE PROCEDURE GetEmployeeByDepartment
(
@DepartmentID INT
)
AS
BEGIN
	SELECT EmployeeID, FirstName,LastName,Position
	FROM EMS.Employees 
	WHERE DepartmentID=@DepartmentID
END