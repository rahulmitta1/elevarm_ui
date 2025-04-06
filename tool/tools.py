##############################################################
# THIS IS GENERATED FILE
# Do not change this manually
##############################################################

from datetime import date
import base64
import fileinput
import re
import requests
import subprocess
import os.path

STATE_INITIAL = 0
STATE_VERSION_PUBSPEC_UPDATED = 1
STATE_VERSION_CHANGELOG_UPDATED = 2
STATE_RELEASE_BRANCH_CREATED = 3
STATE_CHANGES_STAGED = 4
STATE_CHANGES_COMMITTED = 5
STATE_CHANGES_PUSHED = 6
STATE_PR_DEV_CREATED = 7
STATE_PR_PROD_CREATED = 8
STATE_TAG_CREATED = 9
STATE_TAG_PUSHED = 10
STATE_PR_DEV_MERGED = 11

def run_step(description, step_action, *args):
    print("ℹ️ {}".format(description))
    is_success, error, action = step_action(*args)
    if is_success == False:
        print("     ⛔️ ERROR {}".format(error))
        print("     ⛔️ ACTION {}".format(action))
        raise Exception(error)
    else:
        print("     ✅ OK")
        return is_success, error, action

def revert_process(state, development_branch, release_branch, new_version):
    print('')
    print('⏮️ Rolling back changes:')
    if state >= STATE_PR_DEV_MERGED:
        # Do nothing
        pass
    if state >= STATE_TAG_PUSHED:
        print('  > 10. Delete remote tag')
        delete_pushed_tag(new_version)
    if state >= STATE_TAG_CREATED:
        print('  > 9. Delete local tag')
        delete_tag(new_version)
    if state >= STATE_PR_PROD_CREATED:
        print('  > 8. ⛔️ Please delete PR to production in Bitbucket')
    if state >= STATE_PR_DEV_CREATED:
        print('  > 7. ⛔️ Please delete PR to dev in Bitbucket')
    if state >= STATE_CHANGES_PUSHED:
        print('  > 6. Delete remote release branch')
        delete_pushed_changes(release_branch)
    if state >= STATE_CHANGES_COMMITTED:
        print('  > 5. Undo last commit')
        undo_commit_changes()
    if state >= STATE_CHANGES_STAGED:
        print('  > 4. Unstage changes')
        unstage_changes()
    if state >= STATE_RELEASE_BRANCH_CREATED:
        print('  > 3. Checkout to development branch && delete release branch')
        delete_release_branch(development_branch, release_branch)
    if state >= STATE_VERSION_CHANGELOG_UPDATED:
        print('  > 2. Revert changes in CHANGELOG.md')
        revert_version_changelog()
    if state >= STATE_VERSION_PUBSPEC_UPDATED:
        print('  > 1. Revert changes in pubspec.yaml')
        revert_version_pubspec()

def revert_process_app(state, development_branch, release_branch, new_version):
    print('')
    print('⏮️ Rolling back changes:')
    if state >= STATE_PR_DEV_MERGED:
        # Do nothing
        pass
    if state >= STATE_TAG_PUSHED:
        print('  > 10. Delete remote tag')
        delete_pushed_tag(new_version)
    if state >= STATE_TAG_CREATED:
        print('  > 9. Delete local tag')
        delete_tag(new_version)
    if state >= STATE_PR_PROD_CREATED:
        print('  > 8. ⛔️ Please delete PR to production in Bitbucket')
    if state >= STATE_PR_DEV_CREATED:
        print('  > 7. ⛔️ Please delete PR to dev in Bitbucket')
    if state >= STATE_CHANGES_PUSHED:
        print('  > 6. Delete remote release branch')
        delete_pushed_changes(release_branch)
    if state >= STATE_CHANGES_COMMITTED:
        print('  > 5. Undo last commit')
        undo_commit_changes()
    if state >= STATE_CHANGES_STAGED:
        print('  > 4. Unstage changes')
        unstage_changes_app()
    if state >= STATE_RELEASE_BRANCH_CREATED:
        print('  > 3. Checkout to development branch && delete release branch')
        delete_release_branch(development_branch, release_branch)
    if state >= STATE_VERSION_CHANGELOG_UPDATED:
        print('  > 2. Revert changes in CHANGELOG.md')
        revert_version_changelog()
    if state >= STATE_VERSION_PUBSPEC_UPDATED:
        print('  > 1. Revert changes in pubspec.yaml')
        revert_version_pubspec()

def update_version_pubspec(new_version):
    isFound = False
    for line in fileinput.input("./pubspec.yaml", inplace=True):
        if 'version:' in line and isFound == False:
            print('version: {}'.format(new_version), end='\n')
            isFound = True
        else:
            print(line, end='')

    if isFound == False:
        return False, "Cannot update version in pubspec.yaml", "Make sure there is a line 'version: X' in your pubspec.yaml"
    else:
        return True, None, None

def revert_version_pubspec():
    return subprocess.run(["git", "checkout", "--", "pubspec.yaml"], capture_output=True, text=True)

def update_version_changelog(new_version, project_name = None, development_branch = None, previous_version = None):
    isFound = False
    for line in fileinput.input("./CHANGELOG.md", inplace=True):
        if '## Unreleased' in line and isFound == False:
            print('## {} - {}'.format(new_version, date.today().strftime('%d-%m-%Y')), end='\n')
            isFound = True
        else:
            print(line, end='')

    if isFound == False:
        for line in fileinput.input("./CHANGELOG.md", inplace=True):
            if '## [Unreleased]' in line and isFound == False:
                print('## [{}] - {}'.format(new_version, date.today().strftime('%d-%m-%Y')), end='\n')
                isFound = True
            elif '[Unreleased]:' in line:
                print('[Unreleased]: https://bitbucket.org/elevarm/{}/branches/compare/{}%0Dv{}'.format(project_name, development_branch, new_version.replace('+', '%2B')), end='\n')
                print('[{}]: https://bitbucket.org/elevarm/{}/branches/compare/v{}%0Dv{}'.format(new_version, project_name, new_version.replace('+', '%2B'), previous_version.replace('+', '%2B'), new_version.replace('+', '%2B')), end='\n')
                pass
            else:
                print(line, end='')
        if isFound == False:
            return False, "Cannot update version in CHANGELOG.md.", "Make sure there is a line '## Unreleased' or '## [Unreleased]' in your CHANGELOG.md."
        else:
            return True, None, None
    else:
        return True, None, None

def update_version_changelog_project(new_version, project_name = None, development_branch = None, previous_version = None):
    if os.path.exists('./CHANGELOG_PROJECT.md') == False:
        return True, None, None
    isFound = False
    for line in fileinput.input("./CHANGELOG_PROJECT.md", inplace=True):
        if '## Unreleased' in line and isFound == False:
            print('## {} - {}'.format(new_version, date.today().strftime('%d-%m-%Y')), end='\n')
            isFound = True
        else:
            print(line, end='')

    if isFound == False:
        for line in fileinput.input("./CHANGELOG_PROJECT.md", inplace=True):
            if '## [Unreleased]' in line and isFound == False:
                print('## [{}] - {}'.format(new_version, date.today().strftime('%d-%m-%Y')), end='\n')
                isFound = True
            elif '[Unreleased]:' in line:
                print('[Unreleased]: https://bitbucket.org/elevarm/{}/branches/compare/{}%0Dv{}'.format(project_name, development_branch, new_version.replace('+', '%2B')), end='\n')
                print('[{}]: https://bitbucket.org/elevarm/{}/branches/compare/v{}%0Dv{}'.format(new_version, project_name, new_version.replace('+', '%2B'), previous_version.replace('+', '%2B'), new_version.replace('+', '%2B')), end='\n')
                pass
            else:
                print(line, end='')
        if isFound == False:
            return False, "Cannot update version in CHANGELOG_PROJECT.md.", "Make sure there is a line '## Unreleased' or '## [Unreleased]' in your CHANGELOG_PROJECT.md."
        else:
            return True, None, None
    else:
        return True, None, None

def revert_version_changelog():
    subprocess.run(["git", "checkout", "--", "CHANGELOG_PROJECT.md"], capture_output=True, text=True)
    return subprocess.run(["git", "checkout", "--", "CHANGELOG.md"], capture_output=True, text=True)

def create_release_branch(release_branch):
    p = subprocess.Popen(["git", "checkout", "-b", release_branch], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "'git checkout -b {}': '{}'".format(release_branch, error.decode('utf-8')), "Check whether the version that you entered is correct."
    else:
        return True, None, None

def delete_release_branch(development_branch, release_branch):
    subprocess.run(["git", "checkout", development_branch], capture_output=True, text=True)
    return subprocess.run(["git", "branch", "-d", release_branch], capture_output=True, text=True)

def stage_changes():
    subprocess.run(["git", "add", "pubspec.yaml"], capture_output=True, text=True)
    subprocess.run(["git", "add", "CHANGELOG.md"], capture_output=True, text=True)
    return True, None, None

def stage_changes_app():
    subprocess.run(["git", "add", "pubspec.yaml"], capture_output=True, text=True)
    subprocess.run(["git", "add", "pubspec.lock"], capture_output=True, text=True)
    subprocess.run(["git", "add", "CHANGELOG.md"], capture_output=True, text=True)
    subprocess.run(["git", "add", "CHANGELOG_PROJECT.md"], capture_output=True, text=True)
    return True, None, None

def unstage_changes():
    subprocess.run(["git", "reset", "CHANGELOG.md"], capture_output=True, text=True)
    return subprocess.run(["git", "reset", "pubspec.yaml"], capture_output=True, text=True)

def unstage_changes_app():
    subprocess.run(["git", "reset", "CHANGELOG_PROJECT.md"], capture_output=True, text=True)
    subprocess.run(["git", "reset", "CHANGELOG.md"], capture_output=True, text=True)
    subprocess.run(["git", "reset", "pubspec.yaml"], capture_output=True, text=True)
    return subprocess.run(["git", "reset", "pubspec.lock"], capture_output=True, text=True)

def commit_changes(commit_message):
    p = subprocess.Popen(["git", "commit", "-m", commit_message], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "     ⛔️ ERROR: 'git commit -m {}': '{}'".format(commit_message, error.decode('utf-8')), "-"
    else:
        return True, None, None

def undo_commit_changes():
    return subprocess.run(["git", "reset", "HEAD~"], capture_output=True, text=True)

def push_changes(release_branch):
    p = subprocess.Popen(["git", "push", "--set-upstream", "origin", release_branch], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "     ⛔️ ERROR: 'git push --set-upstream {}': '{}'".format(release_branch, error.decode('utf-8')), "-"
    else:
        return True, None, None

def delete_pushed_changes(release_branch):
    return subprocess.run(["git", "push", "origin", "--delete", release_branch], capture_output=True, text=True)

def create_pull_request(project_name, access_token, title, description, source_branch, target_branch):
    result = requests.post(
        "https://api.bitbucket.org/2.0/repositories/elevarm/{}/pullrequests".format(project_name),
        json = { 
            "title": title,
            "description": description,
            "source": {
                "branch": {  
                    "name": source_branch
                } 
            }, 
            "destination": { 
                "branch": {  
                    "name": target_branch
                } 
            }, 
            "reviewers": [], 
            "close_source_branch": False
        },
        headers = {
            "Authorization": "Basic {}".format(base64.b64encode(access_token.encode()).decode('utf-8')),
            "Content-Type": "application/json"
        }
    )
    if result.status_code != 201 and result.status_code != 200:
        return False, "Creating Pull Request to branch {}: '{}'".format(target_branch, result.text), "-"
    else:
        pr_id = result.json()['id']
        return True, None, pr_id

def create_tag(new_version):
    subprocess.run(["git", "tag", "-a", "v{}".format(new_version), "-m", "Version ".format(new_version)], capture_output=True, text=True)
    return True, None, None

def delete_tag(new_version):
    return subprocess.Popen(["git", "tag", "--delete", "v{}".format(new_version)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def push_tag():
    p = subprocess.Popen(["git", "push", "--tags"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "     ⛔️ ERROR: 'git push --tags': '{}'".format(error.decode('utf-8')), "-"
    else:
        return True, None, None

def delete_pushed_tag(new_version):
    return subprocess.Popen(["git", "push", "--delete", "origin", "v{}".format(new_version)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def merge_pr_bitbucket(project_name, access_token, pr_id, close_source_branch):
    result = requests.post(
        "https://api.bitbucket.org/2.0/repositories/elevarm/{}/pullrequests/{}/merge".format(project_name, pr_id),
        json = { 
            "type": "",
            "message": "",
            "close_source_branch": close_source_branch,
            "merge_strategy": "fast_forward",
        },
        headers = {
            "Authorization": "Basic {}".format(base64.b64encode(access_token.encode()).decode('utf-8')),
            "Content-Type": "application/json"
        }
    )
    if result.status_code != 201 and result.status_code != 200:
        return False, "ERROR Merging Pull Request {}: {}".format(pr_id, result.text), "-"
    else:
        return True, None, None

def checkout_development_branch(development_branch):
    subprocess.run(["git", "checkout", development_branch], capture_output=True, text=True)
    return True, None, None

def is_version_valid(version):
    return re.match("^[0-9]+.[0-9]+.[0-9]+$", version) is not None

def is_version_app_valid(version):
    return re.match("^[0-9]+.[0-9]+.[0-9]+\+[0-9]+$", version) is not None

def is_pubspec_dependencies_valid():
    with open('./pubspec.yaml', 'r') as file:
        data = file.read()
        if "ref: dev" in data:
            return False, "Your pubspec.yaml contains dependencies to dev branch.", "Change the dev branch into locked version."
        else:
            return True, None, None

def get_current_branch():
    return subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()

def is_current_branch_dev(development_branch):
    current_branch = get_current_branch()
    if current_branch != development_branch:
        return False, "You are currently not on the development branch: '{}'".format(development_branch), "Checkout to the development branch: '{}'".format(development_branch)
    else:
        return True, None, None

PROJECT_CODES = [
    "ELL-", # Agrilelang
    "EUI-", # Elevarm UI
    "ELAPP-", # Elevarm App/Dashboard
    "AGPOS-", # AgriPoint
    "PAG-", # PasarAgri
]

def is_commit_message_valid(commit_message):
    matches = [code for code in PROJECT_CODES if commit_message.startswith(code)]
    return len(matches) != 0

def contains_uppercase(text):
    return any(char.isupper() for char in text)

def is_valid_feature_branch(branch):
    is_prefix_true = re.match("^feature\/(.)+", branch) is not None
    is_lowercase = contains_uppercase(branch) == False
    return is_prefix_true and is_lowercase

def is_valid_bugfix_branch(branch):
    is_prefix_true = re.match("^bugfix\/(.)+", branch) is not None
    is_lowercase = contains_uppercase(branch) == False
    return is_prefix_true and is_lowercase

def is_valid_release_branch(branch):
    is_prefix_true = re.match("^release\/v[0-9]+.[0-9]+.[0-9]+(\+[0-9]+)?", branch) is not None
    is_lowercase = contains_uppercase(branch) == False
    return is_prefix_true and is_lowercase

def is_development_branch_up_to_date():
    # Call "git remote update"
    p = subprocess.Popen(["git", "remote", "update"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "'git remote update': {}".format(error.decode('utf-8'))

    # Call "git status -uno"
    p = subprocess.Popen(["git", "status", "-uno"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = p.communicate()
    if p.returncode != 0:
        return False, "'git status -uno': '{}'".format(error.decode('utf-8')), None
    elif 'branch is up to date' not in str(output):
        return False, "Your local development branch is not update with remote.", "Please update your local branch with the remote changes."
    else:
        return True, None, None

def create_pull_request_comment(project_name, pr_id, access_token, comment):
    result = requests.post(
        "https://api.bitbucket.org/2.0/repositories/elevarm/{}/pullrequests/{}/comments".format(project_name, pr_id),
        json = { 
            "content": {
                "raw": comment
            }
        },
        headers = {
            "Authorization": "Bearer {}".format(access_token),
            "Content-Type": "application/json"
        }
    )
    if result.status_code != 201 and result.status_code != 200:
        return False, "Creating Pull Request comment to PR {}: '{}'".format(pr_id, result.text), "-"
    else:
        return True, None, None

def update_pull_request_comment(project_name, pr_id, access_token, comment, comment_id):
    result = requests.put(
        "https://api.bitbucket.org/2.0/repositories/elevarm/{}/pullrequests/{}/comments/{}".format(project_name, pr_id, comment_id),
        json = { 
            "content": {
                "raw": comment
            }
        },
        headers = {
            "Authorization": "Bearer {}".format(access_token),
            "Content-Type": "application/json"
        }
    )
    if result.status_code != 201 and result.status_code != 200:
        return False, "Updating Pull Request comment to PR {}: '{}'".format(pr_id, result.text), "-"
    else:
        return True, None, None

def get_pull_request_comments(project_name, access_token, pr_id):
    result = requests.get(
        "https://api.bitbucket.org/2.0/repositories/elevarm/{}/pullrequests/{}/comments".format(project_name, pr_id),
        headers = {
            "Authorization": "Bearer {}".format(access_token)
        }
    )
    if result.status_code != 201 and result.status_code != 200:
        return False, "Get Pull Request Comments of PR {}: '{}'".format(pr_id, result.text), "-"
    else:
        comments = result.json()['values']
        return True, None, comments

def is_pull_request_title_valid(commit_message):
    matches = [code for code in PROJECT_CODES if commit_message.startswith(code)]
    return len(matches) != 0

def get_pr_section(pr_description, start, end):
    split_section_start = pr_description.split(start, 1)
    if len(split_section_start) == 1:
        return False, 'Start keyword: "{}" not found'.format(start), None
    split_section_end = split_section_start[1].split(end, 1)
    if len(split_section_end) == 1:
        return False, 'End keyword: "{}" not found'.format(end), None
    return True, None, split_section_end[0]

def is_pull_request_ticket_valid(pr_description):
    is_valid, err, section_str = get_pr_section(pr_description, '## Ticket', '## Changes')
    if is_valid == False:
        return False, err
    if 'https://elevarm.atlassian.net/browse' in section_str:
        return True, None
    else:
        return False, 'No Jira ticket found in Ticket section'

def is_pull_request_changes_valid(pr_description):
    is_valid, err, section_str = get_pr_section(pr_description, '## Changes', '## Screenshots')
    if is_valid == False:
        return False, err
    if 'Added:' in section_str and 'Changed:' in section_str and 'Deprecated:' in section_str and 'Removed:' in section_str and 'Fixed:' in section_str and 'Security:' in section_str:
        return False, 'The Changes section hasn\'t been modified'
    else:
        return True, None

def is_pull_request_screenshots_valid(pr_description):
    is_valid, err, section_str = get_pr_section(pr_description, '## Screenshots', '## Videos')
    if is_valid == False:
        return False, err
    if '![](https://bitbucket.org/repo' in section_str:
        return True, None
    else:
        return False, 'No images found in Screenshots section'

def is_pull_request_videos_valid(pr_description):
    is_valid, err, section_str = get_pr_section(pr_description, '## Videos', '## Note for Reviewer')
    if is_valid == False:
        return False, err
    if 'https://drive.google.com/file' in section_str:
        return True, None
    else:
        return False, 'No videos found in Videos section'