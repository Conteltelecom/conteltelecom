Imports conteltelecom.Validacoes
Public Class li_rel_valor_inicial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Function FcnpjFormat(cnpj As Object) As String
        Return CNPJFormat(cnpj)

    End Function
    Private Sub RadGridLinhasValorINicial_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhasValorINicial.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridLinhasValorINicial, 3)


            RadGridLinhasValorINicial.Rebind()
        End If

    End Sub
End Class