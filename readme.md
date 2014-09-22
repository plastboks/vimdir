vimdir
======
my .vim dir

Install
=======
* Clone this repo into your `~/.vim` directory.
* Run `git submodule init`
* Run `git submodule update`

Update
======
* Run `git submodule update --init --recursive'

Howtos
======
* Spelling
  * Change lang = `set spell spelllang=` (eg: no, en ...)
  * `zg` add word
  * `z=` lookup suggestion
  * `zw` reverse
  * `:set spell` to turn on, `:set nospell` to turn off.

Submodules
==========
Almost all (all) the plugins used in my vim dotdir directory is git(hub.com) submodules.
All these submodules get automatically loaded by pathogen. To disable a certain module edit
the submodule/pathogen.vim file (`let g:pathogen_disabled = ['modulename']`).
