git tag -a v1.0.0 -m "Release inicial"
git push origin v1.0.0



# delete local tag '12345'
git tag -d v1.0.0
# delete remote tag '12345' (eg, GitHub version too)
git push origin :refs/tags/v1.0.0
# alternative approach
git push --delete origin tagName
git tag -d tagName