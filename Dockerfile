FROM sumit/hadoop:latest
MAINTAINER Sumit Kumar Maji

#Install Flume
COPY apache-flume-1.7.0-bin.tar_2.gz /usr/local/apache-flume-1.7.0-bin.tar_2.gz
RUN tar -xzvf /usr/local/apache-flume-1.7.0-bin.tar_2.gz -C /usr/local/
RUN mv /usr/local/apache-flume-1.7.0-bin /usr/local/flume
RUN rm -rf apache-flume-1.7.0-bin.tar_2.gz

ENV JAVA_HOME /usr/local/jdk1.7
ENV PATH /usr/local/flume/bin:/usr/local/jdk1.7/bin:$PATH
ENV HADOOP_HOME /usr/local/hadoop

ADD start-flume.sh /usr/local/flume/bin/start-flume.sh
RUN chmod +x /usr/local/flume/bin/start-flume.sh
ADD flume.conf /var/tmp/flume.conf
RUN chown -R hduser:hadoop /usr/local/flume
#ADD run.sh /home/hduser/run.sh
#RUN chmod +x /home/hduser/run.sh
#RUN chown hduser:hadoop /home/hduser/run.sh
RUN su - hduser -c "echo 'export PATH=/usr/local/flume/bin:/usr/local/jdk1.7/bin:$PATH' >> /home/hduser/.bashrc"

EXPOSE 44444

#USER hduser
#WORKDIR /home/hduser/

#CMD su - hduser -c "/usr/local/hadoop/sbin/start-all.sh" \
#su - hduser -c "/usr/local/flume/bin/start-flume.sh"
#CMD [ "/bin/bash" ]
