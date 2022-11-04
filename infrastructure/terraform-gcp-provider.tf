# Terraform google cloud multi tier deployment

provider "google" {
    # Create/Download your credentials from:
    # Google Console -> "APIs & services -> Credentials"
    # Choose create- > "service account key" -> compute engine service account -> JSON
    credentials = file("agisit-2223-website-90792-599e5c6e9e5d.json")
    project = var.GCP_PROJECT_ID
    zone = var.GCP_ZONE
}
