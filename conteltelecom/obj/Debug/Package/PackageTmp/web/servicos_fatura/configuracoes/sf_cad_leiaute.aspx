<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_cad_leiaute.aspx.vb" Inherits="conteltelecom.sf_cad_leiaute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadLeiaute" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaLeiaute" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
   
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_LEIAUTE" DataSourceID="SqlDataSourceBuscaLeiaute" CommandItemDisplay="Top" EditMode="InPlace"  >
           <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="NOVO" AddNewRecordImageUrl="../../../img/add.png" />
             <Columns>
                <telerik:GridBoundColumn DataField="id_SF_LEIAUTE" DataType="System.Int32" FilterControlAltText="Filter id_SF_LEIAUTE column" HeaderText="ID" ReadOnly="True" SortExpression="id_SF_LEIAUTE" UniqueName="id_SF_LEIAUTE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_SF_LEIAUTE" FilterControlAltText="Filter desc_SF_LEIAUTE column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_LEIAUTE" UniqueName="desc_SF_LEIAUTE">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="st_SF_LEIAUTE" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_LEIAUTE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_LEIAUTE">
                </telerik:GridCheckBoxColumn>
                <telerik:GridTemplateColumn>
                    <ItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLeiaute" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT [id_SF_LEIAUTE], [desc_SF_LEIAUTE], [st_SF_LEIAUTE] FROM [SF_LEIAUTE]" DeleteCommand="DELETE FROM [SF_LEIAUTE] WHERE [id_SF_LEIAUTE] = @id_SF_LEIAUTE" InsertCommand="Sp_Insert_sf_cad_leiaute" UpdateCommand="UPDATE [SF_LEIAUTE] SET [desc_SF_LEIAUTE] = @desc_SF_LEIAUTE, [st_SF_LEIAUTE] = @st_SF_LEIAUTE WHERE [id_SF_LEIAUTE] = @id_SF_LEIAUTE" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_LEIAUTE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_LEIAUTE" Type="String" />
            <asp:Parameter Name="st_SF_LEIAUTE" Type="Byte" />
            <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_LEIAUTE" Type="String" />
            <asp:Parameter Name="st_SF_LEIAUTE" Type="Byte" />
            <asp:Parameter Name="id_SF_LEIAUTE" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
