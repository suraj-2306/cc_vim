# cc_vim
This is a vim plugin to help you run a cpp file with a keystroke. It's designed to take input from a input.txt and put the output in output.txt in a local folder.
This is especially helpful for competitive coding.

## Work-flow
1. A key is triggered.
2. All the buffers are saved.
3. The buffer with .cpp extension is passed on to a makefile.
4. A template makefile is copied from the plugin directory to the local directory.
5. The .cpp file is compiled by the makefile recipe.
6. The run command is also invoked in the makefile.
7. If there are no inputs in the program, it directly writes to the output.txt . 

## Dependencies
1. [vim-localrc](https://github.com/thinca/vim-localrc).
   Any local-vimrc tool can be used. However, you can skip the above step if you are not acquainted with working with vim Plugins.
2. rsync
   Install using `sudo apt-get install rsync`

## Installation
1. Using Plugin Manager
   - Recommended to use [Vundle](https://github.com/VundleVim/Vundle.vim)
   - add `Plugin 'suraj-2306/cc_vim'` to your vimrc
2. Manual Installation
   - Download the zip file and extract it to the ~/.vim directory. Merge the 'plugin' directory from the cc_vim plugina and the one in the .vim directory. Similarly merge the autoload directory, if it exists. 
## Usage
1. Install the above dependencies.

2. Using the local.vimrc
   - Add the following command `autocmd VimEnter *.cpp :vsp input.txt |vertical resize 40| split output.txt` to your .local.vimrc or any other local vimrc Plugin you have used.
   - If you are comfortable working with buffers, ignore the above step
3. If your are not using a local vimrc plugin,
   - Add the following lines to your .vimrc `autocmd VimEnter *.cpp :vsp input.txt |vertical resize 40| split output.txt`. This basically splits your screen into 3 sections to accomadate output.txt, input.txt and the .cpp file buffers. The only disadvantage by adding this in the .vimrc folder over a local .vimrc is that, every time your're opening a .cpp file you will have the [this](https://pasteboard.co/JIqx9F2.png) congiguration


4. Opening format
   - Open a terminal window, navigate to your directory and type `vim example.cpp`. [This setup](https://pasteboard.co/JIqx9F2.png) must show up
   - If you're not using 2.a then use `vim example.cpp output.txt input.txt` to open the files as buffers.
  
5. Press F9 key to trigger the plugin. It automatically compiles your example.cpp file and creates a example.out as an executable. This also run the .out file.

## Known Issues
   - It may show up an error if you have more than one cc_vim.makefile in your .vim directory. Delete the other copies and make sure you have only one copy.
 
