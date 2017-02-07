Imports Telerik.Web.UI

Public Class cli_contatos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Function TelefoneFormat(fone As Object) As String


        Return TelefoneFormat(fone)

    End Function
    Public Function CpfFormat(cpf As Object) As String


        Return Validacoes.CNPJFormat(cpf)

    End Function

    Private Sub RadDataFormContatos_ItemCommand(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormContatos.ItemCommand

    End Sub

    Private Sub RadGridContatos_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridContatos.ItemCommand
        If e.CommandName = "PerformInsert" Then
            Dim idCompany As Integer = 0
            Dim autoCompleteBox As New RadAutoCompleteBox
            Dim RadComboBoxTiposIns As New RadDropDownList

            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            RadComboBoxTiposIns = DirectCast(eitem.FindControl("RadComboBoxTiposIns"), RadDropDownList)
            autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxDesc_ps_pesssoa"), RadAutoCompleteBox)
            If autoCompleteBox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                    End If
                Next
            End If
            SqlDataSourceRadgridContatos.InsertParameters("idContato_id_PS_PESSOA").DefaultValue = idCompany
            SqlDataSourceRadgridContatos.InsertParameters("id_PS_TP_CONTATOS").DefaultValue = RadComboBoxTiposIns.SelectedValue

        End If
    End Sub
End Class