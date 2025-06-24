USE dw_toko_barokah;

-- Frekuensi Pembelian Pelanggan
SELECT 
  c.username, 
  COUNT(DISTINCT f.id_transaksi) AS purchase_count
FROM fact_penjualan f
JOIN dim_pembeli c ON f.sk_pembeli = c.sk_pembeli
GROUP BY c.username
ORDER BY purchase_count DESC;

-- Nilai Seumur Hidup Pelanggan
SELECT 
  c.username, 
  SUM(f.total_harga) AS lifetime_value
FROM fact_penjualan f
JOIN dim_pembeli c ON f.sk_pembeli = c.sk_pembeli
GROUP BY c.username
ORDER BY lifetime_value DESC; 