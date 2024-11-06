### Detail Konfigurasi Router

R3 CR (Router Core - Pusat)
Fungsi: Sebagai pusat koneksi untuk menghubungkan jaringan dari ketiga kampus.
Antarmuka:
Eth 2 (192.168.3.1/24): Menghubungkan jaringan 192.168.3.0/24 di Kampus CR.
Eth 3 (10.10.10.2/24): Koneksi point-to-point ke R2 KJ.
Eth 4 (22.22.22.2/24): Koneksi point-to-point ke R1 KHI.

R1 KHI (Router Koneksi Hub Internasional)
Fungsi: Menghubungkan jaringan KHI dengan R3 CR dan R2 KJ.
Antarmuka:
Eth 3 (22.22.22.1/24): Terhubung ke R3 CR melalui IPIP Tunnel (point-to-point).
Eth 4 (33.33.33.1/24): Koneksi point-to-point ke R2 KJ.
Eth 2 (192.168.1.1/24): Menghubungkan jaringan 192.168.1.0/24 di Kampus KHI.

R2 KJ (Router Koneksi Jaringan)
Fungsi: Menghubungkan jaringan KJ dengan R3 CR dan R1 KHI.
Antarmuka:
Eth 3 (10.10.10.1/24): Koneksi point-to-point ke R3 CR.
Eth 4 (33.33.33.2/24): Koneksi point-to-point ke R1 KHI.
Eth 2 (192.168.2.1/24): Menghubungkan jaringan 192.168.2.0/24 di Kampus KJ.

### Alur Komunikasi Antar Subnet
Komunikasi antara subnet 192.168.1.0/24 (KHI) dan subnet 192.168.2.0/24 (KJ):

Paket data dari KHI melewati R1 KHI, melalui Eth 4 (IP 33.33.33.0/24) menuju Eth 4 di R2 KJ, kemudian ke 192.168.2.0/24 melalui Eth 2 di R2 KJ.
Komunikasi antara subnet 192.168.1.0/24 (KHI) dan jaringan pusat 192.168.3.0/24 (CR):

Data dari KHI melewati R1 KHI, melalui Eth 3 (IP 22.22.22.0/24) menuju Eth 4 di R3 CR, dan diteruskan ke tujuan.
Komunikasi antara subnet 192.168.2.0/24 (KJ) dan jaringan pusat 192.168.3.0/24 (CR):

Data dari KJ melewati R2 KJ, melalui Eth 3 (IP 10.10.10.0/24) menuju Eth 3 di R3 CR, lalu diteruskan ke jaringan tujuan.


### Langkah-langkah

Konfigurasi RIP (Routing Information Protocol) pada setiap router memiliki tujuan untuk memastikan komunikasi yang efisien antar-jaringan di seluruh kampus. Pada R1 KHI, jaringan yang perlu ditambahkan adalah 192.168.1.0/24 sebagai jaringan lokal Kampus KHI, 22.22.22.0/24 untuk koneksi tunnel ke R3 CR, dan 33.33.33.0/24 untuk koneksi tunnel ke R2 KJ. Pengaturan ini memungkinkan R1 KHI untuk menghubungkan jaringan KHI dengan pusat (R3 CR) dan jaringan KJ (R2 KJ).

Selanjutnya, pada R2 KJ, konfigurasi mencakup jaringan 192.168.2.0/24 sebagai jaringan lokal Kampus KJ, 10.10.10.0/24 sebagai koneksi tunnel ke R3 CR, dan 33.33.33.0/24 sebagai koneksi tunnel ke R1 KHI. Dengan pengaturan ini, R2 KJ dapat menghubungkan jaringan KJ ke pusat (R3 CR) serta langsung ke KHI.

Untuk R3 CR, yang berperan sebagai pusat, jaringan yang ditambahkan adalah 192.168.3.0/24 sebagai jaringan lokal Kampus CR, 10.10.10.0/24 untuk koneksi tunnel ke R2 KJ, dan 22.22.22.0/24 untuk koneksi tunnel ke R1 KHI. Sebagai pusat jaringan, R3 CR memungkinkan komunikasi antara semua jaringan kampus dengan rute yang efisien.

Setiap router menggunakan RIP versi 2 untuk memastikan pertukaran rute yang tepat. Selain itu, opsi no auto-summary diaktifkan untuk mencegah summarization otomatis, sehingga setiap subnet dapat dikenali secara spesifik tanpa digabungkan. Konfigurasi ini memastikan bahwa setiap jaringan kampus (KHI, KJ, dan CR) dapat berkomunikasi dengan mudah melalui jalur yang telah ditentukan, dengan R3 CR sebagai pusat utama penghubung semua rute.
