Imports System.Web.Services
Imports Telerik.Web.UI

Public Class if_input_fatura_manual
    Inherits System.Web.UI.Page
    Dim id_SF_SERVICOS_FATURA_Atual As Integer
    Dim strMesagembox As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If IsPostBack = False Then
            Dim ClsBuscaMesAnoAtual As New conteltelecom.Validacoes
            RadMaskedTextBoxMesAno_ins.Text = ClsBuscaMesAnoAtual.BuscaMesAnoAtual
            SqlDataSourceLinhas.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = RadMaskedTextBoxMesAno_ins.TextWithLiterals

        End If

    End Sub

    Private Sub RadGridFaturas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridFaturas.ItemCommand



        Dim CslValidacoes As New conteltelecom.Validacoes
        Dim autoCompleteBox As New RadAutoCompleteBox
        Dim RadMaskedTextBoxmesAno As New RadMaskedTextBox
        Dim vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox As New RadNumericTextBox
        Dim idCompany As Integer = 0
        Dim idAnterior As Integer
        Dim mesAteriorUso As Integer = 0



        If e.CommandName = "PerformInsert" Then

            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxCodLInhas"), RadAutoCompleteBox)
            RadMaskedTextBoxmesAno = DirectCast(eitem.FindControl("RadMaskedTextBoxmesAno"), RadMaskedTextBox)
            Dim dtaPerIni_SF_SERVICOS_FATURA As New RadDatePicker
            Dim dtaPerFim_SF_SERVICOS_FATURA As New RadDatePicker
            Dim dtVencimento_SF_SERVICOS_FATURA As New RadDatePicker
            vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox = DirectCast(eitem.FindControl("vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox"), RadNumericTextBox)

            dtaPerIni_SF_SERVICOS_FATURA = DirectCast(eitem.FindControl("RadDatePickerDataInicial"), RadDatePicker)
            dtaPerFim_SF_SERVICOS_FATURA = DirectCast(eitem.FindControl("RadDatePickerDataIniFinal"), RadDatePicker)

            dtVencimento_SF_SERVICOS_FATURA = DirectCast(eitem.FindControl("RadDatePickerdtVencimento_SF_SERVICOS_FATURA"), RadDatePicker)
            Try




                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)

                    End If
                Next

            Catch ex As Exception

            End Try
            Dim id_PS_PESSOA As Integer
            Dim id_PS_CIDADES As Integer
            Dim id_LI_TIPOS As Integer
            Dim id_OP_OPERADORAS As Integer
            Dim codMatriz_PS_CLIENTES As Integer
            Dim vlInicial_id_LI_TIPOS As Decimal
            Dim perIncial_LI_LINHAS As String = "" '
            Dim foraAnalise_LI_LINHAS As Int16
            Dim label01null As New Label
            Dim label02null As New Label
            Dim vl_contrato As Decimal
            Dim nomeUnidade_LI_LINHAS As String = ""
            Dim id_CL_TIPOS_CONTRATOS As Integer
            Dim codLinha_LI_LINHAS As String = ""

            SqlDataSourceLinhas.InsertParameters("id_LI_LINHAS").DefaultValue = idCompany

            SqlDataSourceLinhas.InsertParameters("dtaPerIni_SF_SERVICOS_FATURA").DefaultValue = dtaPerIni_SF_SERVICOS_FATURA.DateInput.SelectedDate
            SqlDataSourceLinhas.InsertParameters("dtaPerFim_SF_SERVICOS_FATURA").DefaultValue = dtaPerFim_SF_SERVICOS_FATURA.DateInput.SelectedDate
            SqlDataSourceLinhas.InsertParameters("dtVencimento_SF_SERVICOS_FATURA").DefaultValue = dtVencimento_SF_SERVICOS_FATURA.DateInput.SelectedDate
            SqlDataSourceLinhas.InsertParameters("id_PS_PESSOA_USUARIO").DefaultValue = Session("id_PS_PESSOA_USUARIO")

            CslValidacoes.BuscaRazaoSocial_Operadora(label01null, label02null, idCompany, id_OP_OPERADORAS,
             id_LI_TIPOS, id_PS_CIDADES, codMatriz_PS_CLIENTES, id_PS_PESSOA, vlInicial_id_LI_TIPOS, perIncial_LI_LINHAS, foraAnalise_LI_LINHAS, nomeUnidade_LI_LINHAS, codLinha_LI_LINHAS)

            CslValidacoes.BuscaValorContrato(vl_contrato, id_CL_TIPOS_CONTRATOS, codMatriz_PS_CLIENTES)
            SqlDataSourceLinhas.InsertParameters("codLinha_LI_LINHAS").DefaultValue = codLinha_LI_LINHAS
            SqlDataSourceLinhas.InsertParameters("vl_contrato").DefaultValue = vl_contrato
            If id_PS_CIDADES = 0 Then
                RadWindowManagerMsg.RadAlert("ATENÇÃO CIDADE NÃO CADATRADA", 400, Nothing, "MENSAGEM", Nothing)
                Exit Sub
            End If
            If nomeUnidade_LI_LINHAS = "" Then
                RadWindowManagerMsg.RadAlert("ATENÇÃO UNIDADE NÃO CADATRADA", 400, Nothing, "MENSAGEM", Nothing)
                Exit Sub
            Else
                SqlDataSourceLinhas.InsertParameters("nomeUnidade_LI_LINHAS").DefaultValue = nomeUnidade_LI_LINHAS
            End If


            SqlDataSourceLinhas.InsertParameters("id_CL_TIPOS_CONTRATOS").DefaultValue = id_CL_TIPOS_CONTRATOS

            SqlDataSourceLinhas.InsertParameters("vlInicial_id_LI_TIPOS").DefaultValue = vlInicial_id_LI_TIPOS
            SqlDataSourceLinhas.InsertParameters("perIncial_LI_LINHAS").DefaultValue = perIncial_LI_LINHAS
            SqlDataSourceLinhas.InsertParameters("foraAnalise_LI_LINHAS").DefaultValue = foraAnalise_LI_LINHAS
            SqlDataSourceLinhas.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA
            SqlDataSourceLinhas.InsertParameters("id_PS_CIDADES").DefaultValue = id_PS_CIDADES
            SqlDataSourceLinhas.InsertParameters("id_LI_TIPOS").DefaultValue = id_LI_TIPOS
            SqlDataSourceLinhas.InsertParameters("codMatriz_PS_CLIENTES").DefaultValue = codMatriz_PS_CLIENTES
            SqlDataSourceLinhas.InsertParameters("id_OP_OPERADORAS").DefaultValue = id_OP_OPERADORAS
            SqlDataSourceLinhas.InsertParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = RadMaskedTextBoxmesAno.TextWithLiterals

            SqlDataSourceLinhas.InsertParameters("vltotalLinha_SF_SERVICOS_FATURA").DefaultValue = vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox.DbValue.ToString

            SqlDataSourceLinhas.InsertParameters("vltotalLinha_SF_SERVICOS_FATURA").DefaultValue = vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox.DbValue.ToString
            SqlDataSourceLinhas.InsertParameters("vltotalLinha_SF_SERVICOS_FATURA").DefaultValue = vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox.DbValue.ToString
            SqlDataSourceLinhas.InsertParameters("vltotalLinha_SF_SERVICOS_FATURA").DefaultValue = vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox.DbValue.ToString






            strMesagembox = "O MÊS DE REFERÊNCIA " & RadMaskedTextBoxmesAno.TextWithLiterals & " JÁ POSSUI LANÇAMENTOS."
            Try

                SqlDataSourceLinhas.Insert()
                If id_SF_SERVICOS_FATURA_Atual = -1 Then
                    Exit Sub
                Else


                    SqlDataSourceUltimoServico.SelectParameters("id_LI_LINHAS").DefaultValue = idCompany





                    Dim mes As String = Month(CDate("01/" & RadMaskedTextBoxmesAno.TextWithLiterals).AddMonths(-1).ToString)
                    If CInt(mes) < 10 Then
                        mes = "0" & mes
                        If mes.Length >= 3 Then
                            mes = mes.Substring(1)
                        End If

                    End If
                    Dim ano As String = Year(CDate("01/" & RadMaskedTextBoxmesAno.TextWithLiterals).AddMonths(-1).ToString)


                    SqlDataSourceUltimoServico.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mes & "/" & ano

                    Dim dvSql1 As DataView = CType(SqlDataSourceUltimoServico.Select(DataSourceSelectArguments.Empty), DataView)


                    If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then

                        For Each drvSql As DataRowView In dvSql1
                            '    id_SF_SERVICOS_FATURA_Atual = 0
                            If IsDBNull(drvSql("id_SF_SERVICOS_FATURA")) = False Then
                                idAnterior = CInt(drvSql("id_SF_SERVICOS_FATURA"))
                            End If

                            If IsDBNull(drvSql("desc_SF_VL_SERVICO")) = False Then
                                SqlDataSourceUltimoServico.InsertParameters("desc_SF_VL_SERVICO").DefaultValue = (drvSql("desc_SF_VL_SERVICO"))
                            End If
                            If IsDBNull(drvSql("qtDias_SF_VL_SERVICO")) = False Then
                                SqlDataSourceUltimoServico.InsertParameters("qtDias_SF_VL_SERVICO").DefaultValue = CInt(drvSql("qtDias_SF_VL_SERVICO"))
                            End If
                            If IsDBNull(drvSql("vl_SF_VL_SERVICO")) = False Then
                                SqlDataSourceUltimoServico.InsertParameters("vl_SF_VL_SERVICO").DefaultValue = drvSql("vl_SF_VL_SERVICO")
                            End If
                            If IsDBNull(drvSql("vlDesconto_SF_VL_SERVICO")) = False Then
                                SqlDataSourceUltimoServico.InsertParameters("vlDesconto_SF_VL_SERVICO").DefaultValue = drvSql("vlDesconto_SF_VL_SERVICO")
                            End If
                            If IsDBNull(drvSql("codNumLinha_SF_VL_SERVICO")) = False Then
                                SqlDataSourceUltimoServico.InsertParameters("codNumLinha_SF_VL_SERVICO").DefaultValue = drvSql("codNumLinha_SF_VL_SERVICO")
                            End If
                            If IsDBNull(drvSql("id_SF_SERVICOS_FATURA")) = False Then
                                mesAteriorUso = drvSql("id_SF_SERVICOS_FATURA")
                                SqlDataSourceUltimoServico.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = id_SF_SERVICOS_FATURA_Atual
                            End If
                            If id_SF_SERVICOS_FATURA_Atual = 0 Then
                                ' SqlDataSourceUltimoServico .Insert()
                                If id_SF_SERVICOS_FATURA_Atual = -1 Then
                                 '   Exit Sub
                                End If
                                'SqlDataSourceUltimoServico.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = id_SF_SERVICOS_FATURA_Atual
                            End If
                            SqlDataSourceUltimoServico.Insert()
                        Next

                    End If



                    SqlDataSourceUso.SelectParameters("id_LI_LINHAS").DefaultValue = idCompany

                    Dim mes1 As String = ""
                    mes1 = Month(CDate("01/" & RadMaskedTextBoxmesAno.TextWithLiterals).AddMonths(-1).ToString)
                    If CInt(mes1) < 10 Then

                        mes1 = "0" & mes
                        If mes1.Length >= 3 Then
                            mes1 = mes1.Substring(1)

                        End If
                    End If

                    Dim ano1 As String = ""
                    ano1 = Year(CDate("01/" & RadMaskedTextBoxmesAno.TextWithLiterals).AddMonths(-1).ToString)

                    SqlDataSourceUso.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mes1 & "/" & ano1
                    Dim dvSql As DataView = CType(SqlDataSourceUso.Select(DataSourceSelectArguments.Empty), DataView)
                    If dvSql IsNot Nothing Then
                        If dvSql.Count <> 0 Then

                            For Each drvSql As DataRowView In dvSql
                                If IsDBNull(drvSql("id_SF_TIPO_USO")) = False Then
                                    SqlDataSourceUso.InsertParameters("id_SF_TIPO_USO").DefaultValue = drvSql("id_SF_TIPO_USO")
                                Else
                                    Exit For
                                End If
                                If IsDBNull(drvSql("id_OP_OPERADORAS")) = False Then
                                    SqlDataSourceUso.InsertParameters("id_OP_OPERADORAS").DefaultValue = drvSql("id_OP_OPERADORAS")
                                End If
                                If IsDBNull(drvSql("vlUso_SF_VL_USO")) = False Then
                                    SqlDataSourceUso.InsertParameters("vlUso_SF_VL_USO").DefaultValue = drvSql("vlUso_SF_VL_USO")
                                End If
                                If IsDBNull(drvSql("minutos_SF_VL_USO")) = False Then
                                    SqlDataSourceUso.InsertParameters("minutos_SF_VL_USO").DefaultValue = drvSql("minutos_SF_VL_USO")
                                End If
                                If IsDBNull(drvSql("codNumLinha_SF_VL_USO")) = False Then
                                    SqlDataSourceUso.InsertParameters("codNumLinha_SF_VL_USO").DefaultValue = drvSql("codNumLinha_SF_VL_USO")
                                End If
                                SqlDataSourceUso.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = id_SF_SERVICOS_FATURA_Atual
                                SqlDataSourceUso.Insert()
                            Next
                        End If

                    End If



                    HttpContext.Current.Response.Redirect("~/web/servicos_fatura/if_input_fatura_manual_Detalhes.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA=" & RadMaskedTextBoxmesAno.TextWithLiterals & "&id_LI_LINHAS=" & idCompany & "&id_SF_SERVICOS_FATURA=" & id_SF_SERVICOS_FATURA_Atual)
                End If
            Catch ex As Exception

                RadWindowManagerMsg.RadAlert("ATENÇÃO OCORREU UM ERRO DURANTE A OPERAÇÃO", 400, Nothing, "MENSAGEM", Nothing)
            End Try
        End If
        If e.CommandName = "Edit" Then

            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim id_SF_SERVICOS_FATURALabel As Label = DirectCast(dataItem.FindControl("id_SF_SERVICOS_FATURALabel"), Label)
            Dim mesAnoRefereincia_SF_SERVICOS_FATURALabel As Label = DirectCast(dataItem.FindControl("mesAnoRefereincia_SF_SERVICOS_FATURALabel"), Label)
            Dim codLinha_LI_LINHASLabel As Label = DirectCast(dataItem.FindControl("codLinha_LI_LINHASLabel"), Label)
            Dim Labelid_LI_LINHAS As Label = DirectCast(dataItem.FindControl("Labelid_LI_LINHAS"), Label)



            HttpContext.Current.Response.Redirect("~/web/servicos_fatura/if_input_fatura_manual_Detalhes.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA=" & mesAnoRefereincia_SF_SERVICOS_FATURALabel.Text & "&codLinha_LI_LINHAS=" & codLinha_LI_LINHASLabel.Text & "&id_SF_SERVICOS_FATURA=" & id_SF_SERVICOS_FATURALabel.Text & "&id_LI_LINHAS=" & Labelid_LI_LINHAS.Text)

        End If

        If e.CommandName = "Delete" Then

            If HiddenField1.Value = "false" Then
                Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
                Dim id_SF_SERVICOS_FATURALabel As Label = DirectCast(item.FindControl("id_SF_SERVICOS_FATURALabel"), Label)
                Session("DeleteValor") = id_SF_SERVICOS_FATURALabel.Text
                RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
                e.Canceled = True
            End If
        ElseIf e.CommandName = "DeleteChecked" Then
            DeleteChecked()
            HiddenField1.Value = "false"
        End If

    End Sub

    Private Sub SqlDataSourceLinhas_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceLinhas.Inserted
        If e.Command.Parameters("@Id").Value > 0 Then
            id_SF_SERVICOS_FATURA_Atual = e.Command.Parameters("@Id").Value
        Else
            id_SF_SERVICOS_FATURA_Atual = e.Command.Parameters("@Id").Value
            RadWindowManagerMsg.RadAlert("REGISTRO JÁ EXISTE", 400, Nothing, "MENSAGEM", Nothing)
        End If

    End Sub


    Protected Sub RadAutoCompleteBoxCodLInhas_TextChanged(sender As Object, e As AutoCompleteTextEventArgs)
        Dim CslValidacoes As New conteltelecom.Validacoes
        Dim razaosocial_PS_JURIDICALabelEdit As New Label
        Dim desc_OP_OPERADORASLabelEdit As New Label
        ' Dim id_OP_OPERADORAS As Integer
        ' Dim id_LI_TIPOS As Integer
        ' Dim id_PS_CIDADES As Integer
        ' Dim codMatriz_PS_CLIENTES As Integer
        ' Dim id_PS_PESSOA As Integer
        Dim autoCompleteBox As New RadAutoCompleteBox
        If RadGridFaturas.MasterTableView.IsItemInserted Then
            Dim edititem As GridEditableItem = DirectCast(RadGridFaturas.MasterTableView.GetInsertItem(), GridEditableItem)
            autoCompleteBox = DirectCast(edititem.FindControl("RadAutoCompleteBoxCodLInhas"), RadAutoCompleteBox)
            desc_OP_OPERADORASLabelEdit = DirectCast(edititem.FindControl("desc_OP_OPERADORASLabelEdit"), Label)
            Dim idCompany As Integer = 0
            If autoCompleteBox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                        CslValidacoes.BuscaRazaoSocial_Operadora(razaosocial_PS_JURIDICALabelEdit, desc_OP_OPERADORASLabelEdit, idCompany, 0, 0, 0, 0, 0, 0.0, "", 0, "", "")

                        Exit For
                    End If
                Next
            End If
        End If








    End Sub

    Private Sub RadGridFaturas_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridFaturas.ItemDataBound
        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                Dim ditem As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim RadMaskedTextBoxmesAno As RadMaskedTextBox = DirectCast(ditem.FindControl("RadMaskedTextBoxmesAno"), RadMaskedTextBox)
                Dim ClsBuscaMesAnoAtual As New conteltelecom.Validacoes
                RadMaskedTextBoxmesAno.Text = ClsBuscaMesAnoAtual.BuscaMesAnoAtual

            End If
        End If
    End Sub

    Protected Sub RadMaskedTextBoxmesAno_TextChanged(sender As Object, e As EventArgs)
        Dim clsValidacoes As New Validacoes

        ' clsValidacoes.ValidaMesCadatrado()




    End Sub

    Private Sub RadGridFaturas_PreRender(sender As Object, e As EventArgs) Handles RadGridFaturas.PreRender
        If Page.IsPostBack = False Then

            Select Case Request.QueryString("modo")
                Case "Edit", "InitInsert"

                    For Each item As GridDataItem In RadGridFaturas.Items
                        If item.IsInEditMode = False Then
                            item.FireCommandEvent("EditAll", [String].Empty)
                        End If
                    Next
                    Exit Select
            End Select
        End If

        If RadGridFaturas.EditIndexes.Count > 0 OrElse RadGridFaturas.MasterTableView.IsItemInserted Then
            RadGridFaturas.MasterTableView.GetColumn("tpConta").Visible = False
            RadGridFaturas.MasterTableView.GetColumn("dtVencimento_SF_SERVICOS_FATURA").Visible = True
            RadGridFaturas.MasterTableView.GetColumn("dtaPerFim_SF_SERVICOS_FATURA").Visible = True
            RadGridFaturas.MasterTableView.GetColumn("dtaPerIni_SF_SERVICOS_FATURA").Visible = True




        End If

    End Sub


    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click
        SqlDataSourceLinhas.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = RadMaskedTextBoxMesAno_ins.TextWithLiterals
        SqlDataSourceLinhas.SelectParameters("codLinha_LI_LINHAS").DefaultValue = RadTextBoxcodLinha_LI_LINHAS.Text
        RadGridFaturas.DataBind()

    End Sub
    Protected Sub DeleteChecked()
        SqlDataSourceLinhas.DeleteParameters("id_SF_SERVICOS_FATURA").DefaultValue = Session("DeleteValor")
        SqlDataSourceLinhas.Delete()
        Session.Remove("DeleteValor")
    End Sub
    Protected Sub RadButtonLimpar_Click(sender As Object, e As EventArgs)


    End Sub

End Class