# Terraform GCP

output "vue" {
  value = join(" ", google_compute_instance.vue.*.network_interface.0.access_config.0.nat_ip)
}

output "happy" {
  value = join(" ", google_compute_instance.happy.*.network_interface.0.access_config.0.nat_ip)
}

output "expressed" {
  value = join(" ", google_compute_instance.expressed.*.network_interface.0.access_config.0.nat_ip)
}

output "bootstorage" {
  value = join(" ", google_compute_instance.bootstorage.*.network_interface.0.access_config.0.nat_ip)
}
