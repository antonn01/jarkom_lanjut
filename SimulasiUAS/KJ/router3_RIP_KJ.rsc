# jan/02/1970 00:46:45 by RouterOS 6.47.10
# software id = R3AC-AAWW
#
# model = RB941-2nD
# serial number = D1130FD936AB
/interface wireless
set [ find default-name=wlan1 ] ssid=KJ
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KJ
/ip pool
add name=dhcp_pool0 ranges=192.168.3.2-192.168.3.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=11.11.11.2/24 interface=ether4 network=11.11.11.0
add address=10.10.10.2/24 interface=ether3 network=10.10.10.0
add address=192.168.3.1/24 interface=ether2 network=192.168.3.0
/ip dhcp-server network
add address=192.168.3.0/24 dns-server=0.0.0.0 gateway=192.168.3.1
/routing rip interface
add
/routing rip neighbor
add address=10.10.10.1
add address=11.11.11.1
/routing rip network
add network=10.10.10.0/24
add network=11.11.11.0/24
add network=192.168.3.0/24
/system identity
set name="R 3"
