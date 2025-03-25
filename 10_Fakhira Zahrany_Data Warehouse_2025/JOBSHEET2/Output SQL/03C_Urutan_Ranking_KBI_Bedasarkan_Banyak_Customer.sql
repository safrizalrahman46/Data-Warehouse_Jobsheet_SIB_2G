WITH Employee_Cust AS (
    SELECT 
        employee.employeeNumber,
        employee.reportsTo,
        CONCAT(employee.firstName, " ", employee.lastName) AS staff,
        COUNT(cust.customerNumber) AS direct_customers
    FROM employees employee  
    LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber  
    GROUP BY employee.employeeNumber
),
Hierarchy_Cust AS (
    SELECT 
        e1.employeeNumber, 
        e1.staff,
        e1.direct_customers,
        COALESCE(SUM(e2.direct_customers), 0) AS inherited_customers
    FROM Employee_Cust e1
    LEFT JOIN Employee_Cust e2 ON e1.employeeNumber = e2.reportsTo
    GROUP BY e1.employeeNumber
)
SELECT 
    employeeNumber, 
    staff,
    direct_customers,
    inherited_customers,
    (direct_customers + inherited_customers) AS total_customers
FROM Hierarchy_Cust
ORDER BY total_customers DESC;
