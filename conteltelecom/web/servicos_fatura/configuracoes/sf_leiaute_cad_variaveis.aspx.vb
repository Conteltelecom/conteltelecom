Public Class sf_leiaute_cad_variaveis
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadVariaveis_PreRender(sender As Object, e As EventArgs) Handles RadGridCadVariaveis.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadVariaveis, 0)
            RadGridCadVariaveis.Rebind()
        End If

    End Sub
End Class