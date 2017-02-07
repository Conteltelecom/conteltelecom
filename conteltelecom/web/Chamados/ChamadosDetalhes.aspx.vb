Imports Telerik.Web.UI

Public Class ChamadosDetalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridInsert_ItemCreated(sender As Object, e As GridItemEventArgs) Handles RadGridInsert.ItemCreated

    End Sub

    Private Sub RadGridInsert_PreRender(sender As Object, e As EventArgs) Handles RadGridInsert.PreRender
        If Page.IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridInsert, 1)
            RadGridInsert.MasterTableView.CommandItemSettings.AddNewRecordText = "NOVO HISTÓRICO"
            RadGridInsert.ShowGroupPanel = False
            RadGridInsert.ClientSettings.AllowColumnsReorder = False
            RadGridInsert.ClientSettings.AllowDragToGroup = False
            RadGridInsert.Rebind()
        End If


        Dim id_CH_SETORES As Integer
        Dim emAtendimentoPor_id_PS_PESSOA As Integer
        Dim dvSql As DataView = CType(SqlDataSourceNovo.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql IsNot Nothing Then
            If dvSql.Count <> 0 Then
                For Each drvSql As DataRowView In dvSql
                    Dim headerItem As GridHeaderItem = DirectCast(RadGridInsert.MasterTableView.GetItems(GridItemType.Header)(0), GridHeaderItem)
                    Dim LabelNomeEmpresa As Label = DirectCast(headerItem.FindControl("LabelNomeEmpresa"), Label)
                    Dim LabelNumChamado_seq As Label = DirectCast(headerItem.FindControl("LabelNumChamado_seq"), Label)
                    Dim Labelcontato_CH_SUBCHAMADOS As Label = DirectCast(headerItem.FindControl("Labelcontato_CH_SUBCHAMADOS"), Label)
                    Dim email_CH_SUBCHAMADOSLabel As Label = DirectCast(headerItem.FindControl("email_CH_SUBCHAMADOSLabel"), Label)
                    Dim telefone_CH_SUBCHAMADOSLabel As Label = DirectCast(headerItem.FindControl("telefone_CH_SUBCHAMADOSLabel"), Label)
                    Dim dtAbertura_CH_SUBCHAMADOSLabel As Label = DirectCast(headerItem.FindControl("dtAbertura_CH_SUBCHAMADOSLabel"), Label)
                    Dim PrazoLabel As Label = DirectCast(headerItem.FindControl("PrazoLabel"), Label)
                    Dim TempoSolucaoLabel As Label = DirectCast(headerItem.FindControl("TempoSolucaoLabel"), Label)
                    Dim dtFim_CH_SUBCHAMADOSLabel As Label = DirectCast(headerItem.FindControl("dtFim_CH_SUBCHAMADOSLabel"), Label)
                    Dim id_CH_PRIORIDADELabel As Label = DirectCast(headerItem.FindControl("id_CH_PRIORIDADELabel"), Label)
                    Dim id_CH_STATUSLabel As Label = DirectCast(headerItem.FindControl("id_CH_STATUSLabel"), Label)
                    Dim id_CH_SETORESLabel As Label = DirectCast(headerItem.FindControl("id_CH_SETORESLabel"), Label)
                    Dim id_CH_TIPO_TAREFALabel As Label = DirectCast(headerItem.FindControl("id_CH_TIPO_TAREFALabel"), Label)
                    Dim HiddenFieldId_CH_SUBCHAMADOS As HiddenField = DirectCast(headerItem.FindControl("HiddenFieldId_CH_SUBCHAMADOS"), HiddenField)

                    LabelNumChamado_seq.Text = Request.QueryString("id_CH_CHAMADOS") & "\" & Request.QueryString("numSeq_CH_SUBCHAMADOS")
                    Dim assunto_CH_SUBCHAMADOSLabel As Label = DirectCast(headerItem.FindControl("assunto_CH_SUBCHAMADOSLabel"), Label)
                    assunto_CH_SUBCHAMADOSLabel.Text = If(IsDBNull(drvSql("assunto_CH_SUBCHAMADOS")) = True, "", drvSql("assunto_CH_SUBCHAMADOS"))
                    LabelNomeEmpresa.Text = If(IsDBNull(drvSql("NomeEmpresa")) = True, "", drvSql("NomeEmpresa"))
                    Labelcontato_CH_SUBCHAMADOS.Text = If(IsDBNull(drvSql("contato_CH_SUBCHAMADOS")) = True, "", drvSql("contato_CH_SUBCHAMADOS"))
                    email_CH_SUBCHAMADOSLabel.Text = If(IsDBNull(drvSql("email_CH_SUBCHAMADOS")) = True, "", drvSql("email_CH_SUBCHAMADOS"))
                    telefone_CH_SUBCHAMADOSLabel.Text = If(IsDBNull(drvSql("telefone_CH_SUBCHAMADOS")) = True, "", drvSql("telefone_CH_SUBCHAMADOS"))
                    dtAbertura_CH_SUBCHAMADOSLabel.Text = If(IsDBNull(drvSql("dtAbertura_CH_SUBCHAMADOS")) = True, "", drvSql("dtAbertura_CH_SUBCHAMADOS"))
                    PrazoLabel.Text = If(IsDBNull(drvSql("dtPrazoTarefa_CH_SUBCHAMADOS")) = True, "", drvSql("dtPrazoTarefa_CH_SUBCHAMADOS"))
                    TempoSolucaoLabel.Text = If(IsDBNull(drvSql("dtPrazoTarefa_CH_SUBCHAMADOS")) = True, "", drvSql("dtPrazoTarefa_CH_SUBCHAMADOS"))
                    dtFim_CH_SUBCHAMADOSLabel.Text = If(IsDBNull(drvSql("dtFim_CH_SUBCHAMADOS")) = True, "", drvSql("dtFim_CH_SUBCHAMADOS"))
                    id_CH_PRIORIDADELabel.Text = If(IsDBNull(drvSql("desc_CH_PRIORIDADE")) = True, "", drvSql("desc_CH_PRIORIDADE"))
                    id_CH_STATUSLabel.Text = If(IsDBNull(drvSql("desc_CH_STATUS")) = True, "", drvSql("desc_CH_STATUS"))
                    id_CH_SETORESLabel.Text = If(IsDBNull(drvSql("desc_CH_SETORES")) = True, "", drvSql("desc_CH_SETORES"))
                    id_CH_TIPO_TAREFALabel.Text = If(IsDBNull(drvSql("desc_CH_TIPO_TAREFA")) = True, "", drvSql("desc_CH_TIPO_TAREFA"))
                    id_CH_SETORES = If(IsDBNull(drvSql("id_CH_SETORES")) = True, -1, drvSql("id_CH_SETORES"))
                    emAtendimentoPor_id_PS_PESSOA = If(IsDBNull(drvSql("emAtendimentoPor_id_PS_PESSOA")) = True, -1, drvSql("emAtendimentoPor_id_PS_PESSOA"))
                    HiddenFieldId_CH_SUBCHAMADOS.Value = If(IsDBNull(drvSql("id_CH_SUBCHAMADOS")) = True, "", drvSql("id_CH_SUBCHAMADOS"))
                    'STATUS 3 CHAMADO FECHADO NÃO PERMITINDO ALTERAÇÃO.
                    Dim id_CH_STATUS As Integer = drvSql("id_CH_STATUS")
                    If id_CH_STATUS = 3 Then
                        RadGridInsert.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = False
                    Else


                    End If


                Next

            Else
                RadGridInsert.MasterTableView.ShowHeader = False
                RadGridInsert.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                RadGridInsert.Rebind()
            End If
        End If



    End Sub

    Protected Sub RadDropDownListSetor_SelectedIndexChanged(sender As Object, e As DropDownListEventArgs)
        Dim combo As RadDropDownList = DirectCast(sender, RadDropDownList)
        Dim item As GridEditFormItem = DirectCast(combo.NamingContainer, GridEditFormItem)
        Dim RadDropDownListAtendentes As RadDropDownList = DirectCast(item.FindControl("RadDropDownListAtendentes"), RadDropDownList)

        SqlDataSourceListaAtendentesSetor.SelectParameters("id_CH_SETORES").DefaultValue = e.Value

    End Sub

    Private Sub RadGridInsert_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridInsert.ItemCommand
        Try


            If e.CommandName = RadGrid.PerformInsertCommandName Then

                Dim headerItem As GridHeaderItem = DirectCast(RadGridInsert.MasterTableView.GetItems(GridItemType.Header)(0), GridHeaderItem)
                Dim HiddenFieldId_CH_SUBCHAMADOS As HiddenField = DirectCast(headerItem.FindControl("HiddenFieldId_CH_SUBCHAMADOS"), HiddenField)
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim RadEditorHistorico As RadEditor = DirectCast(eitem.FindControl("RadEditorHistorico"), RadEditor)
                Dim RadDropDownListSetor As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListSetor"), RadDropDownList)
                Dim RadDropDownListAtendentes As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListAtendentes"), RadDropDownList)
                Dim RadDropDownListStatus As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListStatus"), RadDropDownList)
                Dim PrazoLabel As Label = DirectCast(headerItem.FindControl("PrazoLabel"), Label)
                Dim RadDatePickerDataAgendamento As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerDataAgendamento"), RadDatePicker)
                SqlDataSourceNovo.UpdateParameters("id_CH_STATUS").DefaultValue = If(RadDropDownListStatus.SelectedValue = "", "", RadDropDownListStatus.SelectedValue)
                SqlDataSourceNovo.UpdateParameters("id_CH_STATUS").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.UpdateParameters("emAtendimentoPor_id_PS_PESSOA").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.UpdateParameters("emAtendimentoPor_id_PS_PESSOA").DefaultValue = If(RadDropDownListAtendentes.SelectedValue = "", "", RadDropDownListAtendentes.SelectedValue)
                SqlDataSourceNovo.UpdateParameters("dtFim_CH_SUBCHAMADOS").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.UpdateParameters("dtFim_CH_SUBCHAMADOS").DefaultValue = If(RadDropDownListStatus.SelectedValue = "", "", Date.Now)

                SqlDataSourceNovo.UpdateParameters("id_CH_SUBCHAMADOS").DefaultValue = HiddenFieldId_CH_SUBCHAMADOS.Value
                If RadDatePickerDataAgendamento.DateInput.Text = "" Then
                    SqlDataSourceNovo.UpdateParameters("dtPrazoTarefa_CH_SUBCHAMADOS").DefaultValue = PrazoLabel.Text
                Else
                    Dim str As String = RadDatePickerDataAgendamento.DateInput.DisplayText & " " & DateTime.Now.ToShortTimeString
                    SqlDataSourceNovo.UpdateParameters("dtPrazoTarefa_CH_SUBCHAMADOS").DefaultValue = RadDatePickerDataAgendamento.DateInput.DisplayText & " " & DateTime.Now.ToShortTimeString

                End If
                SqlDataSourceNovo.Update()
                SqlDataSourceNovo.InsertParameters("dtPrazoTarefa_CH_HISTORICO").DefaultValue = SqlDataSourceNovo.UpdateParameters("dtPrazoTarefa_CH_SUBCHAMADOS").DefaultValue.ToString
                SqlDataSourceNovo.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceNovo.InsertParameters("texto_CH_HISTORICO").DefaultValue = RadEditorHistorico.Text
                SqlDataSourceNovo.InsertParameters("id_CH_SUBCHAMADOS").DefaultValue = HiddenFieldId_CH_SUBCHAMADOS.Value
                SqlDataSourceNovo.InsertParameters("id_CH_STATUS").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.InsertParameters("id_CH_SETORES").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.InsertParameters("emAtendimentoPor_id_PS_PESSOA").ConvertEmptyStringToNull = True
                SqlDataSourceNovo.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceNovo.InsertParameters("id_CH_STATUS").DefaultValue = If(RadDropDownListStatus.SelectedValue = "", "", RadDropDownListStatus.SelectedValue)
                SqlDataSourceNovo.InsertParameters("id_CH_SETORES").DefaultValue = If(RadDropDownListSetor.SelectedValue = "", "", RadDropDownListSetor.SelectedValue)
                SqlDataSourceNovo.InsertParameters("emAtendimentoPor_id_PS_PESSOA").DefaultValue = If(RadDropDownListAtendentes.SelectedValue = "", "", RadDropDownListAtendentes.SelectedValue)
                SqlDataSourceNovo.Insert()
            End If


        Catch ex As Exception

        End Try
    End Sub

    Private Sub RadGridInsert_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridInsert.ItemDataBound

        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then


            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                Dim eitem As GridEditFormInsertItem = DirectCast(e.Item, GridEditFormInsertItem)
                Dim NoVoSql As New SqlDataSource
                NoVoSql = SqlDataSourceNovo
                Dim RadDropDownListSetor As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListSetor"), RadDropDownList)
                Dim RadDropDownListAtendentes As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListAtendentes"), RadDropDownList)
                Dim RadDropDownListStatus As RadDropDownList = DirectCast(eitem.FindControl("RadDropDownListStatus"), RadDropDownList)

                Dim dvSql As DataView = CType(NoVoSql.Select(DataSourceSelectArguments.Empty), DataView)
                If dvSql IsNot Nothing Then
                    If dvSql.Count <> 0 Then
                        For Each drvSql As DataRowView In dvSql
                            RadDropDownListSetor.SelectedValue = If(IsDBNull(drvSql("id_CH_SETORES")) = True, "-1", drvSql("id_CH_SETORES"))
                            SqlDataSourceListaAtendentesSetor.SelectParameters("id_CH_SETORES").DefaultValue = If(IsDBNull(drvSql("id_CH_SETORES")) = True, -1, drvSql("id_CH_SETORES"))
                            RadDropDownListAtendentes.DataBind()
                            RadDropDownListAtendentes.SelectedValue = If(IsDBNull(drvSql("emAtendimentoPor_id_PS_PESSOA")) = True, "-1", drvSql("emAtendimentoPor_id_PS_PESSOA"))
                            RadDropDownListStatus.SelectedValue = If(IsDBNull(drvSql("id_CH_STATUS")) = True, "-1", drvSql("id_CH_STATUS"))
                        Next

                    End If
                End If





            Else

                    End If
        End If




    End Sub
End Class