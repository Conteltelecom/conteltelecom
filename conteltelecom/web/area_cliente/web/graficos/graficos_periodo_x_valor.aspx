<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/web/area_cliente/web/ac_web.master" CodeBehind="graficos_periodo_x_valor.aspx.vb" Inherits="conteltelecom.graficos_periodo_x_valor" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
      <script src="../js/JavaScriptGraficos.js" type="text/javascript"></script>
     <div class="demo-container">
    <telerik:RadHtmlChart ID="RadHtmlChart1"  runat="server" DataSourceID="SqlDataSourceGraficoPerido_x_Valor" Skin="Bootstrap" Width="100%">
        <ClientEvents OnLoad="chartLoad" />
<PlotArea>
                <Series>
                    <telerik:LineSeries DataFieldY="vltotalLinha_SF_SERVICOS_FATURA" Name="VALOR DAS FATURAS">
                      <LabelsAppearance DataFormatString="R{0:C}"></LabelsAppearance>
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
                    <TitleAppearance Text="VALOR DAS FATURAS">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="GRÁFICO VALOR FATURA VS MÊS">
            </ChartTitle>
    </telerik:RadHtmlChart></div> 
<asp:SqlDataSource ID="SqlDataSourceGraficoPerido_x_Valor" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SUM(vltotalLinha_SF_SERVICOS_FATURA) AS vltotalLinha_SF_SERVICOS_FATURA, mesAnoRefereincia_SF_SERVICOS_FATURA FROM SF_SERVICOS_FATURA WHERE (codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) GROUP BY mesAnoRefereincia_SF_SERVICOS_FATURA">
    <SelectParameters>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
