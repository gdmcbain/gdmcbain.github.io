#!/usr/bin/env bash

# https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

git stash
git checkout develop

stack exec pages clean
stack exec pages build

git fetch --all
git checkout -b master --track origin/master

cp -a _site/. ..

git add -A
git commit -m publish

git push origin master:master

git checkout develop
git branch -D master
git stash pop
