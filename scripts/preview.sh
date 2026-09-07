#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
export BUNDLE_PATH="${BUNDLE_PATH:-$PWD/local/bundle}"
runner=(bundle)
# The bundled gems on this Mac match its system Ruby's x86_64 runtime.
if [[ "$(uname -s)" == Darwin && "$(command -v ruby)" == /usr/bin/ruby ]]; then
  runner=(arch -x86_64 /usr/bin/ruby /usr/bin/bundle)
fi
if [[ $# -eq 1 && "$1" == --build ]]; then
  exec "${runner[@]}" exec jekyll build
elif [[ $# -eq 0 ]]; then
  exec "${runner[@]}" exec jekyll serve --host 127.0.0.1 --port 4000 --force_polling
else
  printf '%s\n' '预览：bash scripts/preview.sh' '只构建：bash scripts/preview.sh --build'
  exit 1
fi
