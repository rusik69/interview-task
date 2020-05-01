# gcloud auth application-default login
# https://console.cloud.google.com/apis/credentials/serviceaccountkey
# gcloud auth application-default login

terraform {
  backend "gcs" {
    bucket  = "terraform-oracle-interview-task"
    prefix  = "state"
  }
}

provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "oracle-interview-task"
  region      = "europe-west3"
}

