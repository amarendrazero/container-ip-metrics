#Updated Dockerfile to Include Shell Script, extention of Project:container-ip

# Use the official Apache HTTP Server image
FROM httpd:2.4

# Install necessary tools
RUN apt-get update && apt-get install -y curl procps

# Copy the custom index.html file into Apache's document root
COPY index.html /usr/local/apache2/htdocs/index.html

# Add the shell script to the container
COPY collect_metrics.sh /usr/local/bin/collect_metrics.sh

# Set execute permissions on the shell script
RUN chmod +x /usr/local/bin/collect_metrics.sh

# Set ServerName globally to suppress AH00558 warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Expose port 80 for Apache
EXPOSE 80

# Run the script to collect IP address and metrics before starting Apache
CMD ["/bin/bash", "-c", "/usr/local/bin/collect_metrics.sh && httpd-foreground"]
