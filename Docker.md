Docker : Installation et Configuration
======

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
Assurez-vous qu'ils n'existent aucune autres versions de _Docker_ sur la machine.
```sh
sudo yum remove docker docker-common docker-selinux docker-engine
```
Assurez-vous que le repository _extras_ est bien activé.
```sh
sudo yum-config-manager --enable extras
```
Ajoutez le repository _Docker_.
```sh
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
Installez et vérifiez que _Docker_ fonctionne correctement.
```sh
sudo yum install docker-ce
sudo systemctl start docker
sudo docker run hello-world
```

### Procédure de post-installation
Vérifiez les versions de _Docker_ disponible et celle installée.
```sh
yum list docker-ce --showduplicates | sort -r
```
Ajouter un utilisateur non _sudoers_ qui aura les privilège d'utiliser _Docker_.
```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```
Activer _Docker_ au démarrage de Linux.
```sh
sudo systemctl enable docker
```

### Docker concepts
A container runs natively on Linux and shares the kernel of the host machine with other containers. It runs a discrete process, taking no more memory than any other executable, making it lightweight.  
By contrast, a virtual machine (VM) runs a full-blown “guest” operating system with virtual access to host resources through a hypervisor. In general, VMs provide an environment with more resources than most applications need.  

Container | Vms
:---: | :---:
![Container](/img/dck-001.png) | ![Vms](/img/dck-002.png)

### Tutoriels Dockers
#### Docker : Get Started
##### Part 1 Orientation
**Ce qu'il faut retenir :**  
Un simple `docker run nom-de-l'image` permet de "tirer" une image depuis un repository et de "démarrer" un container.  
Un container est l'instanciation d'une image.  
Pour manager les containers on utilise la commande `docker container`.  
Pour manager les images on utilise la commande `docker image` manage les images.  

**Cheat sheet :**   
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
##### Part 2 Containers
**Ce qu'il faut retenir :**  
Pour créer un container on doit le builder depuis fichier nommé _Dockerfile_.  
Pour construire une image on utilise la commande `docker build`.  
Une image construite en local est disponible via la commande `docker image ls`  
Pour partager une image on commence par la taguer via `docker tag image username/repository:tag`  
On la push ensuite sur un repository via `docker push username/repository:tag`  

**Cheat sheet :**  
```
docker build -t friendlyhello .                  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello              # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello           # Same thing, but in detached mode
docker container ls                              # List all running containers
docker container ls -a                           # List all containers, even those not running
docker container stop <hash>                     # Gracefully stop the specified container
docker container kill <hash>                     # Force shutdown of the specified container
docker container rm <hash>                       # Remove specified container from this machine
docker container rm $(docker container ls -a -q) # Remove all containers
docker image ls -a                               # List all images on this machine
docker image rm <image id>                       # Remove specified image from this machine
docker image rm $(docker image ls -a -q)         # Remove all images from this machine
docker login                                     # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag       # Tag <image> for upload to registry
docker push username/repository:tag              # Upload tagged image to registry
docker run username/repository:tag               # Run image from a registry
```
##### Part 3 Services
**Ce qu'il faut retenir :**  
Un service est un container codifié par un fichier _docker-compose.yml_ qui définit comment il doit être instancié.  
Un fichier _docker-compose.yml_ se déploie via la commande `docker stack deploy -c docker-compose.yml nom_de_service`.  
Pour pouvoir déployer une _stack_ il faut instancier un cluster _Swarm_ (Minimun un node).
On instancie un cluster _Swarm_ avec la commande `docker swarm init`.  
Pour manager les services on utilise la commande  `docker service`.  

**Cheat sheet :**  
```
docker stack ls                                  # List stacks or apps
docker stack deploy -c <composefile> <appname>   # Run the specified Compose file
docker service ls                                # List running services associated with an app
docker service ps <service>                      # List tasks associated with an app
docker inspect <task or container>               # Inspect task or container
docker container ls -q                           # List container IDs
docker stack rm <appname>                        # Tear down an application
docker swarm leave --force                       # Take down a single node swarm from the manager
```
##### Part 4 Swarms
**Ce qu'il faut retenir :**  
Un _Swarm_ est un ensemble de machine qui forment un cluster docker.  
On initialise un _Swarm_ avec la commande `docker swarm init`  
Celle ci retourne un id qui permet aux autres instances de rejoindre le cluster _Swarm_ via la commande `docker swarm join --token SWMTKN-1-sha256 @ip_du_master:2377`  
_Swarm_ embarque tout un tas de service natif comme un load balanceur, simplifiant la scalabilité et la configuration d'application en mode distribué.

**Cheat sheet :**  
```
docker-machine create --driver virtualbox myvm1                                                     # Create a VM (Mac, Win7, Linux)
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1                            # Win10
docker-machine env myvm1                                                                            # View basic information about your node
docker-machine ssh myvm1 "docker node ls"                                                           # List the nodes in your swarm
docker-machine ssh myvm1 "docker node inspect <node ID>"                                            # Inspect a node
docker-machine ssh myvm1 "docker swarm join-token -q worker"                                        # View join token
docker-machine ssh myvm1                                                                            # Open an SSH session with the VM; type "exit" to end
docker node ls                                                                                      # View nodes in swarm (while logged on to manager)
docker-machine ssh myvm2 "docker swarm leave"                                                       # Make the worker leave the swarm
docker-machine ssh myvm1 "docker swarm leave -f"                                                    # Make master leave, kill swarm
docker-machine ls                                                                                   # list VMs, asterisk shows which VM this shell is talking to
docker-machine start myvm1                                                                          # Start a VM that is currently not running
docker-machine env myvm1                                                                            # show environment variables and command for myvm1
eval $(docker-machine env myvm1)                                                                    # Mac command to connect shell to myvm1
& "C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe" env myvm1 | Invoke-Expression   # Windows command to connect shell to myvm1
docker stack deploy -c <file> <app>                                                                 # Deploy an app; command shell must be set to talk to manager (myvm1), uses local Compose file
docker-machine scp docker-compose.yml myvm1:~                                                       # Copy file to node's home dir (only required if you use ssh to connect to manager and deploy the app)
docker-machine ssh myvm1 "docker stack deploy -c <file> <app>"                                      # Deploy an app using ssh (you must have first copied the Compose file to myvm1)
eval $(docker-machine env -u)                                                                       # Disconnect shell from VMs, use native docker
docker-machine stop $(docker-machine ls -q)                                                         # Stop all running VMs
docker-machine rm $(docker-machine ls -q)                                                           # Delete all VMs and their disk images
```

##### Part 5 Stacks
**Ce qu'il faut retenir :**  
Une _Stack_ est définit comme suit : A stack is a group of interrelated services that share dependencies, and can be orchestrated and scaled together. A single stack is capable of defining and coordinating the functionality of an entire application (though very complex applications may want to use multiple stacks).   
Ajouter un _service_ dans une _Stack_ revient à ajouter un payload dans la partie services du fichier _docker-compose.yml_.
```yaml
version: "3"
services:
  web:
    # replace username/repo:tag with your name and image details
    image: username/repo:tag
    deploy:
      replicas: 5
      restart_policy:
        condition: on-failure
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
    ports:
      - "80:80"
    networks:
      - webnet
  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints: [node.role == manager]
    networks:
      - webnet
  redis:
    image: redis
    ports:
      - "6379:6379"
    volumes:
      - "/home/docker/data:/data"
    deploy:
      placement:
        constraints: [node.role == manager]
    command: redis-server --appendonly yes
    networks:
      - webnet
networks:
  webnet:
```
Pour manager les stacks on utilise la commande `docker stack`.  
Pour persister les données d'un container on utilise les volumes. Il est nécéssaire de connaitre la manière dont ont été buildés les images qu'on utilise pour persister les données et exposer les services.

##### Part 6 Deploy your app
**Ce qu'il faut retenir :**  
Rien de plus que ce qui est présenté en part 3/4/5. Il faut s'assurer que l'ensemble des machines est accès à un registry.   

**Cheat sheet :**  
```
docker stack deploy -c docker-compose.yml getstartedlab

Creating network getstartedlab_webnet
Creating service getstartedlab_web
Creating service getstartedlab_visualizer
Creating service getstartedlab_redis

[getstartedlab] ~ $ docker node ls
ID                            HOSTNAME                                      STATUS              AVAILABILITY        MANAGER STATUS
9442yi1zie2l34lj01frj3lsn     ip-172-31-5-208.us-west-1.compute.internal    Ready               Active              
jr02vg153pfx6jr0j66624e8a     ip-172-31-6-237.us-west-1.compute.internal    Ready               Active              
thpgwmoz3qefdvfzp7d9wzfvi     ip-172-31-18-121.us-west-1.compute.internal   Ready               Active              
n2bsny0r2b8fey6013kwnom3m *   ip-172-31-20-217.us-west-1.compute.internal   Ready               Active              Leader   

[getstartedlab] ~/sandbox/getstart $ docker service ls
ID                  NAME                       MODE                REPLICAS            IMAGE                             PORTS
x3jyx6uukog9        dockercloud-server-proxy   global              1/1                 dockercloud/server-proxy          *:2376->2376/tcp
ioipby1vcxzm        getstartedlab_redis        replicated          0/1                 redis:latest                      *:6379->6379/tcp
u5cxv7ppv5o0        getstartedlab_visualizer   replicated          0/1                 dockersamples/visualizer:stable   *:8080->8080/tcp
vy7n2piyqrtr        getstartedlab_web          replicated          5/5                 sam/getstarted:part6    *:80->80/tcp

[getstartedlab] ~/sandbox/getstart $ docker service ps vy7n2piyqrtr
ID                  NAME                  IMAGE                            NODE                                          DESIRED STATE       CURRENT STATE            ERROR               PORTS
qrcd4a9lvjel        getstartedlab_web.1   sam/getstarted:part6   ip-172-31-5-208.us-west-1.compute.internal    Running             Running 20 seconds ago                       
sknya8t4m51u        getstartedlab_web.2   sam/getstarted:part6   ip-172-31-6-237.us-west-1.compute.internal    Running             Running 17 seconds ago                       
ia730lfnrslg        getstartedlab_web.3   sam/getstarted:part6   ip-172-31-20-217.us-west-1.compute.internal   Running             Running 21 seconds ago                       
1edaa97h9u4k        getstartedlab_web.4   sam/getstarted:part6   ip-172-31-18-121.us-west-1.compute.internal   Running             Running 21 seconds ago                       
uh64ez6ahuew        getstartedlab_web.5   sam/getstarted:part6   ip-172-31-18-121.us-west-1.compute.internal   Running             Running 22 seconds ago        
```

##### Annexe sur docker-machine
Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands. You can use Machine to create Docker hosts on your local Mac or Windows box, on your company network, in your data center, or on cloud providers like Azure, AWS, or Digital Ocean.

Using docker-machine commands, you can start, inspect, stop, and restart a managed host, upgrade the Docker client and daemon, and configure a Docker client to talk to your host.

#### Katacoda : Get Started

### Source
[Get Docker](https://docs.docker.com/install/)  
[Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)  
[Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)  
[Get Started](https://docs.docker.com/get-started/)  
[Docker Machine](https://docs.docker.com/machine/overview/)
