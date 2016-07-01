Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class ps_cliente
    Inherits System.Web.UI.Page




    Public Function FCnpjFormat(Cnpj As Object) As String

        Return CNPJFormat(Cnpj)

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub rcbContinents_SelectedIndexChanged(o As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs)
        Dim editedItem As GridEditableItem = TryCast(TryCast(o, RadComboBox).NamingContainer, GridEditableItem)
        Dim continentsCombo As RadComboBox = TryCast(o, RadComboBox)
        Dim cod_PS_UF As RadComboBox = TryCast(editedItem("id_PS_CIDADES").FindControl("RadComboBoxInsertUF"), RadComboBox)
        Dim RadComboBoxInsertCidades As RadComboBox = TryCast(editedItem("id_PS_CIDADES").FindControl("RadComboBoxInsertCidades"), RadComboBox)
        SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = cod_PS_UF.SelectedValue.ToString
        RadComboBoxInsertCidades.DataBind()
    End Sub

    Protected Sub RadDropDownListFiltroUF_ItemSelected(sender As Object, e As DropDownListEventArgs) Handles RadDropDownListuF.ItemSelected
        SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue.ToString

    End Sub







    Private Sub RadGridPessoas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridPessoas.ItemCommand
        'If e.CommandName = "PerformInsert" Then
        'If e.Item.IsInEditMode AndAlso TypeOf e.Item Is GridEditFormItem Then
        'Dim editForm As GridEditFormItem = DirectCast(e.Item, GridEditFormItem)
        'Dim grid As TextBox = DirectCast(editForm.FindControl("desc_PS_PESSOA"), TextBox)
        'End If
        '  SqlDataSourcePesoas.Insert()
        '  End If

        If e.CommandName = "InitInsert" Then
            Session("id_pessoaNav") = "0"
            HttpContext.Current.Response.Redirect("~/Account/login.aspx")

        End If
        If e.CommandName = "Pesquisar" Or e.CommandName = "DetalhesFilho" Then
            Dim id_PS_PESSOALabel As New Label
              Dim Labelid_PS_CLIENTES As New  Label
            Dim razaosocial_PS_JURIDICALabel As New Label
            Dim consultaMatriz As Int16 = 0
            Select Case e.CommandName
                Case "Pesquisar"
                    id_PS_PESSOALabel = TryCast(e.Item.FindControl("id_PS_PESSOALabel"), Label)
                    Labelid_PS_CLIENTES = TryCast(e.Item.FindControl("Labelid_PS_CLIENTES"), Label)
                    razaosocial_PS_JURIDICALabel = TryCast(e.Item.FindControl("razaosocial_PS_JURIDICALabel"), Label)
                    consultaMatriz = 1
                Case "DetalhesFilho"
                    consultaMatriz = 0
                    Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
                    If item.OwnerTableView.Name = "filiais" Then

                        id_PS_PESSOALabel = TryCast(e.Item.FindControl("id_PS_PESSOAFilhoLabel"), Label)
                        Labelid_PS_CLIENTES = TryCast(e.Item.FindControl("Labelid_PS_CLIENTES"), Label)
                        razaosocial_PS_JURIDICALabel = TryCast(e.Item.FindControl("razaosocial_PS_JURIDICALabel"), Label)
                    End If

            End Select
            Session("id_PS_CLIENTES") = Labelid_PS_CLIENTES.Text
            Session("id_pessoaNav") = Labelid_PS_CLIENTES.Text
            Session("id_PS_PESSOA") = id_PS_PESSOALabel.Text
            Session("dadosCliente") = id_PS_PESSOALabel.Text & "/" & razaosocial_PS_JURIDICALabel.Text
            If consultaMatriz = 0 Then
                HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente_detalhes.aspx?id_cliente=" & id_PS_PESSOALabel.Text & "&consultaMatriz=" & consultaMatriz)
            Else
                HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente_detalhes.aspx?id_cliente=" & id_PS_PESSOALabel.Text & "&consultaMatriz=" & consultaMatriz & "&codMatriz_PS_CLIENTES=" & id_PS_PESSOALabel.Text)

            End If

        End If
        If e.CommandName = "PerformInsert" Then
            Dim eitem As GridEditableItem = TryCast(e.Item, GridEditableItem)
            Dim txtEditIP As TextBox = TryCast(eitem.FindControl("desc_PS_PESSOA"), TextBox)

        End If

    End Sub

    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click
        SqlDataSourcePesoas.SelectParameters("CNPJ_PS_JURIDICA").DefaultValue = RadMaskedTextBoxCnpjI.Text
    End Sub

    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Dim CLScontroles As New conteltelecom.Controles
        CLScontroles.Limpar(Me)
        CLScontroles = Nothing
        RadDropDownListFiltroCidade.SelectedIndex = -1
        RadDropDownListuF.SelectedIndex = -1
    End Sub

    Private Sub RadGridPessoas_ItemUpdated(sender As Object, e As GridUpdatedEventArgs) Handles RadGridPessoas.ItemUpdated

    End Sub


    Private Sub RadGridPessoas_PreRender(sender As Object, e As EventArgs) Handles RadGridPessoas.PreRender




    End Sub

    Private Sub RadGridPessoas_ItemCreated(sender As Object, e As GridItemEventArgs) Handles RadGridPessoas.ItemCreated

        '  Dim txt As RadTextBox = DirectCast(e.Item.FindControl("TextBox1"), RadTextBox)
        'If IsNothing(txt) Then
        'txt.Text = "CONTATOS"
        'End If


    End Sub
End Class