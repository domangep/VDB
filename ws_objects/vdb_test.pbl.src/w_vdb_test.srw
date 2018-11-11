$PBExportHeader$w_vdb_test.srw
forward
global type w_vdb_test from window
end type
type sle_classname from singlelineedit within w_vdb_test
end type
type cb_fw_classname from commandbutton within w_vdb_test
end type
end forward

global type w_vdb_test from window
integer width = 1627
integer height = 1956
boolean titlebar = true
string title = "VDB - Tests"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_classname sle_classname
cb_fw_classname cb_fw_classname
end type
global w_vdb_test w_vdb_test

type variables
n_windows_api inv_api
end variables

on w_vdb_test.create
this.sle_classname=create sle_classname
this.cb_fw_classname=create cb_fw_classname
this.Control[]={this.sle_classname,&
this.cb_fw_classname}
end on

on w_vdb_test.destroy
destroy(this.sle_classname)
destroy(this.cb_fw_classname)
end on

type sle_classname from singlelineedit within w_vdb_test
integer x = 841
integer y = 36
integer width = 741
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_fw_classname from commandbutton within w_vdb_test
integer x = 27
integer y = 36
integer width = 777
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "FindWindow by Classname"
end type

event clicked;ulong	ul_handler
string	ls_classname

ls_classname 	= sle_classname.text
ul_handler 		= inv_api.of_findwindow( ls_classname )

messagebox("FindWIndow by classname"," Classname = " + ls_classname + "~nHandler = " + string( ul_handler ), information!)

end event

