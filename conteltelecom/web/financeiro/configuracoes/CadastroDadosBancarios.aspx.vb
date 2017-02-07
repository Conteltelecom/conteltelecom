Public Class CadastroDadosBancarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridDadosBancarios_PreRender(sender As Object, e As EventArgs) Handles RadGridDadosBancarios.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridDadosBancarios, 0)
            RadGridDadosBancarios.Rebind()
        End If
    End Sub
End Class