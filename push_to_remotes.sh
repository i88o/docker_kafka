#!/bin/bash

# 推送到 GitHub
echo "正在推送到 GitHub..."
git push -u github main
if [ $? -ne 0 ]; then
  echo "GitHub 推送失败!"
  exit 1
fi

# 推送到 Gitee
echo "正在推送到 Gitee..."
git push -u gitee main
if [ $? -ne 0 ]; then
  echo "Gitee 推送失败!"
  exit 1
fi

echo "代码成功推送到 GitHub 和 Gitee！"
