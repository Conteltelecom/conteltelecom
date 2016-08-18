<%@ Page Title="CADASTRO DE TIPOS DE MENUS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_menus.aspx.vb" Inherits="conteltelecom.cad_menus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

         <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridCadMenus.ClientID %>");
           if (arg) {
            
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
     <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
    <telerik:RadGrid ID="RadGridCadMenus" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadMenus" Skin="Bootstrap" style="margin-bottom: 0px" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CONFIG_TIPO_MENU" DataSourceID="SqlDataSourceCadMenus" CommandItemDisplay="Top" EditMode="InPlace"  >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="FALSE" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_CONFIG_TIPO_MENU" DataType="System.Int32" FilterControlAltText="Filter id_CONFIG_TIPO_MENU column" HeaderText="ID" ReadOnly="True" SortExpression="id_CONFIG_TIPO_MENU" UniqueName="id_CONFIG_TIPO_MENU">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CONFIG_TIPO_MENU" FilterControlAltText="Filter desc_CONFIG_TIPO_MENU column" HeaderText="DESCRIÇÃO" SortExpression="desc_CONFIG_TIPO_MENU" UniqueName="desc_CONFIG_TIPO_MENU">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_CONFIG_TIPO_MENUTextBox" runat="server" Text='<%# Bind("desc_CONFIG_TIPO_MENU") %>' Width="95%"></telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="RequiRadMaskeddesc_CONFIG_TIPO_MENUTextBox" ControlToValidate="desc_CONFIG_TIPO_MENUTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CONFIG_TIPO_MENULabel" runat="server" Text='<%# Eval("desc_CONFIG_TIPO_MENU") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CONFIG_TIPO_MENU column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CONFIG_TIPO_MENU" DataField="st_CONFIG_TIPO_MENU">
                </telerik:GridCheckBoxColumn>
 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" CommandArgument='<%# Eval("id_CONFIG_TIPO_MENU") %>' runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceCadMenus" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CONFIG_TIPO_MENU] WHERE [id_CONFIG_TIPO_MENU] = @id_CONFIG_TIPO_MENU" InsertCommand="INSERT INTO [CONFIG_TIPO_MENU] ([desc_CONFIG_TIPO_MENU], [st_CONFIG_TIPO_MENU]) VALUES (@desc_CONFIG_TIPO_MENU, @st_CONFIG_TIPO_MENU)" SelectCommand="SELECT [desc_CONFIG_TIPO_MENU], [id_CONFIG_TIPO_MENU], [st_CONFIG_TIPO_MENU] FROM [CONFIG_TIPO_MENU]" UpdateCommand="UPDATE [CONFIG_TIPO_MENU] SET [desc_CONFIG_TIPO_MENU] = @desc_CONFIG_TIPO_MENU, [st_CONFIG_TIPO_MENU] = @st_CONFIG_TIPO_MENU WHERE [id_CONFIG_TIPO_MENU] = @id_CONFIG_TIPO_MENU">
        <DeleteParameters>
            <asp:Parameter Name="id_CONFIG_TIPO_MENU" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CONFIG_TIPO_MENU" Type="String" />
            <asp:Parameter Name="st_CONFIG_TIPO_MENU" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CONFIG_TIPO_MENU" Type="String" />
            <asp:Parameter Name="st_CONFIG_TIPO_MENU" Type="Byte" />
            <asp:Parameter Name="id_CONFIG_TIPO_MENU" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
