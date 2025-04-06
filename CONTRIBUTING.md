# Contributing

## Adding Feature Process

> Feature branches are used for specific feature work or improvements.

1. Make sure that you've created an issue/ticket for the feature in the project's Jira.
2. Create the feature branch on Bitbucket:
    1. Go to [Branches] menu.
    2. Click **Create Branch** button.
    3. Fill **Type** field with `Feature`.
    4. Fill **From branch** field with `dev`.
    5. Fill **Branch name** field with prefix `feature/` followed by the feature name in kebab-case. For example: `feature/elevarm-avatar`.
    6. Click **Create** button.
3. Work on the feature:
    1. Checkout to the feature branch on your local machine:
       ```
       $ git fetch origin && git checkout feature/elevarm-avatar
       ```
    2. Make your changes locally and then add, commit, and push your changes to the feature branch. Make sure you include the **ticket code in your commit message**.
       ```
       $ git add .
       $ git commit -m "EUI-1 Init repository"
       $ git push origin feature/elevarm-avatar
       ```
    3. (Optional) If your branch is not up to date with `dev` branch, make sure to merge the changes locally first:
       ```
       $ git checkout dev && git pull
       $ git checkout feature/elevarm-avatar && git merge dev
       ```
4. Create a Pull Request on Bitbucket:
    1. Go to [Pull Requests] menu.
    2. Click **Create pull request** button.
    3. Select your feature branch as the source branch (left-hand side).
    4. Select `dev` branch as the target branch (right-hand side).
    5. Fill **Title** with the changes you've made. Make sure to include the ticket code in the title.
    6. The **Description** field with be filled in with default description. Fill in the description accordingly.
    7. Fill **Reviewers** with your colleague(s).
    8. Select **Delete branch** checkbox if you've finished working on the branch.
    9. Click **Create pull request** button.

## (Non-Urgent) Fixing Bugs Process

> Bug fix branches are used to fix non-urgent bugs.

1. Make sure that you've created an issue/ticket for the bug fix in the project's Jira.
2. Create the bug fix branch on Bitbucket:
    1. Go to [Branches] menu.
    2. Click **Create Branch** button.
    3. Fill **Type** field with `Bugfix`.
    4. Fill **From branch** field with `dev`.
    5. Fill **Branch name** field with prefix `bugfix/` followed by the bug name in kebab-case. For example: `bugfix/login-error`.
    6. Click **Create** button.
3. Work on fixing the bug:
    1. Checkout to the bug fix branch on your local machine:
       ```
       $ git fetch origin && git checkout bugfix/login-error
       ```
    2. Make your changes locally and then add, commit, and push your changes to the bug fix branch. Make sure you include the **ticket code in your commit message**.
       ```
       $ git add .
       $ git commit -m "EUI-2 Fix login error"
       $ git push origin bugfix/login-error
       ```
    3. (Optional) If your branch is not up to date with `dev` branch, make sure to merge the changes locally first:
       ```
       $ git checkout dev && git pull
       $ git checkout bugfix/login-error && git merge dev
       ```
    4. Describe the details of the bug on the ticket. Specify the root cause and the solution of the bug.
4. Create a Pull Request on Bitbucket:
    1. Go to [Pull Requests] menu.
    2. Click **Create pull request** button.
    3. Select your bug fix branch as the source branch (left-hand side).
    4. Select `dev` branch as the target branch (right-hand side).
    5. Fill **Title** with the changes you've made. Make sure to include the ticket code in the title.
    6. The **Description** field with be filled in with default description. Fill in the description accordingly.
    7. Fill **Reviewers** with your colleague(s).
    8. Select **Delete branch** checkbox if you've finished working on the branch.
    9. Click **Create pull request** button.

[Branches]: https://bitbucket.org/elevarm/agrimaps-ui/branches/
[Pull Requests]: https://bitbucket.org/elevarm/agrimaps-ui/pull-requests/