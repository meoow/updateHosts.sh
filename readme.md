# Update Hosts
### Update the hosts file of your operating system.

####Install
Just grab the script, add executing permission, and run it.

####Usage
```sh
# Simply running it with root privilege will update Google's IP addresses, so you can use services provided by google again.
sudo ./updateHosts.sh
#or
su -c './updateHosts.sh'

# You can also pass additional file arguments to add more IP - Domain Name pairs, the files should be in same format as the hosts file.
sudo ./updateHosts.sh "fileA_hosts" ["fileB_hosts" ...]
```
