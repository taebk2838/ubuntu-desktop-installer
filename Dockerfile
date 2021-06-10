FROM ubuntu:bionic

# Install.
RUN \
 su && \
 apt-get update && \
 apt-get install wget -y && \
 apt-get install sudo -y && \
 apt-get install unzip -y && \
 apt-get install python3 -y && \
 sudo apt install python3-pip && \
 sudo pip install selenium -y && \
 wget https://chromedriver.storage.googleapis.com/91.0.4472.19/chromedriver_linux64.zip && \
 unzip chromedriver_linux64.zip && \
 chmod +x chromedriver && \
 sudo mv chromedriver /usr/local/bin/ && \
 wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
 sudo apt-get install apt-transport-https && \
 echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
 sudo apt-get update && \
 sudo apt-get install sublime-text && \
 sudo apt-get install python3-tk -y && \
 sudo apt-get install python-tk -y && \
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
