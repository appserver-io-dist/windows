#!/bin/sh

# install ant and other dependencies
yum -y install ant ant-contrib git;

# download jmeter and make it usable
wget -q ${jmeter.download.url};
tar -xzf ./${jmeter.package.name}${jmeter.package.extension} -C ${jmeter.vagrant.basedir} >> /dev/null;