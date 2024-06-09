#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() As String)
		  
		  
		  if testmode then
		  else
		    Call Daemonize
		  end if
		  
		  registermbs
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub registermbs()
		  // Desert Sand Software, MBS Complete, 202411, KRbR3JxENtkNsM/o1KfXdQof0KJYUPBLOokV1fNwtebfTGZX+PX5Ku/vz4Xj8FeZ
		  dim s as string = decodeBase64("S1JiUjNKeEVOdGtOc00vbzFLZlg=", encodings.UTF8)
		  dim p as string = decodeBase64("TUJTIENvbXBsZXRl", encodings.UTF8)
		  dim n as string = decodeBase64("RGVzZXJ0IFNhbmQgU29mdHdhcmU=", encodings.UTF8)
		  dim e as integer = 202411
		  dim t as string = decodeBase64("ZFFvZjBLSllVUEJMT29rVjFmTnd0ZWJmVEdaWCtQWDVLdS92ejRYajhGZVo=", encodings.UTF8)
		  
		  if not registerMBSPlugin(n, p, e, s+t) then  
		    MessageBox "MBS Plugin serial not valid?"  
		  end if  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		athome As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Socket1 As smtpsocket
	#tag EndProperty

	#tag Property, Flags = &h0
		testmode As boolean = True
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="testmode"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="athome"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
