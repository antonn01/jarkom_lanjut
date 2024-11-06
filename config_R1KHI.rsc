# Konfigurasi Router R1 KHI (Koneksi Hub Internasional)

/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik

# Konfigurasi Wireless Security
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik

# Pool IP DHCP untuk jaringan 192.168.1.0/24
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254

# DHCP Server untuk jaringan 192.168.1.0/24
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1

# Alokasi IP untuk antarmuka
/ip address
add address=192.168.1.1/24 interface=ether2 network=192.168.1.0
add address=20.8.8.1/29 interface=ether1 network=20.8.8.0
add address=22.22.22.1/29 interface=ether3 network=22.22.22.0

# DHCP Server Network
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1

# Konfigurasi RIP
/routing rip interface
add interface=ether2
add interface=ether3

/routing rip neighbor
add address=22.22.22.2   # R2 KJ

/routing rip network
add network=192.168.1.0/24
add network=22.22.22.0/29

# Set Identity Router
/system identity
set name=R1_KHI_UTS_JarLut
