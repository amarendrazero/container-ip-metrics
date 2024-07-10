#To collect the container's IP address and system metrics.
#!/bin/bash
# Collect IP address
echo -e "HTTP/1.1 200 OK\n\n$(hostname -I | awk '{print $1}')" > /usr/local/apache2/htdocs/ip

# Collect system metrics
METRICS=$(top -b -n1 | head -n 10)
echo -e "HTTP/1.1 200 OK\n\n${METRICS}" > /usr/local/apache2/htdocs/metrics
