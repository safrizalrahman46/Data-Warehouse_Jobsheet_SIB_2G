SELECT 
    manager.employeeNumber AS id_manager,
    CONCAT(manager.firstName, " ", manager.lastName) AS Manager,
    employee.employeeNumber AS id_staff,
    CONCAT(employee.firstName, " ", employee.lastName) AS staff,
    COUNT(cust.customerNumber) AS total_cust
FROM employees employee
JOIN employees manager ON employee.reportsTo = manager.employeeNumber
LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber
GROUP BY employee.employeeNumber, manager.employeeNumber
ORDER BY manager.firstName;
