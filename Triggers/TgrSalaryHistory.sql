USE EmplpoyeeManagementSystem
GO
CREATE OR ALTER TRIGGER TgrSalaryHistory ON EMS.Salaries
AFTER UPDATE

AS
BEGIN
	INSERT INTO EMS.SalaryHistory(EmployeeID,NewSalary,OldSalary)
	SELECT 	e.EmployeeID,
			d.Amount AS OldSalary,
			i.Amount AS NewSalary
	FROM inserted i
	JOIN deleted d ON i.SalaryID=d.SalaryID
	JOIN EMS.Employees e ON e.SalaryID=i.SalaryID
END

/*
update ems.Salaries
set Amount=92000
where SalaryID=5
*/