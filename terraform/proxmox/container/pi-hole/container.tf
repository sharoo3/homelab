resource "proxmox_lxc" "pi-hole" {
  target_node  = "minase"
  vmid         = 103
  hostname     = "pi-hole"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged = true
  pool         = "terraform"
  cores        = 1
  memory       = 1024
  swap         = 1024
  onboot       = true
  start        = true
  tags         = "service;ubuntu"

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqLIvRqHO6fNvuErP/DnBGZEGZlcZ4OBv2HXkodJ93z
  EOT

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.0.103/24"
    gw     = "192.168.0.1"
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}
