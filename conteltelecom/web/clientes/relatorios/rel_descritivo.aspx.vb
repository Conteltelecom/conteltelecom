Imports Telerik.Web.UI
Imports System.Windows.Forms
Imports conteltelecom.Validacoes
Public Class rel_descritivo
    Inherits System.Web.UI.Page
    Dim listaOc As List(Of RelDescritivo)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If IsPostBack = False Then

            If IsNothing(Request.QueryString("descritivoPorLinha")) = False Then


                MontaDescritivo()



            Else

                If IsNothing(Request.QueryString("id_PS_PESSOA")) = True Then
                    Session("codMatriz_PS_CLIENTES") = ""
                Else

                    RadDropDownListMes.SelectedValue = Date.Today.Month
                    RadDropDownListAno.SelectedValue = Date.Today.Year
                    Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
                    Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
                    RadAutoCompleteBoxBuscaMatriz.Visible = False
                    Label2.Visible = False
                    ' RadImageButtonGerar_Click(RadImageButtonGerar, EventArgs.Empty)
                    ' ReportViewer1.LocalReport.Refresh()

                End If


            End If







        End If
    End Sub
    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs)

        If IsNothing(Request.QueryString("id_PS_PESSOA")) = True Then
            If IsNothing(RadAutoCompleteBoxBuscaMatriz) = False Then
                For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxBuscaMatriz.Entries
                    If RadAutoCompleteBoxBuscaMatriz.Text = entry.Text Then
                        Session("codMatriz_PS_CLIENTES") = entry.Value
                    End If
                Next
            End If
        Else
            Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
        End If
        Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue

        ReportViewer1.LocalReport.Refresh()

    End Sub




    Protected Sub RadImageButtonGerarWord_Click(sender As Object, e As ImageButtonClickEventArgs) Handles RadImageButtonGerarWord.Click
        MontaDescritivo()
    End Sub

    Sub MontaDescritivo()

        Dim ClsValidacoes As New Validacoes
        Dim sqldatasetBusca As New SqlDataSource
        If IsNothing(Request.QueryString("descritivoPorLinha")) = False Then

            If Request.QueryString("descritivoPorLinha") = "1" Then
                sqldatasetBusca = SqlDataSourceDescritivoPorLinhas
                Session("codMatriz_PS_CLIENTES") = Request.QueryString("codMatriz_PS_CLIENTES")
                Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA")
                sqldatasetBusca.SelectParameters("id_LI_LINHAS").DefaultValue = Request.QueryString("id_LI_LINHAS")
            Else
                sqldatasetBusca = SqlDataSourceBusca
                Session("codMatriz_PS_CLIENTES") = Request.QueryString("codMatriz_PS_CLIENTES")
                Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA")
            End If

        Else
            sqldatasetBusca = SqlDataSourceBusca
            Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
        End If


        Dim nomeFantasia As String = ""

        Dim Formatado As String
        Dim Agrupamento As New List(Of Integer)()
        Dim NomeAgrupamento As String
        Dim RazaoSocial As String
        Dim Cnpj As String
        Dim Cidades As String
        Dim CodLinha As String
        Dim NumLInha As String
        Dim DescricaoServico As String = ""
        Dim Ordem As String
        Dim Valor2 As Decimal
        Dim ContaRetificada As Integer
        Dim tipoinfo As Integer
        Dim Id_SF_VL_SERVICO As Integer

        sqldatasetBusca.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = Session("mesAnoRefereincia_SF_SERVICOS_FATURA")
        sqldatasetBusca.SelectParameters("codMatriz_PS_CLIENTES").DefaultValue = Session("codMatriz_PS_CLIENTES")

        Dim dvSql As DataView = CType(sqldatasetBusca.Select(DataSourceSelectArguments.Empty), DataView)
        listaOc = New List(Of RelDescritivo)()
        For Each q As DataRowView In dvSql
            nomeFantasia = q("desc_PS_PESSOA").ToString.TrimEnd
            If Not Agrupamento.Contains(q("ordem_CL_PLANOS_CLIENTE")) Then

                Agrupamento.Add(q("ordem_CL_PLANOS_CLIENTE"))
            End If
            Valor2 = CDec(q("vl_SF_VL_SERVICO")) - CDec(q("vlDesconto_SF_VL_SERVICO"))

            Cnpj = q("CNPJ_PS_JURIDICA").ToString.TrimEnd
            Formatado = Validacoes.CNPJFormat(CNPJ)
            NomeAgrupamento = q("desc_CL_PLANOS_CLIENTE").ToString.TrimEnd & " " & q("desc_OP_PLANOS").ToString.TrimEnd
            RazaoSocial = q("razaosocial_PS_JURIDICA").ToString.TrimEnd
            Cnpj = "Cnpj : " & Formatado
            ContaRetificada = q("contaRetificada_SF_SERVICOS_FATURA")
            Cidades = "CIDADE: " & q("desc_PS_CIDADES").ToString.TrimEnd
            CodLinha = q("codLinha_LI_LINHAS").ToString.TrimEnd
            NumLInha = q("numLinha_LI_LINHAS").ToString.TrimEnd
            tipoinfo = q("tipoinfo")
            Ordem = q("ordem_CL_PLANOS_CLIENTE")
            Id_SF_VL_SERVICO = q("id_SF_VL_SERVICO")



            '   Tráfego Fronteiriço OI -0 min — R$ 0, 0(se não tiver valor nenhum não precisa aparecer o serviço)
            DescricaoServico = q("desc_SF_VL_SERVICO") & " "
                If q("tipoinfo") = 0 Then
                    If (CInt(q("qtDias_SF_VL_SERVICO")) < 30 And CInt(q("qtDias_SF_VL_SERVICO")) > 0) = True Then
                        DescricaoServico = DescricaoServico & q("qtDias_SF_VL_SERVICO") & " Dias"
                    End If

                Else
                    If IsNothing(q("minutos_SF_VL_USO")) = False Then

                        Dim Min As Integer
                        Min = SomenteNumeros(q("minutos_SF_VL_USO"))

                    'If CInt(Min) > 0 Then   removido regra para minutos locais
                    DescricaoServico = DescricaoServico & q("minutos_SF_VL_USO") & " Min"
                    'End If
                End If
                End If
                DescricaoServico = DescricaoServico & "— R$ " & CDec(q("vl_SF_VL_SERVICO")) - CDec(q("vlDesconto_SF_VL_SERVICO"))



            listaOc.Add(New RelDescritivo(NomeAgrupamento, RazaoSocial,
             Cnpj, Cidades, CodLinha, NumLInha, DescricaoServico, Ordem,
             Valor2, ContaRetificada, tipoinfo, Id_SF_VL_SERVICO))


        Next
        listaOc.Sort((Function(p1 As RelDescritivo, p2 As RelDescritivo) p1.Ordem.CompareTo(p2.Ordem)))
        Agrupamento.Sort()

        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.ClearContent()
        HttpContext.Current.Response.ClearHeaders()
        HttpContext.Current.Response.Buffer = True
        HttpContext.Current.Response.ContentType = "application/msword"
        HttpContext.Current.Response.Write("<html xmlns=""http:  //www.w3.org/1999/xhtml"" lang=""pt-br"" xml:lang=""pt-br"">")
        'HttpContext.Current.Response.AddHeader("Content-Disposition","attachment;filename=teste_gera.doc")

        HttpContext.Current.Response.AddHeader("content-disposition", "inline; filename=RELATÓRIO DESCRITIVO.doc")
        HttpContext.Current.Response.Charset = "utf-8"
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("Windows-1252")
        ' HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Verdana;'>")


        ' HttpContext.Current.Response.Clear()
        'HttpContext.Current.Response.Charset = ""

        '        HttpContext.Current.Response.ContentType = "application/msword"
        '       Dim strNomeArquivo As String = "RelatórioDescritivo" & ".doc"
        '      HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" & strNomeArquivo)
        ' Dim strHTMLContent As StringBuilder = New StringBuilder()
        HttpContext.Current.Response.Write("<font style='font-size:11.0pt; font-family:Calibri;'>")
        HttpContext.Current.Response.Write("<STYLE TYPE ='text/css' >.blue {background-color: #FFD700;font-size:11.0pt; font-family:Calibri; }.silver {background-color: #D8D8D8; ;font-size:11.0pt}

.azul{
color: #0000FF;
font-size:12.0pt; font-family:Calibri;
}
.Font10{

font-size:10.0pt; font-family:Calibri;
}
</STYLE>")

        HttpContext.Current.Response.Write("<b> <font CLASS=azul'>" & nomeFantasia & " — DESCRITIVO ".ToString() & MonthName(CDate("01/" & (Session("mesAnoRefereincia_SF_SERVICOS_FATURA"))).Month, False).ToUpper & "/" & CDate("01/" & (Session("mesAnoRefereincia_SF_SERVICOS_FATURA"))).Year & "</font></b>")
        Dim num As Integer
        Dim contador As Integer = 0
        Dim controle As Integer
        Dim linhaAtual As String
        Dim codlinhaAtual As String
        Dim TotalGeral As Decimal
        Dim Valor As Decimal




        For Each num In Agrupamento

            controle = 0
            Dim listaFiltrada1 As List(Of RelDescritivo) = listaOc.FindAll(Function(p) p.Ordem = num)

            While listaFiltrada1.Count > 0


                For Each p1 As RelDescritivo In listaFiltrada1

                    If controle = 0 Then

                        HttpContext.Current.Response.Write("<p><b><font CLASS='silver'>" & Server.HtmlDecode(p1.NomeAgrupamento.ToString()) & "</font></b> <br/>")


                        HttpContext.Current.Response.Write("<font CLASS=Font10'>" & p1.Cnpj & "</font> <br/>")
                        HttpContext.Current.Response.Write("<font CLASS=Font10'>" & p1.Cidades.ToString() & "</font> <br/><br/>")

                        controle = 1
                    End If

                    Dim listaFiltrada As List(Of RelDescritivo) = listaFiltrada1.FindAll(Function(p) p.CodLinha = p1.CodLinha)

                    listaFiltrada.Sort((Function(p5 As RelDescritivo, p6 As RelDescritivo) p5.tipoinfo.CompareTo(p6.tipoinfo) And p5.Id_SF_VL_SERVICO.CompareTo(p6.Id_SF_VL_SERVICO)))

                    For Each p2 As RelDescritivo In listaFiltrada

                        If contador = 0 Then

                            codlinhaAtual = p2.CodLinha.ToString()
                            linhaAtual = Trim(ClsValidacoes.TelefoneFormat2(p2.NumLInha.ToString))

                            If SomenteNumeros(codlinhaAtual.ToString.Trim) <> SomenteNumeros(linhaAtual.ToString.Trim) Then

                                HttpContext.Current.Response.Write("<b><font CLASS='blue'>" & p2.CodLinha.ToString() & If(p2.ContaRetificada = 1, " CONTA RETIFICADA", "") & "</font></b> <br/>")
                                HttpContext.Current.Response.Write("<b>" & Trim(ClsValidacoes.TelefoneFormat2(p2.NumLInha.ToString())) & "</b><br/>")
                            Else
                                HttpContext.Current.Response.Write("<b><font CLASS='blue'>" & p2.CodLinha.ToString() & If(p2.ContaRetificada = 1, " CONTA RETIFICADA", "") & "</font></b> <br/>")
                            End If
                            contador = 1
                            If p2.Valor < 0 Then
                                If p2.DescricaoServico.ToString() <> "" Then
                                    HttpContext.Current.Response.Write("<font color=red>" & p2.DescricaoServico.ToString() & "</font> <br/>")
                                End If

                            Else
                                If p2.DescricaoServico.ToString() <> "" Then
                                    HttpContext.Current.Response.Write(p2.DescricaoServico.ToString() & "<br/>")
                                End If
                            End If


                                Else

                            If p2.Valor < 0 Then
                                If p2.DescricaoServico.ToString() <> "" Then
                                    HttpContext.Current.Response.Write("<font color=red>" & p2.DescricaoServico.ToString() & "</font> <br/>")
                                End If
                            Else
                                If p2.DescricaoServico.ToString() <> "" Then

                                    HttpContext.Current.Response.Write(p2.DescricaoServico.ToString() & "<br/>")
                                End If
                            End If

                            End If
                        valor = valor + p2.Valor
                        Dim removerLista As List(Of RelDescritivo) = listaFiltrada1
                        removerLista.RemoveAll(Function(p As RelDescritivo) p.NumLInha = p2.NumLInha And p.CodLinha = p2.CodLinha)

                    Next
                    contador = 0
                    HttpContext.Current.Response.Write("".ToString())
                    HttpContext.Current.Response.Write("<b><font size=7.0pt>TOTAL — R$ ".ToString() & valor & "</font></b>")
                    HttpContext.Current.Response.Write("".ToString() & " <br/>")
                    HttpContext.Current.Response.Write("".ToString() & " <br/>")
                    TotalGeral = TotalGeral + Valor
                    Valor = 0
                    Exit For
                Next
            End While

        Next


        HttpContext.Current.Response.[End]()
        HttpContext.Current.Response.Flush()

    End Sub
    Private Sub ExibirResultado(ByVal lista As List(Of RelDescritivo), ByVal info As String)
        For Each p As RelDescritivo In lista

        Next

    End Sub





End Class