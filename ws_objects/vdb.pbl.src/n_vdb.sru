$PBExportHeader$n_vdb.sru
forward
global type n_vdb from nonvisualobject
end type
type ids_data from datastore within n_vdb
end type
end forward

global type n_vdb from nonvisualobject autoinstantiate
ids_data ids_data
end type

type variables
public:
n_cst_vbd	#cst

protected:
integer	ii_Scope
integer	ii_Style
string		ii_SourceText
char		ic_Scope


end variables

forward prototypes
public function integer of_setstyle (integer ai_style)
public function integer of_setscope (integer ai_scope)
protected function integer of_getdatatypeprefix (string as_datatype, ref string as_datatypeprefix)
protected function integer of_getobjectprefixe (string as_object, ref string as_objectprefix)
public function string of_parse (string as_line)
public function string of_cleanuselessblank (string as_line)
end prototypes

public function integer of_setstyle (integer ai_style);if isnull( ai_style ) then return -1

choose case ai_style
	case #cst.#standard_lowercase, #cst.#standard_uppercase
		ii_style = ai_style
	case else
		return -1
end choose

return 1
end function

public function integer of_setscope (integer ai_scope);if isnull( ai_scope ) then return -1

choose case ai_scope
	case #cst.#local_variable, #cst.#instance_variable, #cst.#shared_variable, #cst.#global_variable
		ii_scope = ai_scope
	case else
		return -1
end choose

choose case ii_scope
	case #cst.#local_variable
		ic_scope = "l"
	case #cst.#instance_variable
		ic_scope = "i"
	case #cst.#shared_variable
		ic_scope = "s"
	case #cst.#global_variable
		ic_scope = "g"
end choose

return 1
end function

protected function integer of_getdatatypeprefix (string as_datatype, ref string as_datatypeprefix);if isnull( as_datatype ) or len(trim( as_datatype )) = 0 then return -1

choose case lower( trim( as_datatype ) )
	case "any"
		as_datatypeprefix = "a"
	case "blob"
		as_datatypeprefix = "blb"
	case "boolean"
		as_datatypeprefix = "b"
	case "byte"
		as_datatypeprefix = "bt"
	case "char", "character" 
		as_datatypeprefix = "ch"
	case "date"
		as_datatypeprefix = "d"
	case "datetime"
		as_datatypeprefix = "dtm"
	case "dec", "decimal"
		as_datatypeprefix = "dc"
	case "double"
		as_datatypeprefix = "dbl"
	case "enumerated"
		as_datatypeprefix = "e"
	case "int", "integer"
		as_datatypeprefix = "i"
	case "long"
		as_datatypeprefix = "l"
	case "longlong"
		as_datatypeprefix = "ll"
	case "longptr"
		as_datatypeprefix = "lptr"
	case "real"
		as_datatypeprefix = "r"
	case "string"
		as_datatypeprefix = "s"
	case "time"
		as_datatypeprefix = "tm"
	case "uint","unsignedint", "unsignedinteger"
		as_datatypeprefix = "ui"
	case "ulong", "unsignedlong"
		as_datatypeprefix = "ul"
end choose

return 1
end function

protected function integer of_getobjectprefixe (string as_object, ref string as_objectprefix);if isnull( as_object ) or len(trim( as_object )) = 0 then return -1

choose case lower( trim( as_object ) )
	case "adoresultset"
		as_objectprefix = "ars"
	case "animation"
		as_objectprefix = "am"
	case "application"
		as_objectprefix = "app"
	case "arraybounds"
		as_objectprefix = "ab"
	case "checkbox" 
		as_objectprefix = "cbx"
	case "classdefinition"
		as_objectprefix = "cdef"
	case "classdefinitionobject"
		as_objectprefix = "cdefo"
	case "coderobject"
		as_objectprefix = "cobj"
	case "commandbutton"
		as_objectprefix = "cb"
	case "connection"
		as_objectprefix = "cn"
	case "connectioninfo"
		as_objectprefix = "cni"
	case "connectobject"
		as_objectprefix = "cnobj"
	case "contextinformation"
		as_objectprefix = "ctxnfo"
	case "contextkeyword"
		as_objectprefix = "ctxkwd"
	case "cplusplus"
		as_objectprefix = "cpp"
	case "crypterobject"
		as_objectprefix = "crypto"
	case "datastore"
		as_objectprefix = "ds"
	case "datawindow"
		as_objectprefix = "dw"
	case "datawindowchild"
		as_objectprefix = "dwc"
	case "datepicker"
		as_objectprefix = "dp"
	case "dividebyzeroerror"
		as_objectprefix = "dbzerr"
	case "dragobject"
		as_objectprefix = "drgo"
	case "drawobject"
		as_objectprefix = "drwo"
	case "dropdownlistbox"
		as_objectprefix = "ddlb"
	case "dropdownpicturelistbox"
		as_objectprefix = "ddplb"
	case "dwobject"
		as_objectprefix = "dwo"
	case "dwruntimeerror"
		as_objectprefix = "dwrterr"
	case "dynamicdescriptionarea"
		as_objectprefix = "dda"
	case "dynamicstagingarea"
		as_objectprefix = "dsa"
	case "editmask"
		as_objectprefix = "em"
	case "enumerationdefinition"
		as_objectprefix = "enumdef"
	case "enumerationitemdefinition"
		as_objectprefix = "enumidef"
	case "environment"
		as_objectprefix = "env"
	case "error"
		as_objectprefix = "err"
	case "errorlogging"
		as_objectprefix = "errlog"
	case "exception"
		as_objectprefix = "ex"
	case "extobject"
		as_objectprefix = "extobj"
	case "function_object"
		as_objectprefix = "fobj"
	case "graph"
		as_objectprefix = "gr"
	case "graphicobject"
		as_objectprefix = "go"
	case "graxis"
		as_objectprefix = "grax"
	case "grdispattr"
		as_objectprefix = "grdia"
	case "groupbox"
		as_objectprefix = "gb"
	case "hprogressbar"
		as_objectprefix = "hpb"
	case "hscrollbar"
		as_objectprefix = "hsb"
	case "htrackbar"
		as_objectprefix = "htb"
	case "httpclient"
		as_objectprefix = "httpc"
	case "inet"
		as_objectprefix = "inet"
	case "inkedit"
		as_objectprefix = "ie"
	case "inkpicture"
		as_objectprefix = "ip"
	case "internetresult"
		as_objectprefix = "ir"
	case "jaguarorb"
		as_objectprefix = "jagorb"
	case "jsongenerator"
		as_objectprefix = "jsongen"
	case "jsonpackage"
		as_objectprefix = "jsonpkg"
	case "jsonparser"
		as_objectprefix = "jsonprs"
	case "line"
		as_objectprefix = "ln"
	case "listbox"
		as_objectprefix = "lb"
	case "listview"
		as_objectprefix = "lv"
	case "listviewitem"
		as_objectprefix = "lvi"
	case "mailfiledescription"
		as_objectprefix = "mfd"
	case ""
		as_objectprefix = ""
	case "mailmessage"
		as_objectprefix = "mm"
	case "mailrecipient"
		as_objectprefix = "mr"
	case "mailsession"
		as_objectprefix = "ms"
	case "mdiclient"
		as_objectprefix = "mdi"
	case "menu"
		as_objectprefix = "m"
	case "menucascade"
		as_objectprefix = "mc"
	case "message"
		as_objectprefix = "msg"
	case "mlsync"
		as_objectprefix = "mlsync"
	case "mlsynchronization"
		as_objectprefix = "mlsynchr"
	case "monthcalendar"
		as_objectprefix = "mc"
	case ""
		as_objectprefix = ""
	case "multilineedit"
		as_objectprefix = "mle"	
	case "nonvisualobject"
		as_objectprefix = "nvo"
	case "nullobjecterror"
		as_objectprefix = "noerr"
	case "oauthclient"
		as_objectprefix = "oauthclnt"
	case "oauthrequest"
		as_objectprefix = "oauthreq"
	case "olecontrol"
		as_objectprefix = "olectrl"
	case "olecustomcontrol"
		as_objectprefix = "olecctrl"
	case "oleobject"
		as_objectprefix = "oleobj"
	case "oleruntimeerror"
		as_objectprefix = "olerterr"
	case "olestorage"
		as_objectprefix = "olesto"
	case "olestream"
		as_objectprefix = "olestr"
	case "oletxnobject"
		as_objectprefix = "oletxobj"
	case "omcontrol"
		as_objectprefix = "omctrl"
	case "omcustomcontrol"
		as_objectprefix = "omcctrl"
	case "omembeddedcontrol"
		as_objectprefix = "omectrl"
	case "omobject"
		as_objectprefix = "omobj"
	case "omstorage"
		as_objectprefix = "omsto"
	case "omstream"
		as_objectprefix = "omstr"
	case "orb"
		as_objectprefix = "orb"
	case "oval"
		as_objectprefix = "ov_"
	case "pbtocppobject"
		as_objectprefix = "pbtocpp"
	case "pbxruntimeerror"
		as_objectprefix = "pbxrterr"
	case "picture"
		as_objectprefix = "p"
	case "picturebutton"
		as_objectprefix = "pb"		
	case "picturehyperlink"
		as_objectprefix = "phl"
	case "picturelistbox"
		as_objectprefix = "plb"
	case "pipeline"
		as_objectprefix = "pipe"
	case "powerobject"
		as_objectprefix = "po"
	case "profilecall"
		as_objectprefix = "pca"
	case "profileclass"
		as_objectprefix = "pcl"
	case "profileline"
		as_objectprefix = "pl"
	case "profileroutine"
		as_objectprefix = "pr"
	case "profiling"
		as_objectprefix = "prf"
	case "radiobutton"
		as_objectprefix = "rb"
	case "rectangle"
		as_objectprefix = "rec"
	case "remoteobject"
		as_objectprefix = "ro"
	case "resourceresponse"
		as_objectprefix = "rres"
	case "restclient"
		as_objectprefix = "rc"
	case "resultset"
		as_objectprefix = "rs"
	case "resultsets"
		as_objectprefix = "rss"
	case "richtextedit"
		as_objectprefix = "rte"
	case "roundrectangle"
		as_objectprefix = "rr"
	case "runtimeerror"
		as_objectprefix = "rterr"
	case "scriptdefinition"
		as_objectprefix = "sdef"
	case "service"
		as_objectprefix = "srv"
	case "simpletypedefinition"
		as_objectprefix = "stdef"
	case "singlelineedit"
		as_objectprefix = "sle"
	case "sslcallback"
		as_objectprefix = "sslcb"
	case "sslserviceprovider"
		as_objectprefix = "sslsp"
	case "statichyperlink"
		as_objectprefix = "sthl"
	case "statictext"
		as_objectprefix = "st"
	case "structure"
		as_objectprefix = "str"
	case "syncparm"
		as_objectprefix = "sp"
	case "systemfunctions"
		as_objectprefix = "sf"
	case "tab"
		as_objectprefix = "tab"
	case "throwable"
		as_objectprefix = "trw"
	case "timing"
		as_objectprefix = "tmg"
	case "tokenrequest"
		as_objectprefix = "tknreq"
	case "tokenresponse"
		as_objectprefix = "tknres"
	case "traceactivitynode"
		as_objectprefix = "tan"
	case "tracebeginend"
		as_objectprefix = "tbe"
	case "traceerror"
		as_objectprefix = "terr"
	case "traceesql"
		as_objectprefix = "tsql"
	case "tracefile"
		as_objectprefix = "tf"
	case "tracegarbagecollect"
		as_objectprefix = "tgc"
	case "traceline"
		as_objectprefix = "tl"
	case "traceobject"
		as_objectprefix = "to"
	case "traceroutine"
		as_objectprefix = "trtn"
	case "tracetree"
		as_objectprefix = "tt"
	case "tracetreeerror"
		as_objectprefix = "tterr"
	case "tracetreeesql"
		as_objectprefix = "ttsql"
	case "tracetreegarbagecollect"
		as_objectprefix = "ttgc"
	case "tracetreeline"
		as_objectprefix = "ttl"
	case "tracetreenode"
		as_objectprefix = "ttn"
	case "tracetreeobject"
		as_objectprefix = "tto"
	case "tracetreeroutine"
		as_objectprefix = "ttr"
	case "tracetreeuser"
		as_objectprefix = "ttu"
	case "traceuser"
		as_objectprefix = "tu"
	case "transaction"
		as_objectprefix = "tr"
	case "transactionserver"
		as_objectprefix = "trs"
	case "treeview"
		as_objectprefix = "tv"
	case "treeviewitem"
		as_objectprefix = "tvi"
	case "typedefinition"
		as_objectprefix = "tdef"
	case "ulsync"
		as_objectprefix = "ulsnc"
	case "userobject"
		as_objectprefix = "uo"
	case "variablecardinalitydefinition"
		as_objectprefix = "vcdef"
	case "variabledefinition"
		as_objectprefix = "vdef"
	case "vprogressbar"
		as_objectprefix = "vpb"
	case "vscrollbar"
		as_objectprefix = "vsb"
	case "vtrackbar"
		as_objectprefix = "vtb"
	case "window"
		as_objectprefix = "w"
	case "windowobject"
		as_objectprefix = "wo"
	case "wsconnection"
		as_objectprefix = "wscn"		
end choose

return 1
end function

public function string of_parse (string as_line);string ls_line

ls_line = trim( as_line )



return ls_line


end function

public function string of_cleanuselessblank (string as_line);string ls_line
string ls_left
string ls_right
long 	ll_pos

// remove surrounding blank
ls_line = trim( as_line, true )

// remove double space
ll_pos = pos( ls_line, "  ")
do while ll_pos > 0
	ls_left = left( ls_line, ll_pos )
	ls_right = mid( ls_line, ll_pos + 2)
	ls_line =  ls_left + ls_right
	ll_pos = pos( ls_line, "  ")
loop

// remove double tabs
ll_pos = pos( ls_line, "~t~t")
do while ll_pos > 0
	ls_left = left( ls_line, ll_pos )
	ls_right = mid( ls_line, ll_pos + 2)
	ls_line =  ls_left + ls_right
	ll_pos = pos( ls_line, "~t~t")
loop

return ls_line


end function

on n_vdb.create
call super::create
this.ids_data=create ids_data
TriggerEvent( this, "constructor" )
end on

on n_vdb.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids_data)
end on

type ids_data from datastore within n_vdb descriptor "pb_nvo" = "true" 
string dataobject = "d_vdb"
end type

on ids_data.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_data.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

