# jan/02/1970 00:12:35 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.1.1/24 interface=ether2 network=192.168.1.0
add address=33.33.33.1/24 interface=ether4 network=33.33.33.0
add address=22.22.22.1/24 interface=ether3 network=22.22.22.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/routing rip interface
add interface=ether3
add interface=ether4
/routing rip neighbor
add address=22.22.22.2
add address=33.33.33.2
/routing rip network
add network=33.33.33.0/24
add network=22.22.22.0/24
/system identity
set name=UTS_JarLut
