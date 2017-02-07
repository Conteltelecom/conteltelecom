Public Class CadatroRepresentanteEmail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridEmail_PreRender(sender As Object, e As EventArgs) Handles RadGridEmail.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridEmail, 0)
            RadGridEmail.Rebind()
        End If
    End Sub
End Class