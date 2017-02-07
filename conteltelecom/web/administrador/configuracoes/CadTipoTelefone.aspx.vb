Public Class CadTipoTelefone
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadTipoTelefone_PreRender(sender As Object, e As EventArgs) Handles RadGridCadTipoTelefone.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadTipoTelefone, 0)
            RadGridCadTipoTelefone.Rebind()
        End If
    End Sub
End Class