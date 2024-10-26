USE EmplpoyeeManagementSystem
GO
--select * from EmployeeDetails

CREATE VIEW EmployeeDetails
AS
SELECT e.EmployeeID,e.FirstName+e.LastName AS Name,d.DepartmentName,e.Position,s.Amount AS Salary,p.Ratings
FROM EMS.Employees e
JOIN EMS.Departments d ON e.DepartmentID=d.DepartmentID
JOIN EMS.Salaries s ON e.SalaryID=s.SalaryID
JOIN EMS.PerformanceReviews p ON e.EmployeeID=p.EmployeeID