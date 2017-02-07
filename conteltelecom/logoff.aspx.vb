Public Class logoff
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session.Contents.RemoveAll()
        FormsAuthentication.SignOut()
        Try
            Dim nameCookie As HttpCookie = Request.Cookies("AutenticacaoNovo")
            'Set the Expiry date to past date.
            nameCookie.Expires = DateTime.Now.AddDays(-1)
            'Update the Cookie in Browser.
            Response.Cookies.Add(nameCookie)
        Catch ex As Exception

        End Try



        HttpContext.Current.Response.Redirect("~/Account/login.aspx")
    End Sub
End Class