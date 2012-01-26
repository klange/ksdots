" Vim syntax file
" Language: Plaintext tree / list / checklist
" Maintainer: Kevin Lange <klange@apple.com>
" Version: 0.0.1


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match treeNode /\\_/
syn match treeLine /^[ |]*/
syn match treeNumeral /^\ *[A-Za-z0-9]\+\./
syn match treeSubnumeral /^\ *[A-Za-z0-9]\+)/
syn match listBoxUnchecked /\[\ \]/
syn match listBoxChecked /\[[xo]\]/
syn match listItem /^\ *[*\-+]/
syn match listHeader /^\ *\*.*\*/
syn match treeComment /#.*/


hi link treeNode Type
hi link treeLine Type
hi link treeNumeral Number
hi link treeSubnumeral Label
hi link listBoxUnchecked Label
hi link listBoxChecked Label
hi link listItem Type
hi link listHeader Constant
hi link treeComment Comment

let b:current_syntax = "treelist"
