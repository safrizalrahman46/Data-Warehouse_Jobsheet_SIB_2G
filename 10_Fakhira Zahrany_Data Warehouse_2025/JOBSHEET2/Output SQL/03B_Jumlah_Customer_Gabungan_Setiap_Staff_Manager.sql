WITH Employee_Cust AS (
    SELECT 
        employee.employeeNumber,
        employee.reportsTo,
        CONCAT(employee.firstName, " ", employee.lastName) AS staff,
        COUNT(cust.customerNumber) AS direct_customers
    FROM employees employee  
    LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber  
    GROUP BY employee.employeeNumber
)
SELECT 
    e1.employeeNumber AS id_staff,
    e1.staff,
    e1.direct_customers,
    COALESCE(SUM(e2.direct_customers), 0) AS inherited_customers
FROM Employee_Cust e1
LEFT JOIN Employee_Cust e2 ON e1.employeeNumber = e2.reportsTo
GROUP BY e1.employeeNumber
ORDER BY (e1.direct_customers + COALESCE(SUM(e2.direct_customers), 0)) DESC;
