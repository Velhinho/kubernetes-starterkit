# How to define variables in terraform:
# https://www.terraform.io/docs/configuration/variables.html

variable "GCP_PROJECT_ID" {
    default = "agisit-2223-website-90792"
}

# A list of machine types is found at:
# https://cloud.google.com/compute/docs/machine-types
# Minimum required is N1 type = "n1-standard-1, 1 vCPU, 3.75 GB RAM"
variable "GCP_MACHINE_TYPE" {
    default = "n1-standard-1"
}

# Regions list is found at:
# https://cloud.google.com/compute/docs/regions-zones/regions-zones?hl=en_US
variable "GCP_ZONE" {
    default = "europe-west2-c"
}

variable "DISK_SIZE" {
    default = "15"
}
