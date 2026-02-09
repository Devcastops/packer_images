build {
  name = "control-plane"

  source "source.googlecompute.debian-10" {
    name   = "controlplane"
  }

  provisioner "shell" {
  inline = [
    "df -h",
    "whoami",
    "sudo mkdir -p /home/debian/ansible-tmp",  # Change from runner to debian
    "sudo chmod 777 /home/debian/",            # Change from runner to debian
    "sudo chmod 777 /home/debian/ansible-tmp", # Change from runner to debian
    "df -h / /tmp /home || true",
  ]
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
    "-e", "ansible_remote_tmp=/home/debian/ansible-tmp"  # Change from runner to debian

  ]
}

  hcp_packer_registry {
    bucket_name = "control-plane"
  }
}