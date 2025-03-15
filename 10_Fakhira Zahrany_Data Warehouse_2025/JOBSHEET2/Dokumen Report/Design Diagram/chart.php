<?php
$host = "localhost"; 
$user = "root"; 
$password = ""; 
$dbname = "perusahaan"; // Ganti dengan nama database kamu
error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = new mysqli($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$sql = "SELECT 
            CONCAT(e.firstName, ' ', e.lastName) AS sales_rep_name,
            YEAR(p.paymentDate) AS tahun,
            SUM(p.amount) AS total_omset
        FROM employees e
        JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
        JOIN payments p ON c.customerNumber = p.customerNumber
        WHERE CONCAT(e.firstName, ' ', e.lastName) IN ('Foon Yue Tseng', 'Pamela Castillo')
        GROUP BY sales_rep_name, tahun
        ORDER BY sales_rep_name, tahun";

$result = $conn->query($sql);
$data = [];
while ($row = $result->fetch_assoc()) {
    $data[$row['sales_rep_name']][$row['tahun']] = $row['total_omset'];
}

$conn->close();

// Ambil semua tahun unik
$years = array_unique(array_merge(array_keys($data['Foon Yue Tseng'] ?? []), array_keys($data['Pamela Castillo'] ?? [])));
sort($years);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grafik KPI Omzet</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<canvas id="kpiChart"></canvas>

<script>
    const ctx = document.getElementById('kpiChart').getContext('2d');
    const years = <?php echo json_encode($years); ?>;
    const omzetData = <?php echo json_encode($data); ?>;

    const omzetFoon = years.map(year => omzetData['Foon Yue Tseng']?.[year] || 0);
    const omzetPamela = years.map(year => omzetData['Pamela Castillo']?.[year] || 0);

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: years,
            datasets: [
                {
                    label: 'Foon Yue Tseng',
                    data: omzetFoon,
                    borderColor: 'blue',
                    backgroundColor: 'rgba(0, 0, 255, 0.1)',
                    fill: true
                },
                {
                    label: 'Pamela Castillo',
                    data: omzetPamela,
                    borderColor: 'orange',
                    backgroundColor: 'rgba(255, 165, 0, 0.1)',
                    fill: true
                }
            ]
        },
        options: {
            responsive: true,
            scales: { y: { beginAtZero: true } }
        }
    });
</script>

</body>
</html>
