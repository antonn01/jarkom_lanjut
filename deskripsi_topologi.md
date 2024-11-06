Deskripsi Topologi:

R3 CR (Router 3 - Core Router) berada di tengah dan berfungsi sebagai pusat koneksi antara tiga subnet. R3 CR memiliki empat antarmuka:

Eth 2 (192.168.2.1/24) yang terhubung ke komputer di jaringan 192.168.2.0.
Eth 3 (10.10.10.2) yang terhubung ke router R2 KJ.
Eth 4 (22.22.22.2) yang terhubung ke router R1 KHI.

R1 KHI (Router 1 - Koneksi Hub Internasional) memiliki tiga antarmuka:

Eth 3 (22.22.22.1) yang terhubung ke R3 CR.
Eth 4 (33.33.33.1) yang terhubung ke R2 KJ.
Eth 2 (192.168.1.1/24) yang terhubung ke komputer di jaringan 192.168.1.0.

R2 KJ (Router 2 - Koneksi Jaringan) memiliki tiga antarmuka:

Eth 3 (10.10.10.1) yang terhubung ke R3 CR.
Eth 4 (33.33.33.2) yang terhubung ke R1 KHI.
Eth 2 (192.168.2.1/24) yang terhubung ke komputer di jaringan 192.168.2.0.

Alur Komunikasi: 

Komputer di 192.168.2.0/24 dapat berkomunikasi dengan komputer di 192.168.1.0/24 melalui jalur R3 CR, R2 KJ, dan R1 KHI.
Konfigurasi RIP memungkinkan setiap router untuk bertukar informasi rute, sehingga setiap perangkat di jaringan ini dapat saling berkomunikasi antar subnet melalui rute yang paling efisien.