build {
  name = "nomad-client"

  source "source.googlecompute.debian-10" {
    name   = "nomadclient"
  }

  provisioner "ansible" {
    playbook_file = "./nomad-client/main.yaml"
  }
}