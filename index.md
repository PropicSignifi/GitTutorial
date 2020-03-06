# A Tutorial of Git and Source Code Management

![version control](images/version-control.jpg)

---

# Why version control?

Have you ever met one of these problems?

- The code I did last night worked. I wish I could revert it back.

- I have to copy the same file to maintain multiple versions, and now I don't know their differences and don't know which one to choose.

- I want someone else to participate in my work, but I don't want him to overwrite my progress.

---

# Git and its history

Git is a distributed version-control system, created by Linus Torvalds (who is also the creator of Linux kernel) in 2005, originally designed for efficiently handling large projects like Linux kernel.

People may get confused with git and github. Git is a command-line tool for version control. While github is a website that user can share and even collaborate on their git repositories.

---

# Level of difficulty

I will categorize each page with a level of difficulty.

![basic](https://img.shields.io/badge/-Basic-brightgreen) Basic commands that you should be familiar with

![intermediate](https://img.shields.io/badge/-Intermediate-blue) Learning these commands or knowledge will help you understand how git internally works

![advanced](https://img.shields.io/badge/-Advanced-red) Advanced skills but still proved to be useful

---

# Getting a repository ![basic](https://img.shields.io/badge/-Basic-brightgreen)

A Repository is a location that you keep all the files related to your project.

We can either create a new repository (`git init`), or get an existing repository from somewhere else (`git clone`).

---

# Getting a repository ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git clone

This will copy a remote repository (usually from the Internet) to your local filesystem.

```git
git clone https://github.com/PropicSignifi/GitTutorial
```

---

# Getting a repository ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git init

This will convert your current directory into a git repository

```git
mkdir MyProject
cd MyProject
git init
```

---

# Checking your status ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git status

It shows the status of your current branch, the status of all the files in
your repository, and the status of the differences between your local branch
and your remote branch.

This is an example of a clean status. We will see more complicated status as
the tutorial proceeds.

```git
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

Advice: always check your status before taking further actions.

---

# Branch ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git branch

`git branch` shows the status of the branches.

```git
$ git branch
* master
```

This shows me that I have only one branch named "master". By default, "master"
is the main branch of a git repository.

---

# Branch ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git branch

We can create a new branch by type a new branch name after `git branch`:

```git
$ git branch myNewBranch
```

Now check your branches status again.

```git
$ git branch
* master
  myNewBranch
```

We have two branches now, but our current working branch is still "master".

---

# Branch ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git checkout \<branch\>

We can switch to a different branch using the command `git checkout`

```git
$ git checkout myNewBranch
$ git branch
  master
* myNewBranch
```

![intermediate](https://img.shields.io/badge/-Intermediate-blue)
`git checkout` has many, many usages. We can use it to switch to a branch,
a commit, or a tag. We can also checkout a file or a directory. Even
more, we can combine the both. For example, checkout a file from a
specific branch. We will see some of these examples later.

---

# Making changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

Let's start from creating a new file, name it "hello.txt", and add some
content to the file:

```git
echo "Hello world" >> hello.txt
```

Now if we see our `git status`, we can see "hello.txt" is recognized as
an untracked file.

```git
$ git status
On branch myNewBranch
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	hello.txt

nothing added to commit but untracked files present (use "git add" to track)
```

---

# Making changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git add \<path\>

`git add` will convert our untracked file to a staged status.

```git
$ git add hello.txt
$ git status
On branch myNewBranch
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   hello.txt
```

---

# Making changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git commit

We are not ready to commit our change. A new commit requires a commit message.
You may pass your commit message through the `-m` option.

```git
git commit -m "Add the line Hello world to the file hello.txt"
```

Now check our status again. Everything is clean.

```git
$ git status
On branch myNewBranch
nothing to commit, working tree clean
```

---

# Checking the history ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git log

```git
$ git log
commit 4ce2556bc32186220054359bc275f8a6a90d4ca4 (HEAD -> myNewBranch)
Author: Henry Li <henry@clicktocloud.com>
Date:   Fri Mar 6 11:20:14 2020 +1100

    Add the line Hello world to the file hello.txt
```

---

# Checking the history ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git log

Many times, we can use `git log -p` instead, which will also show the
detailed changes.

```git
$ git log -p
commit 4ce2556bc32186220054359bc275f8a6a90d4ca4 (HEAD -> myNewBranch)
Author: Henry Li <henry@clicktocloud.com>
Date:   Fri Mar 6 11:20:14 2020 +1100

    Add the line Hello world to the file hello.txt

diff --git a/hello.txt b/hello.txt
new file mode 100644
index 0000000..802992c
--- /dev/null
+++ b/hello.txt
@@ -0,0 +1 @@
+Hello world
```

---

# Checking the changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git diff

Using `git diff` can also check the changes. For example, `git diff master`
will show us the difference from the master branch to our current branch.

```diff
$ git diff master
diff --git a/hello.txt b/hello.txt
new file mode 100644
index 0000000..802992c
--- /dev/null
+++ b/hello.txt
@@ -0,0 +1 @@
+Hello world
```

---

# Making changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

Let's continue to make changes on the file "hello.txt".

```git
echo "Hello again" >> hello.txt
```

Check the status. This time, the file "hello.txt" is in a modified status.

```git
$ git st
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   hello.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

---

# Checking the changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

If there are files in a modified status, we can see the unstaged
changes using `git diff`.

```diff
$ git diff
diff --git a/hello.txt b/hello.txt
index 802992c..06ae335 100644
--- a/hello.txt
+++ b/hello.txt
@@ -1 +1,2 @@
 Hello world
+Hello again
```

---

# File status ![basic](https://img.shields.io/badge/-Basic-brightgreen)

So far, we've seen all four different status of a file. They are:

- Untracked (new)
- Unmodified (clean)
- Modified (unstaged)
- Staged

---

# File status ![basic](https://img.shields.io/badge/-Basic-brightgreen)

![status-cycle](images/lifecycle.png)

---

# Pulling the changes ![basic](https://img.shields.io/badge/-Basic-brightgreen)

## git pull

Git is a distributed version control system, which means there are also changes
made by other people from other places. We can get their update using the
`git pull` command.

Usually we only care about the main branch from our origin master branch.
So the following one would be a frequently used command:

```git
git pull origin master
```

---

# References

[Pro Git, Scott Chacon and Ben Straub](https://git-scm.com/book/en/v2)
