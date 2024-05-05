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
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/t8WxckiAay1Ql5kyoyxlIDlXU0M17Epu5zSqDWjVo
  EOT

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.100.3/24"
    gw     = "192.168.100.100"
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}
