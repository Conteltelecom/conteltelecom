Public Class CadastroTipoOperacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadastroTipoOperacao_PreRender(sender As Object, e As EventArgs) Handles RadGridCadastroTipoOperacao.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadastroTipoOperacao, 0)
            RadGridCadastroTipoOperacao.Rebind()
        End If
    End Sub
End Class