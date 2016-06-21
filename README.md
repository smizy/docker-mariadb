# docker-mariadb

docker mariadb image 

* same as [official mariadb build](https://hub.docker.com/_/mariadb/) as possible
* su-exec instead of gosu
* use apk mariadb package based on alpine:3.4 image

## image size

```
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
smizy/mariadb          latest              d9f0fff77320        17 minutes ago      172.3 MB
mariadb                latest              0112f2662974        10 days ago         387.7 MB
```

## Usage

This image works in the same way the official `mariadb` docker image work.
README: [https://hub.docker.com/_/mariadb/](https://hub.docker.com/_/mariadb/)

```
# run container
$ docker run  -e MYSQL_ROOT_PASSWORD=mysecretpassword -p 3306:3306  smizy/mariadb
```