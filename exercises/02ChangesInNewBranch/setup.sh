#!/bin/sh

mkdir MyProject

cd MyProject

git init

echo "Hello world" >> hello.txt

git add hello.txt

git commit -m 'Inital commit'
