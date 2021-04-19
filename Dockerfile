FROM ubuntu:20.10

MAINTAINER RCHARI <techtaste.me>

ENV C9_PATH /work/c9sdk/
ENV TZ Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD proxy /work/proxy
ADD startup.sh /work/startup.sh

# Install git, make, gcc, g++ curl required for cloud9 setup
RUN apt-get update -y && apt install locales-all -y && apt-get install git -y && apt-get install git -y && \
    apt-get install gcc -y && apt-get install g++ -y && \
    apt-get install make -y && apt-get install python -y && \
    apt-get install nodejs -y && apt-get install curl -y && \
    # setup cloud9 ide and remove gcc, make, g++
    git clone https://github.com/rchari66/c9-core.git /work/c9sdk && \
    /work/c9sdk/scripts/install-sdk.sh && \
    apt-get remove gcc -y && apt-get remove g++ -y && \
    apt-get remove make -y && apt-get clean -y && apt-get autoremove -y

RUN chmod +x /work/startup.sh && chmod +x /work/proxy

EXPOSE 8182

CMD ["/bin/bash", "/work/startup.sh"]
