resource "proxmox_lxc" "pi-hole" {
  target_node  = "minase"
  vmid         = 104
  hostname     = "benchmark"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged = true
  pool         = "terraform"
  cores        = 4
  memory       = 4096
  swap         = 4096
  onboot       = true
  start        = true
  tags         = "benchmark;ubuntu"

  ssh_public_keys = <<EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/t8WxckiAay1Ql5kyoyxlIDlXU0M17Epu5zSqDWjVo
  EOT

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.100.4/24"
    gw     = "192.168.100.100"
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}
