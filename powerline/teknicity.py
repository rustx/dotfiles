from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    USERNAME_FG = 179
    USERNAME_BG = 239
    USERNAME_ROOT_BG = 209

    HOSTNAME_FG = 15
    HOSTNAME_BG = 23

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 31  # blueish
    HOME_FG = 15  # white
    PATH_BG = 238
    PATH_FG = 150
    CWD_FG = 150
    SEPARATOR_FG = 251

    READONLY_BG = 209
    READONLY_FG = 0

    REPO_CLEAN_BG = 150  # pale green
    REPO_CLEAN_FG = 235
    REPO_DIRTY_BG = 203  # pale red
    REPO_DIRTY_FG = 255

    JOBS_FG = 215
    JOBS_BG = 4

    CMD_PASSED_BG = 7
    CMD_PASSED_FG = 8
    CMD_FAILED_BG = 9
    CMD_FAILED_FG = 15

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 255
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 255
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 255
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 255

    GIT_STASH_BG = 221
    GIT_STASH_FG = 0

    VIRTUAL_ENV_BG = 150
    VIRTUAL_ENV_FG = 0

    AWS_PROFILE_FG = 0
    AWS_PROFILE_BG = 7

    TIME_FG = 236
    TIME_BG = 150
