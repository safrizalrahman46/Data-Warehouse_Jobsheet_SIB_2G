<?php
$host = "localhost"; 
$user = "root"; 
$password = ""; 
$dbname = "perusahaan"; // Ganti sesuai database kamu

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = new mysqli($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Query untuk mendapatkan total penjualan tertinggi per cabang
$sql = "WITH SalesPerEmployee AS (
            SELECT o.city AS nama_cabang, 
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
            SELECT nama_cabang, 
                   nama_karyawan, 
                   total_penjualan, 
                   RANK() OVER (PARTITION BY nama_cabang ORDER BY total_penjualan DESC) AS ranking 
            FROM SalesPerEmployee
        )
        SELECT nama_cabang, nama_karyawan, total_penjualan 
        FROM RankedSales 
        WHERE ranking = 1 
        ORDER BY total_penjualan DESC";

$result = $conn->query($sql);

// Menyimpan data ke dalam array
$branches = [];
$sales = [];
while ($row = $result->fetch_assoc()) {
    $branches[] = $row['nama_cabang'];
    $sales[] = $row['total_penjualan'];
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grafik Total Penjualan per Cabang</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<canvas id="salesChart"></canvas>

<script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    const labels = <?php echo json_encode($branches); ?>;
    const data = <?php echo json_encode($sales); ?>;

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Total Penjualan (Rp)',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html>
