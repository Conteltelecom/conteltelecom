Imports conteltelecom.Validacoes
Public Class cnpj_cidades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCnpjCidades_PreRender(sender As Object, e As EventArgs) Handles RadGridCnpjCidades.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridCnpjCidades, 3)
            RadGridCnpjCidades.Rebind()
        End If
    End Sub

    Public Function FcnpjFormat(cnpj As Object) As String

        Return CNPJFormat(cnpj)

    End Function

End Class