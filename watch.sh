#!/bin/sh

render() {
  docker run -v "$(pwd)/docs:/workdir/docs:ro" -v "$(pwd)/output:/workdir/output" buildroot make manual-html
  echo "ビルド終了" >&2
}

watch_dir="./docs"

echo "${watch_dir} の監視を開始します..." >&2

time="$(date "+%Y%m%d%H%M%S")"
render

while :; do
  path="$(fswatch -l 0.1 -1 --event Updated "${watch_dir}")"
  if [ -n "${path}" ]; then
    if echo "${path}" | grep -v '\/\..*\.swp$' > /dev/null; then
      time="$(date "+%Y%m%d%H%M%S")"
      echo "${time} ${path} が変更されました" >&2
      render
    fi
  else
    echo "終了します" >&2
    exit 1
  fi
done
