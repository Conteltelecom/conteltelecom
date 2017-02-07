Public Class CadastroStatusConta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridConfiguraStatusConta_PreRender(sender As Object, e As EventArgs) Handles RadGridConfiguraStatusConta.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridConfiguraStatusConta, 0)
            RadGridConfiguraStatusConta.Rebind()
        End If
    End Sub
End Class