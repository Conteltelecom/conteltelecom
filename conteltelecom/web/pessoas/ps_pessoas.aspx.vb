Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class ps_pessoas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Public Function CpfFormat(cpf As Object) As String

        Dim ClsValidacoes As New conteltelecom.Validacoes
        Return ClsValidacoes.CNPJFormat(cpf)

    End Function
    Public Function FormataFone(fone As Object) As String
        Return TelefoneFormat(fone)

    End Function






    Private Sub RadGridPessoaFisica_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridPessoaFisica.ItemCommand
        If e.CommandName = "Pesquisar" Then
            Dim id_PS_PESSOATextBox As Label = TryCast(e.Item.FindControl("id_PS_PESSOALabel"), Label)
            HttpContext.Current.Response.Redirect("~\web\pessoas\ps_pessoas_detalhes.aspx?id_pessoa=" & id_PS_PESSOATextBox.Text)

        End If
        If e.CommandName = "InitInsert" Then

            HttpContext.Current.Response.Redirect("~\web\pessoas\ps_pessoas_detalhes.aspx?id_pessoa=0")

        End If
    End Sub
End Class