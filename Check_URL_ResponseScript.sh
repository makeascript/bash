#!/bin/bash
link_url=http://www.google.com
while RES=$(curl -A "Web Check" -sL --connect-timeout 3 -w "%{http_code}\n" "$link_url" -o /dev/null)
 do
   if [  $RES -eq 200 ];then
       echo "Success" ;
       break
   elif [  $RES -eq 500 ];then
       echo "Fail" ;
       break
   elif [  $RES -eq 403 ];then
       echo "Fail" ;
       break
   elif [  $RES -eq 404 ];then
                echo "Found 404. Sleeping for 20 seconds..."
                sleep 20;
   fi
   sleep 20
done
