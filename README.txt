

Requiremtns 
Create a server and in sudo vagrant with password rest %admin with passowrd
create web app
Run on two boxes and load balance with nginx 
#####################
Mac os x / or runig web server on port 80
Please change ports to 8080 or something of your liking 


# Following are steps

Chef for configration management. 

Prerequisite:

vagrant 
chefdk
ruby >2.0
gem install inspec 


# Simple run 

$vagrant up

# Check the app 

$curl http://localhost

# For testing

$inspec exec test_site.rb

#if you want to test some integration test cd to cookbook/teestca run

$kithcen test



