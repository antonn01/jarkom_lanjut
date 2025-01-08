# jan/02/1970 00:54:19 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface wireless
set [ find default-name=wlan1 ] ssid=CITRA
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CITRA
/ip pool
add name=dhcp_pool0 ranges=10.10.10.2-10.10.10.254
add name=dhcp_pool1 ranges=14.14.14.2-14.14.14.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=ether3 name=dhcp2
/routing bgp instance
set default as=65001 redistribute-connected=yes
/ip address
add address=172.16.1.1/24 interface=ether1 network=172.16.1.0
add address=10.10.10.1/24 interface=ether2 network=10.10.10.0
add address=14.14.14.1/24 interface=ether3 network=14.14.14.0
/ip dhcp-server network
add address=10.10.10.0/24 gateway=10.10.10.1
add address=14.14.14.0/24 gateway=14.14.14.1
/routing bgp network
add network=10.10.10.0/24
add network=14.14.14.0/24
add network=172.16.1.0/24
/routing bgp peer
add name=peer1-ke-mkrotik2 remote-address=172.16.1.2 remote-as=65002
add name=peer2-ke-mikrotik3 remote-address=10.10.10.2 remote-as=65003
/system identity
set name="Router 1"
