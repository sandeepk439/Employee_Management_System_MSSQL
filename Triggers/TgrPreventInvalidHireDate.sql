USE EmplpoyeeManagementSystem
GO
CREATE OR ALTER TRIGGER TgrPreventInvalidHireDate ON EMS.Employees
INSTEAD OF INSERT
AS
BEGIN
	Declare @HireDate DATE,@DateOfBirth DATE
	SELECT @HireDate=i.HireDate,
			@DateOfBirth=i.DateOfBirth
	FROM inserted i

	IF @HireDate<@DateOfBirth
	BEGIN
		RAISERROR('HireDate cannot be earlier than DateOfBirth',16,1)
		ROLLBACK TRANSACTION;
	END
END

/*

INSERT INTO EMS.Employees (FirstName, LastName, DateOfBirth, HireDate, Position, DepartmentID)
VALUES ('Rahul', 'Kumar', '1990-01-01', '1989-12-31', 'Manager', 2)

*/