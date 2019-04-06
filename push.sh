setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_pdf() {
  git checkout gh-pages
  git add cv.pdf
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@github.com/stilos25/online-cv.git > /dev/null 2>&1
  git push --quiet -u origin gh-pages
}

setup_git
commit_pdf
upload_files
