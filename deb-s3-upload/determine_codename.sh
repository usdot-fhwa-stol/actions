#!/bin/bash

NO_UNDERSCORE_NAME=${GITHUB_REF_NAME/_/-}
# check for specific branches
if [[ ${GITHUB_REF_NAME} =~ feature/.* ]]; then
    APT_CODENAME=feature-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_NAME} =~ candidate/.* ]]; then
    APT_CODENAME=candidate-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_NAME} =~ release/.* ]]; then
    APT_CODENAME=release-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_PROTECTED} == true ]]; then
    # if this is a protected branch then assume this is develop
    APT_CODENAME=develop
else
    # this is the default if this is just a branch that is being pushed for PR
    APT_CODENAME=ci-build
fi

echo ${APT_CODENAME}