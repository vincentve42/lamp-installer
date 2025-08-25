#!/bin/bash

#select_os

echo "LAMP Installer";
echo "Please Select Your Os";
echo "1.Ubuntu";
echo "2.Arch";
echo "3.Fedora";
read -sp "Choose Your System OS : " os;

echo "";

if [ $os -eq 1 | 2 | 3 ]; then
    echo "Selecting $os";
else
    echo "You Must Choose Between 1-3"
    break;
fi
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
        
        pacman -Syu

        pacman -S apache

        systemctl start httpd

        ;;

        3)

        sudo dnf update

        sudo dnf install httpd -y

        sudo firewall-cmd --permanent --add-service=http

        sudo firewall-cmd --permanent --add-service=https

        sudo firewall-cmd --reload

        ;;
    esac

    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install Apache2 ";
        exit
    else
        echo "Ssudo dnf updateuccessfully installed Apache2";
    fi
}

# php

install_php(){

    
    case $os in 
        1)

        sudo apt-get update

        clear

        sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
        
        clear
        
        ;;
        2)

        pacman -Syu

        clear

        pacman -S php php-apache
        

        clear
        ;;

        3)

        sudo dnf update

        sudo dnf -y install httpd php php-cli php-php-gettext php-mbstring php-mcrypt php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip

        ;;
    esac

    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install PHP";
        exit
    else
        echo "Successfully installed PHP";
    fi
    

}

# mysql

install_mysql()
{
    case $os in 
        1)
        
        sudo apt-get update

        clear

        sudo apt install mysql-server
        sudo systemctl start mysql.service
        sudo mysql
        
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456789';
        exit
        clear
        
        ;;
        2)

        pacman -Syu

        clear

        pacman -S mariadb

        mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

        systemctl enable --now mariadb

        mysql --protocol=socket #run this command as root (e.g. prefixed with sudo)

        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456789';

        clear

        ;;

        3)
            sudo dnf install mariadb-server -y

            sudo systemctl start mariadb

            sudo systemctl enable mariadb

            sudo mysql_secure_installation

        ;;
    esac

    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install Mysql";
        exit
    else
        echo "Successfully installed Mysql";
    fi

}

# phpmyadmin

install_phpmyadmin()
{
    clear
    
     case $os in 
        1)

        sudo apt-get update

        sudo apt-get install phpmyadmin

        mysql -u root -p

        UNINSTALL COMPONENT "file://component_validate_password";
        clear

        ;;
        2)

        pacman -Syu

        pacman -S phpmyadmin

        ;;

        3)

        sudo dnf update
        
        sudo dnf -y install phpMyAdmin

        ;;


    esac
    if [ $? -ne 0 ]; then
        echo "Error : Failed To Install Phpmyadmin ";
        exit
    else
        echo "Successfully installed Phpmyadmin";
    fi
}

#install all

install_all()
{
    install_php
    install_apache2
    install_mysql
    install_phpmyadmin
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
        install_mysql
    elif [ $option -eq 4 ]; then 
        echo "Instaling Phpmyadmin....";
        install_phpmyadmin
    elif [ $option -eq 5 ]; then 
        echo "Instaling All....";
        install_all
    else
        echo "Exiting App.....";
        break
    fi
done