<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="fi_cad_vencimento_Ideal.aspx.vb" Inherits="conteltelecom.fi_cad_vencimento_Ideal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadVencimentoIdeal" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaOperadorasCliente" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
            <Excel Format="Xlsx" />
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaOperadorasCliente" EditMode="InPlace" CommandItemDisplay="Top" >
            <CommandItemSettings ShowAddNewRecordButton="false" ExportToExcelText="" ExportToPdfText="" ShowRefreshButton="false" ShowExportToExcelButton="true"  ShowExportToPdfButton="true" ExportToPdfImageUrl="../../../img/pdf_32.png" ExportToExcelImageUrl="../../../img/Excel_32.png" />
                            <Columns>
               
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME FANTASIA" ReadOnly="True" UniqueName="desc_PS_PESSOA">
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="vencimentoIdeal" FilterControlAltText="Filter vencimentoIdeal column" HeaderText="VENCIMENTO IDEAL" SortExpression="vencimentoIdeal" UniqueName="vencimentoIdeal">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox ID="vencimentoIdealTextBox" MaxValue="32" MinValue="1" MaxLength="2" NumberFormat-DecimalDigits="0"  runat="server" Text='<%# Bind("vencimentoIdeal") %>'></telerik:RadNumericTextBox>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vencimentoIdealLabel" runat="server" Text='<%# Eval("vencimentoIdeal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
              

            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaOperadorasCliente" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT LI_LINHAS.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS, MAX(LI_LINHAS.diaVenc_LI_LINHAS) AS vencimentoIdeal, PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.st_PS_PESSOA FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN PS_PESSOA ON PS_CLIENTES.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES &lt;= @codMatriz_PS_CLIENTESfim) AND (PS_CLIENTES.codMatriz_PS_CLIENTES &gt;= @codMatriz_PS_CLIENTESini) AND (PS_PESSOA.st_PS_PESSOA = 1) GROUP BY LI_LINHAS.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS, PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.st_PS_PESSOA">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTESfim" QueryStringField="codMatriz_PS_CLIENTES" DefaultValue="99999999" />
            <asp:QueryStringParameter DefaultValue="0" Name="codMatriz_PS_CLIENTESini" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT LI_LINHAS.id_PS_CLIENTES FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.id_OP_OPERADORAS = @id_OP_OPERADORAS) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)" UpdateCommand="UPDATE LI_LINHAS SET diaVenc_LI_LINHAS = @diaVenc_LI_LINHAS WHERE (id_OP_OPERADORAS = @id_OP_OPERADORAS) AND (id_PS_CLIENTES = @id_PS_CLIENTES)">
        <SelectParameters>
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="diaVenc_LI_LINHAS" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="id_PS_CLIENTES" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server"  Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
</asp:Content>
