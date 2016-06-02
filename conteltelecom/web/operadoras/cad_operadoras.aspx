<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_operadoras.aspx.vb" Inherits="conteltelecom.cad_operadoras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadOperadoras" RenderMode="Auto" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceOperadoras"  AllowAutomaticDeletes="True"  AllowAutomaticUpdates="True"  AllowAutomaticInserts="True" CellSpacing="-1" GridLines="Both" GroupPanelPosition="Top" >


<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_OP_OPERADORAS"  DataSourceID="SqlDataSourceOperadoras" EditMode="InPlace" CommandItemDisplay="Top">
            <CommandItemSettings AddNewRecordImageUrl ="../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false"  />
            <Columns>
                <telerik:GridBoundColumn DataField="id_OP_OPERADORAS" DataType="System.Int32" FilterControlAltText="Filter id_OP_OPERADORAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_OP_OPERADORAS" UniqueName="id_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="DESCRIÇÃO OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                    <EditItemTemplate>
                        <asp:TextBox ID="desc_OP_OPERADORASTextBox" runat="server" Text='<%# Bind("desc_OP_OPERADORAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>
                <telerik:GridNumericColumn DataField="ordenOperadoras" DecimalDigits="0" FilterControlAltText="Filter column column" HeaderText="ORDEM" MaxValue="9999" MinValue="0" UniqueName="ordenOperadoras">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridNumericColumn>
                <telerik:GridCheckBoxColumn DataField="st_OP_OPERADORAS" DataType="System.Int16" FilterControlAltText="Filter st_OP_OPERADORAS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_OP_OPERADORAS">
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
                
 </telerik:GridTemplateColumn>

            </Columns>
        </MasterTableView>


<FilterMenu RenderMode="Auto"></FilterMenu>

<HeaderContextMenu RenderMode="Auto"></HeaderContextMenu>


    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceOperadoras"  runat="server"  ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM OP_OPERADORAS WHERE (id_OP_OPERADORAS = @id_OP_OPERADORAS)" InsertCommand="INSERT INTO [OP_OPERADORAS] ([desc_OP_OPERADORAS], [ordenOperadoras], [st_OP_OPERADORAS]) VALUES (@desc_OP_OPERADORAS, @ordenOperadoras, @st_OP_OPERADORAS)"  SelectCommand="SELECT [id_OP_OPERADORAS], [desc_OP_OPERADORAS], [ordenOperadoras], [st_OP_OPERADORAS] FROM [OP_OPERADORAS] ORDER BY [desc_OP_OPERADORAS]" UpdateCommand="UPDATE OP_OPERADORAS SET desc_OP_OPERADORAS = @desc_OP_OPERADORAS, st_OP_OPERADORAS = @st_OP_OPERADORAS, ordenOperadoras = @ordenOperadoras WHERE (id_OP_OPERADORAS = @id_OP_OPERADORAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_OP_OPERADORAS" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_OP_OPERADORAS" Type="String" />
            <asp:Parameter Name="ordenOperadoras" Type="Int32" />
            <asp:Parameter Name="st_OP_OPERADORAS" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_OP_OPERADORAS" Type="String" />
            <asp:Parameter Name="st_OP_OPERADORAS" Type="Byte" />
            <asp:Parameter Name="ordenOperadoras" Type="Int32" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
