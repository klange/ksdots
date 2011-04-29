" Config for b() binary literals.
if 1
  syn match	cBinaryLiteralZero  '0' contained containedin=cBinaryLiteral
  syn match	cBinaryLiteralOne   '1' contained containedin=cBinaryLiteral
  syn match	cBinaryLiteral	    display "b([01]*)"
  hi cBinaryLiteralZero ctermbg=bg ctermfg=fg guibg=#000000 guifg=#888888
  hi cBinaryLiteralOne  ctermbg=fg ctermfg=bg guibg=#FFFFFF guifg=#888888
  hi  def link cBinaryLiteral     cSpecial
endif

syn keyword	cTodo		contained HACK
