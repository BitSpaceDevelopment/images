FROM bradrydzewski/kerl

WORKDIR /home/ubuntu
USER ubuntu
ADD kerl.sh /etc/drone.d/

RUN kerl build R15B01 R15B01 && \
	sudo mkdir /opt/R15B01 && \
	sudo chown -R 1000:1000 /opt/R15B01 && \
	kerl install R15B01 /opt/R15B01