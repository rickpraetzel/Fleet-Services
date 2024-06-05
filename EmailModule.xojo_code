#tag Module
Protected Module EmailModule
	#tag Property, Flags = &h1
		Protected smtpauthorizationtype As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected smtphost As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected smtppassword As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected smtpport As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected smtpusername As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
