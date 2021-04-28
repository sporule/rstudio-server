FROM rocker/rstudio:3.6.2


RUN apt-get update && apt-get install -y wget unixodbc-dev procps vim unzip git

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/*



# Set up Configuration and Start Services
ADD user.sh /home/rstudio/user.sh
RUN chmod a+x /home/rstudio/user.sh
