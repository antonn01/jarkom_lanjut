# jan/02/1970 01:04:56 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface wireless
set [ find default-name=wlan1 ] ssid=CITRA
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CITRA
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool1 ranges=17.17.1.2-17.17.1.254
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=ether3 name=dhcp1
/routing bgp instance
set default as=65002 redistribute-connected=yes
/ip address
add address=172.16.1.2/24 interface=ether1 network=172.16.1.0
add address=192.168.1.1/24 interface=ether2 network=192.168.1.0
add address=17.17.1.1/24 interface=ether3 network=17.17.1.0
/ip dhcp-server network
add address=17.17.1.0/24 gateway=17.17.1.1
add address=192.168.10.0/24 gateway=192.168.10.1
/routing bgp network
add network=17.17.1.0/24
add network=172.16.1.0/24
add network=192.168.1.0/24
/routing bgp peer
add name=Peer1-Ke-MiktrotikA remote-address=172.16.1.1 remote-as=65001
add name=Peer2-Ke-MiktrotikC remote-address=192.168.1.2 remote-as=65003
