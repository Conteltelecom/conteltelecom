Public Class rl_rel_uso_mes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridUso_PreRender(sender As Object, e As EventArgs) Handles RadGridUso.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridUso, 3)
            RadGridUso.Rebind()
        End If

    End Sub
End Class