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

### Source
[Get Docker](https://docs.docker.com/install/)  
[Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)  
[Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)  
[Get Started](https://docs.docker.com/get-started/)
