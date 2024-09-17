# Basic CLI Environment Setup

## Neovim
Neovim is a modern fork of vim that uses Lua as configuration. It is all based on a CLI interface,
but can provide many features such as language completions.

### Install
To install an up to date version of neovim, we can download the binary to a path we own. Such as,
`$HOME/mybin`.

```
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O $HOME/mybin
tar -C $HOME/mybin -xzf $HOME/mybin/nvim-linux64.tar.gz
rm $HOME/mybin/nvim-linux64.tar.gz
```

Then we can add this to our `$PATH` to make sure it is available. The following is for `fish` shell, but
zsh and bash should be similar.


Run the following commands:

```
# Add Neovim to path
set -U fish_user_paths $HOME/mybin/nvim-linux64/bin/ $fish_user_paths

# Alias vim to Neovim
alias --save vim="nvim"
```


### Setup
We should now have a rudementary Neovim setup. To make it more snazzy,
we will utilize [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
This provides a lot of boilerplate to setup some plugins and such, but is 
designed to be a starting point that can be maintained. It is encouraged
that once you understand it you make changes and edit it to your own benefit.


To install it we simply:
```
git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/nvim
```

Then if you launch Neovim it should perform an initial install and setup.


## Tmux
Tmux is a terminal multiplexor, which means you can have multiple terminals open in one.
Similar to tabs in an editor or browser. It also allows you to maintain terminal sessions
accross multiple ssh sessions. So you could SSH, setup your terminal tabs and such, disconnect,
then reconnect and everything will persist.

The defaults of tmux are relatively good, so the only thing we will add is mouse support:
```
printf "set -g mouse on\nset -g mouse-select-pane on" > ~/.tmux.conf
```

# Workflow
1. SSH to server which hosts design docs.
2. Naviate to desigred DD directory `cd <design doc folder>`
3. Start up `tmux`
4. Split session vertically (ctrl+b THEN %) to have rubric on one half and neovim on other half for code browsing

## Useful hotkeys

### Tmux
Tmux uses a "leader" key, which means that you have to use the key pror to other hotkeys in order for them
to register. By default this is set to `ctrl+b`. So you will haveto press `ctrl+b`, release, then 
the hotkey.

* `%`: vertical split
* `"`: horizontal split
* arrow keys: navigate between splits
* `x`: close a pane
* `d`: detach a session, allowing you to leave a tmux session open when you want to exit it but return later
* * detached sessions can be listed with `tmux ls` and attached with `tmux a -t <id>`


### Neovim
Neovim is a modal editor with identical keys and motions as vim. The particular config provided
has some additional niceties, but left as an excercise to the reader to explore.

* `:q`: quit
* `:wq`: write + quit

If you open tm



