USE dw_toko_barokah;

-- Total Pendapatan 
SELECT SUM(total_harga) AS total_revenue FROM fact_penjualan;

-- Pertumbuhan Penjualan Bulanan
SELECT 
  w.Tahun, 
  w.Bulan, 
  SUM(f.total_harga) AS monthly_sales,
  LAG(SUM(f.total_harga)) OVER (ORDER BY w.Tahun, w.Bulan) AS prev_month_sales,
  (SUM(f.total_harga) - LAG(SUM(f.total_harga)) OVER (ORDER BY w.Tahun, w.Bulan)) / 
  LAG(SUM(f.total_harga)) OVER (ORDER BY w.Tahun, w.Bulan) * 100 AS growth_percentage
FROM fact_penjualan f
JOIN dim_waktu w ON f.sk_waktu = w.sk_waktu
GROUP BY w.Tahun, w.Bulan;

-- Nilai Transaksi Rata-Rata
SELECT AVG(total_harga) AS avg_transaction_value FROM fact_penjualan;