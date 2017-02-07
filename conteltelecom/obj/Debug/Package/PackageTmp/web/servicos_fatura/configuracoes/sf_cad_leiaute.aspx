<%@ Page Title="CADASTRO DE LEIAUTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_cad_leiaute.aspx.vb" Inherits="conteltelecom.sf_cad_leiaute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridCadLeiaute" runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaLeiaute" CellSpacing="-1" GridLines="Both" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" ClientSettings-AllowRowHide="True">
   
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        
        <MasterTableView DataKeyNames="id_SF_CAD_LEIAUTE,id_OP_OPERADORAS" DataSourceID="SqlDataSourceBuscaLeiaute"  >
 
             <Columns>
                 
                 <telerik:GridBoundColumn DataField="id_SF_CAD_LEIAUTE" DataType="System.Int32" FilterControlAltText="Filter id_SF_CAD_LEIAUTE column" HeaderText="ID" ReadOnly="True" SortExpression="id_SF_CAD_LEIAUTE" UniqueName="id_SF_CAD_LEIAUTE">
                 </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn DataField="desc_SF_CAD_LEIAUTE" FilterControlAltText="Filter desc_SF_CAD_LEIAUTE column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_CAD_LEIAUTE" UniqueName="desc_SF_CAD_LEIAUTE">
                     <EditItemTemplate>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatordesc_OP_OPERADORASTextBox" ControlToValidate="desc_SF_CAD_LEIAUTETextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                        <telerik:RadTextBox ID="desc_SF_CAD_LEIAUTETextBox" runat="server" Width="95%" Text='<%# Bind("desc_SF_CAD_LEIAUTE") %>'> </telerik:RadTextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="desc_SF_CAD_LEIAUTELabel" runat="server" Text='<%# Eval("desc_SF_CAD_LEIAUTE") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle CssClass="col-xs-10" />
                 </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                     <EditItemTemplate>
              
                        
                         <telerik:RadDropDownList ID="RadDropDownListOPERADORAS" runat="server" Width="95%" DataSourceID="ObjectDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" DropDownHeight="150px" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>' Skin="Bootstrap"></telerik:RadDropDownList>
                            
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="desc_OP_OPERADORASLabel" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle CssClass="col-xs-2" />
                 </telerik:GridTemplateColumn>
                 <telerik:GridCheckBoxColumn DataField="st_SF_CAD_LEIAUTE" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_CAD_LEIAUTE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_CAD_LEIAUTE" UseNativeEditorsInMobileMode="False">
                 </telerik:GridCheckBoxColumn>
                 <telerik:GridEditCommandColumn ButtonType="ImageButton">
                 </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                 </telerik:GridButtonColumn>
                                 <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
            <ItemTemplate>
                <telerik:RadButton  ID="RadButtonVisualizar"  UniqueName="NovaPagina" CommandName="NovaPagina"    ButtonType ="LinkButton" NavigateUrl='<%# String.Format("~/web/servicos_fatura/configuracoes/sf_cad_leiaute_detalhes.aspx?id_SF_CAD_LEIAUTE={0}", Eval("id_SF_CAD_LEIAUTE"))    %>' runat="server" Text="DETALHES">
                    <Icon PrimaryIconUrl ="../../../img/search_page.png" />
                </telerik:RadButton>
                 <HeaderStyle CssClass="col-xs-1" />
                                      <ItemStyle HorizontalAlign="Center" />
            </ItemTemplate>
            <HeaderStyle CssClass="col-xs-2" />
        </telerik:GridTemplateColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>

        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLeiaute" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SF_CAD_LEIAUTE.desc_SF_CAD_LEIAUTE, OP_OPERADORAS.desc_OP_OPERADORAS, SF_CAD_LEIAUTE.id_SF_CAD_LEIAUTE, OP_OPERADORAS.id_OP_OPERADORAS, SF_CAD_LEIAUTE.st_SF_CAD_LEIAUTE FROM SF_CAD_LEIAUTE INNER JOIN OP_OPERADORAS ON SF_CAD_LEIAUTE.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS" DeleteCommand="DELETE FROM SF_CAD_LEIAUTE WHERE (id_SF_CAD_LEIAUTE = @id_SF_CAD_LEIAUTE)" InsertCommand="INSERT INTO SF_CAD_LEIAUTE(desc_SF_CAD_LEIAUTE, st_SF_CAD_LEIAUTE, id_OP_OPERADORAS, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_SF_CAD_LEIAUTE, @st_SF_CAD_LEIAUTE, @id_OP_OPERADORAS, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" UpdateCommand="UPDATE SF_CAD_LEIAUTE SET desc_SF_CAD_LEIAUTE = @desc_SF_CAD_LEIAUTE, st_SF_CAD_LEIAUTE = @st_SF_CAD_LEIAUTE, dtAlt_SF_CAD_LEIAUTE = GETDATE(), id_OP_OPERADORAS = @id_OP_OPERADORAS, id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_SF_CAD_LEIAUTE = @id_SF_CAD_LEIAUTE)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_CAD_LEIAUTE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="st_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
                        <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
                <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="st_SF_CAD_LEIAUTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
              <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
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
