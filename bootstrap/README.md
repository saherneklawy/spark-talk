How to use boostrap files:

1. Upload both `install-jupyter-notebook-pySpark-1.4.sh` and `set-python-version.sh` to an S3 bucket
2. In the EMR creation wizard, make sure to add 2 bootstarap actions, the first using `set-python-version.sh` and the second being `install-jupyter-notebook-pySpark-1.4.sh`


After the cluster is up:

1. ssh to the master machine using the `hadoop` user. For ssh, make sure you use tunneling over port 8157. This is through the `-D` option in the ssh command, or the tunnelling/socks proxy option in putty.
2. start the python notebook using the following commands:
```
export IPYTHON_HOME=/home/hadoop
export PATH=$PATH:$IPYTHON_HOME/bin:/usr/lib/spark/bin:/usr/local/bin
export IPYTHON_OPTS="notebook --no-browser"
export MASTER=yarn-client
nohup pyspark --master yarn-client > /mnt/var/log/python_notebook.log &
```

Important Urls:

The important urls can be found at [https://github.com/JustGiving/raven-aws-emr-spark-jupyter#accessing-the-cluster-web-pages](https://github.com/JustGiving/raven-aws-emr-spark-jupyter#accessing-the-cluster-web-pages) and are as follows:

- Jupyter: [http://master-public-dns-name:8192](http://master-public-dns-name:8192)
- Hadoop ResourceManager: [http://master-public-dns-name:9026/](http://master-public-dns-name:9026/)
- Hadoop HDFS NameNode: [http://master-public-dns-name:9101/](http://master-public-dns-name:9101/)
- Spark Jobs: [http://master-public-dns-name:4040](http://master-public-dns-name:4040)


