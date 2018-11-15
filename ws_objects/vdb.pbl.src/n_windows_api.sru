$PBExportHeader$n_windows_api.sru
forward
global type n_windows_api from nonvisualobject
end type
end forward

global type n_windows_api from nonvisualobject autoinstantiate
end type

type prototypes
Function ULONG  FindWindowA (string classname, string windowname) Library "user32.dll" alias for "FindWindowA;Ansi"
Function ULONG  FindWindowExA (ulong parent_window, ulong child_after, string classname, string windowname) Library "user32.dll" alias for "FindWindowExA;Ansi"

end prototypes

forward prototypes
public function ulong of_findwindow (string as_classname)
public function ulong of_findwindow (string as_classname, string as_windowname)
public function unsignedlong of_findchildwindow (unsignedlong ul_parent, unsignedlong ul_childafter, string as_classname, string as_windowname)
public function unsignedlong of_findchildwindow (unsignedlong ul_parent, unsignedlong ul_childafter, string as_classname)
public function unsignedlong of_findchildwindow (unsignedlong ul_parent, string as_classname)
end prototypes

public function ulong of_findwindow (string as_classname);string ls_windowname

SetNull( ls_windowname )

return findwindowa (as_classname, ls_windowname)
end function

public function ulong of_findwindow (string as_classname, string as_windowname);return findwindowa (as_classname, as_windowname)
end function

public function unsignedlong of_findchildwindow (unsignedlong ul_parent, unsignedlong ul_childafter, string as_classname, string as_windowname);return findwindowexa ( ul_parent, ul_childafter, as_classname, as_windowname)
end function

public function unsignedlong of_findchildwindow (unsignedlong ul_parent, unsignedlong ul_childafter, string as_classname);string ls_null
setnull(ls_null)

return findwindowexa ( ul_parent, ul_childafter, as_classname, ls_null )
end function

public function unsignedlong of_findchildwindow (unsignedlong ul_parent, string as_classname);ulong ul_null
setnull(ul_null)

return of_findchildwindow( ul_parent, ul_null, as_classname )
end function

on n_windows_api.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_windows_api.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

