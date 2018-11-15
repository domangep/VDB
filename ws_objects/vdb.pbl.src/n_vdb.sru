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
integer	ii_Scope = 1
integer	ii_Style = 1
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
public function integer of_findscope (string as_line, ref long al_pos, ref string as_scope, ref boolean ab_group)
public function integer of_findreadaccess (string as_line, ref long al_pos, ref string as_raccess)
public function integer of_findwriteaccess (string as_line, ref long al_pos, ref string as_waccess)
protected function integer of_finddatatype (string as_line, ref long al_pos, ref string as_datatype)
public function integer of_findvariable (string as_line, string as_prefix, long al_startpos, ref string as_varname, ref long al_nextpos)
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

choose case ii_scope
	case #cst.#global_variable
		as_datatypeprefix = "g"
	case #cst.#instance_variable
		as_datatypeprefix = "i"
	case #cst.#local_variable
		as_datatypeprefix = "l"
	case #cst.#shared_variable
		as_datatypeprefix = "s"
end choose

choose case lower( trim( as_datatype ) )
	case "any"
		as_datatypeprefix += "a"
	case "blob"
		as_datatypeprefix += "blb"
	case "boolean"
		as_datatypeprefix += "b"
	case "byte"
		as_datatypeprefix += "bt"
	case "char", "character" 
		as_datatypeprefix += "ch"
	case "date"
		as_datatypeprefix += "d"
	case "datetime"
		as_datatypeprefix += "dtm"
	case "dec", "decimal"
		as_datatypeprefix += "dc"
	case "double"
		as_datatypeprefix += "dbl"
	case "enumerated"
		as_datatypeprefix += "e"
	case "int", "integer"
		as_datatypeprefix += "i"
	case "long"
		as_datatypeprefix += "l"
	case "longlong"
		as_datatypeprefix += "ll"
	case "longptr"
		as_datatypeprefix += "lptr"
	case "real"
		as_datatypeprefix += "r"
	case "string"
		as_datatypeprefix += "s"
	case "time"
		as_datatypeprefix += "tm"
	case "uint","unsignedint", "unsignedinteger"
		as_datatypeprefix += "ui"
	case "ulong", "unsignedlong"
		as_datatypeprefix += "ul"
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

public function string of_parse (string as_line);boolean 	lb_group
integer	li_rc
integer	li_group
long		ll_pos
long		ll_nextpos
string 	ls_line
string 	ls_scope
string 	ls_raccess
string 	ls_waccess
string 	ls_varname
string 	ls_group
string		ls_datatype
string		ls_prefix
string		ls_varscope
string		ls_tmp

ls_line = lower ( trim( as_line) )

li_rc = of_findscope( ls_line, ll_pos, ls_scope, lb_group )
if lb_group = true then
	li_group ++
end if

li_rc = of_findreadaccess( ls_line, ll_pos, ls_raccess )
li_rc = of_findwriteaccess( ls_line, ll_pos, ls_waccess )
li_rc = of_finddatatype( ls_line, ll_pos, ls_datatype)
li_rc = of_getdatatypeprefix( ls_datatype, ls_prefix)

li_rc = of_findvariable( ls_line, ls_prefix, ll_pos + len(ls_datatype) , ls_varname, ll_nextpos )

do while ll_nextpos > 0
	ls_tmp = string( li_group ) + "~t" + ls_scope + "~t" + ls_raccess + "~t" + ls_waccess + "~t" + ls_datatype + "~t" + ls_varname   + "~r~n"
	li_rc = ids_data.importstring( ls_tmp )
	ls_varname = ""
	li_rc = of_findvariable( ls_line, ls_prefix, ll_nextpos , ls_varname, ll_nextpos )
loop

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

public function integer of_findscope (string as_line, ref long al_pos, ref string as_scope, ref boolean ab_group);long ll_pos

if isnull( as_line ) or as_line = "" then return -1

// find grouped version of scope
ll_pos = pos( as_line, "public:" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Public:'
		case #cst.#standard_uppercase
			as_scope = 'PUBLIC:'
	end choose
	al_pos = ll_pos
	ab_group = true
	return 1
end if

ll_pos = pos( as_line, "protected:" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Protected:'
		case #cst.#standard_uppercase
			as_scope = 'PROTECTED:'
	end choose
	al_pos = ll_pos
	ab_group = true
	return 1
end if

ll_pos = pos( as_line, "private:" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Private:'
		case #cst.#standard_uppercase
			as_scope = 'PRIVATE:'
	end choose
	al_pos = ll_pos
	ab_group = true
	return 1
end if

// find inline version of scope
ll_pos = pos( as_line, "public" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Public'
		case #cst.#standard_uppercase
			as_scope = 'PUBLIC'
	end choose
	al_pos = ll_pos
	ab_group = false
	return 1
end if

ll_pos = pos( as_line, "protected" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Protected'
		case #cst.#standard_uppercase
			as_scope = 'PROTECTED'
	end choose
	al_pos = ll_pos
	ab_group = false
	return 1
end if

ll_pos = pos( as_line, "private" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_scope = 'Private'
		case #cst.#standard_uppercase
			as_scope = 'PRIVATE'
	end choose
	al_pos = ll_pos
	ab_group = false
	return 1
end if

// not scope found
al_pos = 0
as_scope = ""
ab_group = false

return 1
end function

public function integer of_findreadaccess (string as_line, ref long al_pos, ref string as_raccess);long ll_pos

if isnull( as_line ) or as_line = "" then return -1


// find inline read access

ll_pos = pos( as_line, "protectedread" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_raccess = 'ProtectedRead'
		case #cst.#standard_uppercase
			as_raccess = 'PROTECTEDREAD'
	end choose
	al_pos = ll_pos	
	return 1
end if

ll_pos = pos( as_line, "private" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_raccess = 'PrivateRead'
		case #cst.#standard_uppercase
			as_raccess = 'PRIVATEREAD'
	end choose
	al_pos = ll_pos	
	return 1
end if

// not read access found
as_raccess = ""
al_pos = 0

return 1
end function

public function integer of_findwriteaccess (string as_line, ref long al_pos, ref string as_waccess);long ll_pos

if isnull( as_line ) or as_line = "" then return -1


// find inline write access
ll_pos = pos( as_line, "protectedwrite" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_waccess = 'ProtectedWrite'
		case #cst.#standard_uppercase
			as_waccess = 'PROTECTEWRITE'
	end choose
	al_pos = ll_pos	
	return 1
end if

ll_pos = pos( as_line, "privatewrite" )
if  ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
			as_waccess = 'PrivateWrite'
		case #cst.#standard_uppercase
			as_waccess = 'PRIVATEWRITE'
	end choose
	al_pos = ll_pos	
	return 1
end if

// not write access found
as_waccess = ""
al_pos = 0

return 1
end function

protected function integer of_finddatatype (string as_line, ref long al_pos, ref string as_datatype);long ll_pos

if isnull( as_line ) or as_line = "" then return -1

ll_pos = pos( as_line, "any" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Any"
		case #cst.#standard_uppercase
		  as_datatype = "ANY"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "blob" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Blob"
		case #cst.#standard_uppercase
		  as_datatype = "BLOB"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "boolean" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Boolean"
		case #cst.#standard_uppercase
		  as_datatype = "BOOLEAN"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "byte" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Byte"
		case #cst.#standard_uppercase
		  as_datatype = "BYTE"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "char" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Char"
		case #cst.#standard_uppercase
		  as_datatype = "CHAR"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "character" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Character"
		case #cst.#standard_uppercase
		  as_datatype = "CHARACTER"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "date" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Date"
		case #cst.#standard_uppercase
		  as_datatype = "DATE"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "datetime" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "DateTime"
		case #cst.#standard_uppercase
		  as_datatype = "DATETIME"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "decimal" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Decimal"
		case #cst.#standard_uppercase
		  as_datatype = "DECIMAL"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "dec" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Dec"
		case #cst.#standard_uppercase
		  as_datatype = "DEC"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "double" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Double"
		case #cst.#standard_uppercase
		  as_datatype = "DOUBLE"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "enumerated" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Enumerated"
		case #cst.#standard_uppercase
		  as_datatype = "ENUMERATED"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "integer" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Integer"
		case #cst.#standard_uppercase
		  as_datatype = "INTEGER"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "unsignedinteger" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "UnsignedInteger"
		case #cst.#standard_uppercase
		  as_datatype = "UNSIGNEDINTEGER"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "unsignedint" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "UnsignedInt"
		case #cst.#standard_uppercase
		  as_datatype = "UNSIGNEDINT"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "uint" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "UInt"
		case #cst.#standard_uppercase
		  as_datatype = "UINT"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "int" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Int"
		case #cst.#standard_uppercase
		  as_datatype = "INT"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "unsignedlong" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "UnsignedLong"
		case #cst.#standard_uppercase
		  as_datatype = "UNSIGNEDLONG"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "ulong" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "ULong"
		case #cst.#standard_uppercase
		  as_datatype = "ULONG"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "longlong" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "LongLong"
		case #cst.#standard_uppercase
		  as_datatype = "LONGLONG"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "longptr" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "LongPtr"
		case #cst.#standard_uppercase
		  as_datatype = "LONGPTR"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "long" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Long"
		case #cst.#standard_uppercase
		  as_datatype = "LONG"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "real" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Real"
		case #cst.#standard_uppercase
		  as_datatype = "REAL"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "string" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "String"
		case #cst.#standard_uppercase
		  as_datatype = "STRING"
	end choose
	al_pos = ll_pos
	return 1
end if

ll_pos = pos( as_line, "time" )
if ll_pos > 0 then
	choose case ii_style
		case #cst.#standard_lowercase
		  as_datatype = "Time"
		case #cst.#standard_uppercase
		  as_datatype = "TIME"
	end choose
	al_pos = ll_pos
	return 1
end if

// not found
al_pos =0
as_datatype = ""

return 1
end function

public function integer of_findvariable (string as_line, string as_prefix, long al_startpos, ref string as_varname, ref long al_nextpos);long	ll_pos
string ls_tmp
if isnull( as_line ) or as_line = "" then return -1
if isnull( as_prefix ) or as_prefix = "" then return -1
if al_startpos < 0 then return -1

ll_pos = pos( as_line, ",", al_startpos )
if ll_pos > 0 then
	ls_tmp = trim( mid( as_line, al_startpos, ll_pos - al_startpos) )
	al_nextpos = ll_pos + 1
	ll_pos = pos( ls_tmp, "_" )
	if ll_pos > 0 then
		ls_tmp = mid( ls_tmp, ll_pos + 1)
	end if
elseif al_startpos < len( as_line ) then
	ls_tmp = trim(mid( as_line, al_startpos ))
	al_nextpos = 0
end if

if len(ls_tmp ) > 0 then
	as_varname = as_prefix+"_"+ls_tmp	
else
	as_varname = ""
end if

return 1
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

