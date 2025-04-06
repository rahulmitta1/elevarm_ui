##############################################################
# THIS IS GENERATED FILE
# Do not change this manually
##############################################################

from tools import STATE_INITIAL, STATE_VERSION_PUBSPEC_UPDATED, STATE_VERSION_CHANGELOG_UPDATED, STATE_RELEASE_BRANCH_CREATED, STATE_CHANGES_STAGED, STATE_CHANGES_COMMITTED, STATE_CHANGES_PUSHED, STATE_PR_DEV_CREATED, STATE_PR_PROD_CREATED, STATE_TAG_CREATED, STATE_TAG_PUSHED, STATE_PR_DEV_MERGED, revert_process, run_step, checkout_development_branch, merge_pr_bitbucket, delete_pushed_tag, delete_tag, create_tag, push_tag, create_pull_request, delete_pushed_changes, push_changes, undo_commit_changes, commit_changes, unstage_changes, stage_changes, delete_release_branch, create_release_branch, revert_version_changelog, revert_version_pubspec, update_version_changelog, update_version_pubspec, is_version_valid, is_pubspec_dependencies_valid, is_current_branch_dev, is_development_branch_up_to_date
import json
import os.path

###############################################################
# VARIABLES
###############################################################

PROJECT_NAME = "elevarm_ui"
DEVELOPMENT_BRANCH = "dev"
PRODUCTION_BRANCH = "master"

if os.path.isfile('./env.json') == False:
    print("⛔️ ERROR: env.json file not found")
    exit(1)

with open('./env.json') as f:
    d = json.load(f)
    if 'BITBUCKET_ACCESS_TOKEN' not in d:
        print("⛔️ ERROR: BITBUCKET_ACCESS_TOKEN not found in env.json")
        exit(1)
    else:
        ACCESS_TOKEN = d['BITBUCKET_ACCESS_TOKEN']

###############################################################
# MAIN SCRIPT
###############################################################

state = STATE_INITIAL
new_version = ''
previous_version = ''
jira_ticket_code = ''
release_branch = None
pr_dev_id = None
pr_prod_id = None

try:
    # 1. Check whether there are dev dependencies in pubspec.yaml.
    run_step("Checking dependencies in pubspec.yaml...", is_pubspec_dependencies_valid)

    # 2. Check whether your current branch is development branch.
    run_step("Checking whether your current branch is development branch...", is_current_branch_dev, DEVELOPMENT_BRANCH)

    # 3. Check whether your development branch is up to date.
    run_step("Checking whether your development branch is up to date...", is_development_branch_up_to_date)

    # Prompts user for the previous version.
    while is_version_valid(previous_version) != True:
        previous_version = input('🔵 What is the current version? ')
        if is_version_valid(previous_version) != True:
            print("     ⛔️ ERROR: The current version must use convention: X.Y.Z . For example: 1.2.3")
        else:
            print("     ✅ OK")

    # Prompts user for the new version.
    while is_version_valid(new_version) != True:
        new_version = input('🔵 What is the new version? ')
        if is_version_valid(new_version) != True:
            print("     ⛔️ ERROR: The new version must use convention: X.Y.Z . For example: 1.2.3")
        else:
            print("     ✅ OK")

    # Prompts user for the Jira ticket code.
    jira_ticket_code = input('🔵 What is the Jira ticket code? ')

    # TODO: Check whether the new_version already exists.

    # Update version in pubspec.yaml
    run_step("1. Updating version in pubspec.yaml...", update_version_pubspec, new_version)
    state = STATE_VERSION_PUBSPEC_UPDATED

    # Update version in CHANGELOG.md
    run_step("2. Updating version in CHANGELOG.md...", update_version_changelog, new_version, PROJECT_NAME, DEVELOPMENT_BRANCH, previous_version)
    state = STATE_VERSION_CHANGELOG_UPDATED

    # Checkout to release branch.
    release_branch = "release/v{}".format(new_version)
    run_step("3. Creating release branch...", create_release_branch, release_branch)
    state = STATE_RELEASE_BRANCH_CREATED

    # Stage the changes
    run_step("4. Staging changes...", stage_changes)
    state = STATE_CHANGES_STAGED

    # Commit the changes
    run_step("5. Commit changes...", commit_changes, "{} Bump version to {}".format(jira_ticket_code, new_version))
    state = STATE_CHANGES_COMMITTED

    # Push the changes
    run_step("6. Pushing changes...", push_changes, release_branch)
    state = STATE_CHANGES_PUSHED

    # Create PR to dev
    _, __, pr_id = run_step(
        "7. Creating Pull Request to development branch...", 
        create_pull_request,
        PROJECT_NAME, 
        ACCESS_TOKEN, 
        "Bump version to {}".format(new_version), 
        "Please merge this first and use 'Fast forward' merge strategy.", 
        release_branch, 
        DEVELOPMENT_BRANCH
    )
    state = STATE_PR_DEV_CREATED
    pr_dev_id = pr_id

    # Create PR to master
    _, __, pr_id = run_step(
        "8. Creating Pull Request to production branch...",
        create_pull_request,
        PROJECT_NAME, 
        ACCESS_TOKEN, 
        "Release new version {}".format(new_version), 
        "Please merge this last and use 'Fast forward' merge strategy.", 
        release_branch, 
        PRODUCTION_BRANCH
    )
    state = STATE_PR_PROD_CREATED
    pr_prod_id = pr_id

    print("")
    print("<> Please check whether these Pull Requests are ready to be merged:")
    print("   > PR development branch: {}".format("https://bitbucket.org/elevarm/{}/pull-requests/{}".format(PROJECT_NAME, pr_dev_id)))
    print("   > PR production branch: {}".format("https://bitbucket.org/elevarm/{}/pull-requests/{}".format(PROJECT_NAME, pr_prod_id)))
    print("")

    # Prompts user for creating tag
    is_create_tag = input('<> Do you want to create tag v{}?(y/n) '.format(new_version))
    if is_create_tag != 'y':
        print('Thank you~')
        exit(0)
    
    # Create tag
    run_step("9. Creating tag v{}...".format(new_version), create_tag, new_version)
    state = STATE_TAG_CREATED

    # Push tag
    run_step("10. Pushing tag...", push_tag)
    state = STATE_TAG_PUSHED

    is_merge_pr = input('<> Do you want to merge the Pull Requests?(y/n) ')
    if is_merge_pr != 'y':
        print('Thank you~')
        exit(0)

    # Merge PR to dev
    run_step(
        "11. Merging Pull Request to development branch...",
        merge_pr_bitbucket,
        PROJECT_NAME,
        ACCESS_TOKEN,
        pr_dev_id,
        False
    )
    state = STATE_PR_DEV_MERGED

    # Merge PR to production
    run_step(
        "12. Merging Pull Request to production branch...",
        merge_pr_bitbucket,
        PROJECT_NAME,
        ACCESS_TOKEN,
        pr_prod_id,
        True
    )

    # Checkout to development branch
    run_step(
        "13. Moving back to development branch...",
        checkout_development_branch,
        DEVELOPMENT_BRANCH,
    )

    print("")
    print("🎉🎉🎉 Finish 🎉🎉🎉 Please pull the latest development branch")
    print("")

except Exception as e:
    revert_process(state, DEVELOPMENT_BRANCH, release_branch, new_version)
    exit(1)
