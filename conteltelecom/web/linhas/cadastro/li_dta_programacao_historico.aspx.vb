Imports Telerik.Web.UI

Public Class li_dta_programacao_historico
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub DeleteChecked()

        SqlDataSourceHistorico.DeleteParameters("id_LI_CAD_PROGRAMACAO").DefaultValue = Session("DeleteValor")
        SqlDataSourceHistorico.Delete()

        Session.Remove("DeleteValor")

    End Sub

    Private Sub RadGridHistorico_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridHistorico.ItemCommand
        Select Case e.CommandName
            Case "Delete"
                Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
                Dim itemValue As Label = DirectCast(item.FindControl("Labelid_LI_CAD_PROGRAMACAO"), Label)



                Session("DeleteValor") = itemValue.Text

                RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
                e.Canceled = True

                Exit Select


            Case "DeleteChecked"

                DeleteChecked()
                Exit Sub
        End Select
    End Sub
End Class