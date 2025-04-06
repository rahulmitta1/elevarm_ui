##############################################################
# THIS IS GENERATED FILE
# Do not change this manually
##############################################################

from tools import get_current_branch, is_valid_feature_branch, is_valid_bugfix_branch, is_valid_release_branch, is_commit_message_valid
import sys

hook_type = sys.argv[1]

if hook_type == "pre-push":
    branch = get_current_branch()

    is_valid_feature = is_valid_feature_branch(branch)
    is_valid_bugfix = is_valid_bugfix_branch(branch)
    is_valid_release = is_valid_release_branch(branch)

    print('ℹ️ Checking branch name...')
    if is_valid_feature == False and is_valid_bugfix == False and is_valid_release == False:
        print("  ⛔️ ERROR: Your branch name doesn't comply with feature/bugfix/release naming convention.")
        exit(1)
    else:
        print('  ✅ OK')
        exit(0)
    pass
elif hook_type == "prepare-commit-msg":
    # Arguments
    commit_message_file_path = sys.argv[2]

    # Variables
    commit_message = ''

    with open(commit_message_file_path, 'r') as file:
        commit_message = file.read()

    print('ℹ️ Checking commit message...')
    if is_commit_message_valid(commit_message) == False:
        print('  ⛔️ ERROR: Commit message must starts with JIRA ticket code (AGPOS/ELL/ELAPP/EUI/PAG).')
        exit(1)
    else:
        print('  ✅ OK')
        exit(0)
else:
    exit(0)
