#!/usr/bin/env bash
# One-time setup. Changes this repository only, never the default account.
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ $# -gt 1 ]]; then
  printf '%s\n' '首次准备：bash scripts/configure-github.sh --prepare' '添加公钥后验证：bash scripts/configure-github.sh' '使用已有专用密钥：bash scripts/configure-github.sh /专用SSH私钥的绝对路径'
  exit 1
fi
expected_remote='git@github.com:Junxian-Shen/Junxian-Shen.github.io.git'
if [[ "$(git remote get-url origin)" != "$expected_remote" || "$(git remote get-url --push origin)" != "$expected_remote" ]]; then
  printf '%s\n' '仓库地址不符，未修改配置。'
  exit 1
fi
git_dir=$(git rev-parse --absolute-git-dir)
if [[ "$git_dir" != "$PWD/.git" ]]; then
  printf '%s\n' '请在主页的独立仓库中运行，避免修改其他工作区的配置。'
  exit 1
fi
key="$git_dir/homepage-ssh/id_ed25519"
mode="${1:-}"
if [[ "$mode" == --prepare ]]; then
  if [[ -L "$git_dir/homepage-ssh" ]]; then
    printf '%s\n' '密钥目录不能是指向项目外部的链接，未修改配置。'
    exit 1
  fi
  umask 077
  mkdir -p "$git_dir/homepage-ssh"
  if [[ -e "$key" || -L "$key" || -e "$key.pub" || -L "$key.pub" ]]; then
    printf '%s\n' '专用密钥文件已存在，未覆盖。添加公钥后直接运行验证步骤。'
    exit 1
  fi
  # This unattended key stays in .git with owner-only permissions.
  ssh-keygen -q -t ed25519 -N '' -C 'Junxian-Shen.github.io project-only' -f "$key"
elif [[ -n "$mode" ]]; then
  key="$mode"
fi
case "$key" in
  /*) ;;
  *) printf '%s\n' '请提供密钥的绝对路径。'; exit 1 ;;
esac
if [[ ! -f "$key" || "$key" == *.pub || "$key" == *"'"* || "$key" == *$'\n'* ]]; then
  printf '%s\n' '需要有效的私钥文件路径（不是 .pub 公钥）；路径不能含单引号或换行。'
  exit 1
fi
ssh_command="ssh -F /dev/null -i '$key' -o IdentitiesOnly=yes -o IdentityAgent=none -o AddKeysToAgent=no -o ForwardAgent=no -o PreferredAuthentications=publickey -o StrictHostKeyChecking=yes -o UpdateHostKeys=no -o ConnectTimeout=10"
if [[ "$mode" != --prepare ]]; then
  printf '%s\n' '验证专用密钥对应的 GitHub 仓库或账号……'
  # A deploy key authenticates as OWNER/REPO; an account key as OWNER.
  reply=$(ssh -F /dev/null -i "$key" -o IdentitiesOnly=yes -o IdentityAgent=none -o AddKeysToAgent=no -o ForwardAgent=no -o PreferredAuthentications=publickey -o StrictHostKeyChecking=yes -o UpdateHostKeys=no -o ConnectTimeout=10 -T git@github.com 2>&1) || true
  if [[ "$reply" != *"Hi Junxian-Shen/Junxian-Shen.github.io! You've successfully authenticated,"* && "$reply" != *"Hi Junxian-Shen! You've successfully authenticated,"* ]]; then
    printf '%s\n' "$reply" '未验证到目标仓库或 Junxian-Shen，未修改配置。请先在目标仓库添加公钥。'
    exit 1
  fi
fi

git config --local homepage.sshKey "$key"
git config --local core.sshCommand "$ssh_command"
git config --local user.name 'Junxian Shen'
git config --local user.email '189944198+Junxian-Shen@users.noreply.github.com'
git config --local commit.gpgsign false
if [[ "$mode" == --prepare ]]; then
  printf '%s\n' '本地隔离已准备好；尚未验证 GitHub 授权，也未提交或推送。' "公钥文件：$key.pub" '请把公钥添加到目标仓库 Settings → Deploy keys，并允许写入，再运行本脚本验证。'
else
  printf '%s\n' '专用密钥验证通过；配置仅保存在这个项目，其他仓库和常用账号不受影响。'
fi
