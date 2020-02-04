# Dotfiles

## Screenshot

![desktop screenshot][screenshot-1]

![desktop screenshot][screenshot-2]

## Prerequisites
* [sxhkd]
* [bspwm]
* [kitty]
* Curl (`apt-get install curl`, `pacman -S curl`, etc.)
* Git (`apt-get install git`, `pacman -S git`, etc.)
* [zsh]
* [oh-my-zsh]
* [diff-so-fancy]
* tmux (`apt-get install tmux`, `pacman -S tmux`, etc.)
* [neovim] and **Vim** may you wish
* neofetch (`apt-get install neofetch`, `pacman -S neofetch`, etc.)
* stylize neofetch with **cowsay** and **fortune** (`apt-get install cowsay fortune`, `pacman -S cowsay fortune`, etc.)
* [Fira Code][fira-code]
* qdbus, jq (`apt-get install qdbus jq`, `pacman -S qdbus jq`, etc.)
* vim-jedi (`apt-get install vim-python-jedi`, `pacman -S vim-jedi`, etc.)

### Optional (nice) software

##### For API development
* [httpie]

##### For screen recording/capturing
* [Simple Screen Recorder][simple-screen-recorder] (`apt-get install simplescreenrecorder`, `pacman -S simplescreenrecorder`, etc.)
* [peek]
* [screenkey]
* [flameshot]

##### For notification
* telegram-send (`sudo pip3 install telegram-send`)

Great site to get unicode characters!! [&what;](http://www.amp-what.com)


#### Making NeoVim work with `.vimrc` file config
```sh
# Create symbolic link between neovim's config directory and file and vim's
$ ln -s ~/.vim ~/.config/nvim
$ ln -s ~/.vimrc ~/.config/nvim/init.vim
```

[bspwm]: https://github.com/baskerville/bspwm
[diff-so-fancy]: https://github.com/so-fancy/diff-so-fancy
[fira-code]: https://github.com/tonsky/FiraCode/wiki/Linux-instructions
[flameshot]: https://github.com/lupoDharkael/flameshot
[httpie]: https://github.com/jakubroztocil/httpie#installation
[kitty]: https://sw.kovidgoyal.net/kitty/
[neovim]: https://github.com/neovim/neovim/wiki/Installing-Neovim#linux
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh#basic-installation
[peek]: https://github.com/phw/peek
[screenkey]: https://github.com/wavexx/screenkey
[simple-screen-recorder]: http://www.maartenbaert.be/simplescreenrecorder/
[sxhkd]: https://github.com/baskerville/sxhkd
[zsh]: https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH

[screenshot-1]: https://raw.githubusercontent.com/Charliiee/dotfiles/master/Screenshot-1.png "Workspace Screenshot"
[screenshot-2]: https://raw.githubusercontent.com/Charliiee/dotfiles/master/Screenshot-2.png "Workspace Screenshot 2"
