#!/bin/bash

# use dashes instead of underscores in our repo code names
NO_UNDERSCORE_NAME=${GITHUB_REF_NAME/_/-}
RELEASE_BRANCHES="carma-master master"
DEVELOP_BRANCHES="carma-develop develop"

# check for feature branches
if [[ ${GITHUB_REF_NAME} =~ feature/.* ]]; then
    APT_CODENAME=feature-${NO_UNDERSCORE_NAME##*/}

# check for release candidate branches
elif [[ ${GITHUB_REF_NAME} =~ release/.* ]]; then
    APT_CODENAME=candidate-${NO_UNDERSCORE_NAME##*/}

# check for release branches
elif [[ $RELEASE_BRANCHES =~ (^|[[:space:]])${GITHUB_REF_NAME}($|[[:space:]]) ]]; then
    APT_CODENAME=release-${NO_UNDERSCORE_NAME##*/}

# check for develop branches
elif [[ $DEVELOP_BRANCHES =~ (^|[[:space:]])${GITHUB_REF_NAME}($|[[:space:]]) ]]; then
    APT_CODENAME=develop

# this is the default if this is just a branch that is being pushed for PR
else
    APT_CODENAME=ci-build
fi

echo ${APT_CODENAME}