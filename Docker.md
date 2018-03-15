# Docker : Installation et Configuration

### Version des outils
Os / Tool | Version
:---: | :---:
CentOs | 7.4.1708
Docker Ce | 17.12.0

### Avant propos
Docker is available in two editions: Community Edition (CE) and Enterprise Edition (EE).

Docker Community Edition (CE) is ideal for developers and small teams looking to get started with Docker and experimenting with container-based apps. Docker CE has two update channels, stable and edge:

* Stable gives you reliable updates every quarter
* Edge gives you new features every month

### Procédure d'installation
La procédure d'installation de _Docker_ sur _CentOs 7_ se déroule de la façon suivante :   
Installez les prérequis.   
```sh
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```
Assurez-vous qu'ils n'existent aucune autres versions de docker sur la machine.   
```sh
sudo yum remove docker docker-common docker-selinux docker-engine
```
Assurez-vous que le repository extras est bien activé.   
```sh
sudo yum-config-manager --enable extras
```
Ajoutez le repository "docker".   
```sh
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
Installez et vérifiez que docker fonctionne correctement.   
```sh
sudo yum install docker-ce
sudo systemctl start docker
sudo docker run hello-world
```

### Procédure de post-Installation
Vérifiez les versions de docker disponible et celle installée.
```sh
yum list docker-ce --showduplicates | sort -r
```

Ajouter un utilisateur non sudoers qui aura les privilège d'utiliser docker
```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

Start docker on boot
```sh
sudo systemctl enable docker
```

### Get started
```
## List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

## Excecute Docker image
docker run hello-world

## List Docker images
docker image ls

## List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -a -q
```
```
docker build -t friendlyhello .                   # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello               # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello            # Same thing, but in detached mode
docker container ls                               # List all running containers
docker container ls -a                            # List all containers, even those not running
docker container stop <hash>                      # Gracefully stop the specified container
docker container kill <hash>                      # Force shutdown of the specified container
docker container rm <hash>                        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)  # Remove all containers
docker image ls -a                                # List all images on this machine
docker image rm <image id>                        # Remove specified image from this machine
docker image rm $(docker image ls -a -q)          # Remove all images from this machine
docker login                                      # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag        # Tag <image> for upload to registry
docker push username/repository:tag               # Upload tagged image to registry
docker run username/repository:tag                # Run image from a registry
```
```
docker stack ls                                 # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                               # List running services associated with an app
docker service ps <service>                     # List tasks associated with an app
docker inspect <task or container>              # Inspect task or container
docker container ls -q                          # List container IDs
docker stack rm <appname>                       # Tear down an application
docker swarm leave --force                      # Take down a single node swarm from the manager
```

### Source
[Get Docker](https://docs.docker.com/install/)  
[Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)  
[Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)  
[Get Started](https://docs.docker.com/get-started/)
