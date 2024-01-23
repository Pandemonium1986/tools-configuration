#!/bin/bash
#
# This script compare some .dotfiles with a golden source.

set -uo pipefail
IFS=$'\n\t'

################################################################################
# Variables
################################################################################
declare -ar FILES=(
  .ansible-lint
  .editorconfig
  .gitlint
  .hadolint.yaml
  LICENSE
  .markdownlint.yaml
  .pre-commit-config.yaml
  .yamllint
)

declare -ar REPOS=(
  ansible-collection-k8s-toolbox
  ansible-collection-k8s-toolbox/roles/helm
  ansible-collection-k8s-toolbox/roles/k9s
  ansible-collection-k8s-toolbox/roles/kubectl
  ansible-collection-k8s-toolbox/roles/kubectx
  ansible-collection-k8s-toolbox/roles/minikube
  ansible-collection-k8s-toolbox/roles/stern
  ansible-playbook-test
  ansible-role-init
  ansible-role-ohmyzsh
  ansible-role-pip
)
declare -r LOCATION="${HOME}/git/pandemonium1986"

################################################################################
# Functions
################################################################################

#######################################
# Stop the script properly.
# Returns:
#  255 critical error
#######################################
function _exit() {
  echo -e "\n\e[1;31mAn unexpected error caused the shutdown of $(basename "$0")\e[0m\n" >&2
  exit 255
}


#######################################
# Check if I'm root or not
# Returns:
#  2 you are not root
#######################################
function am_i_root() {
  if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit 2
  fi
}

#######################################
# Check the difference between two files
# Arguments:
#  Source file
#  Compare file
#  Array for "No such file or directory"
#  Array for "Differ"
# Output
#  Array containing file path if "No such file or directory"
#  Array containing file path if "Differ"
#######################################
function dot_diff() {
  is_it_diff=$(diff -q "$1" "$2" 2>&1)
  local -n _arr_nsfod="$3"
  local -n _arr_diff="$4"
  if [[ ${is_it_diff} =~ "No such file or directory" ]]; then
    _arr_nsfod+=("$2")
  elif [[ ${is_it_diff} =~ "differ" ]]; then
    _arr_diff+=("$2")
  fi
}



################################################################################
# Main execution
################################################################################

trap _exit SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

declare -a arr_nsfod=()
declare -a arr_diff=()

# Kenel Code
for file in "${FILES[@]}"
do
  for repo in "${REPOS[@]}"
  do
    dot_diff "${LOCATION}/template/${file}" "${LOCATION}/${repo}/${file}" arr_nsfod arr_diff
  done
done

echo -e "\e[33m--------------------------\e[0m"
echo -e "\e[33m| Files that don't exist |\e[0m"
echo -e "\e[33m--------------------------\e[0m"
printf '%s\n' "${arr_nsfod[@]}"
echo -e "\e\n[33m---------------------\e[0m"
echo -e "\e[33m| Files that differ |\e[0m"
echo -e "\e[33m---------------------\e[0m"
printf '%s\n' "${arr_diff[@]}"
echo -e "\e[33m--------------------------------------\e[0m"
