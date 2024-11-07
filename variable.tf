variable "REGION" {
  default = "ap-south-1"
}
variable "ZONE1" {
  default = "ap-south-1a"
}
variable "ZONE2" {
  default = "ap-south-1b"
}
variable "AMIS" {
  default = {
    ap-south-1 = "ami-04a37924ffe27da53"
  }
}
variable "USER" {
  default = "linux"
}
variable "PUB_KEY" {
  default = "linuxins"
}
variable "MYIP" {
  default = "0.0.0.0/0" # Your specific IP address
}
