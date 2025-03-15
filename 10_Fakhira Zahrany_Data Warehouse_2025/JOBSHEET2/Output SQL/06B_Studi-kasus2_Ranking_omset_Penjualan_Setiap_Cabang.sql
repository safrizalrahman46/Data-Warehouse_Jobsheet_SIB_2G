WITH SalesPerEmployee AS (
    SELECT 
        o.city AS nama_cabang,
        e.employeeNumber,
        CONCAT(e.firstName, ' ', e.lastName) AS nama_karyawan,
        SUM(p.amount) AS total_penjualan
    FROM offices o
    JOIN employees e ON o.officeCode = e.officeCode
    JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN payments p ON c.customerNumber = p.customerNumber
    GROUP BY o.city, e.employeeNumber
),
RankedSales AS (
    SELECT 
        nama_cabang,
        nama_karyawan,
        total_penjualan,
        RANK() OVER (PARTITION BY nama_cabang ORDER BY total_penjualan DESC) AS ranking
    FROM SalesPerEmployee
)
SELECT nama_cabang, nama_karyawan, total_penjualan
FROM RankedSales
WHERE ranking = 1
ORDER BY total_penjualan DESC;
