#tag WebPage
Begin WebDialog LoginDialog
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   132
   Index           =   0
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   296
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   TabIndex        =   0
   Top             =   302
   Visible         =   True
   Width           =   300
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton OKButton
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "OK"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   180
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   90
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton CancelButton
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Cancel"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   68
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   2
      Tooltip         =   ""
      Top             =   90
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   28
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   3
      Text            =   "User:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label2
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   28
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   4
      Text            =   "Password:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   48
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField TextField1
      AllowAutoComplete=   True
      AllowSpellChecking=   True
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      Text            =   ""
      TextAlignment   =   ""
      Tooltip         =   ""
      Top             =   14
      Visible         =   True
      Width           =   172
      _mPanelIndex    =   -1
   End
   Begin WebTextField TextField2
      AllowAutoComplete=   True
      AllowSpellChecking=   True
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   1
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   6
      Text            =   ""
      TextAlignment   =   ""
      Tooltip         =   ""
      Top             =   48
      Visible         =   True
      Width           =   172
      _mPanelIndex    =   -1
   End
   Begin AutoDiscoveryClass AutoDiscoveryClass1
      BroadcastAddress=   ""
      Handle          =   0
      Index           =   -2147483648
      IsConnected     =   False
      LocalAddress    =   ""
      LockedInPosition=   False
      PacketsAvailable=   0
      PacketsLeftToSend=   0
      Port            =   0
      RouterHops      =   32
      Scope           =   0
      SendToSelf      =   False
      TabIndex        =   7
      TabStop         =   True
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Dismissed()
		  
		  if session.mysqldb.connect then
		    if accepted then
		      dim rs as recordset
		      rs = session.mysqldb.sqlselect("Select serial from bumblebee_records where user = '" + textfield1.text + "' AND password = '" + TextField2.text + "'")
		      if rs <> nil then
		        if not rs.bof and not rs.eof then
		          session.recordId = rs.IdxField(1).value
		          session.EditingExisting = true
		          Accepted = true
		          'WebPage1.show
		        else
		          MessageBox "Could not authenticate you in the database."
		        end if
		      else
		        MessageBox "Could not authenticate you in the database."
		      end if
		    end if
		  else
		    MessageBox "Lost connection with database."
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Accepted As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events OKButton
	#tag Event
		Sub Pressed()
		  Accepted = True
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=false
		Group="Position"
		InitialValue=""
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
		Visible=false
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Accepted"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
