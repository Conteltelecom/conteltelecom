Imports Telerik.Web.UI

Public Class JavaScript
    Inherits System.Web.UI.Page
    Public Sub jsDelete(ByVal NomeGrid As String)

        Try

            '  RadWindowManagerDelete.RadAlert("ATENÇÃO CIDADE NÃO CADATRADA", 400, Nothing, "MESNAGEM", Nothing)

            Dim myScript As String = " function confirmDeleteBackFn(arg) {
     
            var grid = $find(""<%=" & NomeGrid & ".ClientID %>"");
           if (arg) {
      
                grid.get_masterTableView().fireCommand(""DeleteChecked"", 0);
            }
        }"


            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScriptDelete", myScript,
          True)


        Catch ex As Exception

        End Try
    End Sub



    Public Sub DeleteChecked(ByVal SqlDataSource As Object, ByVal DataKey As Integer)
        SqlDataSource.DeleteParameters(DataKey).DefaultValue = Session("DeleteValor")
        SqlDataSource.Delete()
        Session.Remove("DeleteValor")
    End Sub
End Class
