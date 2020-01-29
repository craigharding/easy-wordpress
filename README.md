![Logo of the project](https://raw.githubusercontent.com/jehna/readme-best-practices/master/sample-logo.png)

# Easy Wordpress
> An easy implementation of Wordpress in Docker

Easy Wordpress will get your CMS up and ready in practically no time. As 
easy as 1 2 3.

## Installing / Getting started

You will need a system with Docker installed and running. Also depends on 
docker-compose.

Edit .env and set your project's name. 

Then...

```shell
./gen-passwords.bash
docker-compose up -d
./update-urls.bash
```

And finally...

```shell
http://<yourProjectName>.localhost:8080
```

Your project's name will be used in container, image, and volume labels.
Use "docker image ls", "docker volume ls", and "docker ps -a" to see 
the labels.

The gen-passwords.bash script uses openssl to generate three random 
passwords that are used to secure the mysql database and Portainer
access. These get copied into the easy Wordpress images.

The docker-compose command downloads the base images, creates custom images,
and starts your Wordpress project.

And the update-urls.bash script modifies the wp-config.php file to set the
Wordpress home and site URLs to whatever you use to access the site.

When you connect to the new site you go through the initial Wordpress
site configuration.

### Initial Configuration

Only docker, with docker-compose, and openssl are required to startup this
easy Wordpress project.

## Monitoring / Managing

Easy Wordpress includes a Portainer container. Access it using: 

```shell
http://<yourProjectName>.localhost:8080/portainer
```

Login with "admin" and the contents of the portainer_admin_password file.

## Customizing

You will want to modify the nginx.conf file to suit your CMS site's URL. 
Change the server_name parameter to match your URL.

I also recommend configuring your site's upload limit. There are settings 
for this in both nginx.conf and php.ini. My preference is to leave nginx
at unlimited and set the threshold in php.ini.

Once you have customized some settings you will need to rebuild the Docker
images:

```shell
docker-compose --build
```

### Deploying / Publishing

I like Ngrok. You can host this site from home using Ngrok.

Beyond that, the Docker documentation has fine instructions to backup, 
restore, and migrate your project to another server.

## Features

This is a four container Wordpress CMS. 
* Nginx is the frontend and serves up the static content
* PHP is the main Wordpress engine
* MySql is the datbase
* Portainer gives you access and views into the containers

## Contributing

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

## Licensing

"The code in this project is licensed under MIT license."
