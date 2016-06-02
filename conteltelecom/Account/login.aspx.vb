Imports System.Web.Security
Public Class login
    Inherits System.Web.UI.Page

    Protected Sub RadButtonlog_Click(sender As Object, e As EventArgs) Handles RadButtonlog.Click

        If RadTextBoxNome.Text = "conteltelecom" And RadTextBoxSenha.Text = "c0nteltelec0m" Then

            HttpContext.Current.Response.Redirect("~/web/pessoas/ps_cliente.aspx")
        Else

            RadNotification1.Show()
        End If



    End Sub
End Class