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
