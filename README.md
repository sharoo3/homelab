# Homelab

TerraformバージョンはTerraform Cloudを参照。
https://app.terraform.io

## Environment variables

Proxmoxにアクセスするためのトークン情報はローカルの環境変数として管理する。

- PM_API_URL
- PM_API_TOKEN_ID
- PM_API_TOKEN_SECRET

## Setup

```powershell
scoop install tenv
tenv tf install 1.8.2
tenv tf use 1.8.2
```

