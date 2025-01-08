# jan/02/1970 00:53:12 by RouterOS 6.47.10
# software id = R3AC-AAWW
#
# model = RB941-2nD
# serial number = D1130FD936AB
/interface wireless
set [ find default-name=wlan1 ] ssid=KJ
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=KJ
/ip pool
add name=dhcp_pool0 ranges=192.168.1.1,192.168.1.3-192.168.1.254
add name=dhcp_pool1 ranges=176.10.10.2-176.10.10.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=ether3 name=dhcp2
/routing bgp instance
set default as=65003 redistribute-connected=yes
/ip address
add address=10.10.10.2/24 interface=ether1 network=10.10.10.0
add address=192.168.1.2/24 interface=ether2 network=192.168.1.0
add address=176.10.10.1/24 interface=ether3 network=176.10.10.0
/ip dhcp-server network
add address=176.10.10.0/24 gateway=176.10.10.1
add address=192.168.1.0/24 gateway=192.168.1.2
/routing bgp network
add network=10.10.10.0/24
add network=176.10.10.0/24
add network=192.168.1.0/24
/routing bgp peer
add name="peer1-Ke-Router 1" remote-address=10.10.10.1 remote-as=65001
add name="peer2-Ke-Router 2" remote-address=192.168.1.1 remote-as=65002
/system identity
set name="Router 3"
