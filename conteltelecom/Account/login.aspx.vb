Imports System.Web.Security

Public Class login
    Inherits System.Web.UI.Page

    Protected Sub RadButtonlog_Click(sender As Object, e As EventArgs) Handles RadButtonlog.Click


        Dim ClsAuteticacao As New autenticacao
        Dim username As String = RadTextBoxNome.Text
        Dim senha As String = RadTextBoxSenha.Text
        Dim msg As String = ""
        If ClsAuteticacao.Autentica("", username, senha, msg) = True Then

            FormsAuthentication.RedirectFromLoginPage(username, False)

        Else

            RadNotification1.Text = msg
            RadNotification1.Show()

        End If






    End Sub
End Class