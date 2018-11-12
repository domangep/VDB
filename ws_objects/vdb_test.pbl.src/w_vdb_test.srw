$PBExportHeader$w_vdb_test.srw
forward
global type w_vdb_test from window
end type
type sle_dst from singlelineedit within w_vdb_test
end type
type sle_src from singlelineedit within w_vdb_test
end type
type cb_cleanuselessblanck from commandbutton within w_vdb_test
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
sle_dst sle_dst
sle_src sle_src
cb_cleanuselessblanck cb_cleanuselessblanck
end type
global w_vdb_test w_vdb_test

type variables
n_vdb inv_vdb

end variables

on w_vdb_test.create
this.sle_dst=create sle_dst
this.sle_src=create sle_src
this.cb_cleanuselessblanck=create cb_cleanuselessblanck
this.Control[]={this.sle_dst,&
this.sle_src,&
this.cb_cleanuselessblanck}
end on

on w_vdb_test.destroy
destroy(this.sle_dst)
destroy(this.sle_src)
destroy(this.cb_cleanuselessblanck)
end on

type sle_dst from singlelineedit within w_vdb_test
integer x = 27
integer y = 168
integer width = 1554
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31259099
borderstyle borderstyle = stylelowered!
end type

type sle_src from singlelineedit within w_vdb_test
integer x = 27
integer y = 36
integer width = 1554
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 30599679
borderstyle borderstyle = stylelowered!
end type

type cb_cleanuselessblanck from commandbutton within w_vdb_test
integer y = 1684
integer width = 777
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clean Useless Blank"
end type

event clicked;string ls_dst
string ls_src

ls_src = sle_src.text
ls_dst = inv_vdb.of_cleanuselessblank( ls_src )

sle_dst.text = ls_dst

end event

