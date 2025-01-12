# jan/08/2025 10:00:37 by RouterOS 6.49.10
# software id = N3QS-6CS2
#
# model = RB941-2nD
# serial number = HF8099MJW59
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether1 name=dhcp1
/ip address
add address=192.168.1.1/24 interface=ether1 network=192.168.1.0
add address=10.10.10.1/30 interface=ether2 network=10.10.10.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/routing rip interface
add interface=ether2
add interface=ether1
/routing rip network
add network=10.10.10.0/30
add network=192.168.1.0/24
