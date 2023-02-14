# STOL GitHub Actions

These actions are commonly used steps in STOL's GitHub workflows.

## add-stol-apt-repository

Add STOL apt repository to `/etc/apt/sources.list.d`.

See [action.yml](add-stol-apt-repository/action.yml).

## setup-deb-s3

Setup [deb-s3](https://github.com/deb-s3/deb-s3) and optionally install minimal helpful tools for building Debian/Ubuntu packages.

See [action.yml](setup-deb-s3/action.yml).

## sonar-scanner

Run [SonarScanner](https://sonarcloud.io/).

To use ensure the following steps have been taken:
* The Sonar project has been created under https://sonarcloud.io/organizations/usdot-fhwa-stol/projects.
* The Sonar project has been set to give **Administer Issues** privileges to the **Issue Administrators** group. This allows developers to mark issues as **false postive** or **won't fix** as necessary because the scanner is not perfect.

See [action.yml](sonar-scanner/action.yml).

# STOL Reusable Workflows

There are resuable workflows included in this repository.

## cpp-module-build

Run a C++ build for STOL projects using the [carma-builds](https://github.com/usdot-fhwa-stol/carma-builds) Docker container.

See [cpp-module-build.yml](.github/workflows/cpp-module-build.yml).

## sonar-scanner-cpp

Run [Sonar Scan for C++ projects](https://github.com/marketplace/actions/sonarcloud-scan-for-c-and-c) for STOL projects

To use ensure the following steps have been taken:
* The steps above for the sonar-scanner action have been completed.
* The token from the Sonar project has been added to the target repository under Settings -> Secrets and Variables -> Actions as SONAR_TOKEN in the "Repository secrets" section.

See [sonar-scanner-cpp.yml](.github/workflows/sonar-scanner-cpp.yml).
