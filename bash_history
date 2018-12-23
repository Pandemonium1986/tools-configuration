git update-index --chmod=+x src/script/version.sh
curl --insecure -v -u admin:mdp --upload-file ./file https://nexus/repository/raw-releases/bin/
sudo vim /etc/modprobe.d/ipv6.conf
ssh-keygen -t ecdsa -b 384 -C Pandemonium -o

owncloud :
---------------------------------------------------
277  vim /etc/apt/sources.list.d/owncloud.list
278  php -m
279  sudo apt install -y apache2 mariadb-server libapache2-mod-php7.0     php7.0-gd php7.0-json php7.0-mysql php7.0-curl     php7.0-intl php7.0-mcrypt php-imagick     php7.0-zip php7.0-xml php7.0-mbstring
280  sudo apt install owncloud-files
281  sudo updatedb
282  locate owncloud
283  sudo vim /etc/apache2/sites-available/owncloud
284  sudo a2ensite owncloud
285  sudo mv /etc/apache2/sites-available/owncloud /etc/apache2/sites-available/owncloud.conf
286  sudo a2ensite owncloud
287  sudo systemctl reload apache2
289  sudo a2enmod rewrite headers env dir mime
291  cd /media/pi/data/
293  cd /var/www/owncloud/data/
300  sudo mariadb
302  sudo mysql -p
303  netstat -an | grep LISTEN
304  sudo mysql_secure_installation
305  sudo mysql -p
307  cd /etc/apache2/sites-available/
309  vim default-ssl.conf
310  vim owncloud.conf
311  vim default-ssl.conf
312  sudo vim default-ssl.conf
313  sudo mkdir -p /media/pi/data/owncloud
314  sudo updatedb
315  locate -b owncloud
316  cd /media/pi/data/
318  mv owncloud/ owncloud
319  mv owncloud owncloud
320  sudo chown www-data:ww-data owncloud/
321  sudo chown www-data:www-data owncloud/
323  cd owncloud/
324  pwd
326  vim /var/www/owncloud/data/owncloud.log
327  sudo vim /var/www/owncloud/data/owncloud.log
329  ls -l
332  sudo mysql -p
333  sudo mysql_secure_installation
334  mysql -p
335  sudo mysql -p
336  mysql -u root
337  sudo mysql -u root
338  sudo mysql -u root -p
339  history
344  chmod 775 /media/pi/data/owncloud/
345  sudo chmod 775 /media/pi/data/owncloud/
347  netstat -an
348  mysql -u root@localhost -p
349  mysql -u root -p
350  mysql -u root
351  sudo mysql --user=root mysql
352  cd /var/www/owncloud/
354  cd data/
356  tail -f owncloud.log
357  sudo tail -f owncloud.log
358  cd /var/log/apache2/
360  tail -f error.log
361  apt-get install -y php-apcu php-redis redis-server \
362  apt-get install -y php-smbclient
363  sudo apt install -y php-smbclient
364  sudo systemctl reload apache2.servic
365  sudo systemctl reload apache2.service
366  sudo su -
367  cd /var/www/owncloud/
370  ls /media/pi/data/owncloud/
372  sudo chmod 770 owncloud
373  sudo chmod 770 /media/pi/data/owncloud/
377  sudo systemctl stop apache2
378  sudo apt purge owncloud-files
379  sudo rm -rf /var/www/owncloud/data
380  sudo rm -rf /var/www/owncloud/config/
381  sudo rm -rf /var/www/owncloud/
382  sudo mysql --user=root mysql
383  sudo mysql --user=oc_user oc_db
384  sudo mysql --user=oc_user oc_db -p
385  sudo mysql --user=root mysql
386  sudo mysql --user=oc_user oc_db -p
387  cd ..
389  sudo apt install owncloud-files
390  sudo systemctl start apache2
395  cd /media/pi/data/
397  chmod 777 owncloud/
398  sudo chmod 777 owncloud/
400  cd owncloud/
401  mkdir data
402  sudo chown www-data:www-data data/
404  cd ..
405  chown -R www-data:www-data owncloud/
406  sudo chown -R www-data:www-data owncloud/
408  sudo chmod -R 770 owncloud
410  cd owncloud/d
411  sudo -u www-data ls -lisa /media/pi/data/owncloud/
412  cd /media/
414  cd /media/
416  cd pi/
417  df -h
419  df -h
420  cd /em
421  cd /media/
423  sudo chown 755 pi
425  sudo chown 755 pi/
427  sudo blkid
428  sudo vim /etc/fstab
429  sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
430  cd /mnt/
432  mkdir pihdd
433  sudo mkdir pihdd
435  sudo mount /dev/sda1 /mnt/pihdd/
436  cd pihdd/
438  sudo blkid
439  sudo vim /etc/fstab
441  cd
443  cd /mnt/pihdd/
445  ls -l
446  cd /media/pi/
448  vim /etc/fstab
449  cd /mnt/pihdd/
451  sudo blkid
452  vim /etc/fstab
453  sudo vim /etc/fstab
454  sudo reboot
455  sudo vim /etc/fstab
456  sudo mkdir -p /mnt/pihdd
457  sudo vim /etc/fstab
458  cd /mnt/pihdd/
460  sudo blkid
461  sudo vim /etc/fstab
463  cd ..
465  cd pihdd/
467  sudo vim /etc/fstab
468  sudo blkid
469  sudo vim /etc/fstab
470  cd /mnt/pihdd/
472  sudo mount /dev/sda1 /mnt/pihdd/
474  sudo reboot
475  sudo -u www-data ls -lisa /media/pi/data/owncloud/
476  sudo su - www-data
477  groupadd
478  useradd
479  useradd -G pi www-data
480  sudo usermod -G pi www-data
481  sudo -u www-data ls -lisa /media/pi/data/owncloud/
482  cd /media/pi/
484  cd /media/pi
487  sudo chown pi:pi /media/pi/
490  sudo -u www-data ls -lisa /media/pi/data/owncloud/
493  sudo -u www-data ls -lisa /media/
494  sudo -u www-data ls -lisa /media/pi/
495  cd /media/pi/
497  cd /media/
498  sudo chmod 755 pi/
500  sudo -u www-data ls -lisa /media/pi/
501  getcifsacl /media/pi/
502  sudo apt install setfacl
503  sudo apt search setfacl
504  sudo apt install acl
505  getfacl /media/pi/
506  sudo setfacl -m "g:pi:r-x" /media/pi/
507  getfacl /media/pi/
508  sudo -u www-data ls -lisa /media/pi/
509  sudo -u www-data ls -lisa /media/pi/data/owncloud/
511  sudo chown 750 pi/
513  sudo chown pi pi/
514  sudo chmod pi pi/
515  sudo chmod 750 pi/
517  cd pi/
519  cd data/
521  cd owncloud/
523  sudo rm owncloud/data
524  sudo rmdor owncloud/data
525  sudo rmdir owncloud/data
527  sudo mv owncloud/ Owncloud
529  sudo -u www-data ls -lisa /media/pi/data/owncloud/
530  sudo -u www-data ls -lisa /media/pi/data/Owncloud/
532  sudo -u www-data ls -lisa /var/www/owncloud/data/
534  sudo chmod 755 Owncloud/
536  cd /var/www/owncloud/
538  cd data/
540  cd ..
541  find . *.log
542  find .
543  find . | grep *.log
544  find  | grep *.log
545  cd data/
547  vim owncloud.log
548  sudo vim owncloud.log
549  cd /var/log/
551  ls -ltr
552  vim auth.log
554  tail f auth.log
555  tail -f auth.log
556  ls -ltr
557  vim auth.log
558  sudo -u www-data ls -lisa /media/pi/data/Owncloud/
559  sudo -u www-data touch /media/pi/data/Owncloud/gezg
560  sudo -u www-data ls -lisa /media/pi/data/Owncloud/
561  mount
562  sudo blkid
563  sudo vim /etc/fstab
565  cd /m,
566  cd /mnt/
568  cd pihdd/
569  sudo vim /etc/fstab
571  mount
572  df -h
573  sudo vim /etc/fstab
574  reboot
575  cd /mnt/pihdd/
577  ls -la
578  cd /media/pi/
579  getfacl /media/pi/
580  sudo setfacl /?
581  sudo setfacl --help
582  sudo setfacl -x group:pi:r-x
583  sudo setfacl -x group:pi:r-x /media/pi/
584  sudo setfacl --remove="group:pi:r-x" /media/pi/
585  sudo setfacl --remove="g:pi:r-x" /media/pi/
586  getfacl /media/pi/
587  sudo setfacl --remove="g:pi:r-x" /media/pi
588  sudo setfacl --help
589  sudo setfacl -x "g:pi:r-x" /media/pi/
590  sudo setfacl -x "g" /media/pi/
591  sudo setfacl -x "g:pi:r-x" /media/pi/
592  sudo setfacl -x "group:pi:r-x" /media/pi/
593  sudo setfacl -x group:pi:r-x /media/pi/
594  sudo setfacl -x group:pi /media/pi/
595  getfacl /media/pi/
596  getfacl /media/
597  deluser www-data pi
598  cat /etc/passwd
599  cat /etc/gro
600  cat /etc/grooups
601  cat /etc/groups
602  cat /etc/group
603  sudo deluser www-data pi
605  cd /mnt/
607  cd pihdd/
609  cd oO
610  cd Owncloud/
612  rm gezg
613  sudo rm gezg
615  cd ??
616  cd ..
618  s
619  sudo -u www-data php /var/www/owncloud/occ user:resetpassword pandemonium
620  sudo a2dissite owncloud.conf
621  sudo a2ensite default-ssl.conf
622  sudo systemctl reload
623  sudo systemctl reload apache2.service
625  de Documents/
627  cd Documents/
629  cd git
631  mkdir owncloud
632  cd owncloud/
633  git init
634  touch owncloud-hardening.sh
635  vim owncloud-hardening.sh
637  ocpath='/var/www/owncloud'
638  ocdata='/var/www/owncloud/data'
639  htuser='www-data'
640  htgroup='www-data'
641  rootuser='root'
642  printf "Creating possible missing Directories\n"
643  mkdir -p $ocdata
644  mkdir -p $ocpath/updater
645  printf "chmod Files and Directories\n"
646  find ${ocpath}/ -type f -print0 | xargs -0 chmod 0640
650  vim owncloud-hardening.sh
651  chmod +x owncloud-hardening.sh
652  ./owncloud-hardening.sh
653  sudo ./owncloud-hardening.sh
654  vim /etc/apache2/sites-available/default-ssl.conf
655  sudo vim /etc/apache2/sites-available/default-ssl.conf
656  sudo systemctl reload apache2.service
657  sudo vim /etc/apache2/sites-available/default-ssl.conf
658  sudo vim /etc/apache2/sites-available/000-default.conf
659  sudo a2ensite 000-default.conf
660  sudo systemctl reload apache2.service
661  sudo vim /etc/apache2/sites-available/000-default.conf
662  sudo systemctl reload apache2.service
663  sudo vim /etc/apache2/sites-available/000-default.conf
664  sudo systemctl reload apache2.service
665  sudo vim /etc/apache2/sites-available/000-default.conf
666  sudo vim /etc/apache2/sites-available/default-ssl.conf
667  sudo systemctl reload apache2.service
668  sudo vim /etc/apache2/sites-available/default-ssl.conf
669  sudo systemctl reload apache2.service
670  sudo vim /var/www/owncloud/config/config.sample.php.
671  sudo su -
672  sudo service nscd restart
673  sudo service apache2 restart
674  sudo vim /var/www/owncloud/config/config.php
675  cat << EOF > /etc/opt/rh/rh-php70/php.d/20-apcu.ini
676  ; APCu php extension
677  extension=apcu.so
678  EOF
679  sudo updatedb
680  locate php.d
681  locate php
682  locate -b php
683  cd /usr/lib/php/7.0/
685  cat << EOF > /etc/opt/rh/rh-php70/php.d/20-apcu.ini
686  ; APCu php extension
687  extension=apcu.so
688  locate php.ini
689  vim /etc/php/7.0/apache2/php.ini
691  locate -b php
692  cd /etc/php
694  cd 7.0/
696  cd mods-available/
698  phpenmod acpi.ini
699  phpenmod acpu.ini
700  phpenmod apcu.ini
701  date
702  locate apcu.so
703  phpenmod apcu
704  sudo phpenmod apcu
705  sudo reboot
706  df -h
708  sudo apt install php-apcu
709  cat << EOF > /etc/opt/rh/rh-php70/php.d/20-apcu.ini
710  ; APCu php extension
711  extension=apcu.so
712  EOF
713  vimcat << EOF > /etc/opt/rh/rh-php70/php.d/20-apcu.ini
714  ; APCu php extension
715  extension=apcu.so
716  cat << EOF > /etc/opt/rh/rh-php70/php.d/20-apcu.ini
717  ; APCu php extension
718  extension=apcu.so
719  EOF
720  vim /etc/opt/rh/rh-php70/php.d/20-apcu.ini
721  sudp vim /etc/opt/rh/rh-php70/php.d/20-apcu.ini
722  sudo vim /etc/opt/rh/rh-php70/php.d/20-apcu.ini
723  sudo rm /etc/opt/rh/rh-php70/php.d/20-apcu.ini
724  sudo su -
725  sudo vim /var/www/owncloud/config/config.php
726  sudo service apache2 restart
727  sudo reboot
728  sudo apt-get install python-certbot-apache
729  sudo certbot --apache
730  sudo vim /etc/apache2/sites-available/
731  sudo vim /etc/apache2/sites-available/default-ssl.conf
732  sudo vim /etc/apache2/sites-available/
733  sudo vim /etc/apache2/sites-available/default-ssl.conf
734  sudo certbot --apache
735  cd /var/log/letsencrypt/
736  sudo cd /var/log/letsencrypt/
737  sudo su -
738  mount
739  cd /mnt/pihdd/
741  cd Owncloud/
743  df -h
744  sudo apt update
745  sudo apt upgrade
746  sudo apt dist-upgrade
747  sudo apt install raspi-config
748  apt list --upgradable
749  apt list --upgradable -a
750  sudo apt dist-upgrade
751  sudo systemctl apache2 restart
752  sudo systemctl restart apacheche2
753  sudo systemctl restart apache2
755  cd
756  sudo updatedb
757  sudo su -
758  sudo systemctl restart apache2
759  ls -ltr
760  df -h
761  cd /var/log/
762  lll
764  cd apache2/
766  sudo tail -f error.log
767  sudo tail -f other_vhosts_access.log
768  sudo su -
769  uname -an
770  sudo vim
771  sudo vim /var/www/owncloud/apps/dav/lib/Upload/ChunkingPlugin.php:
772  sudo updatedb
773  locate ChunkingPlugin.php
774  sudo su -
775  sudo updatedb
776  sudo apt update && sudo apt upgrade
777  sudo su -
778  sudo systemctl restart apache2
779  sudo su -
780  sudo systemctl restart apache2
781  sudo reboot
782  sudo su -
783  sudo apt update && sudo apt upgrade
784  sudo reboot
785  sudo apt purge owncloud-files
786  sudo apt purge owncloud
787  sudo apt purge owncloud-files
788  sudo rm -rf /var/www/owncloud/
790  cd h
791  cd html
793  vim oldconffiles/
795  cd /mnt/pihdd/
797  sudo rm -rf Owncloud/
798  df -h
799  sudo apt update
800  apt list --upgradable
801  sudo apt upgrade
802  sudo apt update
803  sudo apt upgrade
804  cd /var/cache/apt/archive
805  cd /var/cache/apt/archive
806  cd /var/cache/apt/archives/
808  sudo dpkg -i --force-overwrite python3-scrollphathd_1.1.0_all.deb
809  sudo apt update
810  sudo apt autoremove
811  sudo apt clean cache
813  sudo reboot
815  cd .ssh
816  man ssh-keygen
817  ssh-keygen -t rsa -b 4096 -C "michael.maffait@gmail.com"
818  man ssh-agent
819  eval $(ssh-agent -s)
820  ssh-add
821  cat /home/pi/.ssh/id_rsa.pub
822  ssh -T git@github.com
823  cd
825  df -h
826  cd /mnt/pihdd/
828  mkdir git
829  sudo mkdir git
831  cd git/
832  ls -l
833  cd ..
834  sudo chown pi:pi git/
836  cd git/
837  cd
838  cd D
839  cd Documents/
841  cd git/
843  cd owncloud/
------------------------------------------------
find *
find . -not -path "./.git"
find . -not -path ".git"
git cherry-pick 6c506ecc
git ls-files --stage
git merge --abort
git merge --no-ff evo-1221-mla
git merge --no-ff origin/evo-1221-mla
git merge master -X ours
git mv src/ansible/roles/zookeeper-setup/templates/log4j.properties src/ansible/roles/zookeeper-setup/templates/log4j.properties.j2
git rebase origin/evo-XXXX-ivvq
git rebase origin/evo-XXXX-mla
git remote -a
git remote -v
git remote -v
git remote add tower http://192.168.100.7/zsh/zsh-server.git
git remote del tower http://192.168.0.7/zsh/zsh-server.git
git remote remove tower
git update-index --chmod=+x *
mvn help:describe -Dplugin=com.googlecode.maven-download-plugin:maven-download-plugin
mvn help:describe -Dplugin=com.googlecode.maven-download-plugin:maven-download-plugin -Ddetail
mvn versions:set -DnewVersion=2.34.0-SNAPSHOT -DgenerateBackupPoms=false
