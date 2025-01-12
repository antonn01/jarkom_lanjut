# jan/08/2025 00:55:07 by RouterOS 6.49.10
# software id = 5E9J-IUIA
#
# model = RB941-2nD
# serial number = HFA09BYXTTN
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.3.2-192.168.3.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether1 name=dhcp1
/ip address
add address=20.20.20.1/30 interface=ether3 network=20.20.20.0
add address=192.168.3.1/24 interface=ether1 network=192.168.3.0
/ip dhcp-server network
add address=192.168.3.0/24 gateway=192.168.3.1
/routing rip interface
add interface=ether1
add interface=ether3
/routing rip network
add network=20.20.20.0/30
add network=192.168.3.0/24
