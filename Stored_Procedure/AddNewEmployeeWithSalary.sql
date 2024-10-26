USE EmplpoyeeManagementSystem
GO

--EXEC AddNewEmployeeWithSalary 'Rakesh', 'Kumar', '2000-02-02', '2024-02-02','IT Analyst',4,90000,'2025-01-01'

CREATE PROCEDURE AddNewEmployeeWithSalary
(
@FirstName NVARCHAR(50),
@LastName NVARCHAR(50),
@DateOfBirth DATE,
@HireDate DATE,
@Position NVARCHAR(100),
@DepartmentID INT,
@SalaryAmount MONEY,
@EffectiveDate DATE
)
AS
BEGIN
	BEGIN TRANSACTION;
		BEGIN TRY
			INSERT INTO EMS.Employees
			(FirstName,LastName,DateOfBirth,HireDate,Position,DepartmentID)
			SELECT @FirstName,@LastName, @DateOfBirth,@HireDate,@Position,@DepartmentID

			DECLARE @NewEmployeeID INT=SCOPE_IDENTITY()

			INSERT INTO EMS.Salaries
			(Amount,EffectiveDate)
			SELECT @SalaryAmount, @EffectiveDate

			DECLARE @NewSalaryID INT=SCOPE_IDENTITY()

			UPDATE EMS.Employees
			SET SalaryID=@NewSalaryID
			WHERE EmployeeID=@NewEmployeeID

			COMMIT TRANSACTION;

		END TRY

		BEGIN CATCH

		ROLLBACK TRANSACTION;
		DECLARE @ERROR_MESSAGE NVARCHAR(1000)= ERROR_MESSAGE()
		RAISERROR (@ERROR_MESSAGE,16,1);
		
		END CATCH
END