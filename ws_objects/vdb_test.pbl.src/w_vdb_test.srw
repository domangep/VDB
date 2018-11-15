$PBExportHeader$w_vdb_test.srw
forward
global type w_vdb_test from window
end type
type cb_1 from commandbutton within w_vdb_test
end type
type dw_1 from datawindow within w_vdb_test
end type
type mle_1 from multilineedit within w_vdb_test
end type
end forward

global type w_vdb_test from window
integer width = 3237
integer height = 1956
boolean titlebar = true
string title = "VDB - Tests"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
mle_1 mle_1
end type
global w_vdb_test w_vdb_test

type variables
n_vdb inv_vdb

end variables

on w_vdb_test.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.mle_1=create mle_1
this.Control[]={this.cb_1,&
this.dw_1,&
this.mle_1}
end on

on w_vdb_test.destroy
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.mle_1)
end on

type cb_1 from commandbutton within w_vdb_test
integer x = 46
integer y = 476
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Parse"
end type

event clicked;string ls_src

ls_src = mle_1.text

inv_vdb.of_parse( ls_src )
inv_vdb.ids_data.sharedata( dw_1 )

end event

type dw_1 from datawindow within w_vdb_test
integer x = 41
integer y = 648
integer width = 3145
integer height = 1188
integer taborder = 20
string title = "none"
string dataobject = "d_vdb"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_vdb_test
integer x = 41
integer y = 28
integer width = 3145
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 31259099
string text = "none"
borderstyle borderstyle = stylelowered!
end type

