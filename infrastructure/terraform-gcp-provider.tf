# Terraform google cloud multi tier deployment

provider "google" {
    # Create/Download your credentials from:
    # Google Console -> "APIs & services -> Credentials"
    # Choose create- > "service account key" -> compute engine service account -> JSON
    credentials = file("agist-22-23-website-96742-a517fc935054.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
