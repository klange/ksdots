" This scheme was created by CSApproxSnapshot
" on Sat, 17 Jan 2009

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = 'wombat'

if v:version < 700
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term ==# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=#242424 guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=#242424
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=245 gui=italic guibg=#ffff00 guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=italic guibg=bg guifg=#95e454
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#303030 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=138 gui=NONE guibg=#000000 guifg=#857b6f
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=238 ctermfg=231 gui=italic guibg=#444444 guifg=#f6f3e8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=138 gui=NONE guibg=#444444 guifg=#857b6f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#f6f3e8 guifg=#242424
    CSAHi MatchParen term=reverse cterm=bold ctermbg=138 ctermfg=231 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=italic guibg=bg guifg=#99968b
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#e7f6da
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term ==# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=231 gui=NONE guibg=#242424 guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=#242424
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=245 gui=italic guibg=#ffff00 guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=150 gui=italic guibg=bg guifg=#95e454
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=59 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#303030 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=138 gui=NONE guibg=#000000 guifg=#857b6f
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=193 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=238 ctermfg=231 gui=italic guibg=#444444 guifg=#f6f3e8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=138 gui=NONE guibg=#444444 guifg=#857b6f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=231 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=235 gui=NONE guibg=#f6f3e8 guifg=#242424
    CSAHi MatchParen term=reverse cterm=bold ctermbg=138 ctermfg=231 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=145 gui=italic guibg=bg guifg=#99968b
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#e7f6da
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=193 gui=NONE guibg=bg guifg=#cae682
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=230 gui=NONE guibg=#242424 guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=#242424
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=245 gui=italic guibg=#ffff00 guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=italic guibg=bg guifg=#95e454
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#303030 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=230 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=101 gui=NONE guibg=#000000 guifg=#857b6f
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=230 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=230 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=238 ctermfg=230 gui=italic guibg=#444444 guifg=#f6f3e8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=238 ctermfg=101 gui=NONE guibg=#444444 guifg=#857b6f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=230 ctermfg=235 gui=NONE guibg=#f6f3e8 guifg=#242424
    CSAHi MatchParen term=reverse cterm=bold ctermbg=101 ctermfg=230 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=102 gui=italic guibg=bg guifg=#99968b
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#e7f6da
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=21 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#242424 guifg=#f6f3e8
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#242424
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=83 gui=italic guibg=#ffff00 guifg=#8f8f8f
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=italic guibg=bg guifg=#95e454
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#343434 guifg=#808080
    CSAHi NonText term=bold cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#303030 guifg=#808080
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#000000 guifg=#857b6f
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bebebe guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=#a9a9a9 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#00ff00
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=16 ctermfg=79 gui=italic guibg=#444444 guifg=#f6f3e8
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#444444 guifg=#857b6f
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#444444 guifg=#444444
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f6f3e8
    CSAHi Visual term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#384048 guifg=#a0a8b0
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#f6f3e8 guifg=#242424
    CSAHi MatchParen term=reverse cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#857b6f guifg=#f6f3e8
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=italic guibg=bg guifg=#99968b
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#e7f6da
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#8ac6f2
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#8b008b guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=19 gui=bold guibg=#008b8b guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
endif

delcommand CSAHi
