#!/bin/bash
set -x  # 打印执行的命令

echo "功能 0: 停止 Docker Compose 服务"
echo "功能 1: 启动 Docker Compose 服务"
echo "功能 2: 重启 Docker Compose 服务..."
echo "功能 3: 查看 Docker Compose 服务的状态..."

# 输出所有传入的参数
echo "传入的所有参数是: $@"
echo "传入的第一个参数是: $1"  # 调试信息，确保参数 1 被正确传递

# 设置默认行为
COMMAND=$1  # 获取第一个参数

# 检查命令是否为空
echo "传入的命令是: $COMMAND"  # 添加调试信息，检查传入的命令
if [ -z "$COMMAND" ]; then
  echo "用法: $0 {0|1|2|3}"
  exit 1
fi

# 启动 Docker Compose 服务
start() {
  echo "功能 1: 正在启动 Docker Compose 服务..."
  docker-compose up -d
  status
}

# 停止 Docker Compose 服务
stop() {
  echo "功能 0: 正在停止 Docker Compose 服务..."
  docker-compose down
  status
}

# 重启 Docker Compose 服务
restart() {
  echo "功能 2: 正在重启 Docker Compose 服务..."
  docker-compose down
  docker-compose up -d
  status
}

# 查看 Docker Compose 状态
status() {
  echo "功能 3: 查看当前 Docker Compose 服务的状态..."
  docker-compose ps
}

# 根据传入的数字执行不同的操作
case $COMMAND in
  1)
    start
    ;;
  0)
    stop
    ;;
  2)
    restart
    ;;
  3)
    status
    ;;
  *)
    echo "无效命令. 用法: $0 {0|1|2|3}"
    exit 1
    ;;
esac

