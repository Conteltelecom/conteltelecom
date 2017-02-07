Public Class Ch_CadastroPrioriades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridPrioridades_PreRender(sender As Object, e As EventArgs) Handles RadGridPrioridades.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridPrioridades, 0)
            RadGridPrioridades.Rebind()
        End If


    End Sub
End Class