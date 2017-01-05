# dynFreeDNSUpdate
Bash script to keep your dynamic DNS from [freedns.afraid.org](https://freedns.afraid.org) & [Cactus VPN](https://www.cactusvpn.com/) updated

Inspiration from: http://freedns.afraid.org/scripts/dnsactual.sh.txt

## Client requirement

- wget

## Installation

* Obtain your freedns key
Follow these instructions to obtain your "Direct URL": https://freedns.afraid.org/guide/dd-wrt/
From now own we will refer to this URL as your "freedns' direct URL"
* Obtain your CactusVPN key
Follow these instructions to obtain your "Validate IP link": https://www.cactusvpn.com/support/faq-smart-dns/#q14
From now own we will refer to this URL as your "CactusVPN's validation URL"
* Create a new folder under /etc/freedns
```
mkdir -p /etc/freedns/
```
* Download the DNS update script into your newly created folder; make the file executable
```
wget -O /etc/freedns/dynFreeDNSUpdate.sh https://raw.githubusercontent.com/hbjcr/dynFreeDNSUpdate/master/dynFreeDNSUpdate.sh
chmod +x /etc/freedns/dynFreeDNSUpdate.sh
```
* Modify your dynFreeDNSUpdate.sh
Edit your /etc/freedns/dynFreeDNSUpdate.sh using your favorite editor and include the following changes:
 - Replace the [freedns direct URL] placeholder (line #26) with your actual freedns' direct URL
 - Replace the [CactusVPN validation URL] placeholder (line #27) with your actual CactusVPN's validation URL
* Execute the script for the first time
```
./etc/freedns/dynFreeDNSUpdate.sh
```
At this point you should be able to query your /etc/freedns/dynFreeDNSUpdate.log file to debug the result
* Add a new job to cron
```
crontab -e
```
* Add a new entry to execute the job every 30 minutes
```
0,30 * * * * sh /etc/freedns/dynFreeDNSUpdate.sh
```
There is no need to restart the cron service, the job will be executed in 30 minutes
