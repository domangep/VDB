$PBExportHeader$n_cst_vbd.sru
forward
global type n_cst_vbd from nonvisualobject
end type
end forward

global type n_cst_vbd from nonvisualobject
end type
global n_cst_vbd n_cst_vbd

type variables
Public:
constant integer #standard_lowercase = 1
constant integer #standard_uppercase = 2

constant integer #local_variable 		= 1
constant integer #instance_variable	= 2
constant integer #shared_variable 	= 3
constant integer #global_variable		= 4
end variables
on n_cst_vbd.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_vbd.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

