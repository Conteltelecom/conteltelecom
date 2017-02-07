Imports System.Web.Security

Public Class login
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            If IsPostBack = True Then
                Dim ClsAuteticacao As New autenticacao
                Dim msg As String = ""
                Dim username As String
                Dim senha As String
                Dim clsCrypto As New Criptografia
                Dim TipoDispositivo As New TipoDispositivo
                If TipoDispositivo.isMobileBrowser() = True Then
                    If Request.Browser.Cookies Then
                        If IsNothing(Request.Cookies("AutenticacaoNovo")) = False Then
                            senha = clsCrypto.clsCrypto(Request.Cookies("AutenticacaoNovo")("senha"), 0)
                            username = clsCrypto.clsCrypto(Request.Cookies("AutenticacaoNovo")("username"), 0)
                            If ClsAuteticacao.Autentica("", username, senha, msg) = True Then
                                Response.Cookies("AutenticacaoNovo").Expires = DateTime.Now.AddDays(90)
                                FormsAuthentication.RedirectFromLoginPage(username, True)
                            End If
                        End If

                    End If
                End If
                ClsAuteticacao = Nothing
                clsCrypto = Nothing
                TipoDispositivo = Nothing
            End If
        Catch ex As Exception
            RadNotification1.Text = ex.Message
            RadNotification1.Show()
        End Try
    End Sub
    Protected Sub RadButtonlog_Click(sender As Object, e As EventArgs)
        Try
            Dim clsCrypto As New Criptografia
            Dim ClsAuteticacao As New autenticacao
            Dim username As String = nome.Text
            Dim senha As String = password.Text
            Dim msg As String = ""
            Dim TipoDispositivo As New TipoDispositivo


            If ClsAuteticacao.Autentica("", username, senha, msg) = True Then
                If TipoDispositivo.isMobileBrowser() = True Then
                    Response.Cookies("AutenticacaoNovo")("username") = clsCrypto.clsCrypto(username, 1)
                    Response.Cookies("AutenticacaoNovo")("senha") = clsCrypto.clsCrypto(senha, 1)
                    Response.Cookies("AutenticacaoNovo").Expires = DateTime.Now.AddDays(90)

                End If
                FormsAuthentication.RedirectFromLoginPage(username, True)
            Else
                RadNotification1.Text = msg
                RadNotification1.Show()
            End If
        Catch ex As Exception
            RadNotification1.Text = ex.Message
            RadNotification1.Show()
        End Try




    End Sub


End Class