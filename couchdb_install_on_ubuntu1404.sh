# Install CouchDB on Ubuntu 14.04

sudo apt-get update

# manages source resources
sudo apt-get install software-properties-common -y

# PPA enables installation of package
sudo add-apt-repository ppa:couchdb/stable -y
sudo apt-get update

# install couchdb
sudo apt-get install couchdb -y

# check if couchdb is installed and running
curl localhost:5984

# security

sudo stop couchdb

# installation of couchdb creates a `couchdb` user and group
# change ownership of files from root to couchdb
sudo chown -R couchdb:couchdb /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb

# change permissions so couchdb user and group have full permissions and all other users have no permissions
sudo chmod -R 0770 /usr/lib/couchdb /usr/share/couchdb /etc/couchdb /usr/bin/couchdb

# start couchdb
sudo start couchdb
