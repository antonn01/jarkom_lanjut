# jan/02/1970 00:14:48 by RouterOS 6.49.8
# software id = RWA7-BHWK
#
# model = RB941-2nD
# serial number = HF609BYEWH7
/interface bridge
add comment="OSPF loopback" name=loopback
/interface wireless
set [ find default-name=wlan1 ] ssid=CITRA
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=CITRA
/ip pool
add name=dhcp_pool0 ranges=192.168.1.18-192.168.1.30
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether3 name=dhcp1
/routing ospf instance
set [ find default=yes ] router-id=172.16.16.2
/ip address
add address=192.168.0.2/30 comment=koneksi_ke_router1 interface=ether1 \
    network=192.168.0.0
add address=192.168.0.5/30 comment=koneksi_ke_router3 interface=ether2 \
    network=192.168.0.4
add address=192.168.1.17/28 comment=koneksi_ke_LAN interface=ether3 network=\
    192.168.1.16
add address=172.16.16.2 interface=loopback network=172.16.16.2
/ip dhcp-server network
add address=192.168.1.16/28 gateway=192.168.1.17
/routing ospf network
add area=backbone comment=Loopback network=172.16.16.2/32
add area=backbone comment=koneksi_ke_router1 network=192.168.0.0/30
add area=backbone comment=koneksi_ke_router3 network=192.168.0.4/30
add area=backbone comment=LAN network=192.168.1.16/28
