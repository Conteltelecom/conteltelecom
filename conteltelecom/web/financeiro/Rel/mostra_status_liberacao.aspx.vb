Public Class mostra_status_liberacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridMostrastatusLiberacao_PreRender(sender As Object, e As EventArgs) Handles RadGridMostrastatusLiberacao.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridMostrastatusLiberacao, 1)
            RadGridMostrastatusLiberacao.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.Top
            RadGridMostrastatusLiberacao.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = False
            RadGridMostrastatusLiberacao.Rebind()

        End If
    End Sub
End Class