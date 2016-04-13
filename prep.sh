#!/bin/bash
echo Downloading some files
DIST=./distros
if [[ ! -d $DIST ]];then
  mkdir -p $DIST
fi
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.0.M4/bin/apache-tomcat-9.0.0.M4.tar.gz -O $DIST/apache-tomcat-9.0.0.M4.tar.gz
wget https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war -O $DIST/sample.war
