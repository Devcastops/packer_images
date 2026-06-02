build {
  name = "nomad-server"

  source "source.googlecompute.debian-10" {
    name   = "nomadserver"
  }

  provisioner "ansible" {
    galaxy_file   = "./nomad-server/requirements.yaml"
    playbook_file = "./nomad-server/main.yaml"
    user          = "runner"
    ansible_env_vars = [
      # Override (not append) the default ssh_args so ControlMaster/ControlPersist
      # are actually disabled. Appending via ansible_ssh_common_args does NOT work:
      # ssh uses first-value-wins, and Ansible's default `-o ControlMaster=auto
      # -o ControlPersist=60s` comes first, so the persistent multiplexed socket
      # stays on and can wedge a task indefinitely.
      "ANSIBLE_SSH_ARGS=-o StrictHostKeyChecking=no -o ControlMaster=no -o ControlPersist=no -o ServerAliveInterval=15 -o ServerAliveCountMax=4",
      "ANSIBLE_TIMEOUT=30",
      "ANSIBLE_TASK_TIMEOUT=600",
    ]
    extra_arguments = [
      "-e", "ansible_ssh_transfer_method=sftp",
      "-e", "ansible_remote_tmp=/home/runner/ansible-tmp",
      "-vvv"
    ]
  }

  hcp_packer_registry {
    bucket_name = "nomad-server"
  }
}
