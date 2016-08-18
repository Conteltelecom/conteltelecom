Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class cad_ramais
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            Dim dvSqlServico As DataView = CType(SqlDataSourceBuscaLinha.Select(DataSourceSelectArguments.Empty), DataView)

            If dvSqlServico IsNot Nothing Or dvSqlServico.Count < 0 Then

                For Each drvSql As DataRowView In dvSqlServico
                    GlobalCodLinha.Value = (drvSql("codLinha_LI_LINHAS"))
                Next
            End If

        End If

    End Sub


    Function mascaraFone(fone As Object)
        Dim NumFone As String

        NumFone = fone.ToString
        NumFone = SomenteNumeros(NumFone)
        NumFone = TelefoneFormat(NumFone)
        NumFone = NumFone.Substring(0, NumFone.Length - 4)


        Return NumFone


    End Function
    Private Sub RadGridCadDdr_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadDdr.ItemCommand


        If e.CommandName = RadGrid.UpdateCommandName Or e.CommandName = RadGrid.PerformInsertCommandName Then

            Dim eitem As GridEditableItem = TryCast(e.Item, GridEditableItem)
            Dim RangeFimTextBox As RadMaskedTextBox = DirectCast(eitem.FindControl("RangeFimTextBox"), RadMaskedTextBox)
            Dim RangeIniTextBox As RadMaskedTextBox = DirectCast(eitem.FindControl("RangeIniTextBox"), RadMaskedTextBox)
            Dim codLinha_LI_LINHASLabel As Label = DirectCast(eitem.FindControl("codLinha_LI_LINHASLabel"), Label)

            Dim dvSqlServico As DataView = CType(SqlDataSourceInsertRamais.Select(DataSourceSelectArguments.Empty), DataView)
            SqlDataSourceCadDdr.InsertParameters("rangeFinal_LI_RANGE_DDR").DefaultValue = RangeFimTextBox.Text
            SqlDataSourceCadDdr.InsertParameters("rangeInicial_LI_RANGE_DDR").DefaultValue = RangeIniTextBox.Text
            SqlDataSourceCadDdr.InsertParameters("id_LI_LINHAS").DefaultValue = Request.QueryString("id_LI_LINHAS")
            SqlDataSourceCadDdr.Insert()
            If dvSqlServico IsNot Nothing Or dvSqlServico.Count < 0 Then

                For Each drvSql As DataRowView In dvSqlServico
                    For x = CInt(RangeIniTextBox.Text) To CInt(RangeFimTextBox.Text)

                        SqlDataSourceInsertRamais.InsertParameters("id_OP_OPERADORAS").DefaultValue = If(IsDBNull(drvSql("id_OP_OPERADORAS")), 2, drvSql("id_OP_OPERADORAS"))
                        SqlDataSourceInsertRamais.InsertParameters("id_PS_CLIENTES").DefaultValue = If(IsDBNull(drvSql("id_PS_CLIENTES")), DBNull.Value, drvSql("id_PS_CLIENTES"))
                        SqlDataSourceInsertRamais.InsertParameters("id_LI_TIPOS").DefaultValue = If(IsDBNull(drvSql("id_LI_TIPOS")), DBNull.Value, drvSql("id_LI_TIPOS"))
                        SqlDataSourceInsertRamais.InsertParameters("vlInicial_id_LI_TIPOS").DefaultValue = "0"
                        SqlDataSourceInsertRamais.InsertParameters("numContrato_LI_LINHAS").DefaultValue = "9999"
                        SqlDataSourceInsertRamais.InsertParameters("codLinha_LI_LINHAS").DefaultValue = codLinha_LI_LINHASLabel.Text
                        SqlDataSourceInsertRamais.InsertParameters("numLinha_LI_LINHAS").DefaultValue = retornaNumLinha(codLinha_LI_LINHASLabel.Text, x)
                        SqlDataSourceInsertRamais.InsertParameters("vlIdeal_LI_LINHAS").DefaultValue = "0"
                        SqlDataSourceInsertRamais.InsertParameters("diaVenc_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("diaVenc_LI_LINHAS")), "1", drvSql("diaVenc_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("foraAnalise_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("foraAnalise_LI_LINHAS")), "1", drvSql("foraAnalise_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("st_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("st_LI_LINHAS")), DBNull.Value, drvSql("st_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("liCancelada_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("liCancelada_LI_LINHAS")), "0", drvSql("liCancelada_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("numF_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("numF_LI_LINHAS")), String.Empty, drvSql("numF_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("perIncial_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("perIncial_LI_LINHAS")), String.Empty, drvSql("perIncial_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("id_PS_CIDADES").DefaultValue = If(IsDBNull(drvSql("id_PS_CIDADES")), 1, drvSql("id_PS_CIDADES"))
                        SqlDataSourceInsertRamais.InsertParameters("bairro_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("bairro_LI_LINHAS")), String.Empty, drvSql("bairro_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("rua_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("rua_LI_LINHAS")), String.Empty, drvSql("rua_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("numEndereco_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("numEndereco_LI_LINHAS")), String.Empty, drvSql("numEndereco_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("complemeto_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("complemeto_LI_LINHAS")), String.Empty, drvSql("complemeto_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("obs_LI_LINHAS").DefaultValue = "DDR-RAMAL LINHA CHAVE " & codLinha_LI_LINHASLabel.Text
                        SqlDataSourceInsertRamais.InsertParameters("cep_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("cep_LI_LINHAS")), String.Empty, drvSql("cep_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("linhaVirtual_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("linhaVirtual_LI_LINHAS")), "0", drvSql("linhaVirtual_LI_LINHAS"))
                        SqlDataSourceInsertRamais.InsertParameters("nomeUnidade_LI_LINHAS").DefaultValue = If(IsDBNull(drvSql("nomeUnidade_LI_LINHAS")), String.Empty, drvSql("nomeUnidade_LI_LINHAS"))
                        SqlDataSourceInsertRamais.Insert()

                    Next

                Next
                SqlDataSourceInsertRamais.DataBind()


            End If

        End If

    End Sub

    Function retornaNumLinha(ByVal codLinha_LI_LINHAS As String, ByVal numRamal As Integer) As String
        Dim ClsValidacoes As New Validacoes
        codLinha_LI_LINHAS = SomenteNumeros(codLinha_LI_LINHAS)



        codLinha_LI_LINHAS = codLinha_LI_LINHAS.Substring(0, codLinha_LI_LINHAS.Length - 4)
        codLinha_LI_LINHAS = codLinha_LI_LINHAS & numRamal.ToString.PadLeft(4, "0")
        codLinha_LI_LINHAS = SomenteNumeros(codLinha_LI_LINHAS)
        Return codLinha_LI_LINHAS
    End Function

    Private Sub RadGridCadDdr_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCadDdr.ItemDataBound

        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then
            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then

                Dim codLinha_LI_LINHASLabel As Label = DirectCast(e.Item.FindControl("codLinha_LI_LINHASLabel"), Label)

                codLinha_LI_LINHASLabel.Text = GlobalCodLinha.Value

            Else

            End If
        End If
    End Sub
End Class