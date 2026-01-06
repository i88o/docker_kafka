#!/bin/bash

# 定义 Kafka 和 Zookeeper 数据目录
KAFKA_DIR="/home/user1/docker_workSpace/docker_kafka/kafka_01/data/kafka/"
ZOOKEEPER_DIR="/home/user1/docker_workSpace/docker_kafka/kafka_01/data/zookeeper/"

# 检查 Kafka 数据目录是否存在并删除
if [ -d "$KAFKA_DIR" ]; then
  echo "正在删除 Kafka 数据目录中的文件..."
  sudo rm -rf ${KAFKA_DIR}*
  echo "Kafka 数据已删除。"
else
  echo "未找到 Kafka 目录。"
fi

# 检查 Zookeeper 数据目录是否存在并删除
if [ -d "$ZOOKEEPER_DIR" ]; then
  echo "正在删除 Zookeeper 数据目录中的文件..."
  sudo rm -rf ${ZOOKEEPER_DIR}*
  echo "Zookeeper 数据已删除。"
else
  echo "未找到 Zookeeper 目录。"
fi

echo "清理完成。"
