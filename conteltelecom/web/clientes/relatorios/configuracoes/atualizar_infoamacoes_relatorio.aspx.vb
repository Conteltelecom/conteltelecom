Imports Telerik.Web.UI
Imports conteltelecom.SiteMaster

Public Class atualizar_infoamacoes_relatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridBuscaInformacoesRelatorio_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridBuscaInformacoesRelatorio.ItemCommand

        If e.CommandName = "Manutencao" Then
            Dim vl_contrato As Double
            Dim id_CL_TIPOS_CONTRATOS As Integer
            Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim codMatriz_PS_CLIENTES As String = item("codMatriz_PS_CLIENTES").Text
            Dim mesAnoRefereincia_SF_SERVICOS_FATURA As String = item("mesAnoRefereincia_SF_SERVICOS_FATURA").Text
            Dim numSequencia_SF_SERVICOS_FATURA As Int16 = item("numSequencia_SF_SERVICOS_FATURA").Text

            SqlDataSourceBuscaContratos.SelectParameters("id_PS_PESSOA").DefaultValue = codMatriz_PS_CLIENTES
            Dim dvSqlContratos As DataView = CType(SqlDataSourceBuscaContratos.Select(DataSourceSelectArguments.Empty), DataView)

            If dvSqlContratos IsNot Nothing Or dvSqlContratos.Count < 0 Then

                For Each drvSql As DataRowView In dvSqlContratos
                    If IsDBNull(drvSql("vl_contrato")) = False Then
                        vl_contrato = (drvSql("vl_contrato"))
                    End If
                    If IsDBNull(drvSql("id_CL_TIPOS_CONTRATOS")) = False Then
                        id_CL_TIPOS_CONTRATOS = (drvSql("id_CL_TIPOS_CONTRATOS"))
                    End If


                Next

            End If



            SqlDataSourceBuscalinhas.SelectParameters("codMatriz_PS_CLIENTES").DefaultValue = codMatriz_PS_CLIENTES
            Dim dvSql1 As DataView = CType(SqlDataSourceBuscalinhas.Select(DataSourceSelectArguments.Empty), DataView)

            If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then

                For Each drvSql As DataRowView In dvSql1
                    If IsDBNull(drvSql("nomeUnidade_LI_LINHAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("nomeUnidade_LI_LINHAS").DefaultValue = (drvSql("nomeUnidade_LI_LINHAS"))

                    End If

                    If IsDBNull(drvSql("codLinha_LI_LINHAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("codLinha_LI_LINHAS").DefaultValue = (drvSql("codLinha_LI_LINHAS"))
                    Else
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("codLinha_LI_LINHAS").DefaultValue = 9999

                    End If
                    If IsDBNull(drvSql("foraAnalise_LI_LINHAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("foraAnalise_LI_LINHAS").DefaultValue = (drvSql("foraAnalise_LI_LINHAS"))
                    End If
                    If IsDBNull(drvSql("perIncial_LI_LINHAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("perIncial_LI_LINHAS").DefaultValue = (drvSql("perIncial_LI_LINHAS"))
                    Else
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("perIncial_LI_LINHAS").DefaultValue = "01/2000"
                    End If
                    If IsDBNull(drvSql("id_PS_CIDADES")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_PS_CIDADES").DefaultValue = (drvSql("id_PS_CIDADES"))
                    Else
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_PS_CIDADES").DefaultValue = 1
                    End If
                    If IsDBNull(drvSql("id_OP_OPERADORAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_OP_OPERADORAS").DefaultValue = (drvSql("id_OP_OPERADORAS"))
                    End If

                    If IsDBNull(drvSql("id_LI_TIPOS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_LI_TIPOS").DefaultValue = (drvSql("id_LI_TIPOS"))
                    End If

                    If IsDBNull(drvSql("id_PS_PESSOA")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_PS_PESSOA").DefaultValue = (drvSql("id_PS_PESSOA"))
                    End If
                    If IsDBNull(drvSql("vlInicial_id_LI_TIPOS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("vlInicial_id_LI_TIPOS").DefaultValue = (drvSql("vlInicial_id_LI_TIPOS"))
                    End If
                    If IsDBNull(drvSql("id_LI_LINHAS")) = False Then
                        SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_LI_LINHAS").DefaultValue = (drvSql("id_LI_LINHAS"))
                    End If
                    SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("id_CL_TIPOS_CONTRATOS").DefaultValue = id_CL_TIPOS_CONTRATOS
                    SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("vl_contrato").DefaultValue = vl_contrato
                    SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("codMatriz_PS_CLIENTES").DefaultValue = codMatriz_PS_CLIENTES
                    SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mesAnoRefereincia_SF_SERVICOS_FATURA
                    SqlDataSourceBuscaInformacoesRelatorio.UpdateParameters("numSequencia_SF_SERVICOS_FATURA").DefaultValue = numSequencia_SF_SERVICOS_FATURA
                    SqlDataSourceBuscaInformacoesRelatorio.Update

                Next

                RadWindowManagerMsgSite.RadAlert("REGISTROS ALTERADOS COM SUCESSO", 400, Nothing, "MESNAGEM", Nothing)

            End If



        End If
    End Sub

    Private Sub RadGridBuscaInformacoesRelatorio_ItemCreated(sender As Object, e As GridItemEventArgs) Handles RadGridBuscaInformacoesRelatorio.ItemCreated

    End Sub
End Class