Detail Konfigurasi Router
R3 CR (Router Core - Pusat)
Fungsi: R3 CR berperan sebagai pusat koneksi yang menghubungkan seluruh jaringan dari ketiga kampus. Dengan demikian, R3 CR adalah pusat routing yang akan memastikan komunikasi antar subnet dapat berjalan dengan baik.
Antarmuka:
Eth 2 (192.168.2.1/24): Terhubung ke jaringan 192.168.2.0/24 di Kampus KJ. Komputer-komputer pada subnet ini menggunakan IP dalam rentang 192.168.2.x dan terhubung ke switch yang menghubungkan mereka ke router R3 CR.
Eth 3 (10.10.10.2/24): Terhubung langsung ke R2 KJ. Antarmuka ini berfungsi untuk koneksi point-to-point antara R3 CR dan R2 KJ, yang akan memungkinkan paket data antara jaringan pusat dan jaringan KJ.
Eth 4 (22.22.22.2/24): Terhubung ke R1 KHI. Antarmuka ini juga berfungsi sebagai koneksi point-to-point antara R3 CR dan R1 KHI, memastikan komunikasi antara jaringan pusat dan jaringan KHI.
R1 KHI (Router Koneksi Hub Internasional)
Fungsi: R1 KHI adalah router yang menghubungkan jaringan KHI dan berfungsi sebagai penghubung menuju pusat (R3 CR) dan R2 KJ.
Antarmuka:
Eth 3 (22.22.22.1/24): Terhubung ke R3 CR di Eth 4 dengan konfigurasi IPIP Tunnel untuk komunikasi point-to-point, memungkinkan paket data dari jaringan KHI untuk mencapai jaringan pusat.
Eth 4 (33.33.33.1/24): Terhubung ke R2 KJ di Eth 4, menghubungkan langsung antar router dengan koneksi point-to-point. Koneksi ini memungkinkan data dari jaringan KHI untuk dikirim ke R2 KJ dan sebaliknya.
Eth 2 (192.168.1.1/24): Terhubung ke jaringan 192.168.1.0/24 di Kampus KHI. Komputer-komputer di subnet ini menggunakan IP dalam rentang 192.168.1.x dan terhubung ke switch yang terhubung langsung ke router R1 KHI.
R2 KJ (Router Koneksi Jaringan)
Fungsi: R2 KJ menghubungkan jaringan KJ dan menyediakan koneksi ke pusat (R3 CR) serta koneksi langsung ke R1 KHI.
Antarmuka:
Eth 3 (10.10.10.1/24): Terhubung ke R3 CR di Eth 3 untuk komunikasi point-to-point dengan jaringan pusat. Antarmuka ini memungkinkan data dari jaringan KJ untuk sampai ke pusat jaringan.
Eth 4 (33.33.33.2/24): Terhubung ke R1 KHI di Eth 4. Antarmuka ini menghubungkan jaringan KJ dan KHI secara langsung, memungkinkan komunikasi antara dua jaringan ini tanpa perlu melewati R3 CR.
Eth 2 (192.168.2.1/24): Terhubung ke jaringan 192.168.2.0/24 di Kampus KJ. Komputer-komputer pada subnet ini menggunakan IP dalam rentang 192.168.2.x dan terhubung ke switch yang menghubungkan mereka ke router R2 KJ.


Alur Komunikasi Antar Subnet
Dengan konfigurasi di atas, alur komunikasi dapat dilakukan sebagai berikut:

Komunikasi antara subnet 192.168.1.0/24 (KHI) dan subnet 192.168.2.0/24 (KJ):
Paket data dari jaringan KHI akan melewati R1 KHI, kemudian melalui Eth 4 di R1 KHI menuju Eth 4 di R2 KJ melalui IP 33.33.33.x/24. Setelah itu, data akan dikirim ke jaringan 192.168.2.0/24 melalui Eth 2 di R2 KJ.
Komunikasi antara subnet 192.168.1.0/24 (KHI) dan jaringan pusat 192.168.3.0/24 (CR):
Paket data dari jaringan KHI akan melewati R1 KHI, kemudian melalui Eth 3 di R1 KHI menuju Eth 4 di R3 CR melalui IP 22.22.22.x/24. Setelah sampai di R3 CR, data akan diteruskan sesuai dengan tujuan.
Komunikasi antara subnet 192.168.2.0/24 (KJ) dan jaringan pusat 192.168.3.0/24 (CR):
Paket data dari jaringan KJ akan melewati R2 KJ, kemudian melalui Eth 3 di R2 KJ menuju Eth 3 di R3 CR melalui IP 10.10.10.x/24. Setelah sampai di R3 CR, data akan diteruskan ke jaringan tujuan.

Pada R1 KHI, Anda perlu menambahkan jaringan 192.168.1.0/24, 22.22.22.0/24 (koneksi ke R3 CR), dan 33.33.33.0/24 (koneksi ke R2 KJ)
Router> enable
Router# configure terminal
Router(config)# router rip
Router(config-router)# version 2
Router(config-router)# network 192.168.1.0
Router(config-router)# network 22.22.22.0
Router(config-router)# network 33.33.33.0
Router(config-router)# no auto-summary
Router(config-router)# exit
Router(config)# exit
Router# write memory

Pada R2 KJ, tambahkan jaringan 192.168.2.0/24, 10.10.10.0/24 (koneksi ke R3 CR), dan 33.33.33.0/24 (koneksi ke R1 KHI)
Router> enable
Router# configure terminal
Router(config)# router rip
Router(config-router)# version 2
Router(config-router)# network 192.168.2.0
Router(config-router)# network 10.10.10.0
Router(config-router)# network 33.33.33.0
Router(config-router)# no auto-summary
Router(config-router)# exit
Router(config)# exit
Router# write memory

Pada R3 CR, tambahkan jaringan 192.168.3.0/24, 10.10.10.0/24 (koneksi ke R2 KJ), dan 22.22.22.0/24 (koneksi ke R1 KHI).
Router> enable
Router# configure terminal
Router(config)# router rip
Router(config-router)# version 2
Router(config-router)# network 192.168.3.0
Router(config-router)# network 10.10.10.0
Router(config-router)# network 22.22.22.0
Router(config-router)# no auto-summary
Router(config-router)# exit
Router(config)# exit
Router# write memory
