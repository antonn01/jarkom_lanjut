# Konfigurasi Router R3 CR (Router Core - Pusat)

# Interface Wireless
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik

# Konfigurasi Wireless Security
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik

# Pool IP DHCP untuk jaringan 192.168.3.0/24
/ip pool
add name=dhcp_pool2 ranges=192.168.3.2-192.168.3.254

# DHCP Server untuk jaringan 192.168.3.0/24
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=no interface=ether2 name=dhcp1

# Alokasi IP untuk antarmuka
/ip address
add address=192.168.3.1/24 interface=ether2 network=192.168.3.0
add address=20.6.6.2/29 interface=ether1 network=20.6.6.0
add address=33.33.33.2/29 interface=ether3 network=33.33.33.0

# DHCP Server Network
/ip dhcp-server network
add address=192.168.3.0/24 gateway=192.168.3.1

# Konfigurasi RIP
/routing rip interface
add interface=ether2
add interface=ether3

/routing rip neighbor
add address=33.33.33.1   # R2 KJ

/routing rip network
add network=192.168.3.0/24
add network=33.33.33.0/29

# Set Identity Router
/system identity
set name=R3_CR_UTS_JarLut
