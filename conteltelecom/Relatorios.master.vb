Public Class Relatorios
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub LabelCliente_PreRender(sender As Object, e As EventArgs) Handles LabelCliente.PreRender
        If IsPostBack = False Then
            If (IsNothing(Request.QueryString("id_cliente")) = False And Request.QueryString("id_cliente") <> "0") Then
                LabelCliente.Text = "CLIENTE: " & UCase(Session("dadosCliente").ToString)


            End If
        End If
    End Sub
End Class