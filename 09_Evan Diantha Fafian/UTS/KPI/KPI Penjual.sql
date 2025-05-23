USE dw_toko_barokah;

-- Penjual Terbaik 
SELECT 
  s.nama_penjual, 
  SUM(f.total_harga) AS total_sales
FROM fact_penjualan f
JOIN dim_penjual s ON f.sk_penjual = s.sk_penjual
GROUP BY s.nama_penjual
ORDER BY total_sales DESC;