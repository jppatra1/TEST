#!/bin/bash
sv_name='192.168.0.105'
counter=0
echo " Started a new run " > server.log
while [ True ]
do
ping -c 3 $sv_name >/dev/null 2>&1
if [ $? -eq 0 ]
then
echo " Server is active , This is Counter $counter " >> server.log
sleep 10 ;
counter=`expr $counter + 1`
if [ $counter -eq 5 ]
then
exit 0 ;
else
continue ;
fi
else
echo " $sv_name is not active " >> server.log
exit 1 ;
fi
done
