#!/usr/bin/env bash
# Publish only homepage source/content, not local caches or unrelated templates.
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ $# -ne 1 || -z "$1" ]]; then
  printf '%s\n' '用法：bash scripts/publish.sh "简短描述这次更新"' '只检查配置：bash scripts/publish.sh --check'
  exit 1
fi
expected_remote='git@github.com:Junxian-Shen/Junxian-Shen.github.io.git'
if [[ "$(git remote get-url origin)" != "$expected_remote" || "$(git remote get-url --push origin)" != "$expected_remote" || "$(git branch --show-current)" != master ]]; then
  printf '%s\n' '仓库地址或分支不符；仅允许发布 Junxian-Shen.github.io 的 master 分支。'
  exit 1
fi
key=$(git config --local --get homepage.sshKey || true)
if [[ -z "$key" || ! -f "$key" || "$key" == *"'"* || "$key" == *$'\n'* ]]; then
  printf '%s\n' '还未绑定 Junxian-Shen 专用密钥。请先运行 scripts/configure-github.sh，参见《用法.md》。'
  exit 1
fi
reply=$(ssh -F /dev/null -i "$key" -o IdentitiesOnly=yes -o IdentityAgent=none -o AddKeysToAgent=no -o ForwardAgent=no -o PreferredAuthentications=publickey -o StrictHostKeyChecking=yes -o UpdateHostKeys=no -o ConnectTimeout=10 -T git@github.com 2>&1) || true
if [[ "$reply" != *"Hi Junxian-Shen/Junxian-Shen.github.io! You've successfully authenticated,"* && "$reply" != *"Hi Junxian-Shen! You've successfully authenticated,"* ]]; then
  printf '%s\n' "$reply" '账号验证未通过，停止推送。'
  exit 1
fi
if [[ "$1" == --check ]]; then
  printf '%s\n' '目标仓库或 Junxian-Shen 专用身份、仓库地址和 master 分支均已验证；未提交或推送。'
  exit 0
fi
if ! git diff --cached --quiet; then
  printf '%s\n' '已有暂存的修改。为避免混入其他内容，请先检查并处理暂存区，再重新运行。'
  exit 1
fi

# Pin this operation too, even if the shell has another SSH setting.
export GIT_SSH_COMMAND="ssh -F /dev/null -i '$key' -o IdentitiesOnly=yes -o IdentityAgent=none -o AddKeysToAgent=no -o ForwardAgent=no -o PreferredAuthentications=publickey -o StrictHostKeyChecking=yes -o UpdateHostKeys=no -o ConnectTimeout=10"
git fetch origin master
if ! git merge-base --is-ancestor origin/master HEAD; then
  printf '%s\n' '远端有尚未合并的更新。未提交或推送；请先处理版本差异，不要强制推送。'
  exit 1
fi

paths=(
  _config.yml .gitignore 用法.md
  _data/home.yml _data/home_ui.yml _data/news.yml _data/theme.yml _data/projects.yml _data/teaching.yml
  _includes/home-content.html _includes/seo.html _layouts/home.html _layouts/single.html
  _pages/about.md _pages/about-zh.md _publications _talks
  _sass/_home.scss assets/css/home.scss assets/css/main.scss assets/js/home.js
  assets/fonts files images scripts
  ':(exclude)**/.DS_Store'
)
# Ignore permission-only changes without altering working files.
git -c core.fileMode=false add -A -- "${paths[@]}"
if ! git diff --cached --quiet; then
  git diff --cached --stat
  git -c user.name='Junxian Shen' -c user.email='189944198+Junxian-Shen@users.noreply.github.com' commit -m "$1"
fi
if [[ "$(git rev-list --count origin/master..HEAD)" == 0 ]]; then
  printf '%s\n' '没有新的主页内容需要推送。'
  exit 0
fi
git push origin HEAD:master
printf '%s\n' '源文件已推送。请在仓库 Actions / Pages 检查部署结果。' \
  '英文：https://junxian-shen.github.io/' '中文：https://junxian-shen.github.io/zh/'
