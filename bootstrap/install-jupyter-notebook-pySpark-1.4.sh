# Copyright (c) 2015 Giving.com, trading as JustGiving. Licensed under the Apache License (v2.0).
#!/bin/bash
set -x -e

sudo /usr/sbin/alternatives --set python /usr/bin/python2.7
sudo yum install -y tmux htop

#Installing iPython Notebook
if grep isMaster /mnt/var/lib/info/instance.json | grep true;
then
#cd /home/hadoop
#sudo pip install virtualenv
#mkdir IPythonNB
#cd IPythonNB
#/usr/local/bin/virtualenv -p /usr/bin/python2.7 venv
#source venv/bin/activate



#Install ipython and dependency
sudo pip install --upgrade pip &&
sudo ln -s /usr/local/bin/pip /usr/bin/pip &&
sudo pip install "ipython[notebook]" &&
sudo pip install requests numpy &&
sudo pip install matplotlib

export PATH=$PATH:/usr/local/bin

#Create profile 	
ipython profile create default

#Run on master /slave based on configuration
echo "c = get_config()" >  /home/hadoop/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.ip = '*'" >>  /home/hadoop/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.open_browser = False"  >>  /home/hadoop/.ipython/profile_default/ipython_notebook_config.py
echo "c.NotebookApp.port = 8192" >>  /home/hadoop/.ipython/profile_default/ipython_notebook_config.py


# installing R jupyter kernel
sudo yum-config-manager --add-repo http://download.opensuse.org/repositories/home:/fengshuo:/zeromq/CentOS_CentOS-6/home:fengshuo:zeromq.repo
sudo yum install -y zeromq
sudo yum install -y zeromq-devel libczmq1 libczmq1-devel

# in R:
sudo PATH=$PATH:/usr/local/bin R -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', 'http://cran.us.r-project.org')); IRkernel::installspec(user = FALSE)";


#starting ipython notebook with pyspark interactive support.
export IPYTHON_HOME=/home/hadoop
export PATH=$PATH:$IPYTHON_HOME/bin
export IPYTHON_OPTS="notebook --no-browser"
export MASTER=yarn-client
nohup pyspark --master yarn-client > /mnt/var/log/python_notebook.log &
fi


## running SparkR right
## add this to ~/.Rpofile
#Sys.setenv(SPARK_HOME="/usr/lib/spark")
#.libPaths(c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"), .libPaths()))
#library(SparkR)
#sc <- sparkR.init(master="local")
