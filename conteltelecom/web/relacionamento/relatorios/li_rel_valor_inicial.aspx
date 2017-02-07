<%@ Page Title="RELATÓRIO DE VALOR INICIAL" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="li_rel_valor_inicial.aspx.vb" Inherits="conteltelecom.li_rel_valor_inicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridLinhasValorINicial" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhas">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhas">
            <Columns>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CPF/CNPJ" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA", "{0:##.###.###/####-##}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.FcnpjFormat(Eval("CNPJ_PS_JURIDICA")) %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vlInicial_id_LI_TIPOS" DataFormatString="{0:C}" DataType="System.Decimal" FilterControlAltText="Filter vlInicial_id_LI_TIPOS column" HeaderText="VL INICIAL" SortExpression="vlInicial_id_LI_TIPOS" UniqueName="vlInicial_id_LI_TIPOS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TIPO" FilterControlAltText="Filter TIPO column" HeaderText="TIPO" ReadOnly="True" SortExpression="TIPO" UniqueName="TIPO">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ST" FilterControlAltText="Filter ST column" HeaderText="ST" ReadOnly="True" SortExpression="ST" UniqueName="ST">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid><asp:SqlDataSource ID="SqlDataSourceLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_JURIDICA.CNPJ_PS_JURIDICA, PS_PESSOA.desc_PS_PESSOA, OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.vlInicial_id_LI_TIPOS, LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS, CASE WHEN LI_LINHAS.linhaVirtual_LI_LINHAS = 0 THEN 'NORMAL' ELSE 'VIRTUAL' END AS TIPO, CASE WHEN LI_LINHAS.st_LI_LINHAS = 0 THEN 'INATIVA' ELSE 'ATIVA' END AS ST FROM PS_PESSOA INNER JOIN PS_JURIDICA ON PS_PESSOA.id_PS_PESSOA = PS_JURIDICA.id_PS_PESSOA INNER JOIN PS_CLIENTES ON PS_JURIDICA.id_PS_JURIDICA = PS_CLIENTES.id_PS_JURIDICA INNER JOIN LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS ON PS_CLIENTES.id_PS_CLIENTES = LI_LINHAS.id_PS_CLIENTES"></asp:SqlDataSource>
</asp:Content>
