source "googlecompute" "debian-10" {
  project_id      = var.project_id
  zone            = "europe-west2-a"
  source_image    = "ubuntu-2204-jammy-v20240223"
  disk_size       = var.disk_size
  ssh_username    = "debian"
  subnetwork      = "projects/devcastops/regions/europe-west2/subnetworks/github"
  use_internal_ip = false
  tags            = ["packerbuild"]
}
