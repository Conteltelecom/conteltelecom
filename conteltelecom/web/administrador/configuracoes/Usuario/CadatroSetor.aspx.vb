Public Class CadatroSetor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridSetores_PreRender(sender As Object, e As EventArgs) Handles RadGridSetores.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridSetores, 0)
            RadGridSetores.Rebind()
        End If

    End Sub
End Class