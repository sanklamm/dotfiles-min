# Dotfiles

My Dotfiles repo.  
These are managed with GNU Stow.  
Stow takes a directory structure containing files and symlinks the same structure to its parent directory.  
So the directory structure of this dotfiles repo has to mimik the structure of where these files are stored in relation to the home directory.

## Useful commands to deploy the dotfiles

Obviously you have to clone this dir to your home directory so it ends up in `~/Dotfiles`.

```sh
# from within the Dotfiles folder
# create symlinks for a given folder
stow spacemacs
# use verbose mode
stow -v spacemacs
```

```sh
# from within the Dotfiles folder
# create symlinks for all folders
stow *
```

```sh
# from within the Dotfiles folder
# delete symlinks for a given folder
stow -D spacemacs
```

```sh
# from within the Dotfiles folder
# restow symlinks for a given folder
stow -R spacemacs
```
