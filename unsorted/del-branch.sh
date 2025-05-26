# ===================================
# git branch | grep '^  ABC/_' | xargs -n1 git branch -D
# ===================================

###

git branch | grep '^  ABC/' | while read branch; do
    echo "$branch"
    # git branch -D "$branch"
done
