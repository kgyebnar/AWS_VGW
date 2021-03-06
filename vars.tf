variable "CGWS" {
default = {
    CGW1 = {
      name       = "cgw1-dc1-cisco1"
      bgp_asn    = "65412"
      ip_address = "1.2.3.4"
    },
    "CGW2" = {
      name       = "cgw2-dc1-cisco2"
      bgp_asn    = "65412"
      ip_address = "2.2.3.4"
    },
    "CGW3" = {
      name       = "cgw3-dc2-cisco1"
      bgp_asn    = "65412"
      ip_address = "3.2.3.4"
    },
    "CGW4" = {
      name       = "cgw4-dc2-cisco2"
      bgp_asn    = "65412"
      ip_address = "4.2.3.4"
    }
 }
}
variable "VPNS" {
  default = {
    "VPN1" = {
      "name"       = "vpn1-dc1-cisco1"
      "tunnel_key1"    = "12341234"
      "tunnel_key2"    = "567856781234"
    "cgw" = "CGW1"
    },
    "VPN2" = {
      "name"       = "vpn2-dc1-cisco2"
      "tunnel_key1"    = "9101112341234"
      "tunnel_key2"    = "12131412341234"
    "cgw" = "CGW2"
    },
    "VPN3" = {
      "name"       = "vpn3-dc2-cisco1"
      "tunnel_key1"    = "123456789101112"
      "tunnel_key2"    = "123456789101112"
    "cgw" = "CGW3"
    },
    "VPN4" = {
      "name"       = "vpn4-dc2-cisco2"
      "tunnel_key1"    = "123456789101112"
      "tunnel_key2"    = "123456789101112"
    "cgw" = "CGW4"
    },
    }
}

variable "ENV" {
  default = "DEV"
}

variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1    = "ami-13be557e"
    us-west-2    = "ami-06b94666"
    eu-west-1    = "ami-844e0bf7"
    eu-central-1 = "ami-027583e616ca104df"
  }
}

variable "vpn_cidr" {
  default = "0.0.0.0/0"
}

variable "pub1_cidr" {
  default = "10.0.111.0/24"
}

variable "pub2_cidr" {
  default = "10.0.2.0/24"
}

variable "priv1_cidr" {
  default = "10.0.1.0/24"
}

variable "priv2_cidr" {
  default = "10.0.2.0/24"
}

variable "vpc_cidr" {
  default = "10.0.0.0/22"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

