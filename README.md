# harpoon-back

Quickly go back to the previous buffer tracked by harpoon. Requires [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon).

It works by subscribing into harpoon's **on("changed")** event in order to store the previous harpoon stored buffer you were in so you can quickly come back.

## Install

```
Plug 'dgalizzi/harpoon-back'
```

## Use
Call with
```
:lua require('harpoon-back').go_back()
```
For example, if you are on a buffer being tracked by harpoon and jump around different files not tracked by harpoon, by calling go_back() it would take you back to that initial buffer. Also, if you are working with two harpooned files, calling go_back() repeatedly would switch between them.
