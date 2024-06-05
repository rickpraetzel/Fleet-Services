#tag Class
Protected Class Session
Inherits WebSession
	#tag Event
		Sub Open()
		  self.timeout = 0
		  session.mysqldb = new MySQLCommunityServer
		  session.mysqldb.DatabaseName = "ZacReg"
		  
		  
		  
		  if DebugBuild then
		    session.mysqldb.DatabaseName = "ZacTest"
		  end if
		  session.mysqldb.Host = "localhost" 'at work live on the server
		  
		  
		  
		  
		  
		  session.mysqldb.UserName = "DOTUser"
		  session.mysqldb.Password = "g0v3rnm3ntsucks"
		  session.mysqldb.port = 3306
		  
		  if session.mysqldb.Connect then
		    MyConnectionTimer = new timer
		    MyConnectionTimer.period = 1000 * 60 * 10 '10 minutes
		    MyConnectionTimer.mode = 2
		  else
		    MsgBox session.mysqldb.ErrorMessage
		    quit
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub TimedOut()
		  MsgBox "Session has timed out!"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub loadSOgeartypes()
		  dim sqlstring as string
		  dim rs as recordset
		  dim n as integer
		  dim newgtype as gearTypeClass
		  
		  
		  sqlstring = "Select * from rentalgeartypes"
		  if mysqldb.Connect then
		    rs = session.mysqldb.SQLSelect(sqlstring)
		    if rs <> nil then
		      if not rs.bof and not rs.eof then
		        redim SOgeartypes(0)
		        while not rs.eof
		          newgtype = new gearTypeClass
		          newgtype.name =  rs.Field("type").value
		          newgtype.abbr = rs.Field("abbrev").value
		          newgtype.trackedbyid = rs.field("trackbyid").value
		          newgtype.serial = rs.field("serial").value
		          newgtype.productserials = rs.field("productserials").value
		          SOgeartypes.append newgtype
		          rs.movenext
		        wend
		      end if
		    end if
		  else
		    MsgBox "Failed to connect to the database.  Could not load SO gear types."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecordLaunch()
		  dim rec as DatabaseRecord
		  dim d as new date
		  
		  rec = new DatabaseRecord
		  
		  rec.column("date") = str(d.year) + format(d.month,"00") + format(d.day,"00")
		  rec.column("time") = format(d.hour,"00") + ":" + format(d.minute,"00") + ":" + format(d.second,"00")
		  rec.column("ip") = session.RemoteAddress
		  session.mysqldb.InsertRecord("bumblebee_webappformlaunch",rec)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EditingExisting As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MyConnectionTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h0
		mysqldb As MySQLCommunityServer
	#tag EndProperty

	#tag Property, Flags = &h0
		recordId As string
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			this will allow them to go backwards if necessary.
			If they go back and edit webpage1, we don't want to create another record, but save the cahnges instead.
		#tag EndNote
		SaveProgress As Integer = 0
	#tag EndProperty


	#tag Constant, Name = ErrorDialogCancel, Type = String, Dynamic = True, Default = \"Do Not Send", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogMessage, Type = String, Dynamic = True, Default = \"This application has encountered an error and cannot continue.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogQuestion, Type = String, Dynamic = True, Default = \"Please describe what you were doing right before the error occurred:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogSubmit, Type = String, Dynamic = True, Default = \"Send", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorThankYou, Type = String, Dynamic = True, Default = \"Thank You", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorThankYouMessage, Type = String, Dynamic = True, Default = \"Your feedback helps us make improvements.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoJavascriptInstructions, Type = String, Dynamic = True, Default = \"To turn Javascript on\x2C please refer to your browser settings window.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoJavascriptMessage, Type = String, Dynamic = True, Default = \"Javascript must be enabled to access this page.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ScaleFactor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_baseurl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffsetInSeconds"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveConnectionCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Browser"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="BrowserType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Safari"
				"2 - Chrome"
				"3 - Firefox"
				"4 - InternetExplorer"
				"5 - Opera"
				"6 - ChromeOS"
				"7 - SafariMobile"
				"8 - Android"
				"9 - Blackberry"
				"10 - OperaMini"
				"11 - Epiphany"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BrowserVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Connection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ConnectionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - AJAX"
				"1 - WebSocket"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="EditingExisting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HashTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageRightToLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Platform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="PlatformType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Macintosh"
				"2 - Windows"
				"3 - Linux"
				"4 - Wii"
				"5 - PS3"
				"6 - iPhone"
				"7 - iPodTouch"
				"8 - Blackberry"
				"9 - WebOS"
				"10 - iPad"
				"11 - AndroidTablet"
				"12 - AndroidPhone"
				"13 - RaspberryPi"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Protocol"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="recordId"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RenderingEngine"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="EngineType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - WebKit"
				"2 - Gecko"
				"3 - Trident"
				"4 - Presto"
				"5 - EdgeHTML"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SaveProgress"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Expiration"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_hasQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mConnection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ConnectionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - AJAX"
				"1 - WebSocket"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
