#! /bin/bash

###This a script to generate a health report about the server and STINGRAY softwere 

###START
# create report file
sudo touch SRV_report.txt
## get basic server info
echo "------------------------" >>SRV_report.txt
echo "This report is generated at ">> SRV_report.txt
date >> SRV_report.txt
echo "The server:" >> SRV_report.txt
hostname >> SRV_report.txt
echo "is up for:" >> SRV_report.txt
uptime -p >>SRV_report.txt
echo "------------------------" >>SRV_report.txt
echo "OS and softwere version" >>SRV_report.txt
echo "------------------------" >>SRV_report.txt
cat /etc/os-release >> SRV_report.txt
fastdpi -ve >> SRV_report.txt
echo "Hardware state" >> SRV_report.txt
lscpu >> SRV_report.txt
free -h >> SRV_report.txt
lspci|grep net >> SRV_report.txt
service fastdpi status >> SRV_report.txt
echo "---------------------------" >>SRV_report.txt
echo "looking for core dump files" >> SRV_report.txt
echo "---------------------------" >>SRV_report.txt
ls /home/*zst >> SRV_report.txt

###get current server config
echo "------------------------" >>SRV_report.txt
echo "current dpi config" >>SRV_report.txt
echo "------------------------" >>SRV_report.txt
cat /etc/dpi/fastdpi.conf >> SRV_report.txt 
cat /etc/dpi/fastpcrf.conf|grep -v '^\s*$\|^\s*\#' >> SRV_report.txt

echo "------------------------" >>SRV_report.txt
tar -cvzf SRV_archived_logs.tar /var/log/dpi/ && echo "log files are archived in the current working directory" >>SRV_report.txt
echo "------------------------" >>SRV_report.txt

