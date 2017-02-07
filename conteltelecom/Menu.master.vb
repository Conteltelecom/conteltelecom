Public Class Menu
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("idEmpresa_PS_PESSOA") = 1 Then
            RadPanelBar1.Visible = True
            RadPanelBarClientes.Visible = False
        Else
            RadPanelBar1.Visible = False
            RadPanelBarClientes.Visible = True
        End If
        LabelNomePagina.Text = " - " & Page.Title
    End Sub

End Class