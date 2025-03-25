SELECT  
    CONCAT(e.firstName, ' ', e.lastName) AS sales_rep_name,  
    YEAR(p.paymentDate) AS tahun,  
    SUM(p.amount) AS total_omset  
FROM employees e  
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber  
JOIN payments p ON c.customerNumber = p.customerNumber  
WHERE CONCAT(e.firstName, ' ', e.lastName) IN ('Foon Yue Tseng', 'Pamela Castillo')  
GROUP BY sales_rep_name, tahun  
ORDER BY sales_rep_name, tahun;
