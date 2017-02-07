Imports Telerik.Web.UI

Public Class Mensagens
    Inherits System.Web.UI.Page


    Public Sub FnMesnagens(ByVal p_ex As Exception, ByVal RadWindowManagerMsg As RadWindowManager, ByVal id_MENSAGENS As Integer)

        Dim clsMesnagem As New Mensagens
        Dim mensagen As String = ""
        Dim intWidth As Integer = 0
        Dim intHegith As Integer = 0
        Dim titulo As String = ""
        Dim strCalbackName As String = ""
        Dim imgUrl As String = ""
        Dim retorno As Integer = 1

        mensagen = p_ex.Message & "ERRO 1= " & p_ex.HResult & "ERRO 2= " & id_MENSAGENS
        titulo = "ATENÇÃO"
        intWidth = 400
        intHegith = 200
        strCalbackName = ""
        imgUrl = ""
        mensagen = Replace(mensagen, "'", "")
        mensagen = Replace(mensagen, ControlChars.CrLf, "")

        Select Case retorno
            Case 1
                RadWindowManagerMsg.RadAlert(mensagen,
                    If(intWidth = 0, Nothing, intWidth),
                    If(intHegith = 0, Nothing, intHegith),
                    titulo,
                    If(strCalbackName = "", Nothing, strCalbackName))
                Exit Select
            Case 2 'RadConfirm
                RadWindowManagerMsg.RadConfirm(mensagen, If(strCalbackName = "", Nothing, strCalbackName),
                                      If(intWidth = 0, Nothing, intWidth),
                                      If(intHegith = 0, Nothing, intHegith),
                                      Nothing,
                                      titulo)
                Exit Select

        End Select



    End Sub


End Class
