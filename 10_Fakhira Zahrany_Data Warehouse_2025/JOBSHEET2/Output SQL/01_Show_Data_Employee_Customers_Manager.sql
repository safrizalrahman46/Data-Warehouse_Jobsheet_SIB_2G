SELECT 
    manager.employeeNumber AS id_manager,
    CONCAT(manager.firstName, " ", manager.lastName) AS Manager,
    employee.employeeNumber AS id_staff,
    CONCAT(employee.firstName, " ", employee.lastName) AS staff
FROM employees employee
JOIN employees manager ON employee.reportsTo = manager.employeeNumber
ORDER BY manager.firstName;
