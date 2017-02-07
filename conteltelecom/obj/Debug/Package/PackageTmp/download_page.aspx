<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="download_page.aspx.vb" Inherits="conteltelecom.download_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceMesAno" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSourceMesAno">
                <Columns>
                    <telerik:GridBoundColumn DataField="DataFildParentId" FilterControlAltText="Filter DataFildParentId column" HeaderText="DataFildParentId" ReadOnly="True" SortExpression="DataFildParentId" UniqueName="DataFildParentId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MES_ANO" FilterControlAltText="Filter MES_ANO column" HeaderText="MES_ANO" ReadOnly="True" SortExpression="MES_ANO" UniqueName="MES_ANO">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        
        <asp:SqlDataSource ID="SqlDataSourceMesAno" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT RIGHT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 4) AS DataFildParentId, LEFT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 2) AS MES_ANO FROM SF_LEITURA_FATURA INNER JOIN LI_LINHAS ON SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA = LI_LINHAS.numContrato_LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) UNION SELECT DISTINCT RIGHT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 4) AS DataFildParentId, RIGHT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 4) AS MES_ANO FROM SF_LEITURA_FATURA AS SF_LEITURA_FATURA_1 INNER JOIN LI_LINHAS AS LI_LINHAS_1 ON SF_LEITURA_FATURA_1.cotAgrupador_SF_LEITURA_FATURA = LI_LINHAS_1.numContrato_LI_LINHAS INNER JOIN PS_CLIENTES AS PS_CLIENTES_1 ON LI_LINHAS_1.id_PS_CLIENTES = PS_CLIENTES_1.id_PS_CLIENTES">
            <SelectParameters>
                <asp:Parameter Name="codMatriz_PS_CLIENTES" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
