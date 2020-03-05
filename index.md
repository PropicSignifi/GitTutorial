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
mkdir NewFolder
cd NewFolder
git init
```

---

# Check your status ![basic](https://img.shields.io/badge/-Basic-brightgreen)

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

# References

[Pro Git, Scott Chacon and Ben Straub](https://git-scm.com/book/en/v2)
