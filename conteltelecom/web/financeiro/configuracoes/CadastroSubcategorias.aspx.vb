Public Class CadastroSubcategorias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridConfiguraSubcategorias_PreRender(sender As Object, e As EventArgs) Handles RadGridConfiguraSubcategorias.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridConfiguraSubcategorias, 0)
            RadGridConfiguraSubcategorias.Rebind()
        End If
    End Sub
End Class