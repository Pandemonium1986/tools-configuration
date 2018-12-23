#!/bin/bash -u
########################################
##	Git : Massive project management  ##
########################################


####################
# Global Variables #
####################

#-- Environment Variables
GIT_HOME="/d/git"
IVVQ="evo-XXXX-ivvq"

#-- Color Variables
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
#===============================================================================#

#############
# Functions #
#############

#-- usage
# print usage on stdout.
usage() {
	cat << EOF
Usage: $0 {git [--project|-p] command}
Execute one of the massive git command
Command available are
	- --help|-h : Print this usage.
	- --project|-p : Set GIT_HOME as a list of projects. ex: --project=ccm-server,ccm-ihm,pms-bdd,cnt-ccm2srm.
	- status|st : Returns if there have been changes in the workspace.
	- fetch|fc : Fetch all repositories in GIT_HOME.
	- merge-master|mgm : For each repositories in GIT_HOME, merge master branch if she is fast forwadable.
	- merge-ivvq|mgi : For each repositories in GIT_HOME, merge ivvq branch if she is fast forwadable.
	- remote|re : Show how many branch there is in all repositories in GIT_HOME.
	- merge-master-to-ivvq|mgm2i : For each repositories in GIT_HOME, merge master branch into ivvq branch if she is fast forwadable.
	- merge-ivvq-to-master|mgi2m : For each repositories in GIT_HOME, merge ivvq branch into master branch if she is fast forwadable.
EOF
}

#-- Browse
# Browse git repositories and execute function inside.
# For correct browsing you need to have a working tree like this
# d:.
# └───git
#      ├───Project Name 1
#      │  ├───Project Name 1 Git 1
#      │  ├───Project Name 1 Git 2
#      │  └───Project Name 1 Git 3
#      └───Project Name 2
#         ├───Project Name 2 Git 1
#         ├───Project Name 2 Git 2
#         └───Project Name 2 Git 3
browse(){
	if [[ -v WORKSPACE[@] ]]
	then
		for project in "${WORKSPACE[@]}"
		do
			GIT_FOLDER=$GIT_HOME"/"${project:0:3}"/"$project
			cd $GIT_FOLDER
			$@
		done
	else
		for GIT_FOLDER in `find $GIT_HOME -maxdepth 2 -mindepth 2 -type d`
		do
			cd $GIT_FOLDER
			$@
		done
	fi
}

#-- colorCommit
# Color the return of type of commit.
# If behind he's red.
# If ahead he's green.
# Use for commit status
colorCommit(){
	if [[ $* == *"behind"* ]]
	then
		RET="${red}"$*"${end}"
	else
		RET="${grn}"$*"${end}"
	fi

	echo "$RET"
}

#-- colorBranch
# Color the result of number of branch.
# If there is 1 branch it's red.
# If there is 2 branch it's green.
# If there is more than 2 branch it's blue.
# Use for commit status
colorBranch(){
	if [ $1 -eq 2 ]
	then
		RET="${grn}"$1"${end}"
	elif [ $1 -gt 2 ]; then
		RET="${cyn}"$1"${end}"
	else
		RET="${red}"$1"${end}"
	fi

	echo "$RET"
}

#-- gitStatus
# Check if is there is modification on the current git repo.
# First check for file modifications with git status --porcelain
# Second check for push/merge modifications with git st -sb
gitStatus(){

	if [ -n "$(git status --porcelain)" ]; then
		CHANGE_STATUS="${red}Yes${end}"
		COMMIT_STATUS=`git st -sb | sed -n "s/^##.*\[\([^]]*\).*$/\1/p"`
		COMMIT_STATUS=`colorCommit $COMMIT_STATUS`
	else
		CHANGE_STATUS="${grn}No${end}"
		COMMIT_STATUS=`git st -sb | sed -n "s/^##.*\[\([^]]*\).*$/\1/p"`
		COMMIT_STATUS=`colorCommit $COMMIT_STATUS`
	fi
	printf "|%-22s|%-17s|%-31s|\n" `basename $GIT_FOLDER` "${CHANGE_STATUS}" "${COMMIT_STATUS}"
}

#-- gitFetch
# Fecth prune the current repository.
# Use progress to redirect output to stderr.
gitFetch(){
	if [ -n "$(git fetch -p --progress 2>&1)" ]; then
		FETCH_STATUS="${grn}Update${end}"
	else
		FETCH_STATUS="${cyn}No need${end}"
	fi
	printf "|%-22s|%-18s|\n" `basename $GIT_FOLDER` "${FETCH_STATUS}"
}

#-- gitMerge
# Merge the current repository only if fast forwadable
# Merge the $1 branch
gitMerge(){
	if [ $# -ne 1 ]; then
		echo "Error : "$FUNCNAME" -> You must pass one argument : The branch name" 1>&2
		exit 2
	fi
	BRANCH=$1
	MERGE_RETURN=""
	CHECK_BRANCH=`git ls-remote --exit-code . $BRANCH`
	if [[ $? -eq 0 ]]; then
		git checkout -q $BRANCH
		MERGE_RETURN=$(git merge origin/$BRANCH --ff-only --progress 2>&1)
		if [[ $MERGE_RETURN == *"Already up-to-date"* ]]
		then
			MERGE_STATUS="${cyn}No need${end}"
		elif [[ $MERGE_RETURN == *"Fast-forward"* ]]
		then
			MERGE_STATUS="${grn}Update${end}"
		else
			MERGE_STATUS="${red}Error${end}"
		fi
		printf "|%-22s|%-27s|\n" `basename $GIT_FOLDER` "${MERGE_STATUS}"
	else
		MERGE_RETURN="${mag}No $BRANCH${end}"
		printf "|%-22s|%-27s|\n" `basename $GIT_FOLDER` "${MERGE_RETURN}"
	fi
}

#-- gitRemoteBranch
# Count the number of branches available in the current repository
# Then color the result
# Check too if IVVQ branch exist in the current repository
gitRemoteBranch(){
	REMOTE_BRANCH=`git branch --remotes | grep -v HEAD | wc -l`
	REMOTE_BRANCH=`colorBranch $REMOTE_BRANCH`
	CHECK_IVVQ=`git ls-remote --exit-code . $IVVQ`
	if [[ $? -eq 0 ]]; then
		HAS_IVVQ="${grn}Yes${end}"
	else
		HAS_IVVQ="${red}No${end}"
	fi
	printf "|%-22s|%-25s|%-24s|\n" `basename $GIT_FOLDER` "${REMOTE_BRANCH}" "${HAS_IVVQ}"
}

#-- execGitStatus
# Execute gitStatus.
execGitStatus(){
	echo -e "----------------------------------------------------"
	printf "|%-22s|%-6s|%-20s|\n" "Projet" "Change" "Commit"
	echo -e "----------------------------------------------------"
	browse gitStatus
	echo -e "----------------------------------------------------"
}

#-- execGitFetch
# Execute gitFetch.
execGitFetch(){
	echo -e "--------------------------------"
	printf "|%-22s|%-7s|\n" "Projet" "Fecth"
	echo -e "--------------------------------"
	browse gitFetch
	echo -e "--------------------------------"
	return 0
}

#-- execGitMerge
# Execute gitMerge.
execGitMerge(){
	if [ $# -ne 1 ]; then
		echo "Error : "$FUNCNAME" -> You must pass one argument : The branch name" 1>&2
		exit 2
	fi
	echo -e "-----------------------------------------"
	printf "|%-22s|%-16s|\n" "Projet" "Merge"
	echo -e "-----------------------------------------"
	browse gitMerge $1
	echo -e "-----------------------------------------"
	return 0
}

#-- execGitRemoteBranch
# Execute gitRemoteBranch.
execGitRemoteBranch(){
	echo -e "-----------------------------------------------------"
	printf "|%-22s|%-10s|%-10s|\n" "Projet" "Nb of Branches" "$IVVQ"
	echo -e "-----------------------------------------------------"
	browse gitRemoteBranch
	echo -e "-----------------------------------------------------"
	return 0
}
#===============================================================================#

########
# Main #
########
if [ $# -eq 0 ]; then
	echo "Error : You must pass at least one argument" 1>&2
	usage 1>&2
	exit 2
fi

while [ $# -gt 0 ]; do
	case "${1}" in
	--help|-h)
		usage
		exit 0
		;;
	--project=*|-p=*)
		DIR="${1/#--/-}"
		DIRSUB="${DIR#*=}"
		IFS=',' read -r -a WORKSPACE <<< "$DIRSUB"
		;;
	status|st)
		execGitStatus
		;;
	fetch|fc)
		execGitFetch
		;;
	merge-master|mgm)
		execGitMerge "master"
		;;
	merge-ivvq|mgi)
		execGitMerge $IVVQ
		;;
	merge-master-to-ivvq|mgm2i)
		echo ${1};
		;;
	merge-ivvq-to-master|mgi2m)
		echo ${1};
		;;	
	remote|re)
		execGitRemoteBranch
		;;
	*)
		echo "Unknown argument : $1" 1>&2
		usage 1>&2
		exit 2
	esac
	shift
done


