$PBExportHeader$vdb.sra
$PBExportComments$Generated Application Object
forward
global type vdb from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type vdb from application
string appname = "vdb"
end type
global vdb vdb

on vdb.create
appname="vdb"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on vdb.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_vdb_test )

end event

