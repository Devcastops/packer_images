build {
  name = "control-plane"

  source "source.googlecompute.debian-10" {
    name   = "controlplane"
  }

  provisioner "shell" {
    inline = [
      "df -h"
      "sudo mkdir -p /home/runner/ansible-tmp"
      "sudo chown runner:runner /home/runner/ansible-tmp",
      "df -h / /tmp /home || true",
      "df -i / /tmp /home || true"
    ]

  }

  provisioner "ansible" {
    galaxy_file = "./control-plane/requirements.yaml"
    playbook_file = "./control-plane/main.yaml"
    extra_arguments = [ "-vvv","-c", "ssh", "-e", "ansible_ssh_transfer_method=scp", "-e", "ansible_ssh_common_args='-o ControlMaster=no -o ControlPersist=no'", "-e","ansible_ssh_control_path=none", "-e","ansible_remote_tmp=/home/runner/ansible-tmp" ]
  }

  hcp_packer_registry {
    bucket_name = "control-plane"
  }
}