# Elevarm Flutter Package Deployment

> This document is copied from this [template](https://bitbucket.org/elevarm/workspace/snippets/EdgALK).

This document contains things related to the deployment of this Flutter package.

## Prerequisities

You must fulfill these prerequisities before you can follow the instructions specified in the next section:

1. Installed Python3 (download [here](https://www.python.org/downloads/)).

## Instructions

1. Before you can deploy this project, make sure that this project has the following files:
    1. `tool/tools.py` (download [here](https://bitbucket.org/elevarm/workspace/snippets/y7ERdo))
    2. `tool/release_new_version.py` (download [here](https://bitbucket.org/elevarm/workspace/snippets/AzMGL5))
    3. `tool/requirements.txt` (download [here](https://bitbucket.org/elevarm/workspace/snippets/eqEgGB))

2. Open `tool/release_new_version.py` and make sure that these values are correct:
    1. `PROJECT_NAME`: This project name, for example `elevarm_shared_module`.
    2. `ACCESS_TOKEN`: This project's Bitbucket Access Token. Please ask an administrator if you don't have the access.
3. (Optional) If you are running this deployment for the first time, you might need to install the Python script dependencies first. Install it by running the following command:
    ```
    pip3 install -r tool/requirements.txt
    ```
4. Next, you need to prepare this project for the release of new version:
    1. Make sure you are on the development branch (usually `dev`).
    2. Make sure your development branch is up to date with remote.
    3. Make sure all dependencies are locked in the `pubspec.yaml` file.
5. Run the deployment script by running the following command:
    ```
    python3 tool/release_new_version.py
    ```
    1. You will be prompted for the new version. Enter the new version and press Enter.
    2. Two Pull Request will be created to development branch and production branch (usually `master`). Please check whether both of them are correct.
    3. If the PRs are correct, you can enter `y` and press Enter to continue creating the release tag.
    4. Finally, you can enter `y` and press Enter to continue merging the PRs.