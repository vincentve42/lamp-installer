#!/bin/bash

#select_os

echo "LAMP Installer";
echo "Please Select Your Os";
echo "1.Ubuntu";
echo "2.Arch";
echo "3.Fedora";
read -sp "Choose Your System OS : " os;

echo "";

clear

# ubuntu lamp-installer

mantap=1;

    
# apache2

install_apache2(){
    case $os in 
        1)
        
        sudo apt-get update

        sudo apt-get install apache2

        sudo ufw allow '80'

        sudo ufw allow '443'

        sudo ufw allow '8080'

        systemctl restart apache2
        
        clear

        ;;

        2)
        sudo apt update

        sudo apt install apache2

        sudo ufw allow '80'

        sudo ufw allow '443'

        sudo ufw allow '8080'

        systemctl start apache2
        
        clear
        ;;
        3)
        sudo apt update

        sudo apt install apache2

        sudo ufw allow '80'

        sudo ufw allow '443'

        sudo ufw allow '8080'

        systemctl start apache2
        
        clear
        ;;

    esac

    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install Apache2 ";
    else
        echo "Successfully installed Apache2";
    fi
}

# php

install_php(){

    case $os in 
        1)
        
        clear

        echo "Select PHP Version to Install 8.x";

        read -sp "Select Custom PHP Version [y/n]" custom_php;

        sudo apt-get update

        sudo apt-get install php8.4
        
        clear
        
        ;;
    esac

    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install PHP";
    else
        echo "Successfully installed PHP";
    fi
    

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

# installer

#while

while [ true ]; do
    echo "1.Install Apache2";
    echo "2.Install PHP";
    echo "3.Install Mysql-server";
    echo "4.Install Phpmyadmin";
    echo "5.Install All";
    echo "6.Exit";
    

    # logic

    read -sp "Select Software to Install : " option;

    echo "";

    # condition

    if [ $option -eq 1 ]; then 
        echo "Installing Apache 2 ....";
        install_apache2
    elif [ $option -eq 2 ]; then 
        echo "Installing PHP ....";
        install_php
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
