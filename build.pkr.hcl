build {
  name = "nomad-client"

  source "source.googlecompute.debian-10" {
    name   = "nomadclient"
  }

  provisioner "ansible" {
    galaxy_file = "./nomad-client/requirements.yaml"
    playbook_file = "./nomad-client/main.yaml"
  }
}