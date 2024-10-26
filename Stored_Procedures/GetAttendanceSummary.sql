USE EmplpoyeeManagementSystem
GO

--EXEC GetAttendanceSummary 2,'2024-01-01','2024-12-31'

CREATE OR ALTER PROCEDURE GetAttendanceSummary
(
@EmployeeID INT,
@StartDate DATE,
@EndDate DATE

)
AS
BEGIN
	SELECT 
		COUNT(CASE WHEN Status='Present' THEN 1 END) AS DaysPresent,
		COUNT(CASE WHEN Status='Absent' then 1 END) AS DaysAbsent
	FROM	EMS.Attendance
	WHERE	EmployeeID=@EmployeeID AND Date BETWEEN @StartDate AND @EndDate

END


