# Cytomine Community Edition 

Cytomine Community Edition is the open source edition of the Cytomine software.

This repo provide the new way to install Cytomine Community Edition, based on Docker compose.

**DISCLAIMER :** the version of Cytomine Community Edition installed using this procedure is **still in development**, and is made available **only for testing** purpose. **Do NOT use for production**, nor to migrate data from an older version of Cytomine.

## Install

Follow the installation procedure described here:
https://doc.cytomine.org/admin-guide/ce/ce-install

## In all cases

The password of the `admin` account is available in the cytomine.yml file : `cat cytomine.yml | grep ADMIN_PASSWORD:`

To learn how to use Cytomine please refer to the [user guide in our documentation](https://doc.cytomine.org/user-guide/).

Note : All Cytomine data is now stored in docker volumes (Postgres, Mongo, images and download buffers) and no mor on folders.
