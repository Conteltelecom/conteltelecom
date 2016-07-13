Imports System.Windows.Forms
Imports Microsoft.Reporting.WebForms

Public Class rel_projecao
    Inherits System.Web.UI.Page
    Dim listaOc As List(Of ListRelProjecao)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            RadDropDownListMes.SelectedValue = Date.Today.Month
            RadDropDownListAno.SelectedValue = Date.Today.Year
            buscalinhas()
            Dim NovoRepDs As New ReportDataSource("DataSetProjecao", listaOc)

            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(NovoRepDs)
            ReportViewer1.LocalReport.Refresh()
        End If



    End Sub



    Sub buscalinhas()
        FiltroDatas()
        listaOc = New List(Of ListRelProjecao)()


        Dim dvSqlContratos As DataView = CType(SqlDataSourceBuscaLinhas.Select(DataSourceSelectArguments.Empty), DataView)


        If dvSqlContratos IsNot Nothing Or dvSqlContratos.Count < 0 Then

            For Each drvSql As DataRowView In dvSqlContratos

                If IsDBNull(drvSql("id_LI_LINHAS")) = False And IsDBNull(drvSql("numLinha_LI_LINHAS")) = False And IsDBNull(drvSql("desc_PS_CIDADES")) = False Then
                    Try
                        BuscaUso(drvSql("id_LI_LINHAS"), drvSql("numLinha_LI_LINHAS"), drvSql("nomeUnidade_LI_LINHAS"), drvSql("desc_PS_CIDADES"))
                    Catch ex As Exception

                    End Try




                End If




            Next


        End If





    End Sub


    Sub BuscaUso(ByVal id_LI_LINHAS As Integer, ByVal numLinha_LI_LINHAS As String, ByVal nomeUnidade_LI_LINHAS As String, ByVal desc_PS_CIDADES As String)




        Dim dtMovel_LI_CAD_PROGRAMACAO As Date
        Dim dtLdn_LI_CAD_PROGRAMACAO As Date
        Dim dt_LI_CAD_PROGRAMACAO As Date
        Dim dtaPerIni_SF_SERVICOS_FATURA As Date
        Dim dtaPerFim_SF_SERVICOS_FATURA As Date
        Dim periodo As String = ""
        Dim mes01 As Decimal
        Dim mes02 As Decimal
        Dim mes03 As Decimal
        Dim vlUso_SF_VL_USO As Decimal
        Dim possuiUso As Integer = 0
        Dim mesReferencia As String = ""
        Dim mesReferencia1 As String = ""
        Dim mesReferencia2 As String = ""
        Dim mesReferencia3 As String = ""
        Dim ClsValidacoes As New Validacoes
        SqlDataSourceValorUso.SelectParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHAS
        BuscaMes(dtMovel_LI_CAD_PROGRAMACAO, dtLdn_LI_CAD_PROGRAMACAO, id_LI_LINHAS)
        For x = 1 To 2
            SqlDataSourceValorUso.SelectParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHAS
            SqlDataSourceValorUso.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = FiltroDatas()
            SqlDataSourceValorUso.SelectParameters("id_SF_TIPO_USO_CATEGORIAS").DefaultValue = x
            Dim dvSqlContratos As DataView = CType(SqlDataSourceValorUso.Select(DataSourceSelectArguments.Empty), DataView)
            If (dvSqlContratos IsNot Nothing Or dvSqlContratos.Count < 0) And dvSqlContratos.Count > 0 Then
                For Each drvSql As DataRowView In dvSqlContratos
                    If (drvSql("id_SF_TIPO_USO_CATEGORIAS")) = 1 Then

                        dt_LI_CAD_PROGRAMACAO = dtLdn_LI_CAD_PROGRAMACAO
                    Else
                        dt_LI_CAD_PROGRAMACAO = dtMovel_LI_CAD_PROGRAMACAO
                    End If
                    If IsDBNull(drvSql("vlUso_SF_VL_USO")) = False Then

                        vlUso_SF_VL_USO = drvSql("vlUso_SF_VL_USO")
                    End If
                    If CInt(dt_LI_CAD_PROGRAMACAO.Year) < 2010 Then

                        mes01 = vlUso_SF_VL_USO
                        mes02 = vlUso_SF_VL_USO
                        mes03 = vlUso_SF_VL_USO

                    Else


                        If IsDBNull(drvSql("dtaPerIni_SF_SERVICOS_FATURA")) = False Then
                            periodo = drvSql("dtaPerIni_SF_SERVICOS_FATURA") & " á " & drvSql("dtaPerFim_SF_SERVICOS_FATURA")

                            dtaPerIni_SF_SERVICOS_FATURA = drvSql("dtaPerIni_SF_SERVICOS_FATURA")
                            dtaPerFim_SF_SERVICOS_FATURA = drvSql("dtaPerFim_SF_SERVICOS_FATURA")


                            mes01 = calculaValorMes(vlUso_SF_VL_USO, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA, 0, dt_LI_CAD_PROGRAMACAO)
                            mes02 = calculaValorMes(vlUso_SF_VL_USO, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA, 1, dt_LI_CAD_PROGRAMACAO)
                            mes03 = calculaValorMes(vlUso_SF_VL_USO, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA, 2, dt_LI_CAD_PROGRAMACAO)
                        End If

                    End If


                    mesReferencia = FiltroDatas()
                    mesReferencia1 = If((dtaPerFim_SF_SERVICOS_FATURA.AddMonths(1)).Month < 10, "0" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(1)).Month, (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(1)).Month) & "/" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(1)).Year
                    mesReferencia2 = If((dtaPerFim_SF_SERVICOS_FATURA.AddMonths(1)).Month < 10, "0" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(2)).Month, (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(2)).Month) & "/" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(2)).Year
                    mesReferencia3 = If((dtaPerFim_SF_SERVICOS_FATURA.AddMonths(2)).Month < 10, "0" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(3)).Month, (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(3)).Month) & "/" & (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(3)).Year
                    listaOc.Add(New ListRelProjecao(ClsValidacoes.TelefoneFormat2(numLinha_LI_LINHAS.ToString.TrimEnd),
                                                             desc_PS_CIDADES.ToString.TrimEnd,
                                                            nomeUnidade_LI_LINHAS.ToString.TrimEnd,
                                                             drvSql("id_SF_TIPO_USO_CATEGORIAS"),
                                                            dt_LI_CAD_PROGRAMACAO,
                                                            periodo,
                                                            mes01,
                                                            mes02,
                                                            mes03,
                                                            vlUso_SF_VL_USO, 1, mesReferencia, mesReferencia1, mesReferencia2, mesReferencia3))


                Next

            Else
                Dim dtaMesref As Date
                mesReferencia = FiltroDatas()
                dtaMesref = "01/" & mesReferencia
                mesReferencia1 = If((dtaMesref.AddMonths(1)).Month < 10, "0" & (dtaMesref.AddMonths(1)).Month, (dtaMesref.AddMonths(1)).Month) & "/" & (dtaMesref.AddMonths(1)).Year
                mesReferencia2 = If((dtaMesref.AddMonths(2)).Month < 10, "0" & (dtaMesref.AddMonths(2)).Month, (dtaMesref.AddMonths(2)).Month) & "/" & (dtaMesref.AddMonths(2)).Year
                mesReferencia3 = If((dtaMesref.AddMonths(2)).Month < 10, "0" & (dtaMesref.AddMonths(2)).Month, (dtaMesref.AddMonths(3)).Month) & "/" & (dtaMesref.AddMonths(3)).Year
                listaOc.Add(New ListRelProjecao(ClsValidacoes.TelefoneFormat2(numLinha_LI_LINHAS.ToString.TrimEnd),
                                                           desc_PS_CIDADES.ToString.TrimEnd,
                                                          nomeUnidade_LI_LINHAS.ToString.TrimEnd,
                                                           x,
                                                          dt_LI_CAD_PROGRAMACAO,
                                                          periodo,
                                                          mes01,
                                                          mes02,
                                                          mes03,
                                                          vlUso_SF_VL_USO, 1, mesReferencia, mesReferencia1, mesReferencia2, mesReferencia3))


            End If

        Next








    End Sub



    Function calculaValorMes(ByVal usoInicial As Decimal, ByVal dtaPerIni_SF_SERVICOS_FATURA As Date, ByVal dtaPerFim_SF_SERVICOS_FATURA As Date,
                            ByVal qtmeses As Integer, ByVal dtaProgramacao As Date) As Decimal

        If dtaProgramacao > dtaPerFim_SF_SERVICOS_FATURA Then
            Return usoInicial
        Else


            Dim valor As Decimal
            Dim qtdiasPerido As Integer = DateDiff(DateInterval.Day, dtaPerIni_SF_SERVICOS_FATURA.AddMonths(qtmeses), (dtaPerFim_SF_SERVICOS_FATURA.AddMonths(qtmeses)))
            Dim qtdiasUso As Integer = DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA.AddMonths(qtmeses), dtaProgramacao)

            Dim valorUsoDiario As Decimal = usoInicial / qtdiasPerido

           
            valor = usoInicial + valorUsoDiario * qtdiasUso


            If valor < 0 Then
                valor = 0
            End If

            Return valor
        End If
    End Function


    Sub BuscaMes(ByRef dtMovel_LI_CAD_PROGRAMACAO As Date, ByRef dtLdn_LI_CAD_PROGRAMACAO As Date, ByVal id_LI_LINHAS As Integer)

        SqlDataSourceMes.SelectParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHAS

        Dim dvSqlMes As DataView = CType(SqlDataSourceMes.Select(DataSourceSelectArguments.Empty), DataView)

        If dvSqlMes IsNot Nothing Or dvSqlMes.Count < 0 Then

            For Each drvSql As DataRowView In dvSqlMes
                If IsDBNull(drvSql("dtMovel_LI_CAD_PROGRAMACAO")) = False Then
                    dtMovel_LI_CAD_PROGRAMACAO = drvSql("dtMovel_LI_CAD_PROGRAMACAO")


                End If
                If IsDBNull(drvSql("dtLdn_LI_CAD_PROGRAMACAO")) = False Then
                    dtLdn_LI_CAD_PROGRAMACAO = drvSql("dtLdn_LI_CAD_PROGRAMACAO")


                End If

            Next



        End If



    End Sub

    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs) Handles RadImageButtonGerar.Click
        buscalinhas()
        Dim NovoRepDs As New ReportDataSource("DataSetProjecao", listaOc)

        ReportViewer1.LocalReport.DataSources.Clear()
        ReportViewer1.LocalReport.DataSources.Add(NovoRepDs)
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Function FiltroDatas() As String

        Return If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue


    End Function
End Class