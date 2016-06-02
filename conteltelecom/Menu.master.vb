Public Class Menu
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LabelNomePagina.Text = " - " & Page.Title.ToUpper
    End Sub

End Class