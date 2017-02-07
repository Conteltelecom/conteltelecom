<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/web/area_cliente/web/ac_web.master" CodeBehind="grafico_reducao.aspx.vb" Inherits="conteltelecom.grafico_reducao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
    <script src="../js/JavaScriptGraficos.js" type="text/javascript"></script>
     <div class="demo-container">
    <telerik:RadHtmlChart ID="RadHtmlChart1"  runat="server" DataSourceID="SqlDataSourceGraficoPerido_x_Valor" Skin="Bootstrap" Width="100%">
        <ClientEvents OnLoad="chartLoad" />
<PlotArea>
                <Series>
                    <telerik:LineSeries DataFieldY="vltotalLinha_SF_SERVICOS_FATURA" Name="VALOR DA REDUÇÃO">
                      <LabelsAppearance DataFormatString="R{0:C}" ></LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:LineSeries>
                </Series>
                <XAxis DataLabelsField="mesAnoRefereincia_SF_SERVICOS_FATURA" >
                    <LabelsAppearance RotationAngle="75">
                       
                    </LabelsAppearance>
                    <TitleAppearance Text="MÊS/ANO">
                    </TitleAppearance>
                </XAxis>
                <YAxis >
                    <LabelsAppearance DataFormatString="R{0:C}"  ></LabelsAppearance>
                    <TitleAppearance Text="VALOR DE REDUÇÃO">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="GRÁFICO REDUÇÃO VS MÊS">
            </ChartTitle>
    </telerik:RadHtmlChart></div> 
<asp:SqlDataSource ID="SqlDataSourceGraficoPerido_x_Valor" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT CASE WHEN SUM(vlReducaoSF_SERVICOS_FATURA) &lt; '0' THEN '0' ELSE SUM(vlReducaoSF_SERVICOS_FATURA) END AS vltotalLinha_SF_SERVICOS_FATURA, mesAnoRefereincia_SF_SERVICOS_FATURA FROM SF_SERVICOS_FATURA WHERE (codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (foraAnalise_LI_LINHAS = 0) GROUP BY mesAnoRefereincia_SF_SERVICOS_FATURA, codMatriz_PS_CLIENTES, foraAnalise_LI_LINHAS, perIncial_LI_LINHAS ORDER BY mesAnoRefereincia_SF_SERVICOS_FATURA">
    <SelectParameters>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
