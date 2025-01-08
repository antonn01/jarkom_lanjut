# jan/02/1970 00:06:17 by RouterOS 6.47.10
# software id = R3AC-AAWW
#
# model = RB941-2nD
# serial number = D1130FD936AB
/interface wireless
set [ find default-name=wlan1 ] ssid=CITRA
/interface bridge
add comment="OSPF loopback" name=loopback
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CITRA
/ip pool
add name=dhcp_pool0 ranges=192.168.1.34-192.168.1.46
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/routing ospf instance
set [ find default=yes ] router-id=172.16.16.3
/ip address
add address=192.168.0.6/30 comment=koneksi_ke_router2 interface=ether1 \
    network=192.168.0.4
add address=192.168.1.33/28 comment=LAN interface=ether2 network=192.168.1.32
add address=172.16.16.3 interface=loopback network=172.16.16.3
/ip dhcp-server network
add address=192.168.1.32/28 gateway=192.168.1.33
/routing ospf network
add area=backbone comment=Loopback network=172.16.16.3/32
add area=backbone comment=koneksi_ke_router2 network=192.168.0.4/30
add area=backbone comment=LAN network=192.168.1.32/28
