#!/bin/bash
#source function library
# source /etc/rc.d/init.d/functions
# source /opt/common/func/bash/load_functions
# get_environ
# RETVAL=0
RET_VAL=t
cat heap_output_file.txt | grep '%' | sed -e 's/%$//'|\

while read LINE
do
    SERVER=$(echo $LINE | awk '{print $1}');
    MEMORY=$(echo $LINE | awk '{print 100-$NF}');
    if [[ $MEMORY -ge 80 ]]
    then
        MSG="This is a test message, no need to take actions. On svli${RET_VAL}cja, the following managed server $SERVER heap memory threshold is reached 80%, current heap memory usage: $MEMORY%"
        echo $MSG
    fi
done