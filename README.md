# STOL GitHub Actions

These actions are commonly used steps in STOL's GitHub workflows.

## add-stol-apt-repository

Add STOL apt repository to `/etc/apt/sources.list.d`.

See [action.yml](add-stol-apt-repository/action.yml).

## setup-deb-s3

Setup [deb-s3](https://github.com/deb-s3/deb-s3) and optionally install minimal helpful tools for building Debian/Ubuntu packages.

See [action.yml](setup-deb-s3/action.yml).

# STOL Reusable Workflows

There are resuable workflows included in this repository.

## cpp-module-build

Run a C++ build for STOL projects using the [carma-builds](https://github.com/usdot-fhwa-stol/carma-builds) Docker container.

See [cpp-module-build.yml](.github/workflows/cpp-module-build.yml).

## sonar-scanner-cpp

Run [Sonar Scan for C++ projects](https://github.com/marketplace/actions/sonarcloud-scan-for-c-and-c) for STOL projects

See [sonar-scanner-cpp.yml](.github/workflows/sonar-scanner-cpp.yml).
