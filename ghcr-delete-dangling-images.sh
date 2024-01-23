#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Simple script to remove dangling images from GHCR.
# You need to have installed gh cli and jq for this script to work properly
# You need to be logged to 'gh' first
declare -a containers=(
  alpine312
  alpine313
  alpine318
  centos7
  centos8
  debian10
  debian11
  debian12
  debian9
  docker-centos7
  mint19
  mint20
  sles15sp3
  sles15sp5
  slides-show
  tumbleweed
  ubuntu1804
  ubuntu2004
  ubuntu2204
)
temp_file="/tmp/ghcr_prune.ids"

for container in "${containers[@]}"; do
  echo "Fetching dangling images from GHCR for $container container..."
  gh api "/user/packages/container/${container}/versions" --paginate >$temp_file

  ids_to_delete=$(jq <"$temp_file" -r '.[] | select(.metadata.container.tags==[]) | .id')

  if [ "${ids_to_delete}" = "" ]; then
    echo "There are no dangling images to remove for this package"
  else
    echo -e "\nDeleting dangling images..."
    while read -r line; do
      id="$line"
      ## Workaround for https://github.com/cli/cli/issues/4286 and https://github.com/cli/cli/issues/3937
      echo -n | gh api --method DELETE "/user/packages/container/${container}/versions/${id}" --input -
      echo Dangling image with ID "$id" deleted successfully
    done <<<"${ids_to_delete}"
  fi

  rm -rf "${temp_file}"
done
echo -e "\nAll the dangling images have been removed successfully"
exit 0
