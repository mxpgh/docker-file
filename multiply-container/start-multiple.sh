#!/bin/sh

# Start the first process
pidof hrt2201
PROCESS_1_STATUS=$?
echo "hrt2201 status..."
echo $PROCESS_1_STATUS
if [ $PROCESS_1_STATUS -ne 0 ]; then
nohup /home/hrt2201 > /home/hrt2201.log 2>&1 &
echo "start hrt2201: $?"
fi
sleep 5

# Start the second process

pidof pt_app
PROCESS_2_STATUS=$?
echo "pt_app status..."
echo $PROCESS_2_STATUS
if [ $PROCESS_2_STATUS -ne 0 ]; then
nohup /home/pt_app > /home/pt_app.log 2>&1 &
echo "start pt_app: $?"
fi

# 每隔60秒检查进程是否运行
while sleep 60; do
pidof hrt2201
PROCESS_1_STATUS=$?
pidof pt_app
PROCESS_2_STATUS=$?
# If the greps above find anything, they exit with 0 status
# If they are not both 0, then something is wrong
if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
echo "One of the processes has already exited."
exit 1
fi
done
