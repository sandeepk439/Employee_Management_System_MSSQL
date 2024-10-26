CREATE NONCLUSTERED INDEX IDX_LastName ON EMS.Employees(LastName)-- to improve the query by searching through last name in where clause

CREATE NONCLUSTERED INDEX IDX_HireDate ON EMS.Employees(HireDate)-- improve the query by ordering the row by HireDate

CREATE NONCLUSTERED INDEX IDX_DepartmentPosition on EMS.Employees(DepartmentID,Position)-- for grouping and filtering

