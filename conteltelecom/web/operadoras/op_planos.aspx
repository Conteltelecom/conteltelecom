<%@ Page Title="CADASTRO DE PLANOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="op_planos.aspx.vb" Inherits="conteltelecom.op_planos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridPlanosOPeradoras" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourcePlanosOperadora" GroupPanelPosition="Top" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_OP_PLANOS" DataSourceID="SqlDataSourcePlanosOperadora" EditMode="InPlace" CommandItemDisplay="Top" NoMasterRecordsText="SEM REGISTROS"  >
            <CommandItemSettings AddNewRecordImageUrl="../../img/add.png" AddNewRecordText="NOVO"  ShowRefreshButton="false" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_OP_PLANOS" DataType="System.Int32" FilterControlAltText="Filter id_OP_PLANOS column" HeaderText="ID" ReadOnly="True" SortExpression="id_OP_PLANOS" UniqueName="id_OP_PLANOS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_OP_PLANOS" FilterControlAltText="Filter desc_OP_PLANOS column" HeaderText="DESCRIÇÃO DOS PLANOS" SortExpression="desc_OP_PLANOS" UniqueName="desc_OP_PLANOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_OP_PLANOSTextBox" runat="server" Text='<%# Bind("desc_OP_PLANOS") %>' Width="90%"></telerik:RadTextBox>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_OP_PLANOSLabel" runat="server" Text='<%# Eval("desc_OP_PLANOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-8" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_OP_OPERADORAS" FilterControlAltText="Filter id_OP_OPERADORAS column" HeaderText="OPERADORA" UniqueName="id_OP_OPERADORAS">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="id_OP_OPERADORASRadComboBox" runat="server" DataSourceID="ObjectDataSourceOperadora" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>'>
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_OP_PLANOS" DataType="System.Int16" FilterControlAltText="Filter st_OP_PLANOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_OP_PLANOS" DefaultInsertValue="1">
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
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourcePlanosOperadora" runat="server"  ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM OP_PLANOS WHERE (id_OP_PLANOS = @id_OP_PLANOS)" InsertCommand="INSERT INTO [OP_PLANOS] ([desc_OP_PLANOS], [st_OP_PLANOS], [id_OP_OPERADORAS]) VALUES (@desc_OP_PLANOS, @st_OP_PLANOS, @id_OP_OPERADORAS)"  SelectCommand="SELECT OP_PLANOS.desc_OP_PLANOS, OP_PLANOS.st_OP_PLANOS, OP_PLANOS.id_OP_OPERADORAS, OP_PLANOS.id_OP_PLANOS, OP_OPERADORAS.desc_OP_OPERADORAS FROM OP_PLANOS INNER JOIN OP_OPERADORAS ON OP_PLANOS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS ORDER BY OP_PLANOS.desc_OP_PLANOS" UpdateCommand="UPDATE OP_PLANOS SET desc_OP_PLANOS = @desc_OP_PLANOS, st_OP_PLANOS = @st_OP_PLANOS, id_OP_OPERADORAS = @id_OP_OPERADORAS WHERE (id_OP_PLANOS = @id_OP_PLANOS)">
        <DeleteParameters>
            <asp:Parameter Name="id_OP_PLANOS"  Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_OP_PLANOS" Type="String" />
            <asp:Parameter Name="st_OP_PLANOS" Type="Byte" />
            <asp:Parameter Name="id_OP_OPERADORAS" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_OP_PLANOS" Type="String" />
            <asp:Parameter Name="st_OP_PLANOS" Type="Byte" />
            <asp:Parameter Name="id_OP_OPERADORAS" Type="Int32" />
            <asp:Parameter Name="id_OP_PLANOS" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceOperadora" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownOperadorasTableAdapters.OP_OPERADORASTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_OP_OPERADORAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_OP_OPERADORAS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_OP_OPERADORAS" Type="String" />
            <asp:Parameter Name="Original_id_OP_OPERADORAS" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
