/interface bridge
add admin-mac=F4:1E:57:B0:11:8C auto-mac=no comment=INTERNET name=bridgeLocal
/interface vlan
add comment=PELANGGAN interface=ether3 name=vlan1-100 vlan-id=100
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=vlan1-100 name=dhcp1 relay=0.0.0.1
/ppp profile
add local-address=192.168.10.1 name=5M rate-limit=5M/5M remote-address=dhcp_pool0
add local-address=192.168.10.1 name="5M UP 8M" rate-limit="5M/5M 8M/8M 3750k/3750k 32/32 8 2500k/2500k " remote-address=dhcp_pool0
add local-address=192.168.10.1 name="8M UP 10M" rate-limit="8M/8M 10M/10M 3750k/3750k 15/15 8 2500k/2500k " remote-address=dhcp_pool0
add local-address=192.168.10.1 name="10M UP 15M" rate-limit="10M/10M 15M/15M 3750k/3750k 63/63 8 2500k/2500k " remote-address=dhcp_pool0
/interface sstp-client
add connect-to=remote3.fazznet.co.id disabled=no name=vpn-fazznet password=fazznet1344edi profile=default-encryption user=fazznet1344edi
/queue simple
add burst-limit=12M/12M burst-threshold=5M/5M burst-time=1m/1m limit-at=10M/10M max-limit=10M/10M name="SERVER/PAK KADUS" target=192.168.1.253/32
/interface bridge port
add bridge=bridgeLocal comment=defconf interface=ether1
add bridge=bridgeLocal comment=defconf interface=ether2
add bridge=bridgeLocal interface=ether4
/interface pppoe-server server
add disabled=no interface=vlan1-100 service-name=service1
/ip address
add address=192.168.10.1/24 interface=vlan1-100 network=192.168.10.0
/ip dhcp-client
add comment=defconf disabled=no interface=bridgeLocal
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall nat
add action=masquerade chain=srcnat out-interface=bridgeLocal
/ppp secret
add comment="taufik kampus " name=Mb1.net password=mb123 profile="8M UP 10M" service=pppoe
add name=tes1 password=tes1 profile=5M service=pppoe
add comment="mifta lorong tuk herman" name=Mb2.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="putra HR music" name=Mb3.net password=mb123 profile="10M UP 15M" service=pppoe
add comment="pak yakub saor" name=Mb4.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="afida adek irul" name=Mb5.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="ayuk imelda toko pnggr jalan" name=Mb6.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="ayuk susi jingga" name=Mb7.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="bibik uun lorong tuk herman" name=Mb8.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="bg azmi sblh bg putra" name=Mb9.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="wahyu candra wc" name=Mb10.net password=mb123 profile="10M UP 15M" service=pppoe
add comment="ayuk neli pinggir jalan odp" name=Mb11.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="ayuk via ipul mifta" name=Mb12.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="mbk atun mas umul" name=Mb13.net password=mb123 profile="8M UP 10M" service=pppoe
add comment=fenanda name=Mb14.net password=mb123 profile="8M UP 10M" service=pppoe
add comment=silpi name=Mb15.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="sebelah rmh yuk mita" name=Mb16.net password=mb123 profile="8M UP 10M" service=pppoe
add comment=kuyung name=Mb17.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="riski pinggir jalan biru tingkat" name=Mb18.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="febri depan mbk atun" name=Mb19.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="pak sodikin" name=Mb20.net password=mb123 profile="10M UP 15M" service=pppoe
add comment="ira imam wak sam" name=Mb21.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="anggun depan mbk atun" name=Mb22.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="bu sri rezeki arah masuk kampus" name=Mb23.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="andri kampus" name=Mb24.net password=mb123 profile="8M UP 10M" service=pppoe
add comment="anddri kampus" name=Mb25.net password=mb123 profile="10M UP 15M" service=pppoe
add comment="mbk ika lorong 2 " disabled=yes name=Mb26.net password=mb123 profile="8M UP 10M" service=pppoe
add name=imelda password=mb123 profile="8M UP 10M" service=pppoe
add comment="mas heri bakso bakar" name=heri password=mb123 profile="8M UP 10M" service=pppoe
add comment="sari sd" name=sarisd password=sarisd profile="10M UP 15M" service=pppoe
add comment="desta kampus" name=kampus password=kampus profile="8M UP 10M" service=pppoe
/system clock
set time-zone-name=America/New_York
/system identity
set name="MAJU BERSAMA NET"
/system ntp client
set server-dns-names=0.id.pool.ntp.org
