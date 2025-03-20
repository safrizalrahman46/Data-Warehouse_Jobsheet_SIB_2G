<?php
$host = "localhost"; 
$user = "root"; 
$password = ""; 
$dbname = "perusahaan"; // Ganti dengan nama database kamu

$conn = new mysqli($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$sql = "SELECT 
            o.city AS nama_cabang,  
            SUM(CASE WHEN YEAR(p.paymentDate) = 2003 THEN p.amount ELSE 0 END) AS '2003',
            SUM(CASE WHEN YEAR(p.paymentDate) = 2004 THEN p.amount ELSE 0 END) AS '2004',
            SUM(CASE WHEN YEAR(p.paymentDate) = 2005 THEN p.amount ELSE 0 END) AS '2005'
        FROM offices o
        JOIN employees e ON o.officeCode = e.officeCode
        JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
        JOIN payments p ON c.customerNumber = p.customerNumber
        GROUP BY o.city
        ORDER BY o.city";

$result = $conn->query($sql);

$labels = [];
$data2003 = [];
$data2004 = [];
$data2005 = [];

while ($row = $result->fetch_assoc()) {
    $labels[] = $row['nama_cabang'];
    $data2003[] = $row['2003'];
    $data2004[] = $row['2004'];
    $data2005[] = $row['2005'];
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grafik Penjualan Per Cabang</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<canvas id="salesChart"></canvas>

<script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    const labels = <?php echo json_encode($labels); ?>;
    const data2003 = <?php echo json_encode($data2003); ?>;
    const data2004 = <?php echo json_encode($data2004); ?>;
    const data2005 = <?php echo json_encode($data2005); ?>;

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    label: '2003',
                    data: data2003,
                    backgroundColor: 'rgba(255, 99, 132, 0.5)'
                },
                {
                    label: '2004',
                    data: data2004,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)'
                },
                {
                    label: '2005',
                    data: data2005,
                    backgroundColor: 'rgba(75, 192, 192, 0.5)'
                }
            ]
        },
        options: {
            responsive: true,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>

</body>
</html>
