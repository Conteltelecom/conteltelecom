Imports conteltelecom.Validacoes
Public Class razaoSocial_Cnpj
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Function FcnpjFormat(cnpj As Object) As String

        Return CNPJFormat(cnpj)

    End Function

End Class