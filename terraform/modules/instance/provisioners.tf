resource "null_resource" "docker-srv" {
  count = var.srv
  depends_on = [yandex_compute_instance.vm-srv]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.vm-srv[count.index].network_interface.0.nat_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sudo sh get-docker.sh",
      "sleep 10",
      "echo 0",
      "echo COMPLETED"
    ]
  }
}

resource "null_resource" "docker-master" {
  count = var.master
  depends_on = [yandex_compute_instance.vm-master]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.vm-master[count.index].network_interface.0.nat_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sudo sh get-docker.sh",
      "sleep 10",
      "echo 0",
      "echo COMPLETED"
    ]
  }
}

resource "null_resource" "docker-app" {
  count = var.app
  depends_on = [yandex_compute_instance.vm-app]
  connection {
    user        = var.ssh_credentials.user
    private_key = file(var.ssh_credentials.private_key)
    host        = yandex_compute_instance.vm-app[count.index].network_interface.0.nat_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sudo sh get-docker.sh",
      "sleep 10",
      "echo 0",
      "echo COMPLETED"
    ]
  }
}
