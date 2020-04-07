#!/bin/bash

#================DALORADIUS=========================
sed -i "s/$configValues\['CONFIG_DB_ENGINE'\] = 'mysqli';/$configValues\['CONFIG_DB_ENGINE'\] = '"$RADIUS_DB_ENGINE"';/" /var/www/daloradius/library/daloradius.conf.php
sed -i "s/$configValues\['CONFIG_DB_HOST'\] = 'localhost';/$configValues\['CONFIG_DB_HOST'\] = '"$RADIUS_DB_HOST"';/" /var/www/daloradius/library/daloradius.conf.php
sed -i "s/$configValues\['CONFIG_DB_PORT'\] = '3306';/$configValues\['CONFIG_DB_PORT'\] = '"$RADIUS_DB_PORT"';/" /var/www/daloradius/library/daloradius.conf.php
sed -i "s/$configValues\['CONFIG_DB_USER'\] = 'root';/$configValues\['CONFIG_DB_USER'\] = '"$RADIUS_DB_USER"';/" /var/www/daloradius/library/daloradius.conf.php
sed -i "s/$configValues\['CONFIG_DB_PASS'\] = '';/$configValues\['CONFIG_DB_PASS'\] = '"$RADIUS_DB_PASS"';/" /var/www/daloradius/library/daloradius.conf.php
sed -i "s/$configValues\['CONFIG_DB_NAME'\] = 'radius';/$configValues\['CONFIG_DB_NAME'\] = '"$RADIUS_DB_NAME"';/" /var/www/daloradius/library/daloradius.conf.php

mkdir /run/php