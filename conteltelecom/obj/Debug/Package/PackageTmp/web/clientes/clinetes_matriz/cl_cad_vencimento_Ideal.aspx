<%@ Page Title="CADASTRO DE VENCIMENTO IDEAL" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_cad_vencimento_Ideal.aspx.vb" Inherits="conteltelecom.cl_cad_vencimento_Ideal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadGrid ID="RadGridCadVencimentoIdeal" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaOperadorasCliente" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaOperadorasCliente" EditMode="InPlace">
            <Columns>
                <telerik:GridBoundColumn DataField="id_OP_OPERADORAS" DataType="System.Int32" FilterControlAltText="Filter id_OP_OPERADORAS column" HeaderText="ID OPERADORA" SortExpression="id_OP_OPERADORAS" UniqueName="id_OP_OPERADORAS" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-8" />
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
                <telerik:GridEditCommandColumn ButtonType="ImageButton"  EditImageUrl="../../../img/edit_32.png" UpdateImageUrl="~\img\accept_32.png" CancelImageUrl="~\img\block_32.png" InsertImageUrl="~\img\accept_32.png" >
                 </telerik:GridEditCommandColumn>
                

            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaOperadorasCliente" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT LI_LINHAS.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS, MAX(LI_LINHAS.diaVenc_LI_LINHAS) AS vencimentoIdeal FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) GROUP BY LI_LINHAS.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
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
