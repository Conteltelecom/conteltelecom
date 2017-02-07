Imports System.IO
Imports System.Net
Imports Telerik.Web.UI

Public Class anexos_solicitacao_fatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'RadDatePickerPeriodoInicial.SelectedDate = Date.Now.ToString("mm/yyyy")

        If IsPostBack = True Then

        Else
            RadDatePickerPeriodoInicial.SelectedDate = Date.Now.ToString("MMMM yyyy")
            SqlDataSourceBuscaAnexos.SelectParameters("mesReferencia_SF_LEITURA_FATURA").DefaultValue = RadDatePickerPeriodoInicial.SelectedDate
        End If

        PersonalizarControles.SubRadWindowManager(RadWindowManagerMsg, 0)
    End Sub

    Private Sub RadGridMostraFaturas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridMostraFaturas.ItemCommand

        Try

            If e.CommandName = "DeleteNovo" Then

                Dim dataItem As GridDataItem = TryCast(e.Item, GridDataItem)
                'get the Hyperlink using the Column uniqueName
                Dim HiddenFieldcaminho_ANEXOS_FATURAS As Label = DirectCast(dataItem.FindControl("HiddenFieldcaminho_ANEXOS_FATURAS"), Label)
                Dim HiddenFieldid_SF_LEITURA_FATURA As Label = DirectCast(dataItem.FindControl("HiddenFieldid_SF_LEITURA_FATURA"), Label)
                Dim id_ANEXOS_FATURAS As Integer = dataItem("id_ANEXOS_FATURAS").Text

                SqlDataSourceBuscaAnexos.DeleteParameters("id_SF_LEITURA_FATURA").DefaultValue = HiddenFieldid_SF_LEITURA_FATURA.Text
                SqlDataSourceBuscaAnexos.Delete()
                Dim arquivo As New FileInfo(HttpContext.Current.Server.MapPath(HiddenFieldcaminho_ANEXOS_FATURAS.Text))

                If arquivo.Exists Then
                    arquivo.Delete()
                End If
                RadGridMostraFaturas.DataBind()

            End If
            If e.CommandName = RadGrid.PerformInsertCommandName And e.Item.OwnerTableView.Name = "Linhas" Then
                Dim mesReferencia_SF_LEITURA_FATURA As String = ""
                Dim dtVencimento_SF_LEITURA_FATURA As Date
                Dim dtPeriodo_ini_SF_LEITURA_FATURA As Date
                Dim dtPeriodo_Fim_SF_LEITURA_FATURA As Date
                Dim parentItem = CType(e.Item.OwnerTableView.ParentItem, GridDataItem)

                Dim id_SF_LEITURA_FATURA As String = ""

                If (Not parentItem Is Nothing) Then

                    id_SF_LEITURA_FATURA = CType(parentItem.OwnerTableView.DataKeyValues(parentItem.ItemIndex)("id_SF_LEITURA_FATURA"), String)

                End If
                Dim idCompany As Integer
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim RadMaskedTextBoxnumNotaFiscal_SF_SOLICITACAO_FATURA_NOTA As RadMaskedTextBox = DirectCast(eitem.FindControl("RadMaskedTextBoxnumNotaFiscal_SF_SOLICITACAO_FATURA_NOTA"), RadMaskedTextBox)
                Dim LabelcotAgrupado_SF_LEITURA_FATURA As Label = DirectCast(eitem.FindControl("LabelcotAgrupado_SF_LEITURA_FATURA"), Label)
                Dim RadAutoCompleteBoxContratoAgrupado As RadAutoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxContratoAgrupado"), RadAutoCompleteBox)
                For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxContratoAgrupado.Entries
                    If entry.Text = RadAutoCompleteBoxContratoAgrupado.Text Then
                        idCompany = Convert.ToInt32(entry.Value)

                    End If
                Next
                Dim cotAgrupador_SF_LEITURA_FATURA As String = RadAutoCompleteBoxContratoAgrupado.Text
                cotAgrupador_SF_LEITURA_FATURA = (cotAgrupador_SF_LEITURA_FATURA)
                Dim numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA As Label = DirectCast(eitem.FindControl("LabelFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA"), Label)
                Dim RadComboBoxTipoPessoa As RadComboBox = DirectCast(eitem.FindControl("RadComboBoxTipoPessoa"), RadComboBox)
                Dim Labelcnpj_SF_SOLICITACAO_FATURA_NOTA As Label = DirectCast(eitem.FindControl("Labelcnpj_SF_SOLICITACAO_FATURA_NOTA"), Label)
                Dim RadNumericTextBoxvlTotal_SF_SOLICITACAO_FATURA_NOTA As RadNumericTextBox = DirectCast(eitem.FindControl("RadNumericTextBoxvlTotal_SF_SOLICITACAO_FATURA_NOTA"), RadNumericTextBox)

                Labelcnpj_SF_SOLICITACAO_FATURA_NOTA.Text = Validacoes.SomenteNumeros(Labelcnpj_SF_SOLICITACAO_FATURA_NOTA.Text.ToString)
                numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA.Text = (numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA.Text.ToString)
                SqlDataSourceLInhas.InsertParameters("id_SF_LEITURA_FATURA").DefaultValue = id_SF_LEITURA_FATURA
                SqlDataSourceLInhas.InsertParameters("numNotaFiscal_SF_SOLICITACAO_FATURA_NOTA").DefaultValue = RadMaskedTextBoxnumNotaFiscal_SF_SOLICITACAO_FATURA_NOTA.Text
                SqlDataSourceLInhas.InsertParameters("numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA").DefaultValue = numFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA.Text
                SqlDataSourceLInhas.InsertParameters("cotAgrupado_SF_SOLICITACAO_FATURA_NOTA").DefaultValue = cotAgrupador_SF_LEITURA_FATURA
                SqlDataSourceLInhas.InsertParameters("cnpj_SF_SOLICITACAO_FATURA_NOTA").DefaultValue = Labelcnpj_SF_SOLICITACAO_FATURA_NOTA.Text
                SqlDataSourceLInhas.InsertParameters("vlTotal_SF_SOLICITACAO_FATURA_NOTA").DefaultValue = RadNumericTextBoxvlTotal_SF_SOLICITACAO_FATURA_NOTA.Text
                SqlDataSourceLInhas.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceLInhas.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceLInhas.Insert()

                SqlDataSourceBuscaItensatura.SelectParameters("id_SF_LEITURA_FATURA").DefaultValue = id_SF_LEITURA_FATURA
                Dim dvSql As DataView = CType(SqlDataSourceBuscaItensatura.Select(DataSourceSelectArguments.Empty), DataView)

                If dvSql IsNot Nothing Then
                    For Each drvSql As DataRowView In dvSql
                        If IsDBNull(drvSql("mesReferencia_SF_LEITURA_FATURA")) = False Then
                            mesReferencia_SF_LEITURA_FATURA = drvSql("mesReferencia_SF_LEITURA_FATURA")
                        End If
                        If IsDBNull(drvSql("dtVencimento_SF_LEITURA_FATURA")) = False Then
                            dtVencimento_SF_LEITURA_FATURA = drvSql("dtVencimento_SF_LEITURA_FATURA")
                        End If
                        If IsDBNull(drvSql("dtPeriodo_ini_SF_LEITURA_FATURA")) = False Then
                            dtPeriodo_ini_SF_LEITURA_FATURA = drvSql("dtPeriodo_ini_SF_LEITURA_FATURA")
                        End If
                        If IsDBNull(drvSql("dtPeriodo_Fim_SF_LEITURA_FATURA")) = False Then
                            dtPeriodo_Fim_SF_LEITURA_FATURA = drvSql("dtPeriodo_Fim_SF_LEITURA_FATURA")
                        End If


                    Next

                End If

            End If
            If e.CommandName = RadGrid.PerformInsertCommandName And e.Item.OwnerTableView.Name = "Master" Then
                Dim id_SF_LEITURA_FATURA As Integer


                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim id_OP_OPERADORAS As Label = DirectCast(eitem.FindControl("LabelIdOperadora"), Label)
                Dim numFatura_SF_LEITURA_FATURA As RadMaskedTextBox = DirectCast(eitem.FindControl("RadNumericTextBoxNumFatura"), RadMaskedTextBox)
                Dim mesReferencia_SF_LEITURA As RadMaskedTextBox = DirectCast(eitem.FindControl("RadTextBoxMesAno"), RadMaskedTextBox)
                Dim dtVencimento_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerdtVencimento_SF_LEITURA_FATURA"), RadDatePicker)
                Dim numFoneAgrupador_SF_LEITURA_FATURA As Label = DirectCast(eitem.FindControl("LabelnumFoneAgrupador_SF_LEITURA_FATURA"), Label)
                Dim AutoCompleteBox As RadAutoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxContratoAgrupador"), RadAutoCompleteBox)

                Dim cotAgrupador_SF_LEITURA_FATURA As String = AutoCompleteBox.Text

                'cotAgrupador_SF_LEITURA_FATURA = Validacoes.SomenteNumeros(cotAgrupador_SF_LEITURA_FATURA)



                Dim dtPeriodo_ini_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerIni"), RadDatePicker)
                Dim dtPeriodo_Fim_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerFim"), RadDatePicker)
                Dim strSQL As String
                strSQL = "INSERT INTO [dbo].[SF_LEITURA_FATURA]
           ([numFatura_SF_LEITURA_FATURA]
           ,[mesReferencia_SF_LEITURA_FATURA]
           ,[dtVencimento_SF_LEITURA_FATURA]
           ,[id_OP_OPERADORAS]
           ,[vlTotal_SF_CAD_LEIAUTE]
           ,[numFoneAgrupador_SF_LEITURA_FATURA]
           ,[cotAgrupador_SF_LEITURA_FATURA]
           ,[id_PS_PESSOA_alt]
           ,[id_PS_PESSOA_inc]
            ,[dtPeriodo_ini_SF_LEITURA_FATURA]
           ,[dtPeriodo_Fim_SF_LEITURA_FATURA])
     VALUES
           (@numFatura_SF_LEITURA_FATURA
           ,@mesReferencia_SF_LEITURA_FATURA
           ,@dtVencimento_SF_LEITURA_FATURA
           ,@id_OP_OPERADORAS
           ,0.00,
            @numFoneAgrupador_SF_LEITURA_FATURA
           ,@cotAgrupador_SF_LEITURA_FATURA
           ,@id_PS_PESSOA_alt
           ,@id_PS_PESSOA_inc
            ,@dtPeriodo_ini_SF_LEITURA_FATURA
           ,@dtPeriodo_Fim_SF_LEITURA_FATURA);SELECT @id= SCOPE_IDENTITY()"
                Dim strConexao As New Sql
                Dim cnn As Data.SqlClient.SqlConnection
                Dim cmd As Data.SqlClient.SqlCommand
                Dim param As Data.SqlClient.SqlParameter
                'defina a string de conexão e cria uma nova conexão
                Dim connString As String = strConexao.StrConectionString()
                cnn = New Data.SqlClient.SqlConnection(connString)

                'define o comando a ser executado
                cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)

                'recebe os parâmetros DESCRIÇÃO
                cmd.Parameters.AddWithValue("@id", 0).Direction = ParameterDirection.Output

                param = New Data.SqlClient.SqlParameter("@numFatura_SF_LEITURA_FATURA", Data.SqlDbType.VarChar) 'OK
                param.Value = If(IsNothing(numFatura_SF_LEITURA_FATURA.Text) = False, numFatura_SF_LEITURA_FATURA.Text, DBNull.Value)
                cmd.Parameters.Add(param)


                param = New Data.SqlClient.SqlParameter("@mesReferencia_SF_LEITURA_FATURA", Data.SqlDbType.VarChar) 'OK
                param.Value = If(IsNothing(mesReferencia_SF_LEITURA.TextWithLiterals) = False, mesReferencia_SF_LEITURA.TextWithLiterals, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@dtVencimento_SF_LEITURA_FATURA", Data.SqlDbType.Date) 'ok
                param.Value = If(IsNothing(dtVencimento_SF_LEITURA_FATURA.DateInput.SelectedDate) = False, dtVencimento_SF_LEITURA_FATURA.DateInput.SelectedDate, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@id_OP_OPERADORAS", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(id_OP_OPERADORAS.Text) = False, id_OP_OPERADORAS.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@numFoneAgrupador_SF_LEITURA_FATURA", Data.SqlDbType.VarChar) 'ok
                param.Value = If(IsNothing(numFoneAgrupador_SF_LEITURA_FATURA.Text) = False, numFoneAgrupador_SF_LEITURA_FATURA.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@cotAgrupador_SF_LEITURA_FATURA", Data.SqlDbType.VarChar) 'ok
                param.Value = If(IsNothing(cotAgrupador_SF_LEITURA_FATURA) = False, cotAgrupador_SF_LEITURA_FATURA, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@dtPeriodo_ini_SF_LEITURA_FATURA", Data.SqlDbType.Date) 'ok
                param.Value = If(IsNothing(dtPeriodo_ini_SF_LEITURA_FATURA.DateInput.SelectedDate) = False, dtPeriodo_ini_SF_LEITURA_FATURA.DateInput.SelectedDate, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@dtPeriodo_Fim_SF_LEITURA_FATURA", Data.SqlDbType.Date) 'ok
                param.Value = If(IsNothing(dtPeriodo_Fim_SF_LEITURA_FATURA.DateInput.SelectedDate) = False, dtPeriodo_Fim_SF_LEITURA_FATURA.DateInput.SelectedDate, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@id_PS_PESSOA_alt", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(Session("id_PS_PESSOA_USUARIO")) = False, Session("id_PS_PESSOA_USUARIO"), DBNull.Value)
                cmd.Parameters.Add(param)
                param = New Data.SqlClient.SqlParameter("@id_PS_PESSOA_inc", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(Session("id_PS_PESSOA_USUARIO")) = False, Session("id_PS_PESSOA_USUARIO"), DBNull.Value)
                cmd.Parameters.Add(param)


                'abre a conexão
                cnn.Open()
                'executa a instrução SQL se retornar
                '  cmd.ExecuteNonQuery()
                cmd.ExecuteScalar()
                id_SF_LEITURA_FATURA = Convert.ToInt32(cmd.Parameters("@id").Value)
                '                'fecha a conexao
                cnn.Close()


                Dim eitemUp As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim mesReferencia_SF_LEITURA_FATURA As RadMaskedTextBox = DirectCast(eitemUp.FindControl("RadTextBoxMesAno"), RadMaskedTextBox)
                Dim RadAsyncUploadAnexos As RadAsyncUpload = DirectCast(eitemUp.FindControl("RadAsyncUploadAnexos"), RadAsyncUpload)
                For Each file As UploadedFile In RadAsyncUploadAnexos.UploadedFiles

                    Dim mes As String = mesReferencia_SF_LEITURA_FATURA.TextWithLiterals.Substring(0, mesReferencia_SF_LEITURA_FATURA.TextWithLiterals.Length - 5)
                    Dim ano As String = mesReferencia_SF_LEITURA_FATURA.TextWithLiterals.Substring(mesReferencia_SF_LEITURA_FATURA.TextWithLiterals.Length - 4)
                    Dim StrPath As String = Server.MapPath("~\Anexos\") & ano & "\" & MonthName(mes) & "\"

                    If Directory.Exists(StrPath) = False Then
                        Directory.CreateDirectory(StrPath)
                    End If

                    file.SaveAs(StrPath & id_SF_LEITURA_FATURA & Path.GetExtension(file.FileName))

                    SqlDataSourceBuscaAnexos.InsertParameters("desc_ANEXOS_FATURAS").DefaultValue = file.FileName
                    SqlDataSourceBuscaAnexos.InsertParameters("caminho_ANEXOS_FATURAS").DefaultValue = ("~\Anexos\") & ano & "\" & MonthName(mes) & "\" & id_SF_LEITURA_FATURA & Path.GetExtension(file.FileName)
                    SqlDataSourceBuscaAnexos.InsertParameters("id_SF_LEITURA_FATURA").DefaultValue = id_SF_LEITURA_FATURA
                    SqlDataSourceBuscaAnexos.Insert()
                Next
            End If

            If e.CommandName = RadGrid.UpdateCommandName And e.Item.OwnerTableView.Name = "Master" Then
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim Labelid_SF_LEITURA_FATURA As Label = DirectCast(eitem.FindControl("Labelid_SF_LEITURA_FATURA"), Label)

                Dim numFatura_SF_LEITURA_FATURA As RadMaskedTextBox = DirectCast(eitem.FindControl("RadNumericTextBoxNumFatura"), RadMaskedTextBox)
                Dim mesReferencia_SF_LEITURA As RadMaskedTextBox = DirectCast(eitem.FindControl("RadTextBoxMesAno"), RadMaskedTextBox)
                Dim dtVencimento_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerdtVencimento_SF_LEITURA_FATURA"), RadDatePicker)

                Dim dtPeriodo_ini_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerIni"), RadDatePicker)
                Dim dtPeriodo_Fim_SF_LEITURA_FATURA As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerFim"), RadDatePicker)

                SqlDataSourceBuscaAnexos.UpdateParameters("numFatura_SF_LEITURA_FATURA").DefaultValue = numFatura_SF_LEITURA_FATURA.Text
                SqlDataSourceBuscaAnexos.UpdateParameters("mesReferencia_SF_LEITURA_FATURA").DefaultValue = Validacoes.FormatarMesRef(mesReferencia_SF_LEITURA.TextWithLiterals, 0).ToString.ToUpper
                SqlDataSourceBuscaAnexos.UpdateParameters("dtVencimento_SF_LEITURA_FATURA").DefaultValue = dtVencimento_SF_LEITURA_FATURA.DateInput.SelectedDate
                SqlDataSourceBuscaAnexos.UpdateParameters("id_SF_LEITURA_FATURA").DefaultValue = Labelid_SF_LEITURA_FATURA.Text

                SqlDataSourceBuscaAnexos.UpdateParameters("dtPeriodo_ini_SF_LEITURA_FATURA").DefaultValue = dtPeriodo_ini_SF_LEITURA_FATURA.DateInput.SelectedDate
                SqlDataSourceBuscaAnexos.UpdateParameters("dtPeriodo_Fim_SF_LEITURA_FATURA").DefaultValue = dtPeriodo_Fim_SF_LEITURA_FATURA.DateInput.SelectedDate
                SqlDataSourceBuscaAnexos.UpdateParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceBuscaAnexos.Update()
                Dim RadAsyncUploadAnexos As RadAsyncUpload = DirectCast(eitem.FindControl("RadAsyncUploadAnexos"), RadAsyncUpload)
                If RadAsyncUploadAnexos.UploadedFiles.Count > 0 Then
                    Dim id_ANEXOS_FATURAS As Integer = eitem("id_ANEXOS_FATURAS").Text
                    Dim Labelcaminho_ANEXOS_FATURAS As Label = DirectCast(eitem.FindControl("Labelcaminho_ANEXOS_FATURAS"), Label)
                    SqlDataSourceOperadoras.DeleteParameters("id_ANEXOS_FATURAS").DefaultValue = id_ANEXOS_FATURAS
                    SqlDataSourceOperadoras.Delete()
                    Try
                        Dim arquivo As New FileInfo(HttpContext.Current.Server.MapPath(Labelcaminho_ANEXOS_FATURAS.Text))
                        If arquivo.Exists Then
                            arquivo.Delete()
                        End If
                    Catch ex As Exception

                    End Try
                    For Each file As UploadedFile In RadAsyncUploadAnexos.UploadedFiles
                        Dim mes As String = mesReferencia_SF_LEITURA.TextWithLiterals.Substring(0, mesReferencia_SF_LEITURA.TextWithLiterals.Length - 5)
                        Dim ano As String = mesReferencia_SF_LEITURA.TextWithLiterals.Substring(mesReferencia_SF_LEITURA.TextWithLiterals.Length - 4)
                        Dim StrPath As String = Server.MapPath("~\Anexos\") & ano & "\" & MonthName(mes) & "\"
                        If Directory.Exists(StrPath) = False Then
                            Directory.CreateDirectory(StrPath)
                        End If

                        file.SaveAs(StrPath & Labelid_SF_LEITURA_FATURA.Text & Path.GetExtension(file.FileName))
                        SqlDataSourceBuscaAnexos.DataBind()
                        SqlDataSourceBuscaAnexos.InsertParameters("desc_ANEXOS_FATURAS").DefaultValue = file.FileName
                        SqlDataSourceBuscaAnexos.InsertParameters("caminho_ANEXOS_FATURAS").DefaultValue = ("~\Anexos\") & ano & "\" & MonthName(mes) & "\" & Labelid_SF_LEITURA_FATURA.Text & Path.GetExtension(file.FileName)
                        SqlDataSourceBuscaAnexos.InsertParameters("id_SF_LEITURA_FATURA").DefaultValue = Labelid_SF_LEITURA_FATURA.Text
                        SqlDataSourceBuscaAnexos.Insert()
                    Next

                    RadGridMostraFaturas.DataBind()
                End If





            End If
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens
            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        Finally


        End Try
    End Sub

    Private Sub RadGridMostraFaturas_PreRender(sender As Object, e As EventArgs) Handles RadGridMostraFaturas.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridMostraFaturas, 1)
            RadGridMostraFaturas.MasterTableView.DetailTables.Item(0).EditMode = GridEditMode.EditForms
            RadGridMostraFaturas.MasterTableView.DetailTables.Item(0).EditFormSettings.EditFormType = GridEditFormType.Template

            RadGridMostraFaturas.Rebind()
        End If



    End Sub

    Protected Sub RadComboBoxTipoPessoa_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
        Dim combo As RadComboBox = DirectCast(sender, RadComboBox)
        Dim item As GridDataItem = DirectCast(combo.NamingContainer, GridDataItem)
        If e.Value = 0 Then
            Dim RadMaskedTextBoxCNPJ As RadMaskedTextBox = DirectCast(item.FindControl("RadMaskedTextBoxCNPJ"), RadMaskedTextBox)
            RadMaskedTextBoxCNPJ.Mask="###.###.###-##"
        End If



    End Sub

    Protected Sub RadMaskedTextBoxcotAgrupado_SF_SOLICITACAO_FATURA_NOTA_TextChanged(sender As Object, e As EventArgs)


        Dim txtbox As RadMaskedTextBox = DirectCast(sender, RadMaskedTextBox)
        Dim item As GridEditableItem = DirectCast(txtbox.NamingContainer, GridEditableItem)
        Dim RadMaskedTextBoxnumFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA As RadMaskedTextBox = DirectCast(item.FindControl("RadMaskedTextBoxnumFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA"), RadMaskedTextBox)
        Dim RadMaskedTextBoxCNPJ As RadMaskedTextBox = DirectCast(item.FindControl("RadMaskedTextBoxCNPJ"), RadMaskedTextBox)



        SqlDataSourceBuscaContrato.SelectParameters("numContrato_LI_LINHAS").DefaultValue = txtbox.DisplayText
        Dim dvSql As DataView = CType(SqlDataSourceBuscaContrato.Select(DataSourceSelectArguments.Empty), DataView)

        If dvSql IsNot Nothing Then
            For Each drvSql As DataRowView In dvSql
                If IsDBNull(drvSql("CNPJ_PS_JURIDICA")) = False Then
                    If drvSql("CNPJ_PS_JURIDICA").ToString.Length <= 11 Then

                        RadMaskedTextBoxCNPJ.Mask = "###.###.###-##"
                    Else
                        RadMaskedTextBoxCNPJ.Mask = "##.###.###/####-##"

                    End If
                    RadMaskedTextBoxCNPJ.Text = drvSql("CNPJ_PS_JURIDICA")

                End If
                If IsDBNull(drvSql("codLinha_LI_LINHAS")) = False Then
                    RadMaskedTextBoxnumFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA.Text = drvSql("codLinha_LI_LINHAS")
                End If
            Next

        End If
    End Sub

    Protected Sub RadAutoCompleteBoxContratoAgrupador_TextChanged(sender As Object, e As AutoCompleteTextEventArgs)
        Dim autoCompleteBox As New RadAutoCompleteBox
        Dim LabelOperadora As New Label
        Dim LabelnumFoneAgrupador_SF_LEITURA_FATURA As New Label
        Dim LabelIdOperadora As New Label
        If RadGridMostraFaturas.MasterTableView.IsItemInserted Then
            Dim edititem As GridEditableItem = DirectCast(RadGridMostraFaturas.MasterTableView.GetInsertItem(), GridEditableItem)
            autoCompleteBox = DirectCast(edititem.FindControl("RadAutoCompleteBoxContratoAgrupador"), RadAutoCompleteBox)
            LabelOperadora = DirectCast(edititem.FindControl("LabelOperadora"), Label)
            LabelnumFoneAgrupador_SF_LEITURA_FATURA = DirectCast(edititem.FindControl("LabelnumFoneAgrupador_SF_LEITURA_FATURA"), Label)
            LabelIdOperadora = DirectCast(edititem.FindControl("LabelIdOperadora"), Label)
            Dim idCompany As Integer = 0
            If autoCompleteBox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                        Exit For
                    End If
                Next
                SqlDataSourceBuscaOperadora_Cod.SelectParameters("id_LI_LINHAS").DefaultValue = idCompany
                Dim dvSql As DataView = CType(SqlDataSourceBuscaOperadora_Cod.Select(DataSourceSelectArguments.Empty), DataView)

                If dvSql IsNot Nothing Then
                    For Each drvSql As DataRowView In dvSql
                        If IsDBNull(drvSql("desc_OP_OPERADORAS")) = False Then
                            LabelOperadora.Text = drvSql("desc_OP_OPERADORAS")

                        End If
                        If IsDBNull(drvSql("codLinha_LI_LINHAS")) = False Then
                            LabelnumFoneAgrupador_SF_LEITURA_FATURA.Text = drvSql("codLinha_LI_LINHAS")
                            LabelIdOperadora.Text = drvSql("id_OP_OPERADORAS")

                        End If
                    Next

                End If
            End If
        End If
    End Sub

    Private Sub RadGridMostraFaturas_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridMostraFaturas.ItemDataBound
        If TypeOf e.Item Is GridEditFormItem AndAlso e.Item.IsInEditMode Then
            If e.Item.OwnerTableView.Name = "Master" Then
                Dim item As GridEditFormItem = DirectCast(e.Item, GridEditFormItem)
                Dim LabelcotAgrupador_SF_LEITURA_FATURA As Label = DirectCast(item.FindControl("LabelcotAgrupador_SF_LEITURA_FATURA"), Label)
                Dim autoCompleteBox As RadAutoCompleteBox = DirectCast(item.FindControl("RadAutoCompleteBoxContratoAgrupador"), RadAutoCompleteBox)
                If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                    LabelcotAgrupador_SF_LEITURA_FATURA.Visible = False
                    autoCompleteBox.Visible = True
                Else
                    LabelcotAgrupador_SF_LEITURA_FATURA.Visible = True
                    autoCompleteBox.Visible = False
                End If
            Else
                Dim item As GridEditFormItem = DirectCast(e.Item, GridEditFormItem)

                Dim LabelcotAgrupado_SF_LEITURA_FATURA As Label = DirectCast(item.FindControl("LabelcotAgrupado_SF_LEITURA_FATURA"), Label)
                Dim RadAutoCompleteBoxContratoAgrupado As RadAutoCompleteBox = DirectCast(item.FindControl("RadAutoCompleteBoxContratoAgrupado"), RadAutoCompleteBox)
                If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                    LabelcotAgrupado_SF_LEITURA_FATURA.Visible = False
                    RadAutoCompleteBoxContratoAgrupado.Visible = True
                Else
                    LabelcotAgrupado_SF_LEITURA_FATURA.Visible = True
                    RadAutoCompleteBoxContratoAgrupado.Visible = False
                End If

            End If
        End If
    End Sub

    Protected Sub RadAutoCompleteBoxContratoAgrupado_TextChanged(sender As Object, e As AutoCompleteTextEventArgs)
        Try



            Dim txtbox As RadAutoCompleteBox = DirectCast(sender, RadAutoCompleteBox)
            Dim item As GridEditableItem = DirectCast(txtbox.NamingContainer, GridEditableItem)
            Dim LabelFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA As Label = DirectCast(item.FindControl("LabelFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA"), Label)
            Dim Labelcnpj_SF_SOLICITACAO_FATURA_NOTA As Label = DirectCast(item.FindControl("Labelcnpj_SF_SOLICITACAO_FATURA_NOTA"), Label)
            Dim idCompany As Integer = 0
            If txtbox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In txtbox.Entries
                    If entry.Text = txtbox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                        Exit For
                    End If
                Next
            End If

            SqlDataSourceBuscaContrato.SelectParameters("id_LI_LINHAS").DefaultValue = idCompany
            Dim dvSql As DataView = CType(SqlDataSourceBuscaContrato.Select(DataSourceSelectArguments.Empty), DataView)

            If dvSql IsNot Nothing Then
                For Each drvSql As DataRowView In dvSql
                    If IsDBNull(drvSql("CNPJ_PS_JURIDICA")) = False Then

                        Labelcnpj_SF_SOLICITACAO_FATURA_NOTA.Text = drvSql("CNPJ_PS_JURIDICA")

                    End If
                    If IsDBNull(drvSql("codLinha_LI_LINHAS")) = False Then
                        LabelFoneAgrupado_SF_SOLICITACAO_FATURA_NOTA.Text = drvSql("codLinha_LI_LINHAS")
                    End If
                Next

            End If

        Catch ex As Exception

        End Try
    End Sub


    ' ação do botao limpar no filtro
    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Try
            Dim CLScontroles As New conteltelecom.Controles
            CLScontroles.Limpar(Me)
            CLScontroles = Nothing
            RadAutoCompleteBoxCodLinha.DataTextField = ""
            RadDatePickerPeriodoInicial.Clear()
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens
            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub





    ' botao pesquisar
    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs)

        Dim verificaMesAno As String ' recebe mes e ano selecionados para verificação
        Dim mesAnoParametro As String ' variavel que será passada ao SQL

        verificaMesAno = Month(RadDatePickerPeriodoInicial.DateInput.SelectedDate) & "/" & Year(RadDatePickerPeriodoInicial.DateInput.SelectedDate)

        ' se o mes nao tiver zero na frente (10,11,12), somente joga o mes escolhido para a variavel mesAnoParametro
        If (verificaMesAno = "10/" & Date.Now.ToString("yyyy") Or verificaMesAno = "11/" & Date.Now.ToString("yyyy") Or verificaMesAno = "12/" & Date.Now.ToString("yyyy")) Then
            mesAnoParametro = verificaMesAno
        Else
            ' se tiver zero, adiciona ele na frente (Ex: mes 4 fica 04)
            mesAnoParametro = "0" & verificaMesAno
        End If

        SqlDataSourceBuscaAnexos.SelectParameters("mesReferencia_SF_LEITURA_FATURA").DefaultValue = mesAnoParametro



        Dim codLinhaParametro As String
        codLinhaParametro = ""

        For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxCodLinha.Entries
            'If entry.Text = RadAutoCompleteBoxCodLinha.Text Then
            If RadAutoCompleteBoxCodLinha.Text <> "" Then
                codLinhaParametro = entry.Value
            End If
        Next

        If codLinhaParametro <> "" Then
            SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " AND codLinha_LI_LINHAS = '" & codLinhaParametro & "'"
        End If


        'If RadAutoCompleteBoxCodLinha.DataTextField <> "" Then
        '    ' SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " AND codLinha_LI_LINHAS LIKE '%" & RadTextBoxCodLinha.Text & "%' "

        '    ' prevenção a SQL Injection
        '    SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " AND codLinha_LI_LINHAS =  @codLinha_LI_LINHAS "
        '    Try
        '        If IsNothing(SqlDataSourceBuscaAnexos.SelectParameters("codLinha_LI_LINHAS")) = True Then
        '            SqlDataSourceBuscaAnexos.SelectParameters.Add("codLinha_LI_LINHAS", RadAutoCompleteBoxCodLinha.DataValueField)
        '        Else
        '            SqlDataSourceBuscaAnexos.SelectParameters("codLinha_LI_LINHAS").DefaultValue = RadAutoCompleteBoxCodLinha.DataValueField
        '        End If

        '    Catch ex As Exception

        '    End Try

        'End If

        ' concatena consulta com cláusula ORDER BY
        SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " ORDER BY ANEXOS_FATURAS.id_ANEXOS_FATURAS DESC, SF_LEITURA_FATURA.id_OP_OPERADORAS "

        RadGridMostraFaturas.DataBind()
    End Sub



    Private Sub SqlDataSourceBuscaAnexos_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSourceBuscaAnexos.Selecting

        'If RadTextBoxCodLinha.Text <> "" Then
        'SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " AND codLinha_LI_LINHAS LIKE '%" & RadTextBoxCodLinha.Text & "%'"
        'End If
        'SqlDataSourceBuscaAnexos.SelectCommand = SqlDataSourceBuscaAnexos.SelectCommand & " ORDER BY ANEXOS_FATURAS.id_ANEXOS_FATURAS DESC, SF_LEITURA_FATURA.id_OP_OPERADORAS "

    End Sub


End Class