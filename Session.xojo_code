#tag Class
Protected Class Session
Inherits WebSession
#tag Session
  interruptmessage=We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect.
  disconnectmessage=You have been disconnected from this application.
  confirmmessage=
  AllowTabOrderWrap=True
  ColorMode=0
  SendEventsInBatches=False
#tag EndSession
	#tag Event
		Sub Opening()
		  
		  session.mysqldb = new MySQLCommunityServer
		  session.mysqldb.DatabaseName = "ZacReg"
		  
		  
		  if app.testmode then
		    session.mysqldb.Host = "192.168.0.102" 'at work in test mode
		  else
		    session.mysqldb.Host = "localhost" 'at work live on the server
		  end if
		  
		  session.mysqldb.UserName = "DOTUser"
		  session.mysqldb.Password = "g0v3rnm3ntsucks"
		  session.mysqldb.port = 3306
		  
		  if session.mysqldb.Connect then
		    MyConnectionTimer = new timer
		    MyConnectionTimer.period = 1000 * 60 * 10 '10 minutes
		    MyConnectionTimer.mode = 2
		    LoadEmailSettings
		  else
		    MessageBox session.mysqldb.ErrorMessage
		    quit
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub UserTimedOut()
		  MessageBox "Session has timed out!"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub LoadEmailSettings()
		  dim rs as recordset
		  dim i as integer
		  
		  
		  rs = session.mysqldb.sqlselect("Select * from emailsettings where serial = '1'")
		  
		  if rs <> nil then
		    if not rs.bof and not rs.eof then
		      EmailModule.smtphost = rs.field("host").value
		      EmailModule.smtpport = rs.field("port").value
		      EmailModule.smtpusername = rs.field("username").value
		      EmailModule.smtppassword = rs.field("password").value
		    end if
		  end if
		End Sub
	#tag EndMethod

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
		    MessageBox "Failed to connect to the database.  Could not load SO gear types."
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
			Name="UserTimeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue="You have been disconnected from this application."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InterruptionMessage"
			Visible=true
			Group="Behavior"
			InitialValue="We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_LastMessageTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabOrderWrap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmDisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="WebSession.ColorModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Auto"
				"1 - Light"
				"2 - Dark"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserPrefersDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendEventsInBatches"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
			Name="Platform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="HashTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="EditingExisting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
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
			Name="SaveProgress"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
