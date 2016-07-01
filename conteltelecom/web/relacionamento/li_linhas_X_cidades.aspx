<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="li_linhas_X_cidades.aspx.vb" Inherits="conteltelecom.li_linhas_X_cidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadGrid ID="RadGridLinhas_x_cidades" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasCidades" GroupPanelPosition="Top" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_LI_LINHAS" DataSourceID="SqlDataSourceLinhasCidades"  CommandItemDisplay="Top" >
            <CommandItemSettings ShowExportToExcelButton="true" ShowRefreshButton="false"  ShowAddNewRecordButton="false"  ShowExportToPdfButton="true" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nomeUnidade_LI_LINHAS" FilterControlAltText="Filter nomeUnidade_LI_LINHAS column" HeaderText="NOME UNIDADE" SortExpression="nomeUnidade_LI_LINHAS" UniqueName="nomeUnidade_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_CIDADES" FilterControlAltText="Filter desc_PS_CIDADES column" HeaderText="CIDADES" SortExpression="desc_PS_CIDADES" UniqueName="desc_PS_CIDADES">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="central" FilterControlAltText="Filter central column" HeaderText="CENTRAL" ReadOnly="True" SortExpression="central" UniqueName="central">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceLinhasCidades" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS, LI_LINHAS.nomeUnidade_LI_LINHAS, PS_CIDADES.desc_PS_CIDADES, '' AS central FROM LI_LINHAS INNER JOIN PS_CIDADES ON LI_LINHAS.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.linhaVirtual_LI_LINHAS = 0) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
