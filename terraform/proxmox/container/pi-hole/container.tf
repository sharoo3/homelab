resource "proxmox_lxc" "pi-hole" {
  target_node     = "minase"
  vmid            = 100
  hostname        = "pi-hole"
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  unprivileged    = true
  pool            = "terraform"
  cores           = 1
  memory          = 1024
  swap            = 1024
  onboot          = true
  start           = true
  ssh_public_keys = file("${path.module}/key.pub")
  tags            = "debian;management"

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.0.101/24"
    gw     = "192.168.0.100"
  }

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}
