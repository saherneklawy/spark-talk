FROM stravanni/ipython-pyspark-cineca

RUN pip install test-helper

COPY core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml

RUN apt-get update --fix-missing
RUN apt-get -y install python-matplotlib

EXPOSE 8888

#CMD /etc/bootstrap.sh && /usr/local/spark/sbin/start-master.sh && IPYTHON_OPTS="notebook --no-browser --ip=0.0.0.0 --port 8888 --pylab inline" pyspark
