Public Class CadastroPermissao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub RadGridPermissao_PreRender(sender As Object, e As EventArgs) Handles RadGridPermissao.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridPermissao, 0)
            RadGridPermissao.Rebind()
        End If

    End Sub
End Class