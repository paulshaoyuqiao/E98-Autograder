# Automated Scripts to Fetch and Test Against All Specified Students' Repositories
# for an Assignment and Output The Results to a CSV file.

# AUTHOR: Paul Shao

import os
import pandas as pd

PARTIAL_CLONE_PREV = "svn export --force https://github.com/{}/ics_bc_s18/trunk/{}"
# The link above was only used for testing purposes (fetching files from previous semester offerings).

PARTIAL_CLONE = "svn export https://github.com/{}/{}/trunk/{}"
BASE_URL = "git clone https://github.com/{}/ics_bc_s18.git"
REMOVE_CMD = "rm -rf {}"
SEARCH_PATH = "./{}/{}/{}"
LAB_CHECK = "{}/.lab{}_progress.txt"

def normalize_score(passed, failed, total):
    '''
    Given the number of passed and failed test cases for a specifc
    method, return the normalized scores for this method.
    @param passed -> the number of passed test cases.
    @param failed -> the number of failed test cases.
    @param total -> the total allocated points for this method.
    @return a normalized score.
    '''
    if passed + failed == 0:
        return 0
    return round(passed / (passed + failed + 0.0) * total, 2)

def fetch_from_github(usernames, week, repo_names, chapters, files):
    '''
    Given a list of Github usernames and an assignment name,
    fetch from the designated Github repositories the students'
    code files, ane execute the autograder on it.
    @param usernames -> a list of usernames (to be used as baseURL)
    @param week -> the week this assignment is given (to search for the code file)
    @param repo_names -> the name of the repository that contains all the code files for this course
    @param chapters -> a list of chapters (to search for the code file)
    @param files -> a list of the names of all files to test the scripts on
    @return a CSV file containing all the students' names assoicated with
    their scores on this particular assignment.
    '''
    scores = {}
    scores['Github Username'] = []
    scores['Week'] = []
    scores['Tested Method'] = []
    scores['Score'] = []
    index = 0
    for username in usernames:
        print('We are currently grading this week\'s assignment by {}...'.format(username))
        repository_url = PARTIAL_CLONE.format(username, repo_names[index], week)
        try:
            os.system(repository_url)
        except ConnectionError as e:
            print(e)
            print('Check if you have input the student\'s repository names correctly. Otherwise please \
            wait for a few more minutes before running the autograder on this student again. Thanks.')
            print('Currently moving on to the next student....')
            continue
        print('fetch success!')
        wk = week[-1]
        lab_progress = LAB_CHECK.format(week, wk)
        lab_score = 0
        try:
            if '2' in open(lab_progress).read():
                lab_score = 2
            else:
                lab_score = 1
        except FileNotFoundError as e:
            print(e)
            print('The studenet might not have finished the lab for this week.')
            print('Please contact the student \
            and make sure he/she has the lab progress file with a completion score of 2 inside.')
        scores['Github Username'].append(username)
        scores['Week'].append(week)
        scores['Tested Method'].append("lab{}".format(wk))
        scores['Score'].append(lab_score)

        error_tracker = open("errors.txt", "a")
        error_tracker.write("{} - Errors encountered while tesitng the meethod: \n".format(username))
        error_tracker.write("\n")

        cmd = 'ruby -r "./execute.rb" -e "Exec.run_all_test"'

        p = os.popen(cmd)
        s = p.read().strip()
        user_score = s.split('\n')
        for i in range(len(user_score) // 3):
            tested_method = '{}.rb'.format(user_score[3 * i])
            passed = int(user_score[3 * i + 1])
            failed = int(user_score[3 * i + 2])
            score = normalize_score(passed, failed, 2)
            scores['Github Username'].append(username)
            scores['Week'].append(week)
            scores['Tested Method'].append(tested_method)
            scores['Score'].append(score)
        clear_repository = REMOVE_CMD.format(week)
        os.system(clear_repository)

        error_tracker.write("\n")
        error_tracker.close()

        index += 1
    score_summary = pd.DataFrame(scores)
    summary_name = '{}_scoring_summary.csv'.format(week)
    score_summary.to_csv(summary_name)

print('Please provide a list of usernames, repo_names, chapters, ruby files(methods), and specify the week of the assignment')