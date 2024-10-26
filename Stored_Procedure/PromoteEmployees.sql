USE EmplpoyeeManagementSystem
GO

EXEC PromoteEmployee 3,'HR Manager',75000,'2024-01-01'

CREATE OR ALTER PROCEDURE PromoteEmployee
    @EmployeeID INT,
    @NewPosition NVARCHAR(50),
    @NewSalaryAmount DECIMAL(18, 2),
    @EffectiveDate DATE
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
		
        UPDATE EMS.Employees
        SET Position = @NewPosition
        WHERE EmployeeID = @EmployeeID

        INSERT INTO EMS.Salaries
		(Amount, EffectiveDate)
        SELECT @NewSalaryAmount, @EffectiveDate
        
        DECLARE @NewSalaryID INT = SCOPE_IDENTITY();
        UPDATE EMS.Employees
        SET SalaryID = @NewSalaryID
        WHERE EmployeeID = @EmployeeID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000)=ERROR_MESSAGE();
		RAISERROR(@ErrorMessage,16,1);
    END CATCH
END
