# cc_vim
This is a vim plugin to help you run a cpp file with a keystroke. It's designed to take input from a input.txt and put the output in output.txt in a local folder.
This is especially helpful for competitive coding.(cpp ofcourse)

## Work-flow
1. A key is triggered.
2. All the buffers are saved.
3. The buffer with .cpp extension is passed on to a makefile.
4. A template makefile is copied from the plugin directory to the local directory.
5. The run command is invoked in the makefile itself.

## Dependencies
1. [vim-localrc](https://github.com/thinca/vim-localrc).
   Any local-vimrc tool can be used
2. rsync
   Install using `sudo apt-get install rsync`

## Installation
1. Using Plugin Manager
   - Recommended to use [Vundle](https://github.com/VundleVim/Vundle.vim)
   - add 'PLugin 'suraj-2306/cc_vim'' to your vimrc
2. Manual Installation
   - Download the zip file and extract it to the ~/.vim directory.
   
## Usage
1. Install the abouve dependencies.

2. Using the local.vimrc
   - a. Add the following command `autocmd VimEnter *.cpp :vsp input.txt |vertical resize 40| split output.txt` to your .local.vimrc or any other Plugin vimrc you have used.
   - b. If you're confortable working with buffers, ignore the above step

3. Opening format
   - a. Open a file `vim example.vim` in your local directory.
   - b. If you're not using 2.a then use `vim example.cpp output.txt input.txt` to open the .txt files as buffers.
  
4. Press <F-9> key to trigger the plugin.
