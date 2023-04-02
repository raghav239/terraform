

resource    "google_storage_bucket" "GCS2023" {
    name = "tf-course-bucket-from-cloud-console-2023-2"

    storage_class = "STANDARD"

    location = "US-CENTRAL1"
    
}