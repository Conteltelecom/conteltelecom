Public Class CadastroSetorUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadastroSetorUsuario_PreRender(sender As Object, e As EventArgs) Handles RadGridCadastroSetorUsuario.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadastroSetorUsuario, 0)
            RadGridCadastroSetorUsuario.Rebind()
        End If
    End Sub
End Class