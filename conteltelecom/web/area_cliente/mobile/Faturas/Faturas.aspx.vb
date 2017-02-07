Imports Telerik.Web.UI

Public Class Faturas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelMesAtual.Text = Request.QueryString("MesAtual")
        LabelAnoAtual.Text = Request.QueryString("AnoAtual")

    End Sub

    Private Sub RadListViewFaturas_DataBinding(sender As Object, e As EventArgs) Handles RadListViewFaturas.DataBinding





    End Sub
End Class