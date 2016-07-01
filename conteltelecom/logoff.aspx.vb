Public Class logoff
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        FormsAuthentication.SignOut()
        HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente_detalhes.aspx?id_cliente=0")
    End Sub
End Class