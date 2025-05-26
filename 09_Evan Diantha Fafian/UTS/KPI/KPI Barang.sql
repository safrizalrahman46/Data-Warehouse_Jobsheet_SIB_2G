USE dw_toko_barokah;

-- Produk Terlaris
SELECT 
  p.nama_produk, 
  SUM(f.qty) AS total_quantity, 
  SUM(f.total_harga) AS total_revenue
FROM fact_penjualan f
JOIN dim_produk p ON f.sk_produk = p.sk_produk
GROUP BY p.nama_produk
ORDER BY total_revenue DESC; 