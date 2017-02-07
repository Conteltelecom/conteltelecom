Public Class CadastroDestinatarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridDestinatarios_PreRender(sender As Object, e As EventArgs) Handles RadGridDestinatarios.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridDestinatarios, 0)
            RadGridDestinatarios.Rebind()
        End If
    End Sub
End Class