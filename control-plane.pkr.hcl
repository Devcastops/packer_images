build {
  name = "control-plane"

  source "source.googlecompute.debian-10" {
    name   = "controlplane"
  }

  provisioner "ansible" {
    galaxy_file   = "./control-plane/requirements.yaml"
    playbook_file = "./control-plane/main.yaml"
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
    bucket_name = "control-plane"
  }
}