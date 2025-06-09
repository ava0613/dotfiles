#########################################################################
#vi

##vimdiff 
:vert diffsplit <filename>
:diffsplit <filename>
]c, [c               - next/prev diff
diffget, diffput     - 
Ctrl + w Ctrl + w    # switch between diff windows

##macros
qa - start registering macro named a
q - end resitering macro
@a - replay macro
@@ - replay last macro

##vert
C-v, select rows, S-i, do the edit, esc
note: during edit only the first row is changed, at esc will be applied

##misc

 quick ref 
 :%s/old/new/g  -- replace all 
 gv -- reselect last visual select
 == indent current line
 = indent, =ap indent around paragraph
