Imports Telerik.Web.UI

Public Class li_cad_tipo_programacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridLICadProgramacao_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLICadProgramacao.ItemCommand

        If e.CommandName = "Delete" Then

            If HiddenField1.Value = "false" Then
                Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
                Dim id_SF_SERVICOS_FATURALabel As Label = DirectCast(item.FindControl("id_LI_TIPO_PROGRAMACAO"), Label)
                Session("DeleteValor") = id_SF_SERVICOS_FATURALabel.Text
                RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO ?" & id_SF_SERVICOS_FATURALabel.Text, "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
                e.Canceled = True
            End If
        ElseIf e.CommandName = "DeleteChecked" Then
            DeleteChecked()
            HiddenField1.Value = "false"
        End If

    End Sub

    Protected Sub DeleteChecked()
        ' SqlDataSourceCadProgramacao.DeleteParameters("id_SF_SERVICOS_FATURA").DefaultValue = Session("DeleteValor")
        SqlDataSourceCadProgramacao.Delete()
        Session.Remove("DeleteValor")
    End Sub

End Class