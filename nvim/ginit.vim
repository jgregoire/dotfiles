" nvim-qt specific options.
if exists(':GuiFont')
    "GuiFont! Fira\ Code:h12
    GuiFont! FiraCode\ Nerd\ Font:h12
endif

if exists(':GuiTabline')
    GuiTabline 1
endif

GuiAdaptiveStyle Fusion
GuiRenderLigatures 1

" Color test: #AABB01
" Ligature Test: --> =/= ~~> != @
