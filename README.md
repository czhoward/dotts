# dotts

dotts is an implementation of a strategy to manage configuration files, as described in a Hacker News [comment](https://news.ycombinator.com/item?id=11071754) by user StreakyCobra ([Fabien Dubosson](https://github.com/StreakyCobra)) and further refined by [Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles).

>"No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation." --StreakyCobra

Since dotts is really just a fancy alias for git configured to use your home ~/ directory as its working directory and a local bare repo, you use it just as you use git.

For example, to commit any files in your home directory, simply add and commit, just as you would for git.


    dotts add ~/.bash_profile
    dotts commit -m 'add .bash_profile'

To push to a remote repository:

    dotts push

No need to be in your home directory when using dotts, since the dotts command is hard-coded to use your home directory as its git working directory. 

dott's actual local repository is maintained in a local bare repository at ~/.dotts , which is ignored by git.


The beauty of dotts is that unlike other schemes to save your configuration files to a centralized store, it doesn't require any symlinks or complicated scripts. It really is just git under the hood. 

To take full advantage of dotts and have it save your configuration to a remote git repository, you'll need to create a github repo to hold your dotts files.


## Quick Start

1. install

        curl -o- https://raw.githubusercontent.com/czhoward/dotts/refs/heads/master/dotts.sh | bash -s -- install

>This will install dotts so that you can use it with the default `dotts` command.
>Don't like using `dotts` as your command and want to use something more intuitive like `config` ? 
>  try this:
>
>        curl -o- https://raw.githubusercontent.com/czhoward/dotts/refs/heads/master/dotts.sh | APP_NAME=config bash  -s -- install 




2. create a github repository to hold your configuration


        gh repo create my-dotts --private
        dotts remote add origin git@github.com:ACCOUNT_NAME/my-dotts.git
        dotts push -u origin master



3. add your first file

        dotts add ~/.bashrc
        dotts commit -m 'add .bashrc'
        dotts push


# Uninstall

    curl -o- https://raw.githubusercontent.com/czhoward/dotts/refs/heads/master/dotts.sh | bash -s -- uninstall


