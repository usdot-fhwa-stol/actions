#!/bin/bash

echo "GITHUB_REF_PROTECTED=$GITHUB_REF_PROTECTED"
echo "GITHUB_REF=$GITHUB_REF"
echo "GITHUB_REF_NAME=$GITHUB_REF_NAME"

NO_UNDERSCORE_NAME=${GITHUB_REF_NAME/_/-}
# check for specific branches
if [[ ${GITHUB_REF_NAME} =~ feature/.* ]]; then
    APT_CODENAME=feature-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_NAME} =~ candidate/.* ]]; then
    APT_CODENAME=candidate-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_NAME} =~ release/.* ]]; then
    APT_CODENAME=release-${NO_UNDERSCORE_NAME##*/}
elif [[ ${GITHUB_REF_PROTECTED} == true ]]; then
    APT_CODENAME=develop
else
    APT_CODENAME=ci-build
fi

echo ${APT_CODENAME}