Attribute VB_Name = "Utils"
Option Explicit

Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" _
    (ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, _
    ByVal lParam As Long) As Long
Private Const WM_SETREDRAW As Long = &HB

Sub Freeze(hwnd As Long)
    SendMessageLong hwnd, WM_SETREDRAW, False, &O0
End Sub

Sub Unfreeze(hwnd As Long)
    SendMessageLong hwnd, WM_SETREDRAW, True, &O0
End Sub

Sub ClearChildNodes(Tree As TreeView, NodeName As String, Optional NodeObject As Node)
    Dim n As Node
    
    If Not NodeObject Is Nothing Then
        Set n = NodeObject
    Else
        Set n = Tree.Nodes(NodeName)
    End If
    If n Is Nothing Then Exit Sub
    While n.Children > 0
        If n.Child.Children > 0 Then
            ClearChildNodes Tree, n.Child
        End If
        Tree.Nodes.Remove n.Child.Index
    Wend
End Sub


