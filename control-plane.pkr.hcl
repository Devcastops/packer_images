build {
  name = "control-plane"

  source "source.googlecompute.debian-10" {
    name   = "controlplane"
  }

  provisioner "ansible" {
  galaxy_file = "./control-plane/requirements.yaml"
  playbook_file = "./control-plane/main.yaml"
  user = "debian"  
  extra_arguments = [ 
    "-vvv",
    "-c", "ssh", 
    "-e", "ansible_ssh_common_args='-o ControlMaster=no -o ControlPersist=no'", 
    "-e", "ansible_ssh_control_path=none", 
  ]
}

  hcp_packer_registry {
    bucket_name = "control-plane"
  }
}