# Terraform google cloud multi tier deployment

provider "google" {
    # Create/Download credentials from:
    # Google Console -> "APIs & services -> Credentials"
    # Choose create- > "service account key" -> compute engine service account -> JSON
    credentials = file("agist-22-23-website-96742-16da41482c25.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
