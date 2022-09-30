---
layout: single
title:  Pushing new config to same repo but new branch
date:   2022-08-28 14:23
author: Noah

categories: 
  - Ricing
  - Github
tags: 
 - Rice

categories_label: "Categories: "

toc: true
---

So I have been Working on a rice for quite a while now and it has constantly changed. I Started out with BSPWM on Xorg but soon switched to Hyperland on wayland. So that meant I needed to use different tools. Git is one of the ones that remained consistent. 

There is a nice article out there on [here](https://www.atlassian.com/git/tutorials/dotfiles) on how to manage dotfiles. There is also a[youtube](https://youtu.be/tBoLDpTWVOM) video that goes over this concep. I basically started using this method to start keeping track of my dotfiles.

However in my case I started a new rice (my wayland rice) on a new OS in Arch linux. I pretty much started from scratch. My old Xorg rices wouldn't really work even though I had a decent collection of configurations stored on git. I wanted a way to keep these new dotfile in the same repo. 
So what I did was create new branch on my dotfiles repo. It's actually pretty easy but just to put it out there...

1. I first followed the instructions in the article to createa new git bare repo.

~~~bash

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

~~~

2. Next I went to Github and created a new branch in my dotfiles repo. I called it ArchBranch.

3. Next I added the remote branch

~~~bash

config remote add ArchBranchDotfilesSSH git@github.com:BranchManager/.dotfiles.git

~~~

4. Then I had to follow the [steps](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to set up an ssh key in order to push to the repo. 

Create the key. Create passphrase when asked
~~~
$ ssh-keygen -t ed25519 -C "your_email@example.com"
~~~

make sure your ssh agent is running. Mine wasn't. Then add your key.

~~~ bash
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519

~~~

once that's done add your key to git hub. Check the last linkt in the navigation menu for how to do that.

5. Finally you will have to force push to the repo

~~~

$ config push -f --set-upstream ArchBranchDotfilesSSH master:ArchBranch

~~~