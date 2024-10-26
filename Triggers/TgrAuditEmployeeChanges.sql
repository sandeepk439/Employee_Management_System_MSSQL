USE EmplpoyeeManagementSystem
GO

CREATE OR ALTER TRIGGER TgrAuditEmployeeChanges ON EMS.Employees

AFTER UPDATE
AS
BEGIN
	INSERT INTO EMS.EmployeeAudit
	(EmployeeID,OldFirstName,NewFirstName,OldLastName,NewLastName)
	SELECT i.EmployeeID,
			d.FirstName AS OldFirstName,
			i.FirstName AS NewFirstName,
			d.LastName AS OldLastName,
			i.LastName AS NewLastName
	FROM inserted i
	JOIN deleted d ON i.EmployeeID=d.EmployeeID	--Virtual tables as Inserted Table Stores New data and Deleted table stores Old data after DML Operations.
END


/*UPDATE ems.Employees
SET FirstName = 'Sawan', LastName = 'kumar'
WHERE EmployeeID = 2
*/