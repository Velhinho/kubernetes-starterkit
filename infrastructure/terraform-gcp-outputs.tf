# Terraform GCP
# To output variables, follow pattern:
# value = TYPE.NAME.ATTR

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

#output "balancer_ssh" {
# value = google_compute_instance.balancer.self_link
#}

# example for a set of identical instances created with "count"
#output "web_IPs"  {
#  value = formatlist("%s = %s", google_compute_instance.web[*].name, google_compute_instance.web[*].network_interface.0.access_config.0.nat_ip)
#}
