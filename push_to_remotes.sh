#!/bin/bash

# 推送到指定的远程仓库
push_to_remote() {
  local remote=$1
  echo "正在推送到 $remote..."
  git push -u "$remote" main
  if [ $? -ne 0 ]; then
    echo "$remote 推送失败!"
    exit 1
  fi
}

# 推送到 GitHub
push_to_remote github

# 推送到 Gitee
push_to_remote gitee

# 推送到其他远程仓库
push_to_remote gitcode
push_to_remote gitlab
push_to_remote gitea

echo "代码成功推送到 GitHub、Gitee、GitCode、GitLab 和 Gitee！"
