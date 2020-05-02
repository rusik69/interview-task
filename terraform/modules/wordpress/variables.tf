variable "name" {
  type = string
  default = "wordpress"
}

variable "machine_type" {
  type = string
  default = "e2-small"
}

variable "zone" {
  type = string
  default = "europe-west3-c"
}

variable "image" {
  type = string
  default = "debian-cloud/debian-10-buster-v20200413"
}

variable "network" {
  type = string
  default = "default"
}

variable "network_tier" {
  type = string
  default = "STANDARD"
}

variable "ssh_pub_key_file" {
  type = string
  default = "./creds/id_rsa.pub"
}

variable "ssh_user" {
  type = string
  default = "oracle"
} 

variable "ports" {
  type = list
  default = ["80", "8080", "9090"]
}
