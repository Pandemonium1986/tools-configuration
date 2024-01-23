#!/bin/bash -u
# shellcheck disable=SC2027,SC2044,SC2092,SC2164,SC2035,SC2086,SC2003,SC2006,SC2091

########################
##  Git : Migration   ##
########################

# Git Directory
START=$(date +%s)
GIT_TMP="/d/git/tmp"

# clone --bare all
cd $GIT_TMP
rm -rf *

##-- Zsh --##
git clone --bare git@localhost:zsh/zsh-ihm.git
git clone --bare git@localhost:zsh/zsh-server.git
git clone --bare git@localhost:zsh/zsh-packaging.git
git clone --bare git@localhost:zsh/zsh-applications.git
git clone --bare git@localhost:zsh/zsh-import.git
git clone --bare git@localhost:zsh/zsh-export.git
git clone --bare git@localhost:zsh/zsh-ni2.git
git clone --bare git@localhost:zsh/zsh-docs.git
git clone --bare git@localhost:zsh/zsh-scripts.git
git clone --bare git@localhost:zsh/zsh-custom-fields.git
git clone --bare git@localhost:zsh/zsh-migration.git

for GIT_FOLDER in $(find $GIT_TMP -maxdepth 1 -mindepth 1 -type d); do
  cd $GIT_FOLDER
  FOLDER=$(basename $GIT_FOLDER)
  GROUP=$(echo $FOLDER | cut -f1 -d-)
  echo -e "Dans : " $FOLDER
  if [ $GROUP == "portail" ] || [ $GROUP == "oth" ]; then
    echo -e "git push --mirror git@server:dttools/"$FOLDER
    $(git push --mirror git@server:dttools/"$FOLDER")
  else
    echo -e "git push --mirror git@server:"$GROUP"/"$FOLDER
    $(git push --mirror git@server:"$GROUP"/"$FOLDER")
  fi
  # eval "git remote -v"
  echo -e "------------------------------------------------------------------"
done

END=$(date +%s)
DIFF=$(expr $END - $START)
echo "Temps total d'éxécution : "$DIFF" s"
