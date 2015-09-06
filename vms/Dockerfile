#FROM sequenceiq/spark:1.4.0
FROM jupyter/pyspark-notebook

RUN apt-get install -y r-base

RUN apt-get install -y libzmq3-dev
RUN R -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', 'http://cran.us.r-project.org')); IRkernel::installspec(user = FALSE)";

ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/bin:$PATH
ENV SPARK_LOCAL_IP localhost

COPY notebook.supervisord.conf /etc/supervisor/conf.d/notebook.conf


#curl -s https://bootstrap.pypa.io/get-pip.py | python
#RUN pip install "ipython[notebook]"
#RUN pip install requests numpy
#RUN pip install matplotlib
#RUN pip install pandas
#
#
#
#RUN bash <(curl -s https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh)
#
#RUN pip install test-helper
#
#COPY core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
#
#RUN apt-get update --fix-missing
#RUN apt-get -y install python-matplotlib
#
EXPOSE 8888

#CMD /etc/bootstrap.sh && /usr/local/spark/sbin/start-master.sh && IPYTHON_OPTS="notebook --no-browser --ip=0.0.0.0 --port 8888 --pylab inline" pyspark
