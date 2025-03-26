-- Membuat Tabel Dimensi Status Pengiriman
CREATE TABLE dim_status_pengiriman (
    id_status_pengiriman INT PRIMARY KEY,
    nama_status_pengiriman VARCHAR(255)
);

-- Membuat Tabel Dimensi Waktu
CREATE TABLE dim_time (
    id_tanggal INT PRIMARY KEY,
    tanggal DATE,
    bulan INT,
    nama_bulan VARCHAR(20),
    tahun INT,
    hari INT
);

-- Membuat Tabel Dimensi Kecamatan
CREATE TABLE dim_kecamatan (
    Id_Kecamatan INT PRIMARY KEY,
    Nama_Kecamatan VARCHAR(255),
    Id_Kota INT,
    Nama_Kota VARCHAR(255),
    Id_Provinsi INT,
    Nama_Provinsi VARCHAR(255)
);

-- Membuat Tabel Dimensi Pembayaran
CREATE TABLE dim_pembayaran (
    id_pembayaran INT PRIMARY KEY,
    total_pembayaran DECIMAL(10, 2),
    id_status_pembayaran INT,
    id_tipe_pembayaran INT,
    FOREIGN KEY (id_status_pembayaran) REFERENCES dim_status_pembayaran(id_status_pembayaran),
    FOREIGN KEY (id_tipe_pembayaran) REFERENCES dim_tipe_pembayaran(id_tipe_pembayaran)
);

-- Membuat Tabel Dimensi Kurir
CREATE TABLE dim_kurir (
    id_kurir INT PRIMARY KEY,
    nama_kurir VARCHAR(255),
    tipe_kendaraan VARCHAR(100),
    no_hp VARCHAR(20)
);

-- Membuat Tabel Dimensi Pelanggan
CREATE TABLE dim_pelanggan (
    Id_Pelanggan INT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(255),
    Alamat_Asal_Pelanggan TEXT,
    Alamat_Tujuan_Pelanggan TEXT
);

-- Membuat Tabel Dimensi Tipe Pembayaran
CREATE TABLE dim_tipe_pembayaran (
    id_tipe_pembayaran INT PRIMARY KEY,
    nama_tipe_pembayaran VARCHAR(255)
);

-- Membuat Tabel Dimensi Status Pembayaran
CREATE TABLE dim_status_pembayaran (
    id_status_pembayaran INT PRIMARY KEY,
    nama_status_pembayaran VARCHAR(255)
);

-- Membuat Tabel Fakta Pengiriman
CREATE TABLE fakta_pengiriman (
    id_pengiriman INT PRIMARY KEY,
    id_waktu INT,
    id_kecamatan_asal INT,
    id_kecamatan_tujuan INT,
    id_pelanggan INT,
    id_status_pengiriman INT,
    id_kurir INT,
    id_pembayaran INT,
    berat DECIMAL(10, 2),
    FOREIGN KEY (id_waktu) REFERENCES dim_time(id_tanggal),
    FOREIGN KEY (id_kecamatan_asal) REFERENCES dim_kecamatan(Id_Kecamatan),
    FOREIGN KEY (id_kecamatan_tujuan) REFERENCES dim_kecamatan(Id_Kecamatan),
    FOREIGN KEY (id_pelanggan) REFERENCES dim_pelanggan(Id_Pelanggan),
    FOREIGN KEY (id_status_pengiriman) REFERENCES dim_status_pengiriman(id_status_pengiriman),
    FOREIGN KEY (id_kurir) REFERENCES dim_kurir(id_kurir),
    FOREIGN KEY (id_pembayaran) REFERENCES dim_pembayaran(id_pembayaran)
);