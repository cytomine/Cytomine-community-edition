# Cytomine Community Edition 

Cytomine Community Edition is the new open source edition of the Cytomine software.

**DISCLAIMER :** this version of Cytomine is still in development, and is made available only for testing purpose. Do NOT use for production.

## How to launch a Cytomine local instance

This installation procedure is for Debian based Linux OS. 

You must have installed [Docker engine](https://docs.docker.com/engine/install/) and git, and have `root` permissions (sudo in Debian/Ubuntu).

1. Clone the repository: `git clone https://github.com/cytomine/cytomine-community-edition.git`
2. Move to the cloned repo: `cd cytomine-community-edition`
3. Edit the file `cytomine.yml` if you want to change default values (like URL or SMTP setup)
4. Launch the installer: `sudo docker run -v $(pwd):/install --user "$(id -u):$(id -g)" --rm -it cytomine/installer:latest deploy -s /install`
5. Launch cytomine: `sudo docker compose up -d`

As a side effect, this last command will write in your local `/etc/hosts` file.

If you have kept the default values your Cytomine will be available on http://cytomine.local

The password of the `admin` account is available in the cytomine.yml file : `cat cytomine.yml | greg ADMIN_PASSWORD:`

To learn how to use Cytomine please refer to the [user guide in our documentation](https://doc.cytomine.org/user-guide/).

Note : All Cytomine data is stored in docker volumes (Postgres, Mongo, images and download buffers).

DISCL
