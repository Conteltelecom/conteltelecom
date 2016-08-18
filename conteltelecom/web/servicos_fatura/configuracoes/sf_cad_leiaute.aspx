<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_cad_leiaute.aspx.vb" Inherits="conteltelecom.sf_cad_leiaute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
<telerik:RadWindowManager ID = "RadWindowManager1" runat="server">
     <Localization OK = "Yes" Cancel = "No" />
</telerik:RadWindowManager> 
    <telerik:RadGrid ID="RadGridCadLeiaute" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaLeiaute" CellSpacing="-1" GridLines="Both" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
   
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_CAD_LEIAUTE" DataSourceID="SqlDataSourceBuscaLeiaute" CommandItemDisplay="Top" EditMode="InPlace"  >
           <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="NOVO" AddNewRecordImageUrl="../../../img/add.png" />
             <Columns>
                <telerik:GridBoundColumn DataField="id_SF_CAD_LEIAUTE" FilterControlAltText="Filter id_SF_CAD_LEIAUTE column" HeaderText="ID" SortExpression="id_SF_CAD_LEIAUTE" UniqueName="id_SF_CAD_LEIAUTE" DataType="System.Int32" ReadOnly="True">
                </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn DataField="desc_SF_CAD_LEIAUTE" FilterControlAltText="Filter desc_SF_CAD_LEIAUTE column" HeaderText="DESCRIÇÃO " SortExpression="desc_SF_CAD_LEIAUTE" UniqueName="desc_SF_CAD_LEIAUTE">
                     <EditItemTemplate>
                         <telerik:RadTextBox ID="desc_SF_CAD_LEIAUTETextBox" runat="server" Width="95%" Text='<%# Bind("desc_SF_CAD_LEIAUTE") %>'></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFielddesc_SF_CAD_LEIAUTETextBox" ControlToValidate="desc_SF_CAD_LEIAUTETextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="desc_SF_CAD_LEIAUTELabel" runat="server" Text='<%# Eval("desc_SF_CAD_LEIAUTE") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle CssClass="col-xs-6" />
                 </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="desc_OP_OPERADORAS" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                     <EditItemTemplate>
                         <telerik:RadDropDownList ID="RadDropDownListOperadoras" Width="95%" runat="server" DataSourceID="ObjectDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" DropDownHeight="150px" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>' Skin="Bootstrap"></telerik:RadDropDownList>
                                            </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle CssClass="col-xs-6" />
                 </telerik:GridTemplateColumn>
                 <telerik:GridCheckBoxColumn DataField="st_SF_CAD_LEIAUTE" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_CAD_LEIAUTE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_CAD_LEIAUTE">
                 </telerik:GridCheckBoxColumn>
                 <telerik:GridEditCommandColumn ButtonType="ImageButton"  EditImageUrl="~\img\Editar_32.png" UpdateImageUrl="~\img\accept_32.png" CancelImageUrl="~\img\block_32.png" InsertImageUrl="~\img\accept_32.png" >
                 </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn FilterControlAltText="Filter EXCLUIR column" ConfirmDialogType="RadWindow"  UniqueName="EXCLUIR" ButtonType="ImageButton" ImageUrl="~\img\delete_32.png" ConfirmText="ATENÇÃO O REGISTRO SERA EXCLUÍDO">
                 </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLeiaute" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_CAD_LEIAUTE.desc_SF_CAD_LEIAUTE, SF_CAD_LEIAUTE.id_SF_CAD_LEIAUTE, SF_CAD_LEIAUTE.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS, SF_CAD_LEIAUTE.st_SF_CAD_LEIAUTE FROM SF_CAD_LEIAUTE INNER JOIN OP_OPERADORAS ON SF_CAD_LEIAUTE.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS" DeleteCommand="DELETE FROM SF_CAD_LEIAUTE WHERE (id_SF_CAD_LEIAUTE = @id_SF_CAD_LEIAUTE)" InsertCommand="INSERT INTO SF_CAD_LEIAUTE(desc_SF_CAD_LEIAUTE, st_SF_CAD_LEIAUTE, id_OP_OPERADORAS) VALUES (@desc_SF_CAD_LEIAUTE, @st_SF_CAD_LEIAUTE, @id_OP_OPERADORAS)" UpdateCommand="UPDATE SF_CAD_LEIAUTE SET desc_SF_CAD_LEIAUTE = @desc_SF_CAD_LEIAUTE, st_SF_CAD_LEIAUTE = @st_SF_CAD_LEIAUTE, id_OP_OPERADORAS = @id_OP_OPERADORAS WHERE (id_SF_CAD_LEIAUTE = @id_SF_CAD_LEIAUTE)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_CAD_LEIAUTE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="st_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="st_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="id_SF_CAD_LEIAUTE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceOperadoras" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownOperadorasTableAdapters.OP_OPERADORASTableAdapter" UpdateMethod="Update">
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
