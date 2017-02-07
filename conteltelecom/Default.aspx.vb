Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("idEmpresa_PS_PESSOA") = 1 Then
            HttpContext.Current.Response.Redirect("~/web/pessoas/ps_cliente.aspx")
        Else
            Dim TipoDispositivo As New TipoDispositivo
            If TipoDispositivo.isMobileBrowser() = True Then
                HttpContext.Current.Response.Redirect("~/web/area_cliente/mobile/M_Default.aspx")
            Else
                HttpContext.Current.Response.Redirect("~/web/area_cliente/web/ac_faturas.aspx")
            End If

        End If
    End Sub

End Class