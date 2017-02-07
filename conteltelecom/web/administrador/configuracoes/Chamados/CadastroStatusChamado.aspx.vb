Public Class CadastroStatusChamado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadastroStatusChamado_PreRender(sender As Object, e As EventArgs) Handles RadGridCadastroStatusChamado.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadastroStatusChamado, 0)
            RadGridCadastroStatusChamado.Rebind()
        End If
    End Sub

End Class