build {
  name = "control-plane"

  source "source.googlecompute.debian-10" {
    name   = "controlplane"
  }

  provisioner "ansible" {
    galaxy_file = "./control-plane/requirements.yaml"
    playbook_file = "./control-plane/main.yaml"
  }

  hcp_packer_registry {
    bucket_name = "control-plane"
  }
}