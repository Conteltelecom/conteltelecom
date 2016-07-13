Imports Telerik.Web.UI

Public Class cad_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadUseuarios_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadUseuarios.ItemCommand
        If e.CommandName = RadGrid.DeleteCommandName Then

        End If
    End Sub
End Class