FROM rocker/rstudio:latest


RUN apt-get update && apt-get install -y gnupg2 apt-utils wget unixodbc-dev procps vim unzip git curl

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
	&& curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && apt-get update \
	&& ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
	&& ACCEPT_EULA=Y apt-get install -y mssql-tools \
	&& apt-get install -y unixodbc-dev

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Set up Configuration and Start Services
ADD user.sh /home/rstudio/user.sh
RUN chmod a+x /home/rstudio/user.sh
