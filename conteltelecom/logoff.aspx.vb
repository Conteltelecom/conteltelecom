Public Class logoff
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session.Contents.RemoveAll()
        FormsAuthentication.SignOut()
        HttpContext.Current.Response.Redirect("~/Account/login.aspx")
    End Sub
End Class