## Detail Konfigurasi Router

R3 CR (Router Core - Pusat) <br>
Fungsi: Sebagai pusat koneksi untuk menghubungkan jaringan dari ketiga kampus. <br>
Antarmuka: <br>
Eth 2 (192.168.3.1/24): Menghubungkan jaringan 192.168.3.0/24 di Kampus CR. <br>
Eth 3 (10.10.10.2/24): Koneksi point-to-point ke R2 KJ. <br>
Eth 4 (22.22.22.2/24): Koneksi point-to-point ke R1 KHI. <br>

R1 KHI (Router Koneksi Hub Internasional) <br>
Fungsi: Menghubungkan jaringan KHI dengan R3 CR dan R2 KJ. <br>
Antarmuka: <br>
Eth 3 (22.22.22.1/24): Terhubung ke R3 CR melalui IPIP Tunnel (point-to-point). <br>
Eth 4 (33.33.33.1/24): Koneksi point-to-point ke R2 KJ. <br>
Eth 2 (192.168.1.1/24): Menghubungkan jaringan 192.168.1.0/24 di Kampus KHI. <br>

R2 KJ (Router Koneksi Jaringan) <br>
Fungsi: Menghubungkan jaringan KJ dengan R3 CR dan R1 KHI. <br>
Antarmuka: <br>
Eth 3 (10.10.10.1/24): Koneksi point-to-point ke R3 CR. <br>
Eth 4 (33.33.33.2/24): Koneksi point-to-point ke R1 KHI. <br>
Eth 2 (192.168.2.1/24): Menghubungkan jaringan 192.168.2.0/24 di Kampus KJ. <br>

## Alur Komunikasi Antar Subnet <br>
Komunikasi antara subnet 192.168.1.0/24 (KHI) dan subnet 192.168.2.0/24 (KJ): <br>

Paket data dari KHI melewati R1 KHI, melalui Eth 4 (IP 33.33.33.0/24) menuju Eth 4 di R2 KJ, kemudian ke 192.168.2.0/24 melalui Eth 2 di R2 KJ. <br>
Komunikasi antara subnet 192.168.1.0/24 (KHI) dan jaringan pusat 192.168.3.0/24 (CR): <br>

Data dari KHI melewati R1 KHI, melalui Eth 3 (IP 22.22.22.0/24) menuju Eth 4 di R3 CR, dan diteruskan ke tujuan. <br>
Komunikasi antara subnet 192.168.2.0/24 (KJ) dan jaringan pusat 192.168.3.0/24 (CR): <br>

Data dari KJ melewati R2 KJ, melalui Eth 3 (IP 10.10.10.0/24) menuju Eth 3 di R3 CR, lalu diteruskan ke jaringan tujuan. <br>

## Langkah-langkah RIP <br>

Konfigurasi RIP (Routing Information Protocol) pada setiap router memiliki tujuan untuk memastikan komunikasi yang efisien antar-jaringan di seluruh kampus. 
Pada R1 KHI, jaringan yang perlu ditambahkan adalah 192.168.1.0/24 sebagai jaringan lokal Kampus KHI, 22.22.22.0/24 untuk koneksi tunnel ke R3 CR, dan 33.33.33.0/24 untuk koneksi tunnel ke R2 KJ. Pengaturan ini memungkinkan R1 KHI untuk menghubungkan jaringan KHI dengan pusat (R3 CR) dan jaringan KJ (R2 KJ). <br>

Selanjutnya, pada R2 KJ, konfigurasi mencakup jaringan 192.168.2.0/24 sebagai jaringan lokal Kampus KJ, 10.10.10.0/24 sebagai koneksi tunnel ke R3 CR, dan 33.33.33.0/24 sebagai koneksi tunnel ke R1 KHI. Dengan pengaturan ini, R2 KJ dapat menghubungkan jaringan KJ ke pusat (R3 CR) serta langsung ke KHI. <br>

Untuk R3 CR, yang berperan sebagai pusat, jaringan yang ditambahkan adalah 192.168.3.0/24 sebagai jaringan lokal Kampus CR, 10.10.10.0/24 untuk koneksi tunnel ke R2 KJ, dan 22.22.22.0/24 untuk koneksi tunnel ke R1 KHI. Sebagai pusat jaringan, R3 CR memungkinkan komunikasi antara semua jaringan kampus dengan rute yang efisien. <br>

Setiap router menggunakan RIP versi 2 untuk memastikan pertukaran rute yang tepat. Selain itu, opsi no auto-summary diaktifkan untuk mencegah summarization otomatis, sehingga setiap subnet dapat dikenali secara spesifik tanpa digabungkan. Konfigurasi ini memastikan bahwa setiap jaringan kampus (KHI, KJ, dan CR) dapat berkomunikasi dengan mudah melalui jalur yang telah ditentukan, dengan R3 CR sebagai pusat utama penghubung semua rute. <br>

## Langkah-langkah static <br>
Konfigurasi static routing ini dirancang untuk memastikan setiap router mengetahui jalur menuju jaringan lainnya secara manual. Pada R1 KHI, rute ditambahkan untuk menuju jaringan 192.168.2.0/24 di Kampus KJ dan jaringan 192.168.3.0/24 di Kampus CR. Rute menuju 192.168.2.0/24 diarahkan melalui IP 33.33.33.2, yaitu koneksi point-to-point ke R2 KJ, sedangkan rute menuju 192.168.3.0/24 diarahkan melalui IP 22.22.22.2, yaitu koneksi point-to-point ke R3 CR. <br>

Selanjutnya, pada R2 KJ, rute menuju jaringan 192.168.1.0/24 di Kampus KHI dan 192.168.3.0/24 di Kampus CR juga ditambahkan. Jaringan 192.168.1.0/24 diarahkan melalui IP 33.33.33.1 sebagai next hop ke R1 KHI, sedangkan jaringan 192.168.3.0/24 diarahkan melalui IP 10.10.10.2 sebagai next hop ke R3 CR. <br>

Di R3 CR yang berfungsi sebagai pusat, rute menuju jaringan 192.168.1.0/24 dan 192.168.2.0/24 ditambahkan agar dapat menghubungkan jaringan KHI dan KJ melalui R3 CR. Untuk rute ke 192.168.1.0/24 (Kampus KHI), next hop yang digunakan adalah 22.22.22.1 yang merupakan koneksi ke R1 KHI, sedangkan rute ke 192.168.2.0/24 (Kampus KJ) menggunakan next hop 10.10.10.1 yang terhubung langsung ke R2 KJ. <br>

Konfigurasi static routing ini diakhiri dengan perintah write memory untuk menyimpan konfigurasi sehingga tidak hilang setelah router restart. Dengan konfigurasi ini, setiap router dapat mengarahkan lalu lintas antar jaringan kampus dengan jalur yang tepat tanpa perlu protokol dynamic routing.






