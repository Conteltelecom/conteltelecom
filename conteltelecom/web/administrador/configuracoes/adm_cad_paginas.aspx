<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="adm_cad_paginas.aspx.vb" Inherits="conteltelecom.adm_cad_paginas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

       <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridCadPaginas.ClientID %>");
           if (arg) {
            
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
    <telerik:RadGrid ID="RadGridCadPaginas" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadPaignas" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CONFIG_CAD_PAGINAS" DataSourceID="SqlDataSourceCadPaignas" CommandItemDisplay="Top" EditMode="InPlace" >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_CONFIG_CAD_PAGINAS" DataType="System.Int32" FilterControlAltText="Filter id_CONFIG_CAD_PAGINAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_CONFIG_CAD_PAGINAS" UniqueName="id_CONFIG_CAD_PAGINAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="titulo_CONFIG_CAD_PAGINAS" FilterControlAltText="Filter titulo_CONFIG_CAD_PAGINAS column" HeaderText="TÍTULO" SortExpression="titulo_CONFIG_CAD_PAGINAS" UniqueName="titulo_CONFIG_CAD_PAGINAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="titulo_CONFIG_CAD_PAGINASTextBox" runat="server" Text='<%# Bind("titulo_CONFIG_CAD_PAGINAS") %>'></telerik:RadTextBox>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="titulo_CONFIG_CAD_PAGINASLabel" runat="server" Text='<%# Eval("titulo_CONFIG_CAD_PAGINAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="url_CONFIG_CAD_PAGINAS" FilterControlAltText="Filter url_CONFIG_CAD_PAGINAS column" HeaderText="URL" SortExpression="url_CONFIG_CAD_PAGINAS" UniqueName="url_CONFIG_CAD_PAGINAS">
                    <EditItemTemplate>
                         <telerik:RadTextBox ID="url_CONFIG_CAD_PAGINASTextBox" runat="server" Text='<%# Bind("url_CONFIG_CAD_PAGINAS") %>'></telerik:RadTextBox>
                      
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="url_CONFIG_CAD_PAGINASLabel" runat="server" Text='<%# Eval("url_CONFIG_CAD_PAGINAS") %>'></asp:Label>
                    </ItemTemplate>
                      <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CONFIG_CAD_PAGINAS" DataType="System.Int16" FilterControlAltText="Filter st_CONFIG_CAD_PAGINAS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CONFIG_CAD_PAGINAS">
                </telerik:GridCheckBoxColumn>

                 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" CommandArgument='<%# Eval("id_CONFIG_CAD_PAGINAS") %>' runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceCadPaignas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CONFIG_CAD_PAGINAS] WHERE [id_CONFIG_CAD_PAGINAS] = @id_CONFIG_CAD_PAGINAS" InsertCommand="INSERT INTO [CONFIG_CAD_PAGINAS] ([titulo_CONFIG_CAD_PAGINAS], [url_CONFIG_CAD_PAGINAS], [st_CONFIG_CAD_PAGINAS]) VALUES (@titulo_CONFIG_CAD_PAGINAS, @url_CONFIG_CAD_PAGINAS, @st_CONFIG_CAD_PAGINAS)" SelectCommand="SELECT [id_CONFIG_CAD_PAGINAS], [titulo_CONFIG_CAD_PAGINAS], [url_CONFIG_CAD_PAGINAS], [st_CONFIG_CAD_PAGINAS] FROM [CONFIG_CAD_PAGINAS]" UpdateCommand="UPDATE [CONFIG_CAD_PAGINAS] SET [titulo_CONFIG_CAD_PAGINAS] = @titulo_CONFIG_CAD_PAGINAS, [url_CONFIG_CAD_PAGINAS] = @url_CONFIG_CAD_PAGINAS, [st_CONFIG_CAD_PAGINAS] = @st_CONFIG_CAD_PAGINAS WHERE [id_CONFIG_CAD_PAGINAS] = @id_CONFIG_CAD_PAGINAS">
        <DeleteParameters>
            <asp:Parameter Name="id_CONFIG_CAD_PAGINAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="titulo_CONFIG_CAD_PAGINAS" Type="String" />
            <asp:Parameter Name="url_CONFIG_CAD_PAGINAS" Type="String" />
            <asp:Parameter Name="st_CONFIG_CAD_PAGINAS" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="titulo_CONFIG_CAD_PAGINAS" Type="String" />
            <asp:Parameter Name="url_CONFIG_CAD_PAGINAS" Type="String" />
            <asp:Parameter Name="st_CONFIG_CAD_PAGINAS" Type="Byte" />
            <asp:Parameter Name="id_CONFIG_CAD_PAGINAS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
