Imports Telerik.Web.UI

Public Class cad_menus
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadMenus_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadMenus.ItemCommand
        If e.CommandName = "Delete" Then



            Session("DeleteValor") = e.CommandArgument
            RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
            e.Canceled = True

        ElseIf e.CommandName = "DeleteChecked" Then
            DeleteChecked()

        End If

    End Sub
    Protected Sub DeleteChecked()
        SqlDataSourceCadMenus.DeleteParameters("id_SF_SERVICOS_FATURA").DefaultValue = Session("DeleteValor")
        SqlDataSourceCadMenus.Delete()
        Session.Remove("DeleteValor")
    End Sub
End Class