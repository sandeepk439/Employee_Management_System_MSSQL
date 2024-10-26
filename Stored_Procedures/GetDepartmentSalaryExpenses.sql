USE EmplpoyeeManagementSystem
GO

CREATE OR ALTER PROCEDURE GetDepartmentSalaryExpenses
(
@DepartmentID INT,
--@StartDate DATE,
--@EndDate DATE,
@TotalSalaryExpenses MONEY OUTPUT
)
AS

BEGIN
	SELECT		@TotalSalaryExpenses=SUM(s.Amount)
	FROM		EMS.Employees e JOIN EMS.Salaries s on e.SalaryID=s.SalaryID
	WHERE		E.DepartmentID=@DepartmentID-- AND S.EffectiveDate BETWEEN @StartDate AND @EndDate
END


DECLARE @TotalExpense MONEY
EXEC GetDepartmentSalaryExpense @DepartmentID = 2, @TotalSalaryExpense =@TotalExpense OUTPUT
SELECT @TotalExpense AS TotalExpenses




