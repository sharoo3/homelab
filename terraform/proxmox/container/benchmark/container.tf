resource "proxmox_lxc" "container" {
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

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqLIvRqHO6fNvuErP/DnBGZEGZlcZ4OBv2HXkodJ93z
  EOT

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.0.104/24"
    gw     = "192.168.0.1"
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}
