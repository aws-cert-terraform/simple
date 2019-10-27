
###############################################################################
#
# Specify provider
#
###############################################################################


provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "web-app" {
    image = "ubuntu-16-04-x64"
    name = "app-server-01"
    region = "${var.do_region}"
    private_networking = true
    size = "${var.size_master}"
    ssh_keys = var.ssh_fingerprint
    user_data = "${file("userdata/userdata.sh")}"

    provisioner "file" {
      source      = "dist/app.zip"
      destination = "/etc/app.zip"

      connection {
        host     = self.ipv4_address
        type     = "ssh"
        user     = "root"
        private_key = "${file("/Users/iancullinane/.ssh/gate-key")}"
      }
    }
}

output "cluster-private-ips" {
  value = "${formatlist("%v", digitalocean_droplet.web-app.ipv4_address)}"
}
