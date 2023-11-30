# install DATA BASE 
sudo apt-get -y install postgresql
sudo service postgresql start
access psql and create a database name synthea
import from file with command 
`sudo -u postgres psql synthea < dump.sql`