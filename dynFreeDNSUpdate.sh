##############################################################################
#
#  application name: dynFreeDNSUpdate
#  other files: dynFreeDNSUpdate.conf (keeps the last updated ip)
#               dynFreeDNSUpdate.log  (register date & time of the actualization)
#  Author: Hector Bejarano
#  Date: 01/05/2017
##############################################################################

if test -f /etc/freedns/dynFreeDNSUpdate.conf
then
  CacheIP=$(cat /etc/freedns/dynFreeDNSUpdate.conf)
fi
#echo $CacheIP
CurreIP=$(wget http://freedns.afraid.org/dynamic/check.php -o /dev/null -O /dev/stdout | grep Detected | cut -d : -f 2 | cut -d '<' -f 1 | tr -d " ")
#echo $CurreIP
if [ "$CurreIP" = "$CacheIP" ]
then
  # Both IP are equal
  echo "Update not required..."
else
  if [ ! "$CurreIP" = ""  ]
  then
    # The IP has change
    echo "Updating http://free.afraid.org with " $CurreIP
    wget [freedns direct URL] -o /dev/null -O /dev/stdout
    wget [CactusVPN validation URL] -o /dev/null -O /dev/stdout
    echo `date` "Updating IP from " $CacheIP " to " $CurreIP >> /etc/freedns/dynFreeDNSUpdate.log
  else
    echo "Current IP is blank"
  fi
fi
rm -f /etc/freedns/dynFreeDNSUpdate.conf
echo $CurreIP > /etc/freedns/dynFreeDNSUpdate.conf
