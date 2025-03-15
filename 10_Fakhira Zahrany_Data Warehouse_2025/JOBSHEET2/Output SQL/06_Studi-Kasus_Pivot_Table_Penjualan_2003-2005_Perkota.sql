SELECT 
    o.city AS nama_cabang,  
    SUM(CASE WHEN YEAR(p.paymentDate) = 2003 THEN p.amount ELSE 0 END) AS '2003',
    SUM(CASE WHEN YEAR(p.paymentDate) = 2004 THEN p.amount ELSE 0 END) AS '2004',
    SUM(CASE WHEN YEAR(p.paymentDate) = 2005 THEN p.amount ELSE 0 END) AS '2005'
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY o.city
ORDER BY o.city;
