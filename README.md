
#Project: 
To collect basic system metrics (like CPU usage, memory usage, etc.) and display along with container IP address on the web page.

*Step1. Dockerfile
Create the Dockerfile to set up Apache, collect the IP address and metrics, and prepare to serve these through a custom index.html file.

*Step2. Create index.html File (index.html)
Create an index.html file that will display the IP address and system metrics of the container.

*Step3. Create a Shell Script to Get IP Address and Metrics (collect_metrics.sh)
Create a shell script to collect the container's IP address and system metrics.

############# All 3 aboves files are created and available in repository.  ###################

*Step4. Build the Docker image using the Dockerfile:

     $docker build -t container-ip-metrics .

*Step5.Run the Docker container based on the image just built.
 
     $docker run -d -p 8080:80 --name container-ip-metrics container-ip-metrics

*Step6. Access the Web Page: 
        Open a web browser and navigate to see the dynamically displayed IP address and system metrics of the container.

    http://<your-ec2-instance-public-ip>:8080    #From EC2 system of AWS
          or
    http://localhost:8080                        #From local System

---------------------------------------------------------------------------------
Steps for Verification if needed:

  *Apache Logs: Check the Docker container logs for any errors or warnings:

     $docker logs container-ip-metrics
  *File Check: Ensure that the "/usr/local/apache2/htdocs/ip" and "/usr/local/apache2/htdocs/metrics" files contain the correct data.
