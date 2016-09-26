Imports conteltelecom.PersonalizarControles
Imports Telerik.Web.UI

Public Class li_cad_linhas_chave
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadLinhaChave_PreRender(sender As Object, e As EventArgs) Handles RadGridCadLinhaChave.PreRender

        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadLinhaChave, 1)
            RadGridCadLinhaChave.Rebind()
        End If

        If RadGridCadLinhaChave.MasterTableView.IsItemInserted = True Then
            Dim i As GridEditableItem = DirectCast(RadGridCadLinhaChave.MasterTableView.GetInsertItem(), GridEditableItem)
            ' Access textbox of boundcolumn
            ' Get this textbox text value  and perform your futhur operation
            ' Dim r As TextBox = DirectCast(i("ID").Controls(0), TextBox)
            Dim LabelCodLInhas As Label = TryCast(i.FindControl("LabelCodLInhas"), Label)
            Dim RadAutoCompleteBoxCodLInhas As RadAutoCompleteBox = TryCast(i.FindControl("RadAutoCompleteBoxCodLInhas"), RadAutoCompleteBox)


            If IsNothing(RadAutoCompleteBoxCodLInhas) = False Then

                RadAutoCompleteBoxCodLInhas.Visible = True
                LabelCodLInhas.Visible = False

            End If


        End If


    End Sub

    Protected Sub RadDropDownListUF_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.DropDownListEventArgs)

        HiddenFieldUf.Value = e.Value
        'ObjectDataSourceUF.SelectParameters("cod_PS_UF").DefaultValue = e.Value
        Dim combo As RadDropDownList = DirectCast(sender, RadDropDownList)
        Dim item As GridEditableItem = DirectCast(combo.NamingContainer, GridEditableItem)
        Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(item.FindControl("RadDropDownListCidade"), RadDropDownList)

        RadDropDownListid_PS_CIDADES.Items.Clear()

        RadDropDownListid_PS_CIDADES.DataBind()


    End Sub

    Protected Sub RadAutoCompleteBoxCodLInhas_TextChanged(sender As Object, e As Telerik.Web.UI.AutoCompleteTextEventArgs)

    End Sub

    Private Sub RadGridCadLinhaChave_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadLinhaChave.ItemCommand

        If e.CommandName = "NovaPagina" Then

            Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim id_LI_CAD_LINHA_CHAVE As String = item("id_LI_CAD_LINHA_CHAVE").Text
            Dim codLinha_LI_LINHASLabel As Label = DirectCast(item.FindControl("codLinha_LI_LINHASLabel"), Label)

            HttpContext.Current.Response.Redirect("~/web/linhas/cadastro/li_cad_filhas.aspx?codLinha_LI_LINHAS=" & codLinha_LI_LINHASLabel.Text & "&id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_CAD_LINHA_CHAVE=" & id_LI_CAD_LINHA_CHAVE & "&modo=" & e.CommandName & "&consultaMatriz=2&codMatriz_PS_CLIENTES=" & Request.QueryString("codMatriz_PS_CLIENTES"))
        End If




        If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Or e.CommandName = RadGrid.UpdateCommandName Then

            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim RadTextBoxcomplemeto_PS_ENDERECO As New RadTextBox
            Dim RadNumericTextBoxNumericNum As New RadNumericTextBox
            Dim RadTextBoxLogradouro As New RadTextBox
            Dim RadTextBoxBairro As New RadTextBox
            Dim RadDropDownListCidade As New RadDropDownList
            Dim RadMaskedTextBoxCep As New RadMaskedTextBox
            Dim autoCompleteBox As New RadAutoCompleteBox
            Dim idCompany As Integer = 0
            Dim Labelid_PS_ENDERECO As New Label
            RadTextBoxcomplemeto_PS_ENDERECO = DirectCast(eitem.FindControl("RadTextBoxcomplemeto_PS_ENDERECO"), RadTextBox)
            RadNumericTextBoxNumericNum = DirectCast(eitem.FindControl("RadNumericTextBoxNumericNum"), RadNumericTextBox)
            RadTextBoxLogradouro = DirectCast(eitem.FindControl("RadTextBoxLogradouro"), RadTextBox)
            RadTextBoxBairro = DirectCast(eitem.FindControl("RadTextBoxBairro"), RadTextBox)
            RadMaskedTextBoxCep = DirectCast(eitem.FindControl("RadMaskedTextBoxCep"), RadMaskedTextBox)
            RadDropDownListCidade = DirectCast(eitem.FindControl("RadDropDownListCidade"), RadDropDownList)
            autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxCodLInhas"), RadAutoCompleteBox)
            Labelid_PS_ENDERECO = DirectCast(eitem.FindControl("Labelid_PS_ENDERECO"), Label)

            Select Case e.CommandName
                Case RadGrid.PerformInsertCommandName

                    autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxCodLInhas"), RadAutoCompleteBox)
                    For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                        If entry.Text = autoCompleteBox.Text Then
                            idCompany = Convert.ToInt32(entry.Value)

                        End If
                    Next
                    SqlDataSourceCadLinhaChave.InsertParameters("complemeto_PS_ENDERECO").DefaultValue = RadTextBoxcomplemeto_PS_ENDERECO.Text
                    SqlDataSourceCadLinhaChave.InsertParameters("num_PS_ENDERECO").DefaultValue = RadNumericTextBoxNumericNum.Text
                    SqlDataSourceCadLinhaChave.InsertParameters("rua_PS_ENDERECO").DefaultValue = RadTextBoxLogradouro.Text
                    SqlDataSourceCadLinhaChave.InsertParameters("bairro_PS_ENDERECO").DefaultValue = RadTextBoxBairro.Text
                    SqlDataSourceCadLinhaChave.InsertParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade.SelectedValue
                    SqlDataSourceCadLinhaChave.InsertParameters("cep_PS_ENDERECO").DefaultValue = RadMaskedTextBoxCep.Text
                    SqlDataSourceCadLinhaChave.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceCadLinhaChave.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceCadLinhaChave.InsertParameters("id_PS_TP_ENDERECO").DefaultValue = 1    'ENDEREÇO COBRAÇA   
                    SqlDataSourceCadLinhaChave.InsertParameters("id_LI_LINHAS").DefaultValue = idCompany
                    SqlDataSourceCadLinhaChave.Insert()
                    'RadGridCadLinhaChave.DataBind()
                    ' e.Canceled = True
                    ' RadGridCadLinhaChave.Rebind()
                    Exit Select

                Case RadGrid.UpdateCommandName

                    SqlDataSourceCadLinhaChave.UpdateParameters("complemeto_PS_ENDERECO").DefaultValue = RadTextBoxcomplemeto_PS_ENDERECO.Text
                    SqlDataSourceCadLinhaChave.UpdateParameters("num_PS_ENDERECO").DefaultValue = RadNumericTextBoxNumericNum.Text
                    SqlDataSourceCadLinhaChave.UpdateParameters("rua_PS_ENDERECO").DefaultValue = RadTextBoxLogradouro.Text
                    SqlDataSourceCadLinhaChave.UpdateParameters("bairro_PS_ENDERECO").DefaultValue = RadTextBoxBairro.Text
                    SqlDataSourceCadLinhaChave.UpdateParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade.SelectedValue
                    SqlDataSourceCadLinhaChave.UpdateParameters("cep_PS_ENDERECO").DefaultValue = RadMaskedTextBoxCep.Text
                    SqlDataSourceCadLinhaChave.UpdateParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceCadLinhaChave.UpdateParameters("dtAlt_PS_ENDERECO").DefaultValue = Date.Now
                    SqlDataSourceCadLinhaChave.UpdateParameters("id_PS_ENDERECO").DefaultValue = Labelid_PS_ENDERECO.Text
                    SqlDataSourceCadLinhaChave.Update()
                    'RadGridCadLinhaChave.DataBind()
                    ' RadGridCadLinhaChave.EditIndexes.Clear()
                    ' RadGridCadLinhaChave.Rebind()
                    Exit Select



            End Select





            eitem = Nothing

        End If
        If e.CommandName = RadGrid.DeleteCommandName Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim id_LI_CAD_LINHA_CHAVE As Integer = dataItem("id_LI_CAD_LINHA_CHAVE").Text

            SqlDataSourceCadLinhaChave.DeleteParameters("id_LI_CAD_LINHA_CHAVE").DefaultValue = id_LI_CAD_LINHA_CHAVE
            SqlDataSourceCadLinhaChave.Delete()
            RadGridCadLinhaChave.DataBind()

        End If
    End Sub

    Private Sub RadGridCadLinhaChave_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCadLinhaChave.ItemDataBound
        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then
            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                ' insert item
            Else
                Dim ditem As GridEditableItem = DirectCast(e.Item, GridEditableItem)

                Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListCidade"), RadDropDownList)
                Dim RadDropDownListUf As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListUf"), RadDropDownList)
                HiddenFieldUf.Value = RadDropDownListUf.SelectedValue
                Dim HiddenFieldIdCidade As HiddenField = DirectCast(ditem.FindControl("HiddenFieldIdCidade"), HiddenField)

                RadDropDownListid_PS_CIDADES.SelectedValue = HiddenFieldIdCidade.Value

            End If
        End If





    End Sub

    Private Sub RadGridCadLinhaChave_UpdateCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadLinhaChave.UpdateCommand

    End Sub

    Private Sub RadGridCadLinhaChave_InsertCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadLinhaChave.InsertCommand

    End Sub
End Class