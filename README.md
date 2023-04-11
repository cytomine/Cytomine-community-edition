# Cytomine Community Edition 



## How to launch a Cytomine local instance

1. Clone the repository: `git clone https://github.com/cytomine/community-edition.git`
2. Move to the cloned repo: `cd community-edition`
3. Launch the installer: `docker run -v $(pwd):/install --user "$(id -u):$(id -g)" --rm -it cytomine/installer:latest deploy -s /install`
4. Launch cytomine: `docker compose up -d`

As a side effect, this last command will write in your local `/etc/hosts` file.

All Cytomine data is stored in docker volumes (Postgres, Mongo, images and download buffers).