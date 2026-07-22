abbr ga 'git add'
abbr gau 'git add --update'
abbr gc 'git commit'
abbr gcm --set-cursor 'git commit -m "%"'
abbr gl 'git pull'
abbr gr 'git pull -r'
abbr glom "git pull $(git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's|/| |')"
abbr grom "git pull -r $(git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null | sed 's|/| |')"
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gpsu 'git push --set-upstream origin (git branch --show-current)'
abbr gru 'git reset --'

abbr gs 'git status'
abbr gss 'git status -s'
abbr gsb 'git status -sb'

abbr gb 'git branch'
abbr gbD 'git branch -D'
abbr gba 'git branch -a'
abbr gbd 'git branch -d'
abbr gbm 'git branch --merged'
abbr gbnm 'git branch --no-merged'
abbr gbr 'git branch --remote'

abbr gbs 'git bisect'
abbr gbsb 'git bisect bad'
abbr gbsg 'git bisect good'
abbr gbsr 'git bisect reset'
abbr gbss 'git bisect start'

abbr gco 'git checkout'
abbr g- 'git checkout -'
abbr gcob 'git checkout -b'

abbr gd 'git diff'
abbr gdw 'git diff -w'
abbr gds 'git diff --staged'
abbr gdsw 'git diff --staged -w'

abbr gdr "git diff @{u}..HEAD"
abbr glr "git range-diff @{u}...HEAD"

abbr glg 'git log'
abbr glp 'git log -p'
abbr glo 'git log --oneline --decorate'

abbr gf 'git fetch'
abbr gfa 'git fetch --all --prune'
abbr gfo 'git fetch origin'

abbr gst 'git stash'
abbr gsta 'git stash apply --index'
abbr gstd 'git stash drop'
abbr gstl 'git stash list'
abbr gstp 'git stash pop --index'
abbr gsts 'git stash show --text'
abbr gstall 'git stash --all'

abbr gdm "git diff $(git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null).."
abbr glm "git log $(git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null).."

abbr gw 'git worktree'
abbr gwl 'git worktree list'
abbr gwa 'git worktree add'
abbr gwr 'git worktree remove'

