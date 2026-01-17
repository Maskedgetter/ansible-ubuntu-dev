# Ansible Ubuntu Development Environment Setup

Windowsから接続するためのUbuntu開発環境をセットアップするAnsibleプレイブックです。
Commonツール、ユーザー設定、およびDocker環境を自動構築します。

## 前提条件

- **管理対象ノード**: Ubuntu 22.04 / 24.04 (Server または Desktop)
- **制御ノード** (Ansibleを実行する場所): Windows上のWSL2、または別のLinuxマシン

## ディレクトリ構成

```
.
├── inventory/
│   └── hosts.ini       # 接続先サーバーの情報を記述
├── group_vars/
│   └── all.yml         # ユーザー名やインストールするパッケージの設定
├── roles/
│   ├── common/         # 基本ツールとユーザー設定
│   └── docker/         # Dockerのインストール
└── site.yml            # メインのプレイブック
```

## 設定方法

1. **接続先の設定**: `inventory/hosts.ini` を編集し、対象のUbuntuサーバーのIPアドレスを設定してください。

    ```ini
    [dev_servers]
    192.168.1.xxx ansible_user=既存のユーザー名
    ```

    ※ SSH鍵認証が未設定の場合は、`--ask-pass --ask-become-pass` オプションを付けて実行する必要があります（`sshpass`が必要）。

2. **変数の設定**: `group_vars/all.yml` で作成したいユーザー名などを変更できます。

    ```yaml
    user_name: ubuntu  # 作成される開発用ユーザー
    ```

## 実行方法

```bash
# 構文チェック
ansible-playbook -i inventory/hosts.ini site.yml --syntax-check

# 実行
ansible-playbook -i inventory/hosts.ini site.yml
```

パスワード入力が必要な場合:
```bash
ansible-playbook -i inventory/hosts.ini site.yml --ask-become-pass
```

## 実行後のWindowsからの接続

### SSH接続
作成されたユーザー（デフォルト: `ubuntu`）でSSH接続します。
```powershell
ssh ubuntu@192.168.1.xxx
```

### VS Code Remote - SSH
1. VS Codeに "Remote - SSH" 拡張機能をインストールします。
2. 左下の緑色のアイコンをクリックし、"Connect to Host..." を選択します。
3. `ubuntu@192.168.1.xxx` を入力して接続します。

### Dockerの利用
作成されたユーザーは `docker` グループに追加されているため、`sudo` なしで `docker` コマンドが実行可能です。
```bash
docker run hello-world
```
