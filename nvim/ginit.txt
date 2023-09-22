" nvim-qt specific options.
if exists(':GuiFont')
    "GuiFont! FiraCode\ Nerd\ Font:h12
    set guifont=FiraCode\ Nerd\ Font:h12
endif

if exists(':GuiTabline')
    GuiTabline 1
endif

if exists('g:neovide')
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_remember_window_size = v:true
    let g:neovide_cursor_vfx_mode = "railgun"
endif

GuiAdaptiveStyle Fusion
GuiRenderLigatures 1

" Color test: #AABB01
" Ligature Test: --> =/= ~~> != @

" Use system clipboard when yanking.
set clipboard=unnamed
