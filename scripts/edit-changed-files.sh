# Open all files logged by git-status.
$EDITOR $(git status --porcelain | awk '{print $2}')
# $EDITOR $(git status --porcelain | rev | cut -d ' ' -f 1 | rev)
