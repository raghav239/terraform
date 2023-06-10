// Template

resource "google_compute_instance_template" "websrv01" {
  name = "websrv01"
  machine_type = "e2-medium"
  //zone = "us-central1-a"

  tags = [ "dev","websrv" ]

  labels = {
    environment = "dev"
  }

  instance_description = "ubuntu-instanced-with-apache2"
  can_ip_forward = false
  
  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "ubuntu-2204-jammy-v20230429"
    auto_delete = true
    boot = true

    // only if wanted to backup the machine daily
    //resource_policies = [google_compute_resource_policy.backup-daily.id]
  }

  network_interface {
    network = "dev-nw-01"
    subnetwork = "public"
  }

}

/*
resource "google_compute_resource_policy" "backup-daily" {
  name = "every-day-4am"
  region = "us-central1"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time = "04:00"
      }
    }
  }
}*/