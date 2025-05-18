# selection of the provider
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
provider "google" {}

# creation of my google cloud project
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "my_project" {
  name       = "DevOps test Project"
  project_id = "devops-test-project123"
}

