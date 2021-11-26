FROM        tykio/tyk-dashboard:v4.0rc7

MAINTAINER  Zaid Albirawi

RUN         echo "deb http://us.archive.ubuntu.com/ubuntu vivid main universe" >> sudo vim /etc/apt/sources.list
RUN         apt update
RUN         apt install -y curl jq procps

COPY        ./tyk-dashboard/scripts/wait-for-it.sh /bin/
COPY        ./tyk-dashboard/scripts/init.sh /bin/start.sh
RUN         chmod +x /bin/wait-for-it.sh
RUN         chmod +x /bin/start.sh

ENTRYPOINT  /bin/start.sh
