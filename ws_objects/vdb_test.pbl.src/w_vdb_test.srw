$PBExportHeader$w_vdb_test.srw
forward
global type w_vdb_test from window
end type
type sle_1 from singlelineedit within w_vdb_test
end type
type cb_2 from commandbutton within w_vdb_test
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
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
mle_1 mle_1
end type
global w_vdb_test w_vdb_test

type variables
n_vdb inv_vdb

end variables

on w_vdb_test.create
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.mle_1=create mle_1
this.Control[]={this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.mle_1}
end on

on w_vdb_test.destroy
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.mle_1)
end on

type sle_1 from singlelineedit within w_vdb_test
integer x = 466
integer y = 476
integer width = 1074
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_vdb_test
integer x = 1559
integer y = 476
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Find"
end type

event clicked;n_windows_api	lnv
ulong	ul_handle_frame
ulong	ul_handle_child
ulong	ul_handle_sheet


ul_handle_frame = lnv.of_findwindow( "PBFRAME170" )
ul_handle_sheet = lnv.of_findchildwindow( ul_handle_frame, sle_1.text )
ul_handle_child = lnv.of_findchildwindow( ul_handle_sheet,  "wedit" )
messagebox("Find Window class " + sle_1.text, "frame Handle = " + string( ul_handle_frame )+ "~Sheet Handlle = " + string( ul_handle_sheet ) + "~nChild Handlle = " + string( ul_handle_child ) , information!)


end event

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

