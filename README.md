My personal dotfiles, managed through GNU stow.

# Usage
The idea came from [this article](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two) by Brandon Invergo. It simplifies a great deal the usage of my dotfiles in several computers. I invite you to read the linked article for a rundown of how things are done.

The steps to get it working are:
*       cd $HOME
*       git clone https://github.com/eldruz/dotfiles.git dotfiles
*       cd dotfiles

And then from here, you basically run:

    stow software_name

for every configuration files you want to use. GNU stow takes care of generating the symlinks for each software. So for instance if you only wanted to use the vim configuration files, just type:

    stow vim

and GNU stow will create the ~/.vim and ~/.vimrc symlinks.

For a more advanced usage of GNU stow you should probably dig in the man pages.
