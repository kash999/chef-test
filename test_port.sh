

port=$(sudo netstat -t4lpn | grep 'nginx' | awk '{print $4}' | cut -d':' -f 2)
if [ $port == 80 ]; then
	echo "Nginx is on port 80"
else 
	echo "Nginx is not on port 80"
fi