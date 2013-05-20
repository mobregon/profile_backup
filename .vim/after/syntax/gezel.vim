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
syn keyword gezelStatement  $bin $cycle $dec $display $dp $finish $hex 
syn keyword gezelStatement   $sfg $trace $option
syn keyword gezelStatement   always dp fsm hardwired initial include define
syn keyword gezelStatement   in ipblock ipparm iptype lookup
syn keyword gezelStatement   ns out reg sequencer sfg sig state
syn keyword gezelStatement   stimulus system tc then use

syn keyword gezelConditional if else then 


syn match   gezelOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  gezelComment start="/\*" end="\*/" contains=gezelTodo
syn match   gezelComment "//.*" oneline contains=gezelTodo

syn match   gezelGlobal "`[a-zA-Z0-9_]\+\>"
syn match   gezelGlobal "$[a-zA-Z0-9_]\+\>"

syn match   gezelConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   gezelNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   gezelNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   gezelNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   gezelNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   gezelNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  gezelString start=+"+  end=+"+

" Directives
syn match   gezelDirective   "//\s*synopsys\>.*$"
syn region  gezelDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  gezelDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   gezelDirective   "//\s*\$s\>.*$"
syn region  gezelDirective   start="/\*\s*\$s\>" end="\*/"
syn region  gezelDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gezel_syn_inits")
   if version < 508
      let did_gezel_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink gezelCharacter       Character
   HiLink gezelConditional     Conditional
   HiLink gezelRepeat          Repeat
   HiLink gezelString          String
   HiLink gezelTodo            Todo
   HiLink gezelComment         Comment
   HiLink gezelConstant        Constant
   HiLink gezelLabel           Label
   HiLink gezelNumber          Number
   HiLink gezelOperator        Special
   HiLink gezelStatement       Statement
   HiLink gezelGlobal          Define
   HiLink gezelDirective       SpecialComment

   delcommand HiLink
endif

let b:current_syntax = "gezel"

" vim: ts=8
