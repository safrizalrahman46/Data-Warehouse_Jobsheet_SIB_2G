/* PRACTICUM 1 - MENAMPILKAN DATA STAFF BESERTA MANAGER
SELECT * 
FROM employees employe, employees manager, customers cust
WHERE employe.reportsTo = manager.employeeNumber
AND employe.employeeNumber = cust.salesRepEmployeeNumber;
*/

/* TUGAS 2 - MENAMPILKAN HIRARKI HUBUNGAN ANTARA STAFF DAN MANAGER
WITH RECURSIVE EmployeeHierarchy AS (
    -- Level 1: Ambil Presiden (Top-Level Boss)
    SELECT 
        employeeNumber, 
        CONCAT(firstName, ' ', lastName) AS fullName,
        jobTitle,
        reportsTo,
        1 AS level
    FROM employees
    WHERE reportsTo IS NULL  -- Presiden tidak punya atasan

    UNION ALL

    -- Level 2, 3, dst.: Rekursif mencari bawahan
    SELECT 
        e.employeeNumber, 
        CONCAT(e.firstName, ' ', e.lastName) AS fullName,
        e.jobTitle,
        e.reportsTo,
        eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.reportsTo = eh.employeeNumber
)
SELECT * FROM EmployeeHierarchy ORDER BY level, reportsTo;*/


/* TUGAS 2 - MENGHASILKAN JUMLAH CUSTOMER DARI SETIAP STAFF BESERTA NAMA MANAGER
SELECT 
    manager.employeeNumber AS id_manager,
    CONCAT(manager.firstName, " ", manager.lastName) AS Manager,
    employee.employeeNumber AS id_staff, 
    CONCAT(employee.firstName, " ", employee.lastName) AS staff, 
    COUNT(cust.customerNumber) AS total_cust 
FROM employees employee 
JOIN employees manager ON employee.reportsTo = manager.employeeNumber 
LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber 
GROUP BY manager.employeeNumber, manager.firstName, manager.lastName, 
         employee.employeeNumber, employee.firstName, employee.lastName
ORDER BY manager.firstName;*/

/* QUERY TUGAS 3 - MENAMPILKAN PEGAWAI DGN JUMLAH CUSTOMER TERBANYAK
SELECT e.employeeNumber AS id_staff,
       CONCAT(e.firstName, ' ', e.lastName) AS staff_name,
       COUNT(c.customerNumber) AS total_customers
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN employees e2 ON e.employeeNumber = e2.reportsTo  -- Mengecek apakah punya bawahan
WHERE e2.employeeNumber IS NULL  -- Ambil hanya yang tidak punya bawahan
GROUP BY e.employeeNumber
ORDER BY total_customers DESC
LIMIT 1;*/

/* QUERY TUGAS 3 - URUTAN RANKING PEGAWAI/STAFF BESERTA JUMLAH CUSTOMER
SELECT 
    e.employeeNumber AS id_pegawai, 
    CONCAT(e.firstName, ' ', e.lastName) AS nama_pegawai,
    COUNT(DISTINCT c.customerNumber) AS total_customer
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN employees staff ON staff.reportsTo = e.employeeNumber
LEFT JOIN customers c2 ON staff.employeeNumber = c2.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY total_customer DESC;*/

/* QUERY TUGAS 3 - REPORT PENJUALAN PER TAHUN FOON YE TSENG DAN PAMELA CASTILLO
SELECT 
    YEAR(p.paymentDate) AS Tahun,
    SUM(CASE WHEN CONCAT(e.firstName, ' ', e.lastName) = 'Foon Yue Tseng' THEN p.amount ELSE 0 END) AS `Foon Yue Tseng`,
    SUM(CASE WHEN CONCAT(e.firstName, ' ', e.lastName) = 'Pamela Castillo' THEN p.amount ELSE 0 END) AS `Pamela Castillo`
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber 
WHERE CONCAT(e.firstName, ' ', e.lastName) IN ('Foon Yue Tseng', 'Pamela Castillo')
GROUP BY YEAR(p.paymentDate)
ORDER BY Tahun;*/


