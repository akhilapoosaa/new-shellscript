#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""  
#message variable to store the output
# -h option is used to display the disk usage in human-readable format
# -T option is used to display the file system type
# grep -vE option is used to avoid the lines that contain the string 'tmp' or 'File'
# -v option is used to invert the match
# -E option is used to enable extended regular expressions

while IFS= read line
do 
      usage=$(echo $line | awk '{print %6F}' | cut -d % -f1)
      partition=$(echo $line | awk '{print $1F}')
      if [ $usage -ge $DISK_THRESHOLD ]
      then
          message+="Disk usage is above threshold for partition $partition: $usage"
      fi 
done <<< "$DISK_USAGE"  
echo "Message: $message"
# <<< is used to read the output of the command into a variable      