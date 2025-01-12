# jan/08/2025 10:01:52 by RouterOS 6.49.11
# software id = SUX5-3H8X
#
# model = RB941-2nD
# serial number = HG109WYFYW6
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.2.2-192.168.2.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether1 name=dhcp1
/ip address
add address=192.168.2.1/24 interface=ether1 network=192.168.2.0
add address=10.10.10.2/30 interface=ether2 network=10.10.10.0
add address=20.20.20.2/30 interface=ether3 network=20.20.20.0
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1
/routing rip interface
add interface=ether1
add interface=ether2
add interface=ether3
/routing rip network
add network=10.10.10.0/30
add network=192.168.2.0/24
add network=20.20.20.0/30
