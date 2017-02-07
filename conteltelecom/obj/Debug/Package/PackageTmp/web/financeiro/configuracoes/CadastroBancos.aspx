<%@ Page Title="CADASTRO DE BANCOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroBancos.aspx.vb" Inherits="conteltelecom.CadastroBancos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridConfiguraBancos" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBancos" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_BANCOS" DataSourceID="SqlDataSourceBancos">
            <Columns>

                <telerik:GridBoundColumn DataField="id_FI_BANCOS" DataType="System.Int32" FilterControlAltText="Filter id_FI_BANCOS column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_BANCOS" UniqueName="id_FI_BANCOS">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn DataField="desc_FI_BANCOS" FilterControlAltText="Filter desc_FI_BANCOS column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_BANCOS" UniqueName="desc_FI_BANCOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_BANCOSTextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_BANCOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_BANCOSLabel" runat="server" Text='<%# Eval("desc_FI_BANCOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn DataField="cod_FI_BANCOS" FilterControlAltText="Filter cod_FI_BANCOS column" HeaderText="COD. BANCO" SortExpression="cod_FI_BANCOS" UniqueName="cod_FI_BANCOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="cod_FI_BANCOSTextBox" Width="95%" runat="server" Text='<%# Bind("cod_FI_BANCOS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="cod_FI_BANCOSLabel" runat="server" Text='<%# Eval("cod_FI_BANCOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>

                <telerik:GridCheckBoxColumn DataField="st_FI_BANCOS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_FI_BANCOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_FI_BANCOS">
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
    </div> <!-- fim responsive-table -->


    <asp:SqlDataSource ID="SqlDataSourceBancos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_BANCOS] WHERE [id_FI_BANCOS] = @id_FI_BANCOS" InsertCommand="INSERT INTO FI_BANCOS(desc_FI_BANCOS, st_FI_BANCOS, id_PS_PESSOA_inc, id_PS_PESSOA_alt, cod_FI_BANCOS) VALUES (@desc_FI_BANCOS, @st_FI_BANCOS, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @cod_FI_BANCOS)" SelectCommand="SELECT id_FI_BANCOS, desc_FI_BANCOS, st_FI_BANCOS, cod_FI_BANCOS FROM FI_BANCOS" UpdateCommand="UPDATE FI_BANCOS SET desc_FI_BANCOS = @desc_FI_BANCOS, st_FI_BANCOS = @st_FI_BANCOS, dtAlt_FI_BANCOS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, cod_FI_BANCOS = @cod_FI_BANCOS WHERE (id_FI_BANCOS = @id_FI_BANCOS)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_BANCOS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_BANCOS" Type="String" />
            <asp:Parameter Name="st_FI_BANCOS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="cod_FI_BANCOS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_BANCOS" Type="String" />
            <asp:Parameter Name="st_FI_BANCOS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="cod_FI_BANCO" Type="String" />
            <asp:Parameter Name="id_FI_BANCOS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
