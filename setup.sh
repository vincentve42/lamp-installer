#!/bin/bash

mantap=1;

#if
while [ true ]; do
    echo "LAMP Installer";
    echo "1.Install Apache2";
    echo "2.Install PHP";
    echo "3.Install Mysql-server";
    echo "4.Install Phpmyadmin";
    echo "5.Install All";
    echo "6.Exit";

    
    # logic

    read option;
    if [ $option -eq 1 ]; then 
        echo "Installing Apache 2 ....";
    elif [ $option -eq 2 ]; then 
        echo "Installing PHP ....";
    elif [ $option -eq 3 ]; then 
        echo "Instaling Mysql....";
    elif [ $option -eq 4 ]; then 
        echo "Instaling Phpmyadmin....";
    elif [ $option -eq 5 ]; then 
        echo "Instaling All....";
    else
        echo "Exiting App.....";
        break
    fi
done
    
# apache2

install_apache2(){
    sudo apt-get update
}

# php

install_php(){
    sudo apt-get update

}

# mysql

install_mysql()
{
    sudo apt-get update

}

# phpmyadmin

install_phpmyadmin()
{
    sudo apt-get update
}

#install all

install_all()
{
    sudo apt-get update
}