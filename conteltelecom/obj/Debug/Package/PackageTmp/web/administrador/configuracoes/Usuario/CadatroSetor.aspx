<%@ Page Title="SETORES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadatroSetor.aspx.vb" Inherits="conteltelecom.CadatroSetor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <div class="table-responsive">  
    <telerik:RadGrid ID="RadGridSetores" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceSetores" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CH_SETORES" DataSourceID="SqlDataSourceSetores">
            <Columns>
                <telerik:GridBoundColumn DataField="id_CH_SETORES" DataType="System.Int32" FilterControlAltText="Filter id_CH_SETORES column" HeaderText="ID" ReadOnly="True" SortExpression="id_CH_SETORES" UniqueName="id_CH_SETORES">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CH_SETORES" FilterControlAltText="Filter desc_CH_SETORES column" HeaderText="DESCRIÇÃO" SortExpression="desc_CH_SETORES" UniqueName="desc_CH_SETORES">
                    <EditItemTemplate>
                        <telerik:RadTextBox Width="95%" ID="desc_CH_SETORESTextBox" runat="server" Text='<%# Bind("desc_CH_SETORES") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_SETORESLabel" runat="server" Text='<%# Eval("desc_CH_SETORES") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CH_SETORES" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CH_SETORES column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CH_SETORES">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->
    <asp:SqlDataSource ID="SqlDataSourceSetores" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CH_SETORES] WHERE [id_CH_SETORES] = @id_CH_SETORES" InsertCommand="INSERT INTO CH_SETORES(desc_CH_SETORES, st_CH_SETORES, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@desc_CH_SETORES, @st_CH_SETORES, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" SelectCommand="SELECT id_CH_SETORES, desc_CH_SETORES, st_CH_SETORES FROM CH_SETORES" UpdateCommand="UPDATE CH_SETORES SET desc_CH_SETORES = @desc_CH_SETORES, dtAlt_CH_SETORES = GETDATE(), st_CH_SETORES = @st_CH_SETORES, id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_CH_SETORES = @id_CH_SETORES)">
        <DeleteParameters>
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CH_SETORES" Type="String" />
            <asp:Parameter Name="st_CH_SETORES" Type="Byte" />
           <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CH_SETORES" Type="String" />
            <asp:Parameter Name="st_CH_SETORES" Type="Byte" />
         <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
