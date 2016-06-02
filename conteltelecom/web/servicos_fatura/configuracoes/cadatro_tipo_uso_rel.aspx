<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cadatro_tipo_uso_rel.aspx.vb" Inherits="conteltelecom.cadatro_tipo_uso_rel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridTipoUsoRel" runat="server" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceTipoUsoRel"  AutoGenerateColumns="False" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
    <MasterTableView DataKeyNames="id_SF_TIPO_USO_REL" DataSourceID="SqlDataSourceTipoUsoRel" EditMode="InPlace" CommandItemDisplay="Top">
        <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton ="false" />
        <Columns>
            <telerik:GridBoundColumn DataField="id_SF_TIPO_USO_REL" DataType="System.Int32" FilterControlAltText="Filter id_SF_TIPO_USO_REL column" HeaderText="ID" ReadOnly="True" SortExpression="id_SF_TIPO_USO_REL" UniqueName="id_SF_TIPO_USO_REL">
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn DataField="desc_SF_TIPO_USO_REL" FilterControlAltText="Filter desc_SF_TIPO_USO_REL column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_TIPO_USO_REL" UniqueName="desc_SF_TIPO_USO_REL">
                <EditItemTemplate>
                    <telerik:RadTextBox ID="desc_SF_TIPO_USO_RELTextBox" runat="server" Text='<%# Bind("desc_SF_TIPO_USO_REL") %>'></telerik:RadTextBox>
                                 </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="desc_SF_TIPO_USO_RELLabel" runat="server" Text='<%# Eval("desc_SF_TIPO_USO_REL") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="col-xs-11" />
            </telerik:GridTemplateColumn>
            <telerik:GridCheckBoxColumn DataField="st_SF_TIPO_USO_REL" DataType="System.Boolean" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_TIPO_USO_REL column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_TIPO_USO_REL">
            </telerik:GridCheckBoxColumn>
            <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>

</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CausesValidation="false"  CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>

        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceTipoUsoRel" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM [SF_TIPO_USO_REL] WHERE [id_SF_TIPO_USO_REL] = @original_id_SF_TIPO_USO_REL AND [desc_SF_TIPO_USO_REL] = @original_desc_SF_TIPO_USO_REL AND [st_SF_TIPO_USO_REL] = @original_st_SF_TIPO_USO_REL" InsertCommand="INSERT INTO [SF_TIPO_USO_REL] ([desc_SF_TIPO_USO_REL], [st_SF_TIPO_USO_REL]) VALUES (@desc_SF_TIPO_USO_REL, @st_SF_TIPO_USO_REL)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [desc_SF_TIPO_USO_REL], [st_SF_TIPO_USO_REL], [id_SF_TIPO_USO_REL] FROM [SF_TIPO_USO_REL] ORDER BY [desc_SF_TIPO_USO_REL]" UpdateCommand="UPDATE [SF_TIPO_USO_REL] SET [desc_SF_TIPO_USO_REL] = @desc_SF_TIPO_USO_REL, [st_SF_TIPO_USO_REL] = @st_SF_TIPO_USO_REL WHERE [id_SF_TIPO_USO_REL] = @original_id_SF_TIPO_USO_REL AND [desc_SF_TIPO_USO_REL] = @original_desc_SF_TIPO_USO_REL AND [st_SF_TIPO_USO_REL] = @original_st_SF_TIPO_USO_REL">
    <DeleteParameters>
        <asp:Parameter Name="original_id_SF_TIPO_USO_REL" Type="Int32" />
        <asp:Parameter Name="original_desc_SF_TIPO_USO_REL" Type="String" />
        <asp:Parameter Name="original_st_SF_TIPO_USO_REL" Type="Byte" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="desc_SF_TIPO_USO_REL" Type="String" />
        <asp:Parameter Name="st_SF_TIPO_USO_REL" Type="Byte" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="desc_SF_TIPO_USO_REL" Type="String" />
        <asp:Parameter Name="st_SF_TIPO_USO_REL" Type="Byte" />
        <asp:Parameter Name="original_id_SF_TIPO_USO_REL" Type="Int32" />
        <asp:Parameter Name="original_desc_SF_TIPO_USO_REL" Type="String" />
        <asp:Parameter Name="original_st_SF_TIPO_USO_REL" Type="Byte" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
