# Konfigurasi Router R2 KJ (Koneksi Jaringan)

/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik

# Konfigurasi Wireless Security
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik

# Pool IP DHCP untuk jaringan 192.168.2.0/24
/ip pool
add name=dhcp_pool1 ranges=192.168.2.2-192.168.2.254

# DHCP Server untuk jaringan 192.168.2.0/24
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=ether2 name=dhcp1

# Alokasi IP untuk antarmuka
/ip address
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
add address=20.8.8.2/29 interface=ether1 network=20.8.8.0
add address=33.33.33.1/29 interface=ether3 network=33.33.33.0
add address=22.22.22.2/29 interface=ether4 network=22.22.22.0

# DHCP Server Network
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1

# Konfigurasi RIP
/routing rip interface
add interface=ether2
add interface=ether3
add interface=ether4

/routing rip neighbor
add address=33.33.33.2   # R3 CR
add address=22.22.22.1   # R1 KHI

/routing rip network
add network=192.168.2.0/24
add network=33.33.33.0/29
add network=22.22.22.0/29

# Set Identity Router
/system identity
set name=R2_KJ_UTS_JarLut
