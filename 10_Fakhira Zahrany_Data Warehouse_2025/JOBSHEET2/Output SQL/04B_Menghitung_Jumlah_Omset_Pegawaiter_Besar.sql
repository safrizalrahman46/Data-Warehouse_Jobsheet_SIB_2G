SELECT  
    e.employeeNumber AS id_staff,  
    CONCAT(e.firstName, ' ', e.lastName) AS staff_name,  
    COALESCE(SUM(p.amount), 0) AS total_omset,  
    m.employeeNumber AS id_manager,  
    CONCAT(m.firstName, ' ', m.lastName) AS manager_name  
FROM employees e  
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber  
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber  
LEFT JOIN payments p ON c.customerNumber = p.customerNumber  
GROUP BY e.employeeNumber, e.firstName, e.lastName,  
         m.employeeNumber, m.firstName, m.lastName  
ORDER BY total_omset DESC  
LIMIT 25;
