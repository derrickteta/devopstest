# selection of the provider
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
provider "google" {}

# creation of my google cloud project
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "my_project" {
  name       = "DevOps test Project"
  project_id = "devops-test-project123"
}

# creation of cloud sql Database Basic
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
resource "google_sql_database" "database" {
  project = "devops-test-project123"
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  project = "devops-test-project123"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = true
}
