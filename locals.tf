locals {
  control_plane_ip = "10.50.1.10"
  worker_ips       = [for index in range(var.worker_count) : "10.50.1.${11 + index}"]
  common_tags = {
    environment = "lab"
    project     = "kubeadm-multinode"
  }
}

