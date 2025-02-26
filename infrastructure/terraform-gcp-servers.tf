
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources
# Image list can be found at:
# https://cloud.google.com/compute/docs/images

###########  Micro-services   #############
# vuecalc
resource "google_compute_instance" "vue" {
    name = "vue"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20221018"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["vue", "http123"]
}

# happy
resource "google_compute_instance" "happy" {
    name = "happy"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20221018"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["happy", "http123"]
}

# expressed
resource "google_compute_instance" "expressed" {
    name = "expressed"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20221018"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["expressed", "http123"]
}


# bootstorage
resource "google_compute_instance" "bootstorage" {
    name = "bootstorage"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20221018"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["bootstorage", "http123"]
}

# prometheus
resource "google_compute_instance" "prometheus" {
    name = "prometheus"
    machine_type = var.GCP_MACHINE_TYPE
    zone = var.GCP_ZONE

    boot_disk {
        initialize_params {
          image = "ubuntu-2004-focal-v20221018"
        }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }

    metadata = {
      ssh-keys = "ubuntu:${file("/home/vagrant/.ssh/id_rsa.pub")}"
    }

  tags = ["prometheus", "http123"]
}

