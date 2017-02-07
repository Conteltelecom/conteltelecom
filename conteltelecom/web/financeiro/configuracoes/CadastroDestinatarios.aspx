<%@ Page Title="CADASTRO DE DESTINATÁRIOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroDestinatarios.aspx.vb" Inherits="conteltelecom.CadastroDestinatarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridDestinatarios" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceConfiguraDestinatarios">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_DESTINATARIO" DataSourceID="SqlDataSourceConfiguraDestinatarios">
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_DESTINATARIO" DataType="System.Int32" FilterControlAltText="Filter id_FI_DESTINATARIO column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_DESTINATARIO" UniqueName="id_FI_DESTINATARIO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_DESTINATARIO" FilterControlAltText="Filter desc_FI_DESTINATARIO column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_DESTINATARIO" UniqueName="desc_FI_DESTINATARIO">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" ID="desc_FI_DESTINATARIOTextBox" runat="server" Text='<%# Bind("desc_FI_DESTINATARIO") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_DESTINATARIOLabel" runat="server" Text='<%# Eval("desc_FI_DESTINATARIO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_FI_DESTINATARIO" DataType="System.Int16" FilterControlAltText="Filter st_FI_DESTINATARIO column" HeaderText="ST" UniqueName="st_FI_DESTINATARIO" DefaultInsertValue="1" StringFalseValue="0" StringTrueValue="1">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceConfiguraDestinatarios" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_DESTINATARIO] WHERE [id_FI_DESTINATARIO] = @id_FI_DESTINATARIO" InsertCommand="INSERT INTO FI_DESTINATARIO(desc_FI_DESTINATARIO, st_FI_DESTINATARIO, dtInc_FI_DESTINATARIO, dtAlt_FI_DESTINATARIO, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_FI_DESTINATARIO, @st_FI_DESTINATARIO, GETDATE(), GETDATE(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_DESTINATARIO, desc_FI_DESTINATARIO, st_FI_DESTINATARIO FROM FI_DESTINATARIO" UpdateCommand="UPDATE FI_DESTINATARIO SET desc_FI_DESTINATARIO = @desc_FI_DESTINATARIO, st_FI_DESTINATARIO = @st_FI_DESTINATARIO, dtAlt_FI_DESTINATARIO = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_DESTINATARIO = @id_FI_DESTINATARIO)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_DESTINATARIO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_DESTINATARIO" Type="String" />
            <asp:Parameter Name="st_FI_DESTINATARIO" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_DESTINATARIO" Type="String" />
            <asp:Parameter Name="st_FI_DESTINATARIO" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_DESTINATARIO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
