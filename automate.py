# Automated Scripts to Fetch and Test Against All Specified Students' Repositories
# for an Assignment and Output The Results to a CSV file.

# AUTHOR: Paul Shao

import os
import pandas as pd

PARTIAL_CLONE = "svn export --force https://github.com/{}/ics_bc_s18/trunk/{}"
BASE_URL = "git clone https://github.com/{}/ics_bc_s18.git"
REMOVE_CMD = "rm -rf {}"
SEARCH_PATH = "./{}/{}/{}"

def normalize_score(passed, failed, total):
    '''
    Given the number of passed and failed test cases for a specifc
    method, return the normalized scores for this method.
    @param passed -> the number of passed test cases.
    @param failed -> the number of failed test cases.
    @param total -> the total allocated points for this method.
    @return a normalized score.
    '''
    return passed / (passed + failed) * total


def fetch_from_github(usernames, week, chapters, files):
    '''
    Given a list of Github usernames and an assignment name,
    fetch from the designated Github repositories the students'
    code files, ane execute the autograder on it.
    @param usernames -> a list of usernames (to be used as baseURL)
    @param week -> the week this assignment is given (to search for the code file)
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
    for username in usernames:
        repository_url = PARTIAL_CLONE.format(username, week)
        os.system(repository_url)
        print('fetch success!')
        for c in chapters:
            for f in files:
                exists = os.path.isfile(SEARCH_PATH.format(week, c, f))
                if not exists:
                    raise FileNotFoundError("The required code file {} cannot be found.".format(f))
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
    score_summary = pd.DataFrame(scores)
    summary_name = '{}_scoring_summary.csv'.format(week)
    score_summary.to_csv(summary_name)