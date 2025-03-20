SELECT  
    e.employeeNumber AS id_staff,  
    CONCAT(e.firstName, ' ', e.lastName) AS staff_name,  
    COALESCE(p.amount, 0) AS omzet_per_transaksi,  
    m.employeeNumber AS id_manager,  
    CONCAT(m.firstName, ' ', m.lastName) AS manager_name  
FROM employees e  
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber  
INNER JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber  
LEFT JOIN payments p ON c.customerNumber = p.customerNumber  
ORDER BY staff_name ASC, omzet_per_transaksi DESC;
