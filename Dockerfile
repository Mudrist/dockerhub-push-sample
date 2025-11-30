# Use official Ubuntu base image
FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Enable SSL module (optional if using HTTPS later)
RUN a2enmod ssl

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Apache in foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
