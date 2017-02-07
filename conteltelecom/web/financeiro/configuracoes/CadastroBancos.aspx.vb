Public Class CadastroBancos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridConfiguraBancos_PreRender(sender As Object, e As EventArgs) Handles RadGridConfiguraBancos.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridConfiguraBancos, 0)
            RadGridConfiguraBancos.Rebind()
        End If
    End Sub
End Class