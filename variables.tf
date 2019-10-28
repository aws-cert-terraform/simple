###############################################################################
#
# Get variables from command line or environment
#
###############################################################################


variable "do_token" {
    default = ""
}


variable "do_region" {
    default = "nyc3"
}


variable "size_master" {
    default = "2gb"
}


variable "ssh_fingerprint" {
    default = ["12:b8:e6:0a:a9:12:e6:9e:bd:6c:ba:c9:02:bb:f0:65"]
}
