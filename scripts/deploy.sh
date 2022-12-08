#!/usr/bin/env bash
JAR_PATH=$(ls /home/ubuntu/action/*SNAPSHOT.jar)
JAR_NAME=$(basename $JAR_PATH)

echo "> 현재 시간: $(date)" >> /home/ubuntu/action/deploy.log

echo "> build 파일명: $JAR_NAME" >> /home/ubuntu/action/deploy.log

echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ubuntu/action/deploy.log
CURRENT_PID=$(pgrep -d " " -f $JAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> /home/ubuntu/action/deploy.log
else
  echo -e "> 구동중인 애플리케이션을 종료합니다. pid: $CURRENT_PID" >> /home/ubuntu/action/deploy.log
  sudo kill -9 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_NAME 배포"    >> /home/ubuntu/action/deploy.log
sudo nohup java -jar $JAR_PATH >> /home/ubuntu/deploy.log 2>/home/ubuntu/action/deploy_err.log &