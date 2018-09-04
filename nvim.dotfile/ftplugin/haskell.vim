let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ }

let g:ale_linters = {'haskell': []}

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

