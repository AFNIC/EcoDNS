# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Create the SSH directory
RUN mkdir /var/run/sshd

# Set the root password for SSH access
RUN echo 'root:rootpassword' | chpasswd

# Allow root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Disable SSH key-based authentication
RUN sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication no/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]
