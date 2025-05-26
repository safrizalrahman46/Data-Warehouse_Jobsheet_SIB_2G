USE dw_toko_barokah;

-- Pola Penjualan Musiman 
SELECT 
  w.Kuartal, 
  w.Tahun,
  SUM(f.total_harga) AS quarterly_sales
FROM fact_penjualan f
JOIN dim_waktu w ON f.sk_waktu = w.sk_waktu
GROUP BY w.Kuartal, w.Tahun
ORDER BY w.Tahun, w.Kuartal;