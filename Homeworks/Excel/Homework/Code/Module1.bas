Attribute VB_Name = "Module1"
Sub easy_hw()
' Defining all of the integers I will be using
Dim t_name As String
Dim totvol As String
Dim x As Long
Dim y As Integer
Dim names As String
Dim last_tick As Long
Dim last_name As Long
Dim last_avg As Long

' Setting static cells that will be the same on every sheet in the same spot
t_name = "Ticker"
totvol = "Toal Volume"
Cells(1, 9) = t_name
Cells(1, 10) = totvol

' Found the formula used below online to count the number of cells that contain
' a value from the bottom up if I correctly understood the explination
last_tick = Cells(Rows.Count, 1).End(xlUp).Row
' Use formula again but within the for loop to continously reset the last
' row of the location for the names and totals to ensure proper alignment
last_avg = Cells(Rows.Count, 10).End(xlUp).Row
last_name = Cells(Rows.Count, 9).End(xlUp).Row

' Sets up for FOR loop with it equal to the appropriate last row on each sheet
For x = 2 To last_tick:
    ' Sets up conditional for determining if the name has been entered into the
    ' list yet. If it has not been entered, the value will be assigned and
    ' finds the sum for the entry
    If (Cells(last_name, 9).Value = Cells(x, 1).Value) Then
        Cells(last_avg, 10).Value = Cells(x, 7).Value + Cells(last_avg, 10).Value
    Else:
        last_avg = last_avg + 1
        last_name = last_name + 1
        Cells(last_name, 9).Value = Cells(x, 1).Value
        Cells(last_avg, 10).Value = Cells(x, 7).Value
       End If
Next

' Cleanup of sheet for unwanted ticker repeats
last_avg = Cells(Rows.Count, 10).End(xlUp).Row
For x = (last_avg + 1) To last_tick:
    Cells(x, 9) = Null
Next
End Sub
