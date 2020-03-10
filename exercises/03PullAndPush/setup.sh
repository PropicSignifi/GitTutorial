#!/bin/sh

git init --bare MyProject.git

git clone MyProject.git MyProject

cd MyProject

echo Hello world >> hello.txt

git add hello.txt

git commit -m 'Add file hello world'

echo Another hello message >> hello.txt

git add hello.txt

git commit -m 'Add another hello message'

git push

git reset head~1

git checkout .
