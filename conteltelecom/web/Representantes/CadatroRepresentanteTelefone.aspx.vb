Imports conteltelecom.Validacoes

Public Class CadatroRepresentanteTelefone

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Function MacaraTelefone(Telefone As Object) As String
        Return TelefoneFormat(Telefone)

    End Function




    Private Sub RadGridTelefone_PreRender(sender As Object, e As EventArgs) Handles RadGridTelefone.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridTelefone, 0)

            RadGridTelefone.Rebind()

        End If
    End Sub

    Private Sub SqlDataSourceTelefone_PreRender(sender As Object, e As EventArgs) Handles SqlDataSourceTelefone.PreRender

    End Sub
End Class