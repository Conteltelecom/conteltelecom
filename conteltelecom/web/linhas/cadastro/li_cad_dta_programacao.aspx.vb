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
                Dim RadDatePickerMovel As RadDatePicker = DirectCast(dataItem.FindControl("RadDatePickerMovel"), RadDatePicker)
                Dim RadDatePickerLdn As RadDatePicker = DirectCast(dataItem.FindControl("RadDatePickerLdn"), RadDatePicker)
                Dim observacoesTextBox As RadTextBox = DirectCast(dataItem.FindControl("observacoesTextBox"), RadTextBox)
                SqlDataSourceBuscaUsoPeriodo.SelectParameters("codMatriz_PS_CLIENTES").DefaultValue = Request.QueryString("codMatriz_PS_CLIENTES")
                SqlDataSourceBuscaUsoPeriodo.SelectParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHASLabelEdit.Text
                Dim dvSqlContratos As DataView = CType(SqlDataSourceBuscaUsoPeriodo.Select(DataSourceSelectArguments.Empty), DataView)
                If (dvSqlContratos IsNot Nothing Or dvSqlContratos.Count < 0) And dvSqlContratos.Count > 0 Then
                    For Each drvSql As DataRowView In dvSqlContratos


                        If drvSql("id_SF_TIPO_USO_CATEGORIAS") = 1 Then
                            If IsNothing(drvSql("vlUso_SF_VL_USO")) = False Then
                                SqlDataSourceCadDtaProg.InsertParameters("vlUso_LI_CAD_PROGRAMACAO").DbType = DbType.Decimal
                                SqlDataSourceCadDtaProg.InsertParameters("vlUso_LI_CAD_PROGRAMACAO").DefaultValue = drvSql("vlUso_SF_VL_USO")

                            End If
                        Else
                            If IsNothing(drvSql("vlUso_SF_VL_USO")) = False Then

                                SqlDataSourceCadDtaProg.InsertParameters("vlUsomoVEL_LI_CAD_PROGRAMACAO").DbType = DbType.Decimal
                                SqlDataSourceCadDtaProg.InsertParameters("vlUsomoVEL_LI_CAD_PROGRAMACAO").DefaultValue = drvSql("vlUso_SF_VL_USO")

                            End If

                        End If

                            If IsNothing(drvSql("dtaPerIni_SF_SERVICOS_FATURA")) = False Then
                            'SqlDataSourceCadDtaProg.InsertParameters("dtTarifIni_LI_CAD_PROGRAMACAO").DbType = DbType.Date
                            SqlDataSourceCadDtaProg.InsertParameters("dtTarifIni_LI_CAD_PROGRAMACAO").DefaultValue = drvSql("dtaPerIni_SF_SERVICOS_FATURA")
                        End If
                        If IsNothing(drvSql("dtaPerFim_SF_SERVICOS_FATURA")) = False Then
                            'SqlDataSourceCadDtaProg.InsertParameters("dtTarifFim_LI_CAD_PROGRAMACAO").DbType = DbType.Date
                            SqlDataSourceCadDtaProg.InsertParameters("dtTarifFim_LI_CAD_PROGRAMACAO").DefaultValue = drvSql("dtaPerFim_SF_SERVICOS_FATURA")
                        End If
                        SqlDataSourceCadDtaProg.InsertParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHASLabelEdit.Text
                        SqlDataSourceCadDtaProg.InsertParameters("dtMovel_LI_CAD_PROGRAMACAO").DefaultValue = If(RadDatePickerMovel.DateInput.DisplayText <> "", RadDatePickerMovel.DateInput.DisplayText, String.Empty)
                        SqlDataSourceCadDtaProg.InsertParameters("dtLdn_LI_CAD_PROGRAMACAO").DefaultValue = If(RadDatePickerLdn.DateInput.DisplayText <> "", RadDatePickerLdn.DateInput.DisplayText, String.Empty)
                        SqlDataSourceCadDtaProg.InsertParameters("obs_LI_CAD_PROGRAMACAO").DefaultValue = observacoesTextBox.Text
                        SqlDataSourceCadDtaProg.InsertParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = drvSql("mesAnoRefereincia_SF_SERVICOS_FATURA")


                    Next

                    SqlDataSourceCadDtaProg.Insert()

                    RadGridCadDtaProg.MasterTableView.ClearEditItems()
                    RadGridCadDtaProg.DataBind()
                    Exit Select
                Else
                    RadWindowManagerMsg.RadAlert("ATENÇÃO NÃO É PERMITIDO REALIZAR PROGRAMAÇÃO PARA LINHAS SEM USO", 400, Nothing, "MESNAGEM", Nothing)
                    Exit Select
                End If


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