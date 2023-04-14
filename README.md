# Cytomine Community Edition 

Cytomine Community Edition is the open source edition of the Cytomine software.

This repo provide the new way to install Cytomine Community Edition, based on Docker compose.

**DISCLAIMER :** the version of Cytomine Community Edition installed using this procedure is **still in development**, and is made available **only for testing** purpose. **Do NOT use for production**, nor to migrate data from an older version of Cytomine.

## How to launch a Cytomine local instance

This installation procedure is for desktop or laptop computers running a Debian based Linux operating systems. 

You must have installed [Docker engine](https://docs.docker.com/engine/install/) and git, and have `root` permissions (sudo in Debian/Ubuntu).

1. Clone the repository on your computer: `git clone https://github.com/cytomine/Cytomine-community-edition.git`
2. Go into the cloned folder: `cd Cytomine-community-edition`
3. Edit the file `cytomine.yml` if you want to change default values (like URLs and/or SMTP setup)
4. Launch the installer. This will create all the folders and files necessary to launch Cytomine: `sudo docker run -v $(pwd):/install --user "$(id -u):$(id -g)" --rm -it cytomine/installer:latest deploy -s /install`
5. Launch cytomine: `sudo docker compose up -d`. As a side effect, this last command will write in your local `/etc/hosts` file.

If you have kept the default values your Cytomine is now available on http://cytomine.local

## How to launch a Cytomine distant instance

This installation procedure is for servers running a Debian based Linux operating systems. 

You must have installed [Docker engine](https://docs.docker.com/engine/install/) and git, and have `root` permissions (sudo in Debian/Ubuntu).

You also need to have set 3 URLs in your Domain Name Server. In this example it will be example.com, ims.example.com and upload.example.com.

1. Clone the repository on your server: `git clone https://github.com/cytomine/Cytomine-community-edition.git`
2. Go into the cloned folder: `cd Cytomine-community-edition`
3. Comment all sections related to `etc_hosts_rewriter` in `cytomine.yml` and `docker-compose.yml`
4. Edit the file `cytomine.yml` if you want to change default values (like URLs and/or SMTP setup)
5. Edit the file `configs/nginx/etc/nginx/nginx.conf.sample` with the correct information if you want SSL encryption directly in your Cytomine
6. Launch the installer. This will create all the folders and files necessary to launch Cytomine: `sudo docker run -v $(pwd):/install --user "$(id -u):$(id -g)" --rm -it cytomine/installer:latest deploy -s /install`
7. Launch cytomine: `sudo docker compose up -d`

Your Cytomine should be accessible on the main URL you have set for CORE in your `cytomine.yml`

## In all cases

The password of the `admin` account is available in the cytomine.yml file : `cat cytomine.yml | greg ADMIN_PASSWORD:`

To learn how to use Cytomine please refer to the [user guide in our documentation](https://doc.cytomine.org/user-guide/).

Note : All Cytomine data is now stored in docker volumes (Postgres, Mongo, images and download buffers) and no mor on folders.
