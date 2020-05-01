resource "google_compute_address" "wordpress" {
  name = var.name
  network_tier = var.network_tier
}

resource "google_compute_instance" "wordpress" {
  name = var.name
  machine_type = var.machine_type
  zone = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
   network_interface {
    network = var.network
    access_config {
      network_tier = var.network_tier
      nat_ip = google_compute_address.wordpress.address
    }
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }
}

output "instance_ip_addr" {
  value = google_compute_address.wordpress.address
}