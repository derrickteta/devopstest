# selection of the provider
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
provider "google" {}

# creation of my google cloud project
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "my_project" {
  name       = "DevOps test Project"
  project_id = "devops-test-project123"
}

# i comment this for now because by billing account doesnot allow it
# creation of cloud sql Database Basic
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
resource "google_sql_database" "database" {
  project = "devops-test-project123"
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  project = "devops-test-project123"
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = true
}

# creation of cloud storage bucket
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "static-file" {
  project = "devops-test-project123"
  name          = "static-file"
  location      = "US"
}
# creation of an artefact registry
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository
resource "google_artifact_registry_repository" "my-repo" {
  project = "devops-test-project123"
  location      = "us-central1"
  repository_id = "devops-test-repo123"
  description   = "docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}
# creation of google cloud run service
# doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
resource "google_cloud_run_service" "default" {
  project = "devops-test-project123"
  name     = "cloudrun-srv"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/devops-test-project123/devops-test-repo123/php-nginx-app:v1"
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}


