" Vim syntax file
" Language:	Gezel
" Maintainer:	<fanjunfeng@gmail.com>
" Last Update:  Fri 17/03/06 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255,+,-,?
else
   set iskeyword=@,48-57,_,192-255,+,-,?
endif

" A bunch of useful Gezel keywords
syn keyword vliwStatement  Loadm Loada Loadb Loadi 
syn keyword vliwStatement  Mul Add Adc Sub Suc
syn keyword vliwStatement  Stoi Stoc

syn keyword vliwConditional if else then 


syn match   vliwOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  vliwComment start="/\*" end="\*/" contains=vliwTodo
syn match   vliwComment "//.*" oneline contains=vliwTodo

syn match   vliwGlobal "`[a-zA-Z0-9_]\+\>"
syn match   vliwGlobal "$[a-zA-Z0-9_]\+\>"

syn match   vliwConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   vliwNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   vliwNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   vliwNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   vliwNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   vliwNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  vliwString start=+"+  end=+"+

" Directives
syn match   vliwDirective   "//\s*synopsys\>.*$"
syn region  vliwDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  vliwDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   vliwDirective   "//\s*\$s\>.*$"
syn region  vliwDirective   start="/\*\s*\$s\>" end="\*/"
syn region  vliwDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vliw_syn_inits")
   if version < 508
      let did_vliw_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink vliwCharacter       Character
   HiLink vliwConditional     Conditional
   HiLink vliwRepeat          Repeat
   HiLink vliwString          String
   HiLink vliwTodo            Todo
   HiLink vliwComment         Comment
   HiLink vliwConstant        Constant
   HiLink vliwLabel           Label
   HiLink vliwNumber          Number
   HiLink vliwOperator        Special
   HiLink vliwStatement       Statement
   HiLink vliwGlobal          Define
   HiLink vliwDirective       SpecialComment

   delcommand HiLink
endif

let b:current_syntax = "vliw"

" vim: ts=8
