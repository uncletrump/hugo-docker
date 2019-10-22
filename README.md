### forked from [orianna-zzo/hugo-docker-dev](https://github.com/orianna-zzo/hugo-docker-dev)

## Get the Image
There are two ways to get the docker image. One is to pull it from docker hub, the other is to build it by yourself. 

### From Docker Hub
[Here](https://hub.docker.com/r/ouhei/hugo/) is the image on the Docker Hub. The compressed size is only 43.03MB. 
You can simply pull the latest image by:

```shell
$ docker pull ouhei/hugo:latest
```

Check the image, and this image is only 111MB now:
```shell
$ docker images
```

### Build the Image
If you have pulled the image from Docker Hub, you can skip this part.

Check `HUGO_VERSION` in the Dockfile compared to [Hugo](https://github.com/gohugoio/hugo). Modify `HUGO_VERSION` if it is not the latest version.

Go to the repo's root and open the terminal:
```shell
docker build -f Dockerfile -t <docker_user/rep_name>:<tag> .
```
`-t` tags the image and one image can be tagged several times.

`.` means from this directory.

e.g.
```shell
docker build -f Dockerfile -t ouhei/hugo:latest .
```

Check the image, and this image is only 111MB now:
```shell
$ docker images
```

## Run the Container
Run the docker container:
```shell
$ docker run -it --name <container name> -v [<host mount point>:]/blog -p 1313:1313 <docker_user/rep_name>:<tag>
```
`--name` defines the name of the container.

`-v` mounts the local directory to the docker.

`-p` defines the port mapping.

`-i` means interactive.

`-t` means to open a terminal.

e.g.
```shell
$ docker run -it --name hugo -v ~/blog:/blog -p 1313:1313 ouhei/hugo:latest
```

## Tag Version
### v0.58.3: == latest
Hugo: v0.58.3. Alpine: v3.10






