build {
  name = "nomad-client"

  source "source.googlecompute.debian-10" {
    name   = "nomadclient"
  }

  provisioner "ansible" {
    galaxy_file = "./nomad-client/requirements.yaml"
    playbook_file = "./nomad-client/main.yaml"
    extra_arguments = [ 
      "--extra-vars", 
      "VAULT_TOKEN=${var.VAULT_TOKEN} VAULT_ADDR=${var.VAULT_ADDR}  vault_binary_loc=${var.vault_binary_loc}" 
      ]
  }

  hcp_packer_registry {
    bucket_name = "nomad-client"
  }
}