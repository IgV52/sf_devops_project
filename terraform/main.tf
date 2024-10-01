terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "=0.119.0"
    }
  }
  required_version = ">= 1.8.3"
}

provider "yandex" {
  service_account_key_file = file("./.key.json")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = "ru-central1-a"
}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}

module "project_cluster" {
  source        = "./modules/instance"
  vpc_subnet_id = yandex_vpc_subnet.subnet.id
  srv      = 1
  master   = 1
  app      = 1
}

resource "null_resource" "create_inventory" {
  provisioner "local-exec" {
    command = "python3 ./create_inventory.py"
  }
  depends_on = [module.project_cluster]
}

resource "null_resource" "exec_ansible_playbook_apt" {
  provisioner "local-exec" {
    command = "cd ~/projects/sf_devops_project/ansible && ansible-playbook ./playbooks/ansible-apt.yaml -u ubuntu"
  }
  depends_on = [null_resource.create_inventory]
}

resource "null_resource" "exec_ansible_playbook_k8s" {
  provisioner "local-exec" {
    command = "cd ~/projects/sf_devops_project/ansible && ansible-playbook ./playbooks/ansible-k8s.yaml -u ubuntu"
  }
  depends_on = [null_resource.exec_ansible_playbook_apt]
}
