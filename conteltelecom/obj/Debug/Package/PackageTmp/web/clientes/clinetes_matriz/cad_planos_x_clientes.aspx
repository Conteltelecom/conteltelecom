<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cad_planos_x_clientes.aspx.vb" Inherits="conteltelecom.cad_planos_x_clientes" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript">
        //Put your JavaScript code here.
  
      function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGrid1.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
</asp:Content>
     
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaPlanosCliente" GroupPanelPosition="Top" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_PLANOS_CLIENTE" DataSourceID="SqlDataSourceBuscaPlanosCliente" EditMode="InPlace" CommandItemDisplay="Top" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" >
            <CommandItemSettings AddNewRecordText="NOVO" AddNewRecordImageUrl="../../../img/add.png" ShowRefreshButton="false" />
            <Columns>
                <telerik:GridTemplateColumn DataField="id_CL_PLANOS_CLIENTE" DataType="System.Int32" FilterControlAltText="Filter id_CL_PLANOS_CLIENTE column" HeaderText="ID" SortExpression="id_CL_PLANOS_CLIENTE" UniqueName="id_CL_PLANOS_CLIENTE" ReadOnly="true" >
                    <EditItemTemplate>
                        <asp:TextBox ID="id_CL_PLANOS_CLIENTETextBox" runat="server" Text='<%# Bind("id_CL_PLANOS_CLIENTE") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_CL_PLANOS_CLIENTELabel" runat="server" Text='<%# Eval("id_CL_PLANOS_CLIENTE") %>'></asp:Label>

                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_CL_PLANOS_CLIENTE" FilterControlAltText="Filter desc_CL_PLANOS_CLIENTE column" HeaderText="DESCRIÇÃO" SortExpression="desc_CL_PLANOS_CLIENTE" UniqueName="desc_CL_PLANOS_CLIENTE">
                    <EditItemTemplate>
                         <asp:RequiredFieldValidator ID="RequiRadMaskedTextBoxmesAno" ControlToValidate="desc_CL_PLANOS_CLIENTETextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                        <telerik:RadTextBox  ID="desc_CL_PLANOS_CLIENTETextBox" runat="server" Text='<%# Bind("desc_CL_PLANOS_CLIENTE") %>' Width="95%"></telerik:RadTextBox>
                                            </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CL_PLANOS_CLIENTELabel" runat="server" Text='<%# Eval("desc_CL_PLANOS_CLIENTE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_OP_OPERADORAS" FilterControlAltText="Filter id_OP_OPERADORAS column" HeaderText="OPERADORAS" UniqueName="id_OP_OPERADORAS">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="id_OP_OPERADORASRadComboBox" runat="server" DataSourceID="ObjectDataSourceBuscaOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>'>
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_OP_OPERADORASLabel" runat="server" Text='<%# Eval("id_OP_OPERADORAS") %>' Visible="false"></asp:Label>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridDropDownColumn DataField="id_OP_PLANOS" DataSourceID="ObjectDataSourcePlanos" FilterControlAltText="Filter id_OP_PLANOS column" HeaderText="PLANOS" ListTextField="desc_OP_PLANOS" ListValueField="id_OP_PLANOS" UniqueName="id_OP_PLANOS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridDropDownColumn>
                <telerik:GridNumericColumn DataField="valor_CL_PLANOS_CLIENTE" DataType="System.Decimal"  DecimalDigits="2" FilterControlAltText="Filter valor_CL_PLANOS_CLIENTE column" HeaderText="VALOR R$" UniqueName="valor_CL_PLANOS_CLIENTE">
                    <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" ></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                    
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridNumericColumn>
                <telerik:GridNumericColumn DataField="ordem_CL_PLANOS_CLIENTE" DecimalDigits="2" FilterControlAltText="Filter ordem_CL_PLANOS_CLIENTE column" HeaderText="ORDEM" UniqueName="ordem_CL_PLANOS_CLIENTE">
                    <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" ></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridNumericColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" FilterControlAltText="Filter st_CL_PLANOS_CLIENTE column" HeaderText="ST" UniqueName="st_CL_PLANOS_CLIENTE" DataField="st_CL_PLANOS_CLIENTE" StringFalseValue="0" StringTrueValue="1" DefaultInsertValue="1">
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

    <asp:SqlDataSource ID="SqlDataSourceBuscaPlanosCliente" runat="server" CancelSelectOnNullParameter="false"  ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT OP_OPERADORAS.desc_OP_OPERADORAS, CL_PLANOS_CLIENTE.id_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.desc_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.ordem_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.st_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.valor_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.id_OP_OPERADORAS, OP_PLANOS.desc_OP_PLANOS, OP_PLANOS.id_OP_PLANOS FROM CL_PLANOS_CLIENTE INNER JOIN OP_OPERADORAS ON CL_PLANOS_CLIENTE.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN OP_PLANOS ON CL_PLANOS_CLIENTE.id_OP_PLANOS = OP_PLANOS.id_OP_PLANOS WHERE (CL_PLANOS_CLIENTE.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (CL_PLANOS_CLIENTE.id_PS_PESSOA = @id_PS_PESSOA)" DeleteCommand="DELETE FROM CL_PLANOS_CLIENTE WHERE (id_CL_PLANOS_CLIENTE = @id_CL_PLANOS_CLIENTE)" InsertCommand="Sp_Insert_cad_planos_x_clientes" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_CL_PLANOS_CLIENTE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="ordem_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="valor_CL_PLANOS_CLIENTE" Type ="Decimal"  />
            <asp:Parameter Name="st_CL_PLANOS_CLIENTE" />
           <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
            <asp:Parameter Name="id_OP_PLANOS" />
            <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceBuscaOperadoras" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownOperadorasTableAdapters.OP_OPERADORASTableAdapter" UpdateMethod="Update">
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

    <asp:ObjectDataSource ID="ObjectDataSourcePlanos" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownPlanosTableAdapters.OP_PLANOSTableAdapter"></asp:ObjectDataSource>
          <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
     <asp:HiddenField ID="HiddenField1" runat="server" Value="false" />
</asp:Content>
