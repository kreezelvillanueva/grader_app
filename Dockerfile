FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl gpg git libssl-dev libreadline-dev zlib1g-dev 

RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB || \
    (curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -)

RUN curl -sSL https://get.rvm.io | bash -s stable && \
    /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install 2.5.1 && rvm use 2.5.1 --default"

RUN echo 'source /etc/profile.d/rvm.sh' >> /root/.bashrc

CMD ["/bin/bash"]
