#!/bin/bash
echo Downloading some files
DIST=./distros
HTML=./html
if [[ ! -d $DIST ]];then
  mkdir -p $DIST
fi
if [[ ! -d $HTML/js ]];then
  mkdir -p $HTML/js
fi
if [[ ! -d $HTML/css ]];then
  mkdir -p $HTML/css
fi
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.0.M6/bin/apache-tomcat-9.0.0.M6.tar.gz -O $DIST/apache-tomcat-9.0.0.M6.tar.gz
wget https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war -O $DIST/sample.war
wget http://wiki.dreyou.org/pub/misc/spring-boot/sampledeploy-0.0.1-SNAPSHOT.war -O $DIST/sampledeploy.war
wget http://search.maven.org/remotecontent?filepath=org/jolokia/jolokia-war/1.3.3/jolokia-war-1.3.3.war -O $DIST/jolokia.war
wget https://github.com/rhuss/jolokia/releases/download/v1.3.3/jolokia-min.js -O $HTML/js/jolokia-min.js
wget https://github.com/rhuss/jolokia/releases/download/v1.3.3/jolokia-simple-min.js -O $HTML/js/jolokia-simple-min.js
wget https://raw.githubusercontent.com/douglascrockford/JSON-js/master/json2.js -O $HTML/js/json2.js
wget https://code.jquery.com/jquery-1.12.3.min.js -O $HTML/js/jquery.min.js
wget https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css -O $HTML/css/bootstrap-theme.min.css
wget https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css -O $HTML/css/bootstrap.min.css
