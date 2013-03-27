" Vim syntax file
" Language:	LOLPython
" Maintainer:	Ahahaha - wait, seriously?  No, we're not maintaining this.
" Last Change:	2012-03-15
" Credits:	Aneesh Goel
"		Zvezdan Petkovic <zpetkovic@acm.org>
"		Neil Schemenauer <nas@python.ca>
"		Dmitry Vasiliev
"
" This is basically a badly copied version of Zvezdan Petkovic's rewrite of
" python.vim.  If it's horrible, we don't really care.  Go away.
"
"
" Optional highlighting can be controlled using these variables.  They might
" well break horribly because of the LOLPython conversion.  Use at your own
" risk.
"
"   let lolpython_no_builtin_highlight = 1
"   let lolpython_no_exception_highlight = 1
"   let lolpython_no_number_highlight = 1
"   let lolpython_space_error_highlight = 1
"
" All the options above can be switched on together.
"
"   let lolpython_highlight_all = 1
"

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" import
syn match lolpythonInclude	/\<GIMME\>/
" False None True
syn match lolpythonStatement	/\<\%\(MEH\|INVISIBLE\|YEAH\)\>/
" as assert break continue del exec global
syn match lolpythonStatement	/\<\%\(LIKE\|SO GOOD\|KTHXBYE\|KTHX\|DO NOT WANT\|exec\|global\)\>/
" lambda nonlocal pass print (print to stderr) return with yield
syn match lolpythonStatement	/\<\%\(RED DOT\|nonlocal\|I IZ CUTE\|VISIBLE\|COMPLAIN\|U TAKE\|WIF\|U BORROW\)\>/
" class def
syn match lolpythonStatement	/\<\%\(ME MAKE\|SO IM LIKE\)\>/ nextgroup=lollolpythonFunction skipwhite
" elif else if
syn match lolpythonConditional	/\<\%\(OR IZ\|\%\(I GIVE UP\|IZ KEWL\|ALL DONE\|NOPE\)\|IZ\)\>/
" :
syn match lolpythonConditional	/?/
" for while while 1
syn match lolpythonRepeat	/\<\%\(GIMME EACH\|WHILE\|WHILE I CUTE\)\>/
" in is not or
syn match lolpythonOperator	/\<\%\(IN \%(UR\|THE\|THIS\)\|KINDA IS\|AINT\|OR MABEE\)\>/
" and
syn match lolpythonOperator	/&/
" = u- b- + += -=
syn match lolpythonOperator	/\<\%\(CAN HAS\|ANTI\|TAKE AWAY\|ALONG WITH\|GETZ ANOTHR\|THROW[SZ]? AWAY\)\>/
" / * /= *=
syn match lolpythonOperator	/\<\%\(SMASHES INTO\|OF THOSE\|SMASHES INTO HAS\|COPIES \%\(HIM\|HER\|IT\)SELF BY\)\>/
" ** ,
syn match lolpythonOperator	/\<\%\(BY GRAYSKULL POWER\|AND\)\>/
" == != >
syn match lolpythonOperator	/\<\%\(KINDA LIKE\|KINDA NOT LIKE\|ATE MORE \%\(CHEEZBURGERS \)\=THAN\)\>/
" < <= >= .
syn match lolpythonOperator	/\<\%\(ATE FEWER \%\(CHEEZBURGERS \)\=THAN\|SMALL LIKE\|BIG LIKE\|OWN\)\>/
" ( )
syn match lolpythonOperator	/\<\%\(WIT\|OK\)\>/
" ) alternate
syn match lolpythonOperator	/!/
" except finally raise try
syn match lolpythonException	/\<\%\(O NOES\|WHATEVER\|HALP\|PLZ\)\>/
" from
syn match lolpythonInclude	/\<IN MAI\>/

" Decorators
syn match   lolpythonDecorator	/\<MARUS IN A\>/ display nextgroup=lolpythonFunction skipwhite
" The zero-length non-grouping match before the function name is
" extremely important in lolpythonFunction.  Without it, everything is
" interpreted as a function inside the contained environment of
" doctests.
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match   lolpythonFunction
      \ /\%(\%(SO IM LIKE\s\|ME MAKE\s\|MARUS IN A\)\s*\)\@<=\h\%(\w\|\.\)*/ contained

syn match   lolpythonComment	/\<\%(BTW\|WTF\).*$/ contains=lolpythonTodo
syn match   lolpythonTodo	/\<\%\(PROCATINATE\|\%\(DO \)\=L8R\)\>/ contained

syn region  lolpythonString
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=lolpythonEscape
syn region  lolpythonString
      \ start=+[uU]\=\z(LOL\)+ end="\/\z1" keepend
      \ contains=lolpythonEscape,lolpythonSpaceError
syn region  lolpythonRawString
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
syn region  lolpythonRawString
      \ start=+[uU]\=[rR]\z(LOL\)+ end="\/\z1" keepend
      \ contains=lolpythonSpaceError

syn match   lolpythonEscape	+\\[abfnrtv'"\\]+ contained
syn match   lolpythonEscape	"\\\o\{1,3}" contained
syn match   lolpythonEscape	"\\x\x\{2}" contained
syn match   lolpythonEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   lolpythonEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   lolpythonEscape	"\\$"

if exists("lolpython_highlight_all")
  if exists("lolpython_no_builtin_highlight")
    unlet lolpython_no_builtin_highlight
  endif
  if exists("lolpython_no_exception_highlight")
    unlet lolpython_no_exception_highlight
  endif
  if exists("lolpython_no_number_highlight")
    unlet lolpython_no_number_highlight
  endif
  let lolpython_space_error_highlight = 1
endif

" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"
" and so on, as specified in the 'Python Language Reference'.
" http://docs.lolpython.org/reference/lexical_analysis.html#numeric-literals
if !exists("lolpython_no_number_highlight")
  " numbers (including longs and complex)
  syn match   lolpythonNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   lolpythonNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   lolpythonNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   lolpythonNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   lolpythonNumber	"\<\d\+[jJ]\>"
  syn match   lolpythonNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   lolpythonNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   lolpythonNumber
	\ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

" Group the built-ins in the order in the 'Python Library Reference' for
" easier comparison.
" http://docs.lolpython.org/library/constants.html
" http://docs.lolpython.org/library/functions.html
" http://docs.lolpython.org/library/functions.html#non-essential-built-in-functions
" Python built-in functions are in alphabetical order.
" This is 0'd out until I get around to actually figuring out what's been
" implemented here and what hasn't
if 0 
  "!exists("lolpython_no_builtin_highlight")
  " built-in constants
  syn keyword lolpythonBuiltin	NotImplemented Ellipsis __debug__
  " built-in functions
  syn keyword lolpythonBuiltin	abs all any bin bool chr classmethod
  syn keyword lolpythonBuiltin	compile complex delattr dict dir divmod
  syn keyword lolpythonBuiltin	enumerate eval filter float format
  syn keyword lolpythonBuiltin	frozenset getattr globals hasattr hash
  syn keyword lolpythonBuiltin	help hex id input int isinstance
  syn keyword lolpythonBuiltin	issubclass iter len list locals map max
  syn keyword lolpythonBuiltin	min next object oct open ord pow print
  syn keyword lolpythonBuiltin	property range repr reversed round set
  syn keyword lolpythonBuiltin	setattr slice sorted staticmethod str
  syn keyword lolpythonBuiltin	sum super tuple type vars zip __import__
  " Python 2.6 only
  syn keyword lolpythonBuiltin	basestring callable cmp execfile file
  syn keyword lolpythonBuiltin	long raw_input reduce reload unichr
  syn keyword lolpythonBuiltin	unicode xrange
  " Python 3.0 only
  syn keyword lolpythonBuiltin	ascii bytearray bytes exec memoryview
  " non-essential built-in functions; Python 2.6 only
  syn keyword lolpythonBuiltin	apply buffer coerce intern
endif

" From the 'Python Library Reference' class hierarchy at the bottom.
" http://docs.lolpython.org/library/exceptions.html
" Most of these are commented out because they don't have actual equivalents
" in lolpython yet
if !exists("lolpython_no_exception_highlight")
  " builtin base exceptions (only used as base classes for other exceptions)
  " Exception
  syn keyword lolpythonExceptions	BORKED
  "syn keyword lolpythonExceptions	ArithmeticError EnvironmentError
  "syn keyword lolpythonExceptions	LookupError
  " builtin base exception removed in Python 3.0
  "syn keyword lolpythonExceptions	StandardError
  " builtin exceptions (actually raised)
  " AssertionError 
  syn keyword lolpythonExceptions	DONOTLIKE
  "syn keyword lolpythonExceptions	AttributeError BufferError
  "syn keyword lolpythonExceptions	EOFError FloatingPointError GeneratorExit
  "syn keyword lolpythonExceptions	IOError ImportError IndentationError
  "syn keyword lolpythonExceptions	IndexError KeyError KeyboardInterrupt
  "syn keyword lolpythonExceptions	MemoryError NameError NotImplementedError
  "syn keyword lolpythonExceptions	OSError OverflowError ReferenceError
  "syn keyword lolpythonExceptions	RuntimeError StopIteration SyntaxError
  "syn keyword lolpythonExceptions	SystemError SystemExit TabError TypeError
  "syn keyword lolpythonExceptions	UnboundLocalError UnicodeError
  "syn keyword lolpythonExceptions	UnicodeDecodeError UnicodeEncodeError
  "syn keyword lolpythonExceptions	UnicodeTranslateError ValueError VMSError
  "syn keyword lolpythonExceptions	WindowsError ZeroDivisionError BLACKHOLE
  " builtin warnings
  "syn keyword lolpythonExceptions	BytesWarning DeprecationWarning FutureWarning
  "syn keyword lolpythonExceptions	ImportWarning PendingDeprecationWarning
  "syn keyword lolpythonExceptions	RuntimeWarning SyntaxWarning UnicodeWarning
  "syn keyword lolpythonExceptions	UserWarning Warning
endif

if exists("lolpython_space_error_highlight")
  " trailing whitespace
  syn match   lolpythonSpaceError	display excludenl "\s\+$"
  " mixed tabs and spaces
  syn match   lolpythonSpaceError	display " \+\t"
  syn match   lolpythonSpaceError	display "\t\+ "
endif

" Sync at the beginning of class, function, or method definition.
syn sync match lolpythonSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("

if version >= 508 || !exists("did_lolpython_syn_inits")
  if version <= 508
    let did_lolpython_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink lolpythonStatement		Statement
  HiLink lolpythonConditional		Conditional
  HiLink lolpythonRepeat		Repeat
  HiLink lolpythonOperator		Operator
  HiLink lolpythonException		Exception
  HiLink lolpythonInclude		Include
  HiLink lolpythonDecorator		Define
  HiLink lolpythonFunction		Function
  HiLink lolpythonComment		Comment
  HiLink lolpythonTodo			Todo
  HiLink lolpythonString		String
  HiLink lolpythonRawString		String
  HiLink lolpythonEscape		Special
  if !exists("lolpython_no_number_highlight")
    HiLink lolpythonNumber		Number
  endif
  " 0'd out until I can actually do this
  if 0 
    " !exists("lolpython_no_builtin_highlight")
    HiLink lolpythonBuiltin		Function
  endif
  if !exists("lolpython_no_exception_highlight")
    HiLink lolpythonExceptions		Structure
  endif
  if exists("lolpython_space_error_highlight")
    HiLink lolpythonSpaceError		Error
  endif
  if !exists("lolpython_no_doctest_highlight")
    HiLink lolpythonDoctest		Special
    HiLink lolpythonDoctestValue	Define
  endif

  delcommand HiLink
endif

let b:current_syntax = "lolpython"

" vim:set sw=2 sts=2 ts=8 noet:
