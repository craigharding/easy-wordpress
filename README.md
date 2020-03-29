
# Easy Wordpress
> An easy implementation of Wordpress in Docker

Easy Wordpress will get your CMS up and ready in practically no time. As 
easy as 1 2 3.

## Features

This is a six container Wordpress CMS. 
* Nginx is the frontend and serves up the static content
* PHP is the main Wordpress engine
* MySql is the datbase
* Portainer gives you access and views into the containers
* MailHog is the dummy email server
* ngrok connects the project to the internet, with TLS

## Installing / Getting started

You will need a system with Docker installed and running. Also depends on 
docker-compose and openssl.

```shell
./gen-passwords.bash
docker-compose up -d
./update-urls.bash
```

And then ...

```shell
http://<yourProjectName>.localhost:8080
```

The gen-passwords.bash script uses openssl to generate three random 
passwords that are used to secure the mysql database and Portainer
access. These get copied into the easy Wordpress images.

The docker-compose command downloads the base images, creates custom images,
and starts your Wordpress project.

And the update-urls.bash script modifies the wp-config.php file to set the
Wordpress home and site URLs to whatever you use to access the site.

When you connect to the new site you go through the initial Wordpress
site configuration.

## Initial Configuration

Only docker, with docker-compose, and openssl are required to startup this
easy Wordpress project.

## Monitoring / Managing

Easy Wordpress includes a Portainer container. Access it using: 

```shell
http://<yourProjectName>.localhost:8080/portainer/
```

Login with "admin" and the contents of the portainer_admin_password file.

## ngrok

I like [ngrok](https://www.ngrok.com/docs). You can host this site from home using ngrok. Get your
ngrok URL this way:

```shell
docker attach <yourProjectName>_nGrok
```
And then connect ...

```shell
https://<someRandomNumber>.ngrok.io
```

## Email Setup

This environment comes with a [MailHog](https://github.com/mailhog/MailHog) dummy email server. You need to 
install a WP plugin to send emails to this container. Use the 
[Easy WP SMTP](https://www.hostinger.com/tutorials/wordpress/how-to-configure-wordpress-to-send-emails-using-smtp "How to Configure WordPress to Send Emails Using SMTP Plugin") plugin. Set the SMTP host to "mailhog", the port to 1025, no authentication, no encryption.

Access the MailHog web UI using:

```shell
http://<yourProjectName>.localhost:8080/mailhog/
```

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

If you have an [ngrok account](https://dashboard.ngrok.com/login "Login"), put your auth token in the ngrok.yml file along with any other customizations to get your utilize the features available to your [plan](https://www.ngrok.com/pricing "ngrok Plans").

## Contributing

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

## Licensing

"The code in this project is licensed under MIT license."
