" Vim syntax file
" Language:	Log
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

" A bunch of useful Log keywords
syn keyword logStatement   2008 2009 
syn keyword logStatement   Nov Dec Jan Feb Mar Apr May Jun Jul Aug Sep Oct 
syn keyword logStatement   Mon Tue Wed Thu Fri Sat Sun
syn keyword logStatement   Question question
syn keyword logStatement   Questions questions
syn keyword logStatement   Plan plan Schedule schedule 
syn keyword logStatement   ASAP 
syn keyword logStatement   Shit Great 
syn keyword logStatement   shit great 
syn keyword logStatement   Todo todo 

syn match   logComment "%.*" oneline contains=logTodo
syn keyword logConditional read write ask discuss talk report
syn keyword logConditional Read Write Ask Discuss Talk Report



" Directives
syn match   logDirective   "//\s*synopsys\>.*$"
syn region  logDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  logDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   logDirective   "//\s*\$s\>.*$"
syn region  logDirective   start="/\*\s*\$s\>" end="\*/"
syn region  logDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_log_syn_inits")
   if version < 508
      let did_log_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink logCharacter       Character
   HiLink logConditional     Conditional
   HiLink logRepeat          Repeat
   HiLink logString          String
   HiLink logTodo            Todo
   HiLink logComment         Comment
   HiLink logConstant        Constant
   HiLink logLabel           Label
   HiLink logNumber          Number
   HiLink logOperator        Special
   HiLink logStatement       Statement
   HiLink logGlobal          Define
   HiLink logDirective       SpecialComment

   delcommand HiLink
endif

let b:current_syntax = "log"

" vim: ts=8
