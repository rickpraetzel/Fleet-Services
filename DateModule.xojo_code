#tag Module
Protected Module DateModule
	#tag Method, Flags = &h0
		Function dateto6figures(indate as date) As String
		  dim s as string
		  
		  return format(indate.month,"00") + "/" + format(indate.day,"00") + "/" + right(str(indate.year),2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetodayofweek(indate as date) As String
		  if indate.dayofweek = 1 then
		    return "Sunday"
		  elseif indate.dayofWeek = 2 then 
		    return "Monday"
		  elseif indate.dayofWeek = 3 then 
		    return "Tuesday"
		  elseif indate.dayofWeek = 4 then 
		    return "Wednesday"
		  elseif indate.dayofWeek = 5 then 
		    return "Thursday"
		  elseif indate.dayofWeek = 6 then 
		    return "Friday"
		  elseif indate.dayofWeek = 7 then 
		    return "Saturday"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetohrdate(indate as date) As String
		  dim d as date
		  d = indate
		  return format(d.month,"00") + "/" + format (d.day,"00") + "/" + str(d.year)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetomonthname(indate as date) As String
		  
		  
		  if indate.month = 1 then
		    return "January"
		  elseif indate.month = 2 then
		    return "February"
		  elseif indate.month = 3 then
		    return "March"
		  elseif indate.month = 4 then
		    return "April"
		  elseif indate.month = 5 then
		    return "May"
		  elseif indate.month = 6 then
		    return "June"
		  elseif indate.month = 7 then
		    return "July"
		  elseif indate.month = 8 then
		    return "August"
		  elseif indate.month = 9 then
		    return "September"
		  elseif indate.month = 10 then
		    return "October"
		  elseif indate.month = 11 then
		    return "November"
		  elseif indate.month = 12 then
		    return "December"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoshortdate(indate as date) As String
		  dim d as date
		  d = indate
		  return format(d.month,"00") + "/" + format (d.day,"00") + "/" + right(str(d.year),2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function datetoworddate(indate as date) As String
		  dim d as date
		  d = indate
		  return str(d.year) + format(d.month,"00") + format (d.day,"00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getlastday(inmonth as integer,inyear as integer) As Integer
		  
		  if inmonth = 1 then
		    return 31
		  elseif inmonth = 2 then
		    if inyear mod 4 = 0 then 'leap year
		      return 29
		    else
		      return 28
		    end if
		  elseif inmonth = 3 then
		    return 31
		  elseif inmonth = 4 then
		    return 30
		  elseif inmonth = 5 then
		    return 31
		  elseif inmonth =6 then
		    return 30
		  elseif inmonth =7 then
		    return 31
		  elseif inmonth =8 then
		    return 31
		  elseif inmonth =9 then
		    return 30
		  elseif inmonth = 10 then
		    return 31
		  elseif inmonth = 11 then
		    return 30
		  elseif inmonth = 12 then
		    return 31
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hrdatetoworddate(hrdate as string) As String
		  return right(hrdate,4) + left(hrdate,2) + mid(hrdate,4,2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function integertodayname(n as integer) As string
		  if n = 1 then
		    return "Sunday"
		  elseif n = 2 then 
		    return "Monday"
		  elseif n = 3 then
		    return "Tuesday"
		  elseif n = 4 then
		    return "Wednesday"
		  elseif n = 5 then
		    return "Thursday"
		  elseif n = 6 then
		    return "Friday"
		  elseif n = 7 then
		    return "Saturday"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function monthdaytoenglish(n as integer) As string
		  if n = 1 or n = 21 or n = 31 then
		    return str(n) + "st"
		  elseif n = 2 or n = 22 then
		    return str(n) + "nd"
		  elseif n = 3 or n = 23 then
		    return str(n) + "rd"
		  elseif n >= 4 and n <= 20 then
		    return str(n) + "th"
		  elseif n >= 24 and n <= 30 then
		    return str(n) + "th"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function shortdatetoworddate(inshortdate as string) As String
		  
		  if len(inshortdate) = 8 then
		    if val(right(inshortdate,2)) > 50 then
		      return "19" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    else
		      return "20" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    end if
		  elseif len(inshortdate) = 10 then
		    if val(right(inshortdate,2)) > 50 then
		      return "19" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    else
		      return "20" + right(inshortdate,2) + left(inshortdate,2) + mid(inshortdate,4,2)
		    end if
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampToDateAndTime(TimeStampString as string) As string
		  dim prefix,suffix,s,year,month,day,hour,minute,second,ampm as string
		  
		  prefix = NthField(TimeStampString," ",1)
		  suffix = NthField(TimeStampString," ",2)
		  
		  year = NthField(prefix,"-",1)
		  month = NthField(prefix,"-",2)
		  day = NthField(prefix,"-",3)
		  
		  hour = NthField(suffix,":",1)
		  minute = NthField(suffix,":",2)
		  second = NthField(suffix,":",3)
		  
		  if val(hour) > 12 then
		    hour = str(val(hour) - 12)
		    ampm = "PM"
		  else
		    ampm = "ZM"
		  end if
		  
		  return month + "/" + day + "/" + year + "      " + hour + ":" + minute + ":" + second + " " + ampm
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetodate(worddate as String) As date
		  dim d as date
		  
		  d = new date
		  d.year = val(left(worddate,4))
		  d.month = val(mid(worddate,5,2))
		  d.day = val(right(worddate,2))
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetohrdate(worddate as string) As String
		  
		  if worddate = "" then
		    return ""
		  else
		    return mid(worddate,5,2) + "/" + right(worddate,2) + "/" + left(worddate,4)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function worddatetoshortdate(instring as string) As String
		  
		  if len(instring) = 8 then
		    return mid(instring,5,2) + "/" + right(instring,2) + "/" + mid(instring,3,2)
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		todaysdate As date
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
