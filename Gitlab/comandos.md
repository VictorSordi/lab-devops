git tag -a v1.0.0 -m "Release inicial"
git push origin v1.0.0



# delete local tag '12345'
git tag -d 12345
# delete remote tag '12345' (eg, GitHub version too)
git push origin :refs/tags/12345
# alternative approach
git push --delete origin tagName
git tag -d tagName