#!/bin/bash

echo "GITHUB_REF_PROTECTED=$GITHUB_REF_PROTECTED"
echo "GITHUB_REF=$GITHUB_REF"
echo "GITHUB_REF_NAME=$GITHUB_REF_NAME"

# check for specific branches
if [[ ${GITHUB_REF} =~ feature/.* ]]; then
    APT_CODENAME=feature-${GITHUB_REF_NAME}
elif [[ ${GITHUB_REF} =~ candidate/.* ]]; then
    APT_CODENAME=candidate-${GITHUB_REF_NAME}
elif [[ ${GITHUB_REF_PROTECTED} = true ]]; then
    APT_CODENAME=develop
else
    APT_CODENAME=ci_build
fi

echo ${APT_CODENAME}