Imports Telerik.Web.UI
Imports conteltelecom.Validacoes
Public Class li_cad_dta_programacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Function FTelefoneFormat(fone As Object) As String
        Return TelefoneFormat(fone)

    End Function

    Private Sub RadGridCadDtaProg_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadDtaProg.ItemCommand



        Select Case e.CommandName


            Case "Salvar"
                Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim id_LI_LINHASLabelEdit As Label = DirectCast(dataItem.FindControl("id_LI_LINHASLabelEdit"), Label)

                SqlDataSourceCadDtaProg.InsertParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHASLabelEdit.Text
                Dim RadDatePickerMovel As RadDatePicker = DirectCast(dataItem.FindControl("RadDatePickerMovel"), RadDatePicker)
                Dim RadDatePickerLdn As RadDatePicker = DirectCast(dataItem.FindControl("RadDatePickerLdn"), RadDatePicker)
                Dim observacoesTextBox As RadTextBox = DirectCast(dataItem.FindControl("observacoesTextBox"), RadTextBox)

                SqlDataSourceCadDtaProg.InsertParameters("dtMovel_LI_CAD_PROGRAMACAO").DefaultValue = RadDatePickerMovel.DateInput.SelectedDate
                SqlDataSourceCadDtaProg.InsertParameters("dtLdn_LI_CAD_PROGRAMACAO").DefaultValue = RadDatePickerLdn.DateInput.SelectedDate
                SqlDataSourceCadDtaProg.InsertParameters("obs_LI_CAD_PROGRAMACAO").DefaultValue = observacoesTextBox.Text
                SqlDataSourceCadDtaProg.Insert()
                RadGridCadDtaProg.MasterTableView.ClearEditItems()
                RadGridCadDtaProg.DataBind()
                Exit Select

            Case "Delete"
                Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim Labelid_LI_CAD_TIPO_PROGRAMACAO As Label = DirectCast(dataItem.FindControl("Labelid_LI_CAD_TIPO_PROGRAMACAO"), Label)


                Session("DeleteValor") = Labelid_LI_CAD_TIPO_PROGRAMACAO.Text

                RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
                    e.Canceled = True

                Exit Select

            Case "historico"
                Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim id_LI_LINHASLabel As Label = DirectCast(dataItem.FindControl("id_LI_LINHASLabel"), Label)


                HttpContext.Current.Response.Redirect("~/web/linhas/cadastro/li_dta_programacao_historico.aspx?id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_LINHAS=" & id_LI_LINHASLabel.Text & "&consultaMatriz=1&codMatriz_PS_CLIENTES=" & Request.QueryString("codMatriz_PS_CLIENTES"))

                Exit Select

            Case "DeleteChecked"

                DeleteChecked()
                Exit Sub
        End Select



    End Sub
    Protected Sub DeleteChecked()

        SqlDataSourceCadDtaProg.DeleteParameters("id_LI_CAD_TIPO_PROGRAMACAO").DefaultValue = Session("DeleteValor")
        SqlDataSourceCadDtaProg.Delete()

        Session.Remove("DeleteValor")

    End Sub

    Private Sub RadGridCadDtaProg_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCadDtaProg.ItemDataBound

        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                '  Dim RadDatePickerDtaProg As RadDatePicker = TryCast(e.Item.FindControl("RadDatePickerDtaProg"), RadDatePicker)
                '  RadDatePickerDtaProg.SelectedDate = Now.Date
                '
                '   Dim RadDatePickerDtaIni As RadDatePicker = TryCast(e.Item.FindControl("RadDatePickerDtaIni"), RadDatePicker)
                '    RadDatePickerDtaProg.SelectedDate = Now.Date
                '    Dim RadDatePickerDtaFim As RadDatePicker = TryCast(e.Item.FindControl("RadDatePickerDtaFim"), RadDatePicker)
                '    RadDatePickerDtaProg.SelectedDate = Now.Date
                ' insert item
            Else
                ' If TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.Name = "DetailTableUFcidade" Then
                'Dim ditem As GridDataItem = DirectCast(e.Item, GridDataItem)
                'Dim RadDropDownListUf As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListUf"), RadDropDownList)
                'SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListUf.SelectedValue
                'Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListCidades"), RadDropDownList)
                'RadDropDownListid_PS_CIDADES.DataBind()
                'Dim LabelDropCidades As Label = DirectCast(ditem.FindControl("LabelDropCidades"), Label)
                ''   Dim LabelDropCidadesNomes As Label = DirectCast(ditem.FindControl("LabelDropCidadesNomes"), Label)
                '
                'If Not [String].IsNullOrEmpty(LabelDropCidades.Text) Then
                ' RadDropDownListid_PS_CIDADES.SelectedValue = LabelDropCidades.Text

                ' Dim RadDatePickerDtaProg As RadDatePicker = TryCast(e.Item.FindControl("RadDatePickerDtaProg"), RadDatePicker)
            End If
        End If




    End Sub


End Class