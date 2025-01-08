# jan/02/1970 00:07:28 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface wireless
set [ find default-name=wlan1 ] ssid=KJ
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KJ
/ip pool
add name=dhcp_pool0 ranges=192.168.2.2-192.168.2.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
add address=10.10.10.1/24 interface=ether3 network=10.10.10.0
add address=12.12.12.2/24 interface=ether4 network=12.12.12.0
/ip dhcp-server network
add address=192.168.2.0/24 gateway=192.168.2.1
/routing rip interface
add send=v1-2
/routing rip neighbor
add address=12.12.12.1
add address=10.10.10.2
/routing rip network
add network=10.10.10.0/24
add network=12.12.12.0/24
add network=192.168.2.0/24
/system identity
set name="Router 2 KJ"
