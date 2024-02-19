source "googlecompute" "debian-10" {
  project_id   = var.project_id
  zone         = "europe-west2-a"
  source_image = "debian-10-buster-v20231010"
  disk_size    = var.disk_size
  ssh_username = "root"
}