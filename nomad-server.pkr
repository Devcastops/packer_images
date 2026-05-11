build {
  name = "nomad-server"

  source "source.googlecompute.debian-10" {
    name   = "nomadserver"
  }

  provisioner "ansible" {
    galaxy_file   = "./nomad-server/requirements.yaml"
    playbook_file = "./nomad-server/main.yaml"
    user          = "runner"
    extra_arguments = [
      "-c", "ssh",
      "-e", "ansible_ssh_transfer_method=sftp",
      "-e", "ansible_ssh_common_args='-o ControlMaster=no -o ControlPersist=no'",
      "-e", "ansible_ssh_control_path=none",
      "-e", "ansible_remote_tmp=/home/runner/ansible-tmp"
    ]
  }

  hcp_packer_registry {
    bucket_name = "nomad-server"
  }
}