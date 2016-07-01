Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        HttpContext.Current.Response.Redirect("~/web/pessoas/ps_cliente.aspx")
    End Sub
End Class