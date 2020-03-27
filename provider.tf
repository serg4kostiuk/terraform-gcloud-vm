provider "google" {
  credentials = "${file("../gcloud-service.json")}"
  project     = "elegant-beach-255419"
  region      = "us-central1"
}