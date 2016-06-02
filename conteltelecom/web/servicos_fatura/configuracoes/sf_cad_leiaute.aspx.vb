Imports Telerik.Web.UI

Public Class sf_cad_leiaute
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub RadGridCadLeiaute_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadLeiaute.ItemCommand
        Dim id_SF_LEIAUTE As Integer
        If e.CommandName = "Edit" Then

            Dim item As GridDataItem = TryCast(e.Item, GridDataItem)

            id_SF_LEIAUTE = item("id_SF_LEIAUTE").Text
            HttpContext.Current.Response.Redirect("~/web/servicos_fatura/configuracoes/sf_cad_leiaute_detalhes.aspx?id_SF_LEIAUTE=" & id_SF_LEIAUTE & "&modo=EditAll")

        End If
    End Sub

    Private Sub SqlDataSourceBuscaLeiaute_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceBuscaLeiaute.Inserted

        HttpContext.Current.Response.Redirect("~/web/servicos_fatura/configuracoes/sf_cad_leiaute_detalhes.aspx?id_SF_LEIAUTE=" & e.Command.Parameters("@Id").Value)
    End Sub
End Class