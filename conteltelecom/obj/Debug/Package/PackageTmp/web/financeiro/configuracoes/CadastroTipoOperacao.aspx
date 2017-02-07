<%@ Page Title="TIPOS DE OPERAÇÃO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroTipoOperacao.aspx.vb" Inherits="conteltelecom.CadastroTipoOperacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridCadastroTipoOperacao" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceTipoOperacao" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_TIPO_OPERACAO" DataSourceID="SqlDataSourceTipoOperacao">
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_TIPO_OPERACAO" DataType="System.Int32" FilterControlAltText="Filter id_FI_TIPO_OPERACAO column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_TIPO_OPERACAO" UniqueName="id_FI_TIPO_OPERACAO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_TIPO_OPERACAO" FilterControlAltText="Filter desc_FI_TIPO_OPERACAO column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_TIPO_OPERACAO" UniqueName="desc_FI_TIPO_OPERACAO">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_TIPO_OPERACAOTextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_TIPO_OPERACAO") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_TIPO_OPERACAOLabel" runat="server" Text='<%# Eval("desc_FI_TIPO_OPERACAO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_FI_TIPO_OPERACAO column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_FI_TIPO_OPERACAO" DataField="st_FI_TIPO_OPERACAO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceTipoOperacao" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_TIPO_OPERACAO] WHERE [id_FI_TIPO_OPERACAO] = @id_FI_TIPO_OPERACAO" InsertCommand="INSERT INTO FI_TIPO_OPERACAO(desc_FI_TIPO_OPERACAO, st_FI_TIPO_OPERACAO, dtInc_FI_TIPO_OPERACAO, dtAlt_FI_TIPO_OPERACAO, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_FI_TIPO_OPERACAO, @st_FI_TIPO_OPERACAO, GETDATE(), GETDATE(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_TIPO_OPERACAO, desc_FI_TIPO_OPERACAO, st_FI_TIPO_OPERACAO FROM FI_TIPO_OPERACAO" UpdateCommand="UPDATE FI_TIPO_OPERACAO SET desc_FI_TIPO_OPERACAO = @desc_FI_TIPO_OPERACAO, st_FI_TIPO_OPERACAO = @st_FI_TIPO_OPERACAO, dtAlt_FI_TIPO_OPERACAO = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_TIPO_OPERACAO = @id_FI_TIPO_OPERACAO)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_TIPO_OPERACAO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_TIPO_OPERACAO" Type="String" />
            <asp:Parameter Name="st_FI_TIPO_OPERACAO" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_TIPO_OPERACAO" Type="String" />
            <asp:Parameter Name="st_FI_TIPO_OPERACAO" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_TIPO_OPERACAO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
