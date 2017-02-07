<%@ Page Title="CADASTRO DE TIPO DE CONTRATO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cl_tipos_contratos.aspx.vb" Inherits="conteltelecom.cl_tipos_contratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridTiposContratos" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceTiposContratos" GroupPanelPosition="Top" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_TIPOS_CONTRATOS" DataSourceID="SqlDataSourceTiposContratos" CommandItemDisplay="Top"  EditMode="InPlace" >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false"  />
            <Columns>
                <telerik:GridBoundColumn DataField="id_CL_TIPOS_CONTRATOS" DataType="System.Int32" FilterControlAltText="Filter id_CL_TIPOS_CONTRATOS column" HeaderText="ID" ReadOnly="True" SortExpression="id_CL_TIPOS_CONTRATOS" UniqueName="id_CL_TIPOS_CONTRATOS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CL_TIPOS_CONTRATOS" FilterControlAltText="Filter desc_CL_TIPOS_CONTRATOS column" HeaderText="DECRIÇÃO" SortExpression="desc_CL_TIPOS_CONTRATOS" UniqueName="desc_CL_TIPOS_CONTRATOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_CL_TIPOS_CONTRATOSTextBox" runat="server" Text='<%# Bind("desc_CL_TIPOS_CONTRATOS") %>' Width="95%" ></telerik:RadTextBox>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CL_TIPOS_CONTRATOSLabel" runat="server" Text='<%# Eval("desc_CL_TIPOS_CONTRATOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-11" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CL_TIPOS_CONTRATOS" DataType="System.Boolean" DefaultInsertValue="true" FilterControlAltText="Filter st_CL_TIPOS_CONTRATOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CL_TIPOS_CONTRATOS">
                </telerik:GridCheckBoxColumn>
                <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
                    <HeaderStyle Width="50px" />
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceTiposContratos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM CL_TIPOS_CONTRATOS WHERE (id_CL_TIPOS_CONTRATOS = @id_CL_TIPOS_CONTRATOS)" InsertCommand="INSERT INTO [CL_TIPOS_CONTRATOS] ([desc_CL_TIPOS_CONTRATOS], [st_CL_TIPOS_CONTRATOS]) VALUES (@desc_CL_TIPOS_CONTRATOS, @st_CL_TIPOS_CONTRATOS)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_CL_TIPOS_CONTRATOS], [desc_CL_TIPOS_CONTRATOS], [st_CL_TIPOS_CONTRATOS] FROM [CL_TIPOS_CONTRATOS] ORDER BY [desc_CL_TIPOS_CONTRATOS]" UpdateCommand="UPDATE [CL_TIPOS_CONTRATOS] SET [desc_CL_TIPOS_CONTRATOS] = @desc_CL_TIPOS_CONTRATOS, [st_CL_TIPOS_CONTRATOS] = @st_CL_TIPOS_CONTRATOS WHERE [id_CL_TIPOS_CONTRATOS] = @original_id_CL_TIPOS_CONTRATOS AND [desc_CL_TIPOS_CONTRATOS] = @original_desc_CL_TIPOS_CONTRATOS AND [st_CL_TIPOS_CONTRATOS] = @original_st_CL_TIPOS_CONTRATOS">
    <DeleteParameters>
        <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="desc_CL_TIPOS_CONTRATOS" Type="String" />
        <asp:Parameter Name="st_CL_TIPOS_CONTRATOS" Type="Byte" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="desc_CL_TIPOS_CONTRATOS" Type="String" />
        <asp:Parameter Name="st_CL_TIPOS_CONTRATOS" Type="Byte" />
        <asp:Parameter Name="original_id_CL_TIPOS_CONTRATOS" Type="Int32" />
        <asp:Parameter Name="original_desc_CL_TIPOS_CONTRATOS" Type="String" />
        <asp:Parameter Name="original_st_CL_TIPOS_CONTRATOS" Type="Byte" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
