USE EmplpoyeeManagementSystem
GO

CREATE OR ALTER PROCEDURE BonusCalculation
(
@EmployeeID INT
)
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		DECLARE @Ratings INT
		DECLARE @LastReviewDate DATE
		DECLARE @BonusPercentage FLOAT

		SELECT TOP 1 @Ratings=Ratings, @LastReviewDate=ReviewDate
		FROM EMS.PerformanceReviews
		WHERE EmployeeID=@EmployeeID
		ORDER BY ReviewDate DESC

		IF @Ratings=5
		BEGIN
			SET @BonusPercentage=20.0;
		END
		IF @Ratings=4
		BEGIN
			SET @BonusPercentage=15.0;
		END
		IF @Ratings=3
		BEGIN
			SET @BonusPercentage=10.0;
		END
		ELSE
		BEGIN
			SET @BonusPercentage=0.0;
		END

		DECLARE @SalaryID INT
		DECLARE @IncreasedAmount MONEY

		SELECT @SalaryID=SalaryID FROM EMS.Employees WHERE EmployeeID=@EmployeeID;
		SELECT @IncreasedAmount=(Amount*(100+@BonusPercentage)*0.01) FROM EMS.Salaries WHERE SalaryID=@SalaryID;

		IF @IncreasedAmount IN (SELECT Amount FROM EMS.Salaries)
		BEGIN
			UPDATE EMS.Employees
			SET SalaryID=(SELECT SalaryID FROM EMS.Salaries WHERE Amount=@IncreasedAmount)
			WHERE EmployeeID=@EmployeeID
		END
		ELSE
		BEGIN
			INSERT INTO EMS.Salaries
			(Amount,EffectiveDate)
			SELECT @IncreasedAmount,GETDATE()

			DECLARE @AddedSalaryID INT=SCOPE_IDENTITY()

			UPDATE EMS.Employees
			SET SalaryID=@AddedSalaryID
			WHERE EmployeeID=@EmployeeID
		END
		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION;
		DECLARE @ErrorMessage NVARCHAR(4000)=ERROR_MESSAGE();
		RAISERROR(@ErrorMessage,16,1);
	END CATCH
END