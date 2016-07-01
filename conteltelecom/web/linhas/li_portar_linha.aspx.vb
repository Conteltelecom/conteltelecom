Imports Telerik.Web.UI

Public Class li_portar_linha
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub RadAutoCompleteBoxCliente_TextChanged(sender As Object, e As Telerik.Web.UI.AutoCompleteTextEventArgs)

        If RadAutoCompleteBoxCliente IsNot Nothing Then
            For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxCliente.Entries
                If entry.Text = RadAutoCompleteBoxCliente.Text Then
                    TextBoxCodini.Text = Convert.ToInt32(entry.Value)
                    Exit For
                End If
            Next
        End If
    End Sub

    Private Sub RadAutoCompleteBoxCliente_Init(sender As Object, e As EventArgs) Handles RadAutoCompleteBoxCliente.Init

    End Sub
End Class