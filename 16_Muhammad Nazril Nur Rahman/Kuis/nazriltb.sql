-- 🔹 Membuat Database
CREATE DATABASE nazrilquizdw;
USE nazrilquizdw;

-- 🔹 Tabel Wilayah (Provinsi, Kota, Kecamatan)
CREATE TABLE Provinsi (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(100) NOT NULL
);

CREATE TABLE Kota (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(100) NOT NULL,
    ProvinsiID INT,
    FOREIGN KEY (ProvinsiID) REFERENCES Provinsi(ID) ON DELETE CASCADE
);

CREATE TABLE Kecamatan (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(100) NOT NULL,
    KotaID INT,
    FOREIGN KEY (KotaID) REFERENCES Kota(ID) ON DELETE CASCADE
);

-- 🔹 Tabel Status Pengiriman & Pembayaran
CREATE TABLE StatusPengiriman (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

CREATE TABLE StatusPembayaran (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

-- 🔹 Tabel Tipe Pembayaran
CREATE TABLE TipePembayaran (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

-- 🔹 Tabel Kurir
CREATE TABLE Kurir (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(100) NOT NULL,
    TipeKendaraan VARCHAR(50),
    NoHP VARCHAR(15)
);

-- 🔹 Tabel Pembayaran
CREATE TABLE Pembayaran (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Total DECIMAL(15,2) NOT NULL,
    StatusPembayaranID INT,
    TipePembayaranID INT,
    FOREIGN KEY (StatusPembayaranID) REFERENCES StatusPembayaran(ID) ON DELETE CASCADE,
    FOREIGN KEY (TipePembayaranID) REFERENCES TipePembayaran(ID) ON DELETE CASCADE
);

-- 🔹 Tabel Pengiriman
CREATE TABLE Pengiriman (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NamaPelanggan VARCHAR(100) NOT NULL,
    AlamatAsal TEXT NOT NULL,
    AlamatTujuan TEXT NOT NULL,
    KecamatanAsalID INT,
    KecamatanTujuanID INT,
    Berat DECIMAL(10,2),
    TanggalPengiriman DATE NOT NULL,
    TanggalSampaiPerkiraan DATE,
    TanggalSampaiAktual DATE,
    KurirID INT,
    StatusPengirimanID INT,
    PembayaranID INT,
    FOREIGN KEY (KecamatanAsalID) REFERENCES Kecamatan(ID) ON DELETE CASCADE,
    FOREIGN KEY (KecamatanTujuanID) REFERENCES Kecamatan(ID) ON DELETE CASCADE,
    FOREIGN KEY (KurirID) REFERENCES Kurir(ID) ON DELETE CASCADE,
    FOREIGN KEY (StatusPengirimanID) REFERENCES StatusPengiriman(ID) ON DELETE CASCADE,
    FOREIGN KEY (PembayaranID) REFERENCES Pembayaran(ID) ON DELETE CASCADE
);

-- 🔹 Tabel Dimensi Data Warehouse
CREATE TABLE Dim_Waktu (
    ID_Waktu INT PRIMARY KEY AUTO_INCREMENT,
    Tanggal DATE NOT NULL,
    Hari VARCHAR(20),
    Bulan VARCHAR(20),
    Tahun INT
);

CREATE TABLE Dim_Kurir (
    ID_Kurir INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(100) NOT NULL,
    TipeKendaraan VARCHAR(50),
    NoHP VARCHAR(15)
);

CREATE TABLE Dim_StatusPengiriman (
    ID_StatusPengiriman INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

CREATE TABLE Dim_StatusPembayaran (
    ID_StatusPembayaran INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

CREATE TABLE Dim_TipePembayaran (
    ID_TipePembayaran INT PRIMARY KEY AUTO_INCREMENT,
    Nama VARCHAR(50) NOT NULL
);

-- 🔹 Dimensi Lokasi (DWH) yang Menggabungkan Kecamatan, Kota, Provinsi
CREATE TABLE Dim_Lokasi (
    ID_Lokasi INT PRIMARY KEY AUTO_INCREMENT,
    ID_Kecamatan INT,
    NamaKecamatan VARCHAR(100) NOT NULL,
    NamaKota VARCHAR(100) NOT NULL,
    NamaProvinsi VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Kecamatan) REFERENCES Kecamatan(ID) ON DELETE CASCADE
);

-- 🔹 Tabel Fakta Data Warehouse
CREATE TABLE Fakta_Pengiriman (
    ID_Pengiriman INT PRIMARY KEY AUTO_INCREMENT,
    ID_Kurir INT,
    ID_Lokasi_Asal INT,
    ID_Lokasi_Tujuan INT,
    ID_StatusPengiriman INT,
    ID_WaktuPengiriman INT,
    ID_WaktuSampai INT,
    Berat DECIMAL(10,2),
    Lama_Pengiriman INT,
    FOREIGN KEY (ID_Kurir) REFERENCES Dim_Kurir(ID_Kurir),
    FOREIGN KEY (ID_Lokasi_Asal) REFERENCES Dim_Lokasi(ID_Lokasi),
    FOREIGN KEY (ID_Lokasi_Tujuan) REFERENCES Dim_Lokasi(ID_Lokasi),
    FOREIGN KEY (ID_StatusPengiriman) REFERENCES Dim_StatusPengiriman(ID_StatusPengiriman),
    FOREIGN KEY (ID_WaktuPengiriman) REFERENCES Dim_Waktu(ID_Waktu),
    FOREIGN KEY (ID_WaktuSampai) REFERENCES Dim_Waktu(ID_Waktu)
);

CREATE TABLE Fakta_Pembayaran (
    ID_Pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    ID_TipePembayaran INT,
    ID_StatusPembayaran INT,
    ID_Waktu INT,
    Total DECIMAL(15,2),
    FOREIGN KEY (ID_TipePembayaran) REFERENCES Dim_TipePembayaran(ID_TipePembayaran),
    FOREIGN KEY (ID_StatusPembayaran) REFERENCES Dim_StatusPembayaran(ID_StatusPembayaran),
    FOREIGN KEY (ID_Waktu) REFERENCES Dim_Waktu(ID_Waktu)
);



insert DATA

-- 🔹 1. Insert Data ke Wilayah
INSERT INTO Provinsi (Nama) VALUES ('Jawa Barat'), ('Jawa Tengah');
INSERT INTO Kota (Nama, ProvinsiID) VALUES ('Bandung', 1), ('Semarang', 2);
INSERT INTO Kecamatan (Nama, KotaID) VALUES ('Coblong', 1), ('Candi', 2);

-- 🔹 2. Insert Data ke Status Pengiriman & Pembayaran
INSERT INTO StatusPengiriman (Nama) VALUES ('Sedang Dikirim'), ('Terkirim');
INSERT INTO StatusPembayaran (Nama) VALUES ('Lunas'), ('Belum Lunas');
INSERT INTO TipePembayaran (Nama) VALUES ('Transfer Bank'), ('COD');

-- 🔹 3. Insert Data ke Kurir
INSERT INTO Kurir (Nama, TipeKendaraan, NoHP) VALUES 
('Budi Santoso', 'Motor', '081234567890'), 
('Siti Aisyah', 'Mobil', '082345678901');

-- 🔹 4. Insert Data ke Pembayaran
INSERT INTO Pembayaran (Total, StatusPembayaranID, TipePembayaranID) VALUES 
(50000, 1, 1), 
(75000, 2, 2);

-- 🔹 5. Insert Data ke Pengiriman
INSERT INTO Pengiriman (NamaPelanggan, AlamatAsal, AlamatTujuan, KecamatanAsalID, KecamatanTujuanID, Berat, 
    TanggalPengiriman, TanggalSampaiPerkiraan, TanggalSampaiAktual, KurirID, StatusPengirimanID, PembayaranID)
VALUES 
('Ahmad Fauzi', 'Jalan Merdeka No. 1', 'Jalan Diponegoro No. 10', 1, 2, 2.5, '2025-03-01', '2025-03-03', '2025-03-03', 1, 2, 1),
('Dewi Lestari', 'Jalan Sudirman No. 20', 'Jalan Gajah Mada No. 15', 2, 1, 3.0, '2025-03-02', '2025-03-05', NULL, 1, 2);

-- 🔹 6. Insert Data ke Dim_Waktu
INSERT INTO Dim_Waktu (Tanggal, Hari, Bulan, Tahun) VALUES 
('2025-03-01', 'Senin', 'Maret', 2025), 
('2025-03-02', 'Selasa', 'Maret', 2025), 
('2025-03-03', 'Rabu', 'Maret', 2025);

-- 🔹 7. Insert Data ke Dim_Kurir
INSERT INTO Dim_Kurir (Nama, TipeKendaraan, NoHP) 
SELECT ID, Nama, TipeKendaraan, NoHP FROM Kurir;

-- 🔹 8. Insert Data ke Dim_StatusPengiriman
INSERT INTO Dim_StatusPengiriman (ID_StatusPengiriman, Nama) 
SELECT ID, Nama FROM StatusPengiriman;

-- 🔹 9. Insert Data ke Dim_StatusPembayaran
INSERT INTO Dim_StatusPembayaran (ID_StatusPembayaran, Nama) 
SELECT ID, Nama FROM StatusPembayaran;

-- 🔹 10. Insert Data ke Dim_TipePembayaran
INSERT INTO Dim_TipePembayaran (ID_TipePembayaran, Nama) 
SELECT ID, Nama FROM TipePembayaran;

-- 🔹 11. Insert Data ke Dim_Lokasi
INSERT INTO Dim_Lokasi (ID_Kecamatan, NamaKecamatan, NamaKota, NamaProvinsi)
SELECT k.ID, k.Nama, c.Nama, p.Nama 
FROM Kecamatan k
JOIN Kota c ON k.KotaID = c.ID
JOIN Provinsi p ON c.ProvinsiID = p.ID;

-- 🔹 12. Insert Data ke Fakta_Pengiriman
INSERT INTO Fakta_Pengiriman (ID_Kurir, ID_Lokasi_Asal, ID_Lokasi_Tujuan, ID_StatusPengiriman, ID_WaktuPengiriman, ID_WaktuSampai, Berat, Lama_Pengiriman)
SELECT 
    p.KurirID, 
    dl_asal.ID_Lokasi, 
    dl_tujuan.ID_Lokasi, 
    p.StatusPengirimanID,
    dw1.ID_Waktu, 
    dw2.ID_Waktu, 
    p.Berat, 
    DATEDIFF(p.TanggalSampaiAktual, p.TanggalPengiriman)
FROM Pengiriman p
JOIN Dim_Lokasi dl_asal ON p.KecamatanAsalID = dl_asal.ID_Kecamatan
JOIN Dim_Lokasi dl_tujuan ON p.KecamatanTujuanID = dl_tujuan.ID_Kecamatan
JOIN Dim_Waktu dw1 ON p.TanggalPengiriman = dw1.Tanggal
LEFT JOIN Dim_Waktu dw2 ON p.TanggalSampaiAktual = dw2.Tanggal;

-- 🔹 13. Insert Data ke Fakta_Pembayaran
INSERT INTO Fakta_Pembayaran (ID_TipePembayaran, ID_StatusPembayaran, ID_Waktu, Total)
SELECT 
    p.TipePembayaranID, 
    p.StatusPembayaranID, 
    dw.ID_Waktu, 
    p.Total
FROM Pembayaran p
JOIN Pengiriman pg ON p.ID = pg.PembayaranID
JOIN Dim_Waktu dw ON pg.TanggalPengiriman = dw.Tanggal;

