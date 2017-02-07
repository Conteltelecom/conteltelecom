Imports System.Net.Mail
Imports System.Text.RegularExpressions
Public Class ClassEnviaEmail
    Dim remetenteEmail As String = "paulo@conteltelecom.com.br"
    ' Esta porta é a utilizada pelo Gmail para envio
    Dim port As String = 587
    Dim Host As String = "smtp.gmail.com"
    Dim EnableSsl As Boolean = True
    Dim senha As String = "18420101aA"
    Dim IsBodyHtml As Boolean = True

    ''' <summary>
    ''' Verifica se o e-mail é válido
    ''' </summary>
    ''' <param name="emailAddress">Endereço de e-mail</param>
    Function EmailAddressCheck(ByVal emailAddress As String) As Boolean
        ' Pattern ou mascara de verificação
        Dim pattern As String = "^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
        ' Verifica se o email corresponde a pattern/mascara
        Dim emailAddressMatch As Match = Regex.Match(emailAddress, pattern)
        ' Caso corresponda
        If emailAddressMatch.Success Then
            Return True
        Else
            Return False
        End If

    End Function
    Public Function EnviaEmail(ByVal Subject As String, ByVal Body As String, ByVal Dest As String) As Boolean
        Dim mail As New MailMessage()


        If EmailAddressCheck(Dest) = True Then
                mail.[To].Add(Dest)
            End If



        mail.From = New MailAddress(remetenteEmail, "Sac-Conteltelecom ", System.Text.Encoding.UTF8)

        mail.Subject = Subject

        mail.SubjectEncoding = System.Text.Encoding.UTF8

        mail.Body = Body

        mail.BodyEncoding = System.Text.Encoding.UTF8

        mail.IsBodyHtml = IsBodyHtml

        mail.Priority = MailPriority.High
        'Prioridade do E-Mail
        Dim client As New SmtpClient()
        'Adicionando as credenciais do seu e-mail e senha:
        client.Credentials = New System.Net.NetworkCredential(remetenteEmail, senha)
        client.Port = port
        ' Esta porta é a utilizada pelo Gmail para envio
        client.Host = Host
        'Definindo o provedor que irá disparar o e-mail
        client.EnableSsl = EnableSsl
        'Gmail trabalha com Server Secured Layer
        Try
            client.Send(mail)

            Return True
        Catch ex As Exception

            Return False
        End Try


    End Function


End Class
