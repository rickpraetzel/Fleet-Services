#tag Module
Protected Module Module1
	#tag Property, Flags = &h0
		CurrentResSerial As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentReturnlistIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		returnlist(0) As gearReturnClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowingDate As date
	#tag EndProperty

	#tag Property, Flags = &h0
		SOGearTypes(0) As gearTypeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		WebPageSeekingDate As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentResSerial"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentReturnlistIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="WebPageSeekingDate"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
