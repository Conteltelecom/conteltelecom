Public Class CadastroMensagemEmail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridMensagemEmail_PreRender(sender As Object, e As EventArgs) Handles RadGridMensagemEmail.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridMensagemEmail, 0)
            RadGridMensagemEmail.Rebind()
        End If
    End Sub
End Class