FROM centos:7

RUN yum -y install socat openssh-server sudo initscripts

# Generate host keys
RUN sshd-keygen

# Create users
RUN useradd -m -U caleb
RUN useradd -m -U john

# Setup user SSH directories
RUN mkdir -p /home/caleb/.ssh /home/john/.ssh
COPY id_rsa.pub /home/caleb/.ssh/authorized_keys
RUN chown -R caleb:caleb /home/caleb && chown -R john:john /home/john
RUN chmod 600 /home/caleb/.ssh/authorized_keys

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
