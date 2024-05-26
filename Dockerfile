# Using the official MediaWiki image from Docker Hub
FROM mediawiki

# Set environment variables
ENV MEDIAWIKI_DB_TYPE=mysql \
    MEDIAWIKI_DB_HOST=db \
    MEDIAWIKI_DB_PORT=3306 \
    MEDIAWIKI_DB_NAME=my_wiki \
    MEDIAWIKI_DB_USER=root \
    MEDIAWIKI_DB_PASSWORD=password

# Expose port 80 for HTTP access
EXPOSE 80

# Start MediaWiki
CMD ["apache2-foreground"]


#Run the following command to build the Docker image:
#docker build -t mediawiki_img .


#To create a container using the built Docker image:

#docker run -d --name mediawiki_container -p 8080:80 mediawiki_img

#This command will create and start a container named mediawiki_container based on the mediawiki image, 
#exposing port 80 from the container to port 8080 on the host.
# We can access mediawiki_container instance by navigating to http://your_vm_ip:8080 in web browser.
