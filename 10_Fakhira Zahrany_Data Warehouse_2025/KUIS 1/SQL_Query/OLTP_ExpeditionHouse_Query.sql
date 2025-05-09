-- Create Database
CREATE DATABASE ExpedisiHouse;
USE ExpedisiHouse;

-- Tabel Dimensi Provinsi
CREATE TABLE dim_provinsi (
    Id_Profinsi INT PRIMARY KEY,
    Nama_profinsi VARCHAR(255)
);

-- Tabel Dimensi Kota
CREATE TABLE dim_kota (
    id_kota INT PRIMARY KEY,
    nama_kota VARCHAR(255),
    id_provinsi INT,
    FOREIGN KEY (id_provinsi) REFERENCES dim_provinsi(Id_Profinsi)
);

-- Tabel Dimensi Kecamatan
CREATE TABLE dim_kecamatan (
    id_kecamatan INT PRIMARY KEY,
    nama_kecamatan VARCHAR(255),
    id_kota INT,
    FOREIGN KEY (id_kota) REFERENCES dim_kota(id_kota)
);

-- Tabel Dimensi Kurir
CREATE TABLE Dim_kurir (
    id_kurir INT PRIMARY KEY,
    nama_kurir VARCHAR(255),
    tipe_kendaraan VARCHAR(100),
    no_hp VARCHAR(20)
);

-- Tabel Dimensi Status Pengiriman
CREATE TABLE dim_status_pengiriman (
    id_status_pengiriman INT PRIMARY KEY,
    nama_status_pengiriman VARCHAR(255)
);

-- Tabel Dimensi Pembayaran
CREATE TABLE dim_pembayaran (
    id_pembayaran INT PRIMARY KEY,
    total_pembayaran DECIMAL(10, 2),
    id_status_pembayaran INT,
    id_tipe_pembayaran INT,
    FOREIGN KEY (id_status_pembayaran) REFERENCES dim_status_pembayaran(id_status_pembayaran),
    FOREIGN KEY (id_tipe_pembayaran) REFERENCES dim_tipe_pembayaran(id_tipe_pembayaran)
);

-- Tabel Dimensi Status Pembayaran
CREATE TABLE dim_status_pembayaran (
    id_status_pembayaran INT PRIMARY KEY,
    nama_status_pembayaran VARCHAR(255)
);

-- Tabel Dimensi Tipe Pembayaran
CREATE TABLE dim_tipe_pembayaran (
    id_tipe_pembayaran INT PRIMARY KEY,
    nama_tipe_pembayaran VARCHAR(255)
);

-- Tabel Dimensi Waktu (dim_time)
CREATE TABLE dim_time (
    id_tanggal INT PRIMARY KEY,
    tanggal DATE,
    bulan INT,
    nama_bulan VARCHAR(15),
    tahun INT,
    hari INT
);

-- Tabel fakta pengiriman
CREATE TABLE fakta_pengiriman (
    Id_pengiriman INT PRIMARY KEY,
    Nama_pelanggan VARCHAR(255),
    Alamat_asal TEXT,
    Alamat_tujuan TEXT,
    Id_kecamatan_asal INT,
    Id_kecamatan_tujuan INT,
    Id_kurir INT,
    Id_status_pengiriman INT,
    Id_pembayaran INT,
    Id_tanggal_pengiriman INT,
    Id_tanggal_sampai_Perkiraan INT,
    Id_tanggal_sampai_Aktual INT,
    berat DECIMAL(10, 2),
    FOREIGN KEY (Id_kecamatan_asal) REFERENCES dim_kecamatan(id_kecamatan),
    FOREIGN KEY (Id_kecamatan_tujuan) REFERENCES dim_kecamatan(id_kecamatan),
    FOREIGN KEY (Id_kurir) REFERENCES Dim_kurir(id_kurir),
    FOREIGN KEY (Id_status_pengiriman) REFERENCES dim_status_pengiriman(id_status_pengiriman),
    FOREIGN KEY (Id_pembayaran) REFERENCES dim_pembayaran(id_pembayaran),
    FOREIGN KEY (Id_tanggal_pengiriman) REFERENCES dim_time(id_tanggal),
    FOREIGN KEY (Id_tanggal_sampai_Perkiraan) REFERENCES dim_time(id_tanggal),
    FOREIGN KEY (Id_tanggal_sampai_Aktual) REFERENCES dim_time(id_tanggal)
);