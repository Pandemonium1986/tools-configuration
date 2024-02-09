#!/bin/bash
#
# This script exports docker image and corresponding helm chart.

set -euo pipefail
IFS=$'\n\t'

################################################################################
# Variables
################################################################################
declare -r DH_EXP_DKR_REGISTRY=${DKR_REGISTRY:-ghcr.io/pandemonium1986}
declare -r DH_EXP_HLM_REGISTRY=${HLM_REGISTRY:-github-chart}
declare -r DH_EXP_OUTPUT_DIR="/tmp"

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
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 2
  fi
}

#######################################
# Pull a docker image then save it.
# Arguments:
#  Docker image name
#  Docker image tag
# Output
#  Array containing file path if "No such file or directory"
#  Array containing file path if "Differ"
#######################################
function docker_pull_save() {
  declare -r _docker_image_name="$1"
  declare -r _docker_image_version="$2"
  declare -r _docker_pull="${DH_EXP_DKR_REGISTRY}/${_docker_image_name}:${_docker_image_version}"

  mkdir -p "${DH_EXP_OUTPUT_DIR}/docker-helm-export"
  docker pull "${_docker_pull}"
  docker save "${_docker_pull}" -o "${DH_EXP_OUTPUT_DIR}/docker-helm-export/${_docker_image_name}-${_docker_image_version}.tar"
  return 0
}

#######################################
# Pull a helm chart from helm registry.
# Arguments:
#  Chart name
#  Chart version
# Return
#  0
#######################################
function helm_pull_save() {
  declare -r _helm_chart_name="$1"
  declare -r _helm_chart_version="$2"
  mkdir -p "${DH_EXP_OUTPUT_DIR}/docker-helm-export"
  helm repo update
  helm pull "${DH_EXP_HLM_REGISTRY}/${_helm_chart_name}" --version "${_helm_chart_version}" --destination "${DH_EXP_OUTPUT_DIR}/docker-helm-export"
  return 0
}

################################################################################
# Main execution
################################################################################

trap _exit SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

echo -e "\e[33m----------------------\e[0m"
echo -e "\e[33m| docker-helm-export |\e[0m"
echo -e "\e[33m----------------------\e[0m"

echo -e "\nDocker step"
docker_pull_save "$1" "$2"
echo -e "\nHelm step"
helm_pull_save "$1" "$2"

echo -e "Export of ${1} version ${2} successfull"
echo -e "\e[33m--------------------------------------\e[0m"
