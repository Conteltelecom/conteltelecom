Public Class CadastroCategorias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridConfiguraCategorias_PreRender(sender As Object, e As EventArgs) Handles RadGridConfiguraCategorias.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridConfiguraCategorias, 0)
            RadGridConfiguraCategorias.Rebind()
        End If
    End Sub
End Class