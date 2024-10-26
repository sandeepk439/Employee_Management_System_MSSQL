USE EmplpoyeeManagementSystem
GO

CREATE VIEW DepartmentEmployeeCountView
AS
SELECT d.DepartmentName,COUNT(e.EmployeeID) AS EmployeeCount
FROM EMS.Employees e
right JOIN EMS.Departments d ON d.DepartmentID=e.DepartmentID
GROUP BY d.DepartmentName


--select * from DepartmentEmployeeCountView