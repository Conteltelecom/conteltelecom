Public Class CadastroOcorrencias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridConfiguraOcorrencias_PreRender(sender As Object, e As EventArgs) Handles RadGridConfiguraOcorrencias.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridConfiguraOcorrencias, 0)
            RadGridConfiguraOcorrencias.Rebind()
        End If
    End Sub
End Class