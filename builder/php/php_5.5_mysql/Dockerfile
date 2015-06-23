FROM bradrydzewski/phpenv

WORKDIR /home/ubuntu
USER ubuntu
ADD rbenv.sh /etc/drone.d/
ADD phpenv.sh /etc/drone.d/
ENV HOME /home/ubuntu

# install default php version
RUN export PATH=$PATH:/home/ubuntu/.phpenv/bin                                 && \
    php-build -i development --pear 5.5.6 /home/ubuntu/.phpenv/versions/5.5.6  && \
    sed -i  's/128M/512M/' /home/ubuntu/.phpenv/versions/5.5.6/etc/php.ini     && \
    phpenv init -                                                              && \
    phpenv rehash                                                              && \
    phpenv global 5.5.6                                                        && \
    curl -sS https://getcomposer.org/installer | php                           && \
    sudo mv composer.phar /usr/local/bin/composer                              && \
    sudo chmod +x /usr/local/bin/composer                                      && \
    sudo pecl -q install mongo                                                 && \
    sudo echo "extension=mongo.so" | sudo tee /home/ubuntu/.phpenv/versions/5.5.6/etc/php.ini
# update composer and install php5 modules
RUN sudo apt-get -y install php5-mysql                                         && \
    sudo apt-get -y install php5-curl                                          && \
    sudo echo "extension=mysql.so" | sudo tee /home/ubuntu/.phpenv/versions/5.5.6/etc/php.ini
# Install local MySQL server
RUN sudo apt-get update                                                             && \
    sudo apt-get install -y vim curl python-software-properties                     && \
    sudo sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf                  && \
    echo mysql-server mysql-server/root_password password root | sudo debconf-set-selections && \
    echo mysql-server mysql-server/root_password_again password root | sudo debconf-set-selections && \
    sudo apt-get install -y mysql-server                                            && \
    mysql -uroot -proot -e "CREATE DATABASE test;"                                  && \
    mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;" && \
    sudo /etc/init.d/mysql restart
