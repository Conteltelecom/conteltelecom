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
        Dim mesref As String = ""
        Dim periodo As String = ""
        Dim dvSqlContratos As DataView = CType(SqlDataSourceBuscaLinhas.Select(DataSourceSelectArguments.Empty), DataView)
        Dim dtaMesref As Date

        Dim mesReferencia As String = FiltroDatas()
        dtaMesref = "01/" & mesReferencia
        Dim mesReferencia1 As String = If((dtaMesref.AddMonths(0)).Month <= 9, "0" & (dtaMesref.AddMonths(0)).Month, (dtaMesref.AddMonths(0)).Month) & "/" & (dtaMesref.AddMonths(0)).Year
        Dim mesReferencia2 As String = If((dtaMesref.AddMonths(1)).Month <= 9, "0" & (dtaMesref.AddMonths(1)).Month, (dtaMesref.AddMonths(1)).Month) & "/" & (dtaMesref.AddMonths(1)).Year
        Dim mesReferencia3 As String = If((dtaMesref.AddMonths(2)).Month <= 9, "0" & (dtaMesref.AddMonths(2)).Month, (dtaMesref.AddMonths(2)).Month) & "/" & (dtaMesref.AddMonths(2)).Year


        If dvSqlContratos IsNot Nothing Or dvSqlContratos.Count < 0 Then

            For Each drvSql As DataRowView In dvSqlContratos

                If IsDBNull(drvSql("id_LI_LINHAS")) = False And IsDBNull(drvSql("numLinha_LI_LINHAS")) = False And IsDBNull(drvSql("desc_PS_CIDADES")) = False Then
                    Try

                        SqlDataSourceValorUso.SelectParameters("id_LI_LINHAS").DefaultValue = drvSql("id_LI_LINHAS")

                        Dim dvSqlLinhas As DataView = CType(SqlDataSourceValorUso.Select(DataSourceSelectArguments.Empty), DataView)
                        If (dvSqlLinhas IsNot Nothing Or dvSqlLinhas.Count < 0) And dvSqlLinhas.Count > 0 Then
                            For Each drvSqlLinhas As DataRowView In dvSqlLinhas
                                mesref = drvSqlLinhas("mesAnoRefereincia_SF_SERVICOS_FATURA")
                                If IsDBNull(drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO")) = False And IsDBNull(drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO")) = False Then
                                    periodo = drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO") & " á " & drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO")
                                End If

                                If IsDBNull(drvSqlLinhas("vlUso_LI_CAD_PROGRAMACAO")) = False Then
                                    '(49) 3623-0093
                                    AddValores(drvSql("numLinha_LI_LINHAS"),
                                              drvSql("desc_PS_CIDADES"),
                                              drvSql("nomeUnidade_LI_LINHAS"),
                                              1,
                                              drvSqlLinhas("dtLdn_LI_CAD_PROGRAMACAO"),
                                              periodo,
                                               calculaValorMes(drvSqlLinhas("vlUso_LI_CAD_PROGRAMACAO"), drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO"), drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO"), CDate(mesref), drvSqlLinhas("dtLdn_LI_CAD_PROGRAMACAO"), drvSql("id_LI_LINHAS"), dtaMesref, 0, 1),
                                                           calculaValorMes(drvSqlLinhas("vlUso_LI_CAD_PROGRAMACAO"), CDate(drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO")).AddMonths(1), CDate(drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO")).AddMonths(1), CDate(mesref).AddMonths(1), drvSqlLinhas("dtLdn_LI_CAD_PROGRAMACAO"), drvSql("id_LI_LINHAS"), dtaMesref, 1, 1),
                                               0,
                                               buscaUsoMes(1, drvSql("id_LI_LINHAS"), mesReferencia),
                                              mesReferencia,
                                              mesReferencia1,
                                              mesReferencia2,
                                              mesReferencia3,
                                              drvSql("id_LI_LINHAS"))

                                Else
                                    AddValores(drvSql("numLinha_LI_LINHAS"),
                                              drvSql("desc_PS_CIDADES"),
                                              drvSql("nomeUnidade_LI_LINHAS"),
                                              1,
                                              String.Empty,
                                              periodo, 0, 0, 0, buscaUsoMes(1, drvSql("id_LI_LINHAS"), mesReferencia),
                                              String.Empty,
                                              mesReferencia1,
                                              mesReferencia2,
                                              mesReferencia3,
                                              drvSql("id_LI_LINHAS"))

                                End If

                                If IsDBNull(drvSqlLinhas("vlUsomoVEL_LI_CAD_PROGRAMACAO")) = False Then

                                    AddValores(drvSql("numLinha_LI_LINHAS"),
                                              drvSql("desc_PS_CIDADES"),
                                              drvSql("nomeUnidade_LI_LINHAS"),
                                              2,
                                              drvSqlLinhas("dtMovel_LI_CAD_PROGRAMACAO"),
                                              periodo,
                                               calculaValorMes(drvSqlLinhas("vlUsomoVEL_LI_CAD_PROGRAMACAO"), drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO"), drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO"), CDate(mesref), drvSqlLinhas("dtLdn_LI_CAD_PROGRAMACAO"), drvSql("id_LI_LINHAS"), dtaMesref, 0, 1),
                                                           calculaValorMes(drvSqlLinhas("vlUsomoVEL_LI_CAD_PROGRAMACAO"), CDate(drvSqlLinhas("dtTarifIni_LI_CAD_PROGRAMACAO")).AddMonths(1), CDate(drvSqlLinhas("dtTarifFim_LI_CAD_PROGRAMACAO")).AddMonths(1), CDate(mesref).AddMonths(1), drvSqlLinhas("dtLdn_LI_CAD_PROGRAMACAO"), drvSql("id_LI_LINHAS"), dtaMesref, 1, 1),
                                               0,
                                               buscaUsoMes(2, drvSql("id_LI_LINHAS"), mesReferencia),
                                              mesReferencia,
                                              mesReferencia1,
                                              mesReferencia2,
                                              mesReferencia3,
                                              drvSql("id_LI_LINHAS"))

                                Else
                                    AddValores(drvSql("numLinha_LI_LINHAS"),
                                              drvSql("desc_PS_CIDADES"),
                                              drvSql("nomeUnidade_LI_LINHAS"),
                                              2,
                                              "01/01/1900",
                                              periodo, 0, 0, 0, buscaUsoMes(2, drvSql("id_LI_LINHAS"), mesReferencia),
                                              String.Empty,
                                              mesReferencia1,
                                              mesReferencia2,
                                              mesReferencia3,
                                              drvSql("id_LI_LINHAS"))
                                End If







                            Next

                        Else

                            For x = 1 To 2

                                Dim Vlvalor As Decimal = buscaUsoMes(x, drvSql("id_LI_LINHAS"), mesReferencia)
                                periodo = ""
                                AddValores(drvSql("numLinha_LI_LINHAS"),
                                           drvSql("desc_PS_CIDADES"),
                                           drvSql("nomeUnidade_LI_LINHAS"),
                                           x,
                                               "01/01/1900",
                                           periodo, Vlvalor, Vlvalor, Vlvalor, Vlvalor,
                                           String.Empty,
                                           mesReferencia1,
                                           mesReferencia2,
                                           mesReferencia3,
                                           drvSql("id_LI_LINHAS"))
                            Next

                        End If







                    Catch ex As Exception

                    End Try




                End If




            Next


        End If





    End Sub






    Sub AddValores(ByVal numLinha_LI_LINHAS As String, ByVal desc_PS_CIDADES As String,
       ByVal nomeUnidade_LI_LINHAS As String, ByVal id_SF_TIPO_USO_CATEGORIAS As Integer, ByVal dt_LI_CAD_PROGRAMACAO As Date,
       ByVal periodo As String, ByVal mes01 As Decimal, ByVal mes02 As Decimal, ByVal mes03 As Decimal, ByVal vlUso_SF_VL_USO As Decimal,
           ByVal mesReferencia As String, ByVal mesReferencia1 As String, ByVal mesReferencia2 As String, ByVal mesReferencia3 As String, ByVal id_LI_LINHA As Integer)
        Dim ClsValidacoes As New Validacoes

        listaOc.Add(New ListRelProjecao(ClsValidacoes.TelefoneFormat2(numLinha_LI_LINHAS.ToString.TrimEnd),
                                                     desc_PS_CIDADES.ToString.TrimEnd,
                                                    nomeUnidade_LI_LINHAS.ToString.TrimEnd,
                                                    id_SF_TIPO_USO_CATEGORIAS,
                                                    dt_LI_CAD_PROGRAMACAO,
                                                    periodo,
                                                    mes01,
                                                    mes02,
                                                    mes03,
                                                    vlUso_SF_VL_USO, 1, mesReferencia, mesReferencia1, mesReferencia2, mesReferencia3, id_LI_LINHA))



    End Sub

    Function calculaValorMes(ByVal usoInicial As Decimal, ByVal dtaPerIni_SF_SERVICOS_FATURA As Date, ByVal dtaPerFim_SF_SERVICOS_FATURA As Date,
                            ByVal Mesatual As String, ByVal dtaProgramacao As Date, ByRef id_LI_LINHAS As Integer, ByVal dtaMesref As String, ByVal tipo As Integer, ByVal id_categoriaUso As Integer) As Decimal
        Try



            Dim valor As Decimal
            Dim dias As Integer = DateDiff(DateInterval.Day, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA)
            Dim Validos As Integer = DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA, dtaProgramacao)
            Dim nummes As Integer = DateDiff(DateInterval.Month, CDate(Mesatual), CDate(dtaMesref))



            If tipo = 0 Then
                Select Case nummes
                    Case 0
                        valor = usoInicial
                        Return valor

                    Case 1

                        valor = (usoInicial / dias) * Validos
                        If valor > usoInicial Then
                            Return usoInicial
                        Else
                            Return valor

                        End If


                    Case -1
                        Return buscaUsoMes(id_categoriaUso, id_LI_LINHAS, dtaMesref)
                    Case Else
                        If nummes > 1 Then
                            Return 0
                        End If
                        If nummes > -1 Then
                            Return buscaUsoMes(id_categoriaUso, id_LI_LINHAS, dtaMesref)
                        End If
                End Select


            Else

                Select Case nummes

                    Case 0

                        Return 0


                    Case 1
                        Return 0

                    Case -1
                        valor = (usoInicial / dias) * (dias - Validos)
                        Return valor
                    Case Else
                        If nummes > 1 Then
                            Return 0
                        End If
                        If nummes > -1 Then
                            If tipo = 0 Then
                                Return 0
                            Else
                                Return buscaUsoMes(1, id_LI_LINHAS, dtaMesref)
                            End If

                        End If

                End Select



            End If



        Catch ex As Exception
            Return 0
        End Try




        'ElseIf dtaPerFim_SF_SERVICOS_FATURA.Month < Mesatual Then

        '    If DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA, dtaProgramacao) <= 30 Then
        '        Dim dias As Integer = DateDiff(DateInterval.Day, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA)
        '        Dim Validos As Integer = DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA, dtaProgramacao)
        '        valor = usoInicial - (usoInicial / dias) * Validos
        '    Else
        '        valor = 0

        '    End If

        'Else


        '    If DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA, dtaProgramacao) <= 30 Then
        '        Dim dias As Integer = DateDiff(DateInterval.Day, dtaPerIni_SF_SERVICOS_FATURA, dtaPerFim_SF_SERVICOS_FATURA)
        '        Dim Validos As Integer = DateDiff(DateInterval.Day, dtaPerFim_SF_SERVICOS_FATURA, dtaProgramacao)
        '        valor = -(usoInicial / dias) * Validos
        '    Else
        '        valor = 0

        '    End If




        'End If





        Return 0

    End Function




    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs) Handles RadImageButtonGerar.Click
        buscalinhas()
        Dim NovoRepDs As New ReportDataSource("DataSetProjecao", listaOc)

        ReportViewer1.LocalReport.DataSources.Clear()
        ReportViewer1.LocalReport.DataSources.Add(NovoRepDs)
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Function FiltroDatas() As String

        Return If(RadDropDownListMes.SelectedValue <= 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue


    End Function


    Function buscaUsoMes(ByVal id_SF_TIPO_USO_CATEGORIAS As Integer, ByVal id_LI_LINHAS As Integer, ByVal mesAnoRefereincia_SF_SERVICOS_FATURA As String) As Decimal
        Try
            SqlDataSourceMes.SelectParameters("id_SF_TIPO_USO_CATEGORIAS").DefaultValue = id_SF_TIPO_USO_CATEGORIAS
            SqlDataSourceMes.SelectParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHAS
            SqlDataSourceMes.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mesAnoRefereincia_SF_SERVICOS_FATURA
            Dim SqlDataSourceMes_ As DataView = CType(SqlDataSourceMes.Select(DataSourceSelectArguments.Empty), DataView)
            If SqlDataSourceMes_ IsNot Nothing Or SqlDataSourceMes_.Count < 0 Then

                For Each drvSql As DataRowView In SqlDataSourceMes_
                    If IsDBNull(drvSql("vlUso_SF_VL_USO")) = False Then
                        Return drvSql("vlUso_SF_VL_USO")
                    Else

                        Return 0
                    End If


                Next
            Else

                Return 0
            End If

        Catch ex As Exception
            Return 0
        End Try
        Return 0
    End Function
End Class