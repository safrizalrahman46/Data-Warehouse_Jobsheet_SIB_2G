-- Import Data dan Analisis Struktur Database
-- Menampilkan Struktur Tabel dan Relasi

-- Tugas 1: Menampilkan Struktur Database
SHOW TABLES;

-- Menampilkan jumlah field di setiap tabel
DESCRIBE productlines;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE orderdetails;
DESCRIBE customers;
DESCRIBE employees;
DESCRIBE offices;
DESCRIBE payments;

-- Tugas 2: Menampilkan Hirarki Pegawai
SELECT manager.employeeNumber AS id_manager,
       CONCAT(manager.firstName, ' ', manager.lastName) AS Manager,
       employee.employeeNumber AS id_staff,
       CONCAT(employee.firstName, ' ', employee.lastName) AS staff
FROM employees employee, employees manager
WHERE employee.reportsTo = manager.employeeNumber
ORDER BY manager.firstName;

-- Tugas 3: Analisis KPI Pegawai

-- a) Menampilkan Staff Berprestasi Berdasarkan Jumlah Customer
SELECT employee.employeeNumber AS id_staff, 
       CONCAT(employee.firstName, ' ', employee.lastName) AS staff, 
       COUNT(cust.customerNumber) AS total_cust 
FROM employees employee 
LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber 
GROUP BY employee.employeeNumber 
ORDER BY total_cust DESC 
LIMIT 1;

-- b) Ranking Pegawai Berdasarkan KPI "Jumlah Customer"
WITH EmployeeHierarchy AS (
    SELECT 
        manager.employeeNumber AS id_manager, 
        CONCAT(manager.firstName, ' ', manager.lastName) AS Manager, 
        employee.employeeNumber AS id_staff, 
        CONCAT(employee.firstName, ' ', employee.lastName) AS staff, 
        COUNT(cust.customerNumber) AS total_cust 
    FROM employees employee 
    JOIN employees manager ON employee.reportsTo = manager.employeeNumber 
    LEFT JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber 
    GROUP BY employee.employeeNumber 
),
ManagerCustomer AS (
    SELECT 
        e.id_manager, 
        e.Manager, 
        SUM(e.total_cust) AS total_customers 
    FROM EmployeeHierarchy e 
    GROUP BY e.id_manager, e.Manager
)
SELECT id_manager, Manager, total_customers 
FROM ManagerCustomer 
ORDER BY total_customers DESC;

-- c) Ranking Pegawai Berdasarkan KPI "Jumlah Omset"
SELECT employee.employeeNumber AS id_staff, 
       CONCAT(employee.firstName, ' ', employee.lastName) AS staff, 
       SUM(payments.amount) AS total_omset 
FROM employees employee 
JOIN customers cust ON employee.employeeNumber = cust.salesRepEmployeeNumber 
JOIN payments ON cust.customerNumber = payments.customerNumber 
GROUP BY employee.employeeNumber 
ORDER BY total_omset DESC;

-- Tugas 4: Dashboard Penjualan per Cabang
SELECT offices.city AS Nama_Cabang, 
       YEAR(payments.paymentDate) AS Tahun, 
       SUM(payments.amount) AS Total_Omset 
FROM payments 
JOIN customers ON payments.customerNumber = customers.customerNumber 
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber 
JOIN offices ON employees.officeCode = offices.officeCode 
GROUP BY offices.city, Tahun 
ORDER BY offices.city, Tahun;

-- Tugas 5: Report Alternatif
-- a) Menampilkan Jumlah Transaksi per Cabang per Tahun
SELECT offices.city AS Nama_Cabang,
       YEAR(orders.orderDate) AS Tahun,
       COUNT(orders.orderNumber) AS Total_Transaksi
FROM orders
JOIN customers ON orders.customerNumber = customers.customerNumber
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices ON employees.officeCode = offices.officeCode
GROUP BY offices.city, Tahun
ORDER BY offices.city, Tahun;

-- b) Menampilkan Total Omset per Cabang per Tahun
SELECT 
    offices.city AS Nama_Cabang,
    YEAR(payments.paymentDate) AS Tahun,
    SUM(payments.amount) AS Total_Omset
FROM payments
JOIN customers ON payments.customerNumber = customers.customerNumber
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices ON employees.officeCode = offices.officeCode
GROUP BY offices.city, Tahun
ORDER BY offices.city, Tahun;
