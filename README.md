# Data-Warehouse_Jobsheet_SIB_2G

![Image](https://github.com/user-attachments/assets/8e6b0f73-18c2-456e-b0be-644e22e60414)

# C:ONE Project

## Cara Pull dan Push ke GitHub

Ikuti langkah-langkah berikut untuk menarik perubahan terbaru dari repository GitHub dan mendorong perubahan baru yang telah Anda buat.

### 1. Clone Repository (Jika Belum Ada)
```bash
git clone https://github.com/USERNAME/NAMA-REPO.git
cd NAMA-REPO
```

### 2. Pastikan Berada di Branch yang Benar
```bash
git checkout main  # Ganti 'main' dengan nama branch yang sesuai
```

### 3. Tarik Perubahan Terbaru dari Repository (Pull)
```bash
git pull origin main  # Ganti 'main' jika branch berbeda
```

### 4. Tambahkan Perubahan Baru ke Git
```bash
git add .  # Menambahkan semua perubahan
```

### 5. Commit Perubahan dengan Pesan yang Jelas
```bash
git commit -m "Pesan commit yang menjelaskan perubahan"
```

### 6. Dorong Perubahan ke Repository GitHub (Push)
```bash
git push origin main  # Ganti 'main' jika branch berbeda
```

### 7. (Opsional) Cek Status Branch
```bash
git status
```

### 8. (Opsional) Lihat Log Commit
```bash
git log --oneline --graph --decorate --all
```

---
Sekarang perubahan telah berhasil disinkronkan dengan repository GitHub! 🚀
