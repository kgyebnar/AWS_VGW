# AWS VGW Playground
This is a basic TF Template for 
 - App VPC creation
 - VGW Creation
 - VGW and VPN tunnel associations
 - 2 security group 
 - 2 private subnet per VPC
 - 2 routing table (Main,PRIVATE)
 - VPN GW with 2 private subnet
 - 4x CGW (AWS Customer Gateway)
 - 4 vpn connection (8x IPsec) to On-prem connectivity
 - 4byte ASN for TGW and VGW

Added simple pkeys.sh which replace the preshared keys in the vars.tf.

## Requirements




| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| AMIS | n/a | `map(string)` | <pre>{<br>  "eu-central-1": "ami-027583e616ca104df",<br>  "eu-west-1": "ami-844e0bf7",<br>  "us-east-1": "ami-13be557e",<br>  "us-west-2": "ami-06b94666"<br>}</pre> | no |
| AWS\_REGION | n/a | `string` | `"eu-central-1"` | no |
| CGWS | n/a | `map` | <pre>{<br>  "CGW1": {<br>    "bgp_asn": "65412",<br>    "ip_address": "1.2.3.4",<br>    "name": "cgw1-dc1-cisco1"<br>  },<br>  "CGW2": {<br>    "bgp_asn": "65412",<br>    "ip_address": "2.2.3.4",<br>    "name": "cgw2-dc1-cisco2"<br>  },<br>  "CGW3": {<br>    "bgp_asn": "65412",<br>    "ip_address": "3.2.3.4",<br>    "name": "cgw3-dc2-cisco1"<br>  },<br>  "CGW4": {<br>    "bgp_asn": "65412",<br>    "ip_address": "4.2.3.4",<br>    "name": "cgw4-dc2-cisco2"<br>  }<br>}</pre> | no |
| INSTANCE\_USERNAME | n/a | `string` | `"ubuntu"` | no |
| PATH\_TO\_PRIVATE\_KEY | n/a | `string` | `"mykey"` | no |
| PATH\_TO\_PUBLIC\_KEY | n/a | `string` | `"mykey.pub"` | no |
| VPNS | n/a | `map` | <pre>{<br>  "VPN1": {<br>    "cgw": "CGW1",<br>    "name": "vpn1-dc1-cisco1",<br>    "tunnel_key1": "test1234",<br>    "tunnel_key2": "test5678"<br>  },<br>  "VPN2": {<br>    "cgw": "CGW2",<br>    "name": "vpn2-dc1-cisco2",<br>    "tunnel_key1": "test1234",<br>    "tunnel_key2": "test5678"<br>  },<br>  "VPN3": {<br>    "cgw": "CGW3",<br>    "name": "vpn3-dc2-cisco1",<br>    "tunnel_key1": "test1234",<br>    "tunnel_key2": "test5678"<br>  },<br>  "VPN4": {<br>    "cgw": "CGW4",<br>    "name": "vpn4-dc2-cisco2",<br>    "tunnel_key1": "test1234",<br>    "tunnel_key2": "test5678"<br>  }<br>}</pre> | no |
| priv1\_cidr | n/a | `string` | `"10.0.1.0/24"` | no |
| priv2\_cidr | n/a | `string` | `"10.0.2.0/24"` | no |
| pub1\_cidr | n/a | `string` | `"10.0.111.0/24"` | no |
| pub2\_cidr | n/a | `string` | `"10.0.2.0/24"` | no |
| vpc\_cidr | n/a | `string` | `"10.0.0.0/22"` | no |
| vpn\_cidr | n/a | `string` | `"0.0.0.0/0"` | no |

## Outputs


| Name | Description |
|------|-------------|
| cgw-bgp-asn | return a list of ASN associated to each CGW |
| cgw-ids | return a list of CGW-IDs |
| cgw-ips | return a list of IPs associated to each CGWs |
| cgw-name-tags | return a list of Name tags associated to each CGWs |
| vpn-cgw-mappings | return a list, how the VPNs are mapped to CGWs |
| vpn-ids | return a list of VPN-IDs |
| vpn-name-tags | return a list of Name tags associated to each VPNs |
| vpn-tunnel1-address | list of IPs: AWS tunnel2 outside IP address associated to each VPN connection |
| vpn-tunnel1-bgp-asn | list of tunnel1 ASN associated to each VPN connection |
| vpn-tunnel1-inside-cgw-address | list of IPs: CGW tunnel1 intside IP address associated to each VPN connection |
| vpn-tunnel1-inside-vgw-address | list of IPs: VGW tunnel1 inside IP address associated to each VPN connection |
| vpn-tunnel2-address | list of IPs: AWS tunnel2 outside IP address associated to each VPN connection |
| vpn-tunnel2-bgp-asn | list of tunnel2 ASN associated to each VPN connection |
| vpn-tunnel2-inside-cgw-address | list of IPs: CGW tunnel2 inside IP address associated to each VPN connection |
| vpn-tunnel2-inside-vgw-address | list of IPs: VGW tunnel2 inside IP address associated to each VPN connection |



