Attribute VB_Name = "changeldnumbers"
Option Explicit

Sub changeld_Click()
'Call check
Call changetold
'Call SortByRows
Call check
End Sub
Sub SortAllCols()
    Dim wsToSort As Excel.Worksheet
    Dim wbTemp As Excel.Workbook
    Dim wsTemp As Excel.Worksheet
    Dim rRow As Excel.Range
    Dim lastrow As Long
    Dim rT As Range, v

    Set wsToSort = ActiveSheet 'Change to suit
    Set wbTemp = Workbooks.Add
    Set wsTemp = wbTemp.Worksheets(1)
    Application.ScreenUpdating = False

    With wsToSort
        lastrow = .Range("CW" & .Rows.count).End(xlUp).row
        For Each rRow In .Range("CW13:CW" & lastrow)
            wsTemp.UsedRange.Clear
            v = .Range(rRow, .Cells(rRow.row, .Columns.count).End(xlToLeft)).Value
            If IsArray(v) Then 'ignore single cell range
                Set rT = wsTemp.Range("CW13").Resize(, UBound(v, 2))
                rT.Value = v
                rT.Offset(1, 0).FormulaR1C1 = "=LEN(R[-1]C)"
                rT.Resize(2).Sort Key1:=rT.Rows(2), Order1:=xlDescending, Orientation:=xlSortRows
                v = rT.Rows(1).Value
                rRow.Resize(, UBound(v, 2)).Value = v
            End If
        Next rRow
    End With
    Application.ScreenUpdating = True
    wbTemp.Close False
End Sub




Sub SortByRows()
Dim rw As Long
Dim lastrow As Long

 With ActiveSheet
        lastrow = .Range("AC" & .Rows.count).End(xlUp).row
For rw = 13 To lastrow
Range("CW" & rw & ":DA" & rw).Sort Key1:=Range("CW" & rw & ":DA" & rw), Order1:=xlDescending, Header:=xlGuess, _
OrderCustom:=1, MatchCase:=False, Orientation:=xlLeftToRight
Next rw
End With
End Sub


Sub changetold()
    Dim sTxt As String
    Dim lastrow As Long, i As Long

    With ActiveSheet
        lastrow = .Cells(.Rows.count, "AC").End(xlUp).row
    End With

    For i = 13 To lastrow
        sTxt = Range("CW" & i)

        Select Case Len(sTxt)
        Case 6, 7, 11, 0
        Case 10
            If Left(sTxt, 3) <> "032" Then Range("cw" & i) = "101011"
        Case Else
            Range("cw" & i) = "101011"
        End Select
    Next i
    
    
      For i = 13 To lastrow
        sTxt = Range("cx" & i)

        Select Case Len(sTxt)
        Case 6, 7, 11, 0
        Case 10
            If Left(sTxt, 3) <> "032" Then Range("cx" & i) = "101011"
        Case Else
            Range("cx" & i) = "101011"
        End Select
    Next i
    
      For i = 13 To lastrow
        sTxt = Range("cy" & i)

        Select Case Len(sTxt)
        Case 6, 7, 11, 0
        Case 10
            If Left(sTxt, 3) <> "032" Then Range("cy" & i) = "101011"
        Case Else
            Range("cy" & i) = "101011"
        End Select
    Next i
    
    
      For i = 13 To lastrow
        sTxt = Range("cz" & i)

        Select Case Len(sTxt)
        Case 6, 7, 11, 0
        Case 10
            If Left(sTxt, 3) <> "032" Then Range("cz" & i) = "101011"
        Case Else
            Range("cz" & i) = "101011"
        End Select
    Next i
    
      For i = 13 To lastrow
        sTxt = Range("da" & i)

        Select Case Len(sTxt)
        Case 6, 7, 11, 0
        Case 10
            If Left(sTxt, 3) <> "032" Then Range("da" & i) = "101011"
        Case Else
            Range("da" & i) = "101011"
        End Select
    Next i
End Sub


Sub check()
Dim i As Long
Dim lastrow As Long
Dim cell As Variant
ActiveSheet.Range("CW13").Select

 With ActiveSheet
    lastrow = .Cells(.Rows.count, "AC").End(xlUp).row
    For i = 1 To lastrow
Range(ActiveCell, ActiveCell.End(xlToRight)).Select

For Each cell In Selection
If WorksheetFunction.CountIf(Selection, cell) > 1 Then
cell.ClearContents
Else
End If
Next cell
On Error Resume Next
Selection.SpecialCells(xlCellTypeBlanks).ClearContents
ActiveCell.Range("A2").Select
Next i
End With


'2nd OPTION
'Dim loc As Long
'Dim lastrow As Long
'Dim i As Integer
'Dim rng As Range
'
'loc = 2
' With ActiveSheet
'    lastrow = .Cells(.Rows.count, "F").End(xlUp).row
'
'For i = 1 To lastrow
'
'    loc = loc + 1
'
'    Set rng = ActiveSheet.Range("A" & loc & ":E" & loc)
'
'
'rng.RemoveDuplicates Columns:=Array(1, 2, 3, 4, 5)
'
'Next i
'    End With




End Sub
