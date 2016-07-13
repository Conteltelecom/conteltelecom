<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_add_linhas_planos.aspx.vb" Inherits="conteltelecom.cl_add_linhas_planos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script type="text/javascript">
        //Put your JavaScript code here.
  
      function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGrid1.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
    <telerik:RadScriptBlock runat="server">
        <script>
            function selectAllDetailTables(checkBox)
            {
                var selected = checkBox.checked;
                var grid = $find("<%= RadGridLinhas02.ClientID %>");
                var dataItems = grid.get_masterTableView().get_dataItems();
                setSelectedToAllDataItems(dataItems, selected);
                var detailTables = grid.get_detailTables();
                for (var i = 0; i < detailTables.length; i++)
                {
                    setSelectedToAllDataItems(detailTables[i].get_dataItems(), selected);
                }
            }

            function setSelectedToAllDataItems(dataItems, selected)
            {
                for (var i = 0; i < dataItems.length; i++)
                {
                    dataItems[i].set_selected(selected);
                }
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaPlanosCliente" GroupPanelPosition="Top" Skin="Bootstrap" ExpandCollapseColumn-Display = "false"   ExpandCollapseColumn-Visible = "false">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_PLANOS_CLIENTE" DataSourceID="SqlDataSourceBuscaPlanosCliente" EditMode="InPlace" CommandItemDisplay="Top" HierarchyDefaultExpanded="true" ExpandCollapseColumn-Display = "false"   ExpandCollapseColumn-Visible = "false"  >
           
             <DetailTables>
                <telerik:GridTableView runat="server" DataKeyNames="id_LI_LINHAS,ID_CL_PLANOSxLINHAS,idLinhasPai_LI_LINHAS" DataSourceID="SqlDataSourceLInhasAtuais" Name="Linhas" CommandItemDisplay="Top" AllowNaturalSort="False" NoDetailRecordsText="SEM REGISTROS" NoMasterRecordsText="SEM REGISTROS">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="ID_CL_PLANOSxLINHAS" MasterKeyField="ID_CL_PLANOSxLINHAS" />
                    </ParentTableRelation>
                    <CommandItemSettings ShowAddNewRecordButton="false" />
                   <CommandItemTemplate>
                       <CommandItemTemplate >
               <div style="text-align:center ">
                   <asp:Label ID="Label1" runat="server" Text="LINHAS INCLUÍDAS NO PLANO" Font-Bold ="true" ></asp:Label>
               </div>
           </CommandItemTemplate>
                   </CommandItemTemplate>
                    <DetailTables>
                        <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceLInhasAtuais2" Name="linhas02" DataKeyNames="ID_CL_PLANOSxLINHAS" NoDetailRecordsText="SEM REGISTROS" NoMasterRecordsText="SEM REGISTROS">
                            <Columns>
                                  <telerik:GridCheckBoxColumn DataType="System.Int16" FilterControlAltText="Filter ST column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="ST" DataField="ST">
                                </telerik:GridCheckBoxColumn>
                       <telerik:GridBoundColumn DataField="ID_CL_PLANOSxLINHAS" FilterControlAltText="Filter ID_CL_PLANOSxLINHAS column" HeaderText="ID" UniqueName="ID_CL_PLANOSxLINHAS">
                        </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="LINHAS VINCULADAS AO CÓDIGO" UniqueName="numLinha_LI_LINHAS">
                                    <HeaderStyle CssClass="col-xs-12" />
                                </telerik:GridBoundColumn>
                              
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                         <telerik:GridCheckBoxColumn DataField="ST" DataType="System.Int16" FilterControlAltText="Filter ST column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="ST">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="ID_CL_PLANOSxLINHAS" FilterControlAltText="Filter ID_CL_PLANOSxLINHAS column" HeaderText="ID" UniqueName="ID_CL_PLANOSxLINHAS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="COD/LINHAS" UniqueName="codLinha_LI_LINHAS">
                            <HeaderStyle CssClass="col-xs-12" />
                        </telerik:GridBoundColumn>
                       
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                           <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            
               </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <CommandItemSettings AddNewRecordText="NOVO" ShowAddNewRecordButton ="false"  AddNewRecordImageUrl="../../../img/add.png" ShowRefreshButton="false" />
              <ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn DataField="id_CL_PLANOS_CLIENTE" DataType="System.Int32" FilterControlAltText="Filter id_CL_PLANOS_CLIENTE column" HeaderText="ID" ReadOnly="True" SortExpression="id_CL_PLANOS_CLIENTE" UniqueName="id_CL_PLANOS_CLIENTE">
          
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CL_PLANOS_CLIENTE" FilterControlAltText="Filter desc_CL_PLANOS_CLIENTE column" HeaderText="DESCRIÇÃO" SortExpression="desc_CL_PLANOS_CLIENTE" UniqueName="desc_CL_PLANOS_CLIENTE">
                    <EditItemTemplate>
                        
                        <telerik:RadTextBox  ID="desc_CL_PLANOS_CLIENTETextBox" runat="server" Text='<%# Bind("desc_CL_PLANOS_CLIENTE") %>' Width="90%"></telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="RequiRadMaskedTextBoxmesAno" ControlToValidate="desc_CL_PLANOS_CLIENTETextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>                   
                         </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CL_PLANOS_CLIENTELabel" runat="server" Text='<%# Eval("desc_CL_PLANOS_CLIENTE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridDropDownColumn DataField="id_OP_OPERADORAS" DataSourceID="ObjectDataSourceBuscaOperadoras" FilterControlAltText="Filter id_OP_OPERADORAS column" HeaderText="OPERADORAS" ListTextField="desc_OP_OPERADORAS" ListValueField="id_OP_OPERADORAS" UniqueName="id_OP_OPERADORAS" ReadOnly="true">
                   
                     <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="id_OP_PLANOS" DataSourceID="ObjectDataSourcePlanos" FilterControlAltText="Filter id_OP_PLANOS column" HeaderText="PLANOS" ListTextField="desc_OP_PLANOS" ListValueField="id_OP_PLANOS" UniqueName="id_OP_PLANOS">
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridDropDownColumn>
                <telerik:GridNumericColumn DataField="valor_CL_PLANOS_CLIENTE" DecimalDigits="2" FilterControlAltText="Filter valor_CL_PLANOS_CLIENTE column" HeaderText="VALOR R$" UniqueName="valor_CL_PLANOS_CLIENTE" DataType="System.Decimal">
                    <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" ></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridNumericColumn>
                <telerik:GridNumericColumn DataField="ordem_CL_PLANOS_CLIENTE" DecimalDigits="2" FilterControlAltText="Filter ordem_CL_PLANOS_CLIENTE column" HeaderText="ORDEM" UniqueName="ordem_CL_PLANOS_CLIENTE" MinValue="0" MaxValue="999">
                    <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="*" SetFocusOnError="true" ></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridNumericColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" FilterControlAltText="Filter st_CL_PLANOS_CLIENTE column" HeaderText="ST" UniqueName="st_CL_PLANOS_CLIENTE" DataField="st_CL_PLANOS_CLIENTE" StringFalseValue="0" StringTrueValue="1" DefaultInsertValue ="1">
                </telerik:GridCheckBoxColumn>
              
                 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid><br />
    <hr />
        <br />

    <telerik:RadGrid ID="RadGridLinhas02"  AllowMultiRowSelection="True"   runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceLinhas02"  GroupPanelPosition="Top" Skin="Bootstrap" AutoGenerateColumns="False"  >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhas02"  NoDetailRecordsText = "SEM REGISTROS" DataKeyNames="id_LI_LINHAS,codLinha_LI_LINHAS,id_OP_OPERADORAS,codMatriz_PS_CLIENTES" CommandItemDisplay="TopAndBottom" AllowAutomaticUpdates="False" AllowNaturalSort="False" >
            
            <CommandItemTemplate >
                <div style="text-align:center">
                    <asp:Label ID="LabelLinhasDisponiveis" runat="server" Text="LINHAS DIPONÍVEIS" Font-Bold="true" ></asp:Label>
                </div>
                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName="Salvar"></telerik:RadImageButton>
                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
            </CommandItemTemplate>
            <DetailTables>
                <telerik:GridTableView runat="server" NoDetailRecordsText = "SEM REGISTROS"  DataKeyNames="id_LI_LINHAS" DataSourceID="SqlDataSourceLinhas3" AllowAutomaticUpdates="False" AllowNaturalSort="False" Name="Linhas"  >
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="codLinha_LI_LINHAS" MasterKeyField="codLinha_LI_LINHAS" />
                        <telerik:GridRelationFields DetailKeyField="codMatriz_PS_CLIENTES" MasterKeyField="codMatriz_PS_CLIENTES" />
                        <telerik:GridRelationFields DetailKeyField="id_OP_OPERADORAS" MasterKeyField="id_OP_OPERADORAS" />
                        <telerik:GridRelationFields DetailKeyField="id_LI_LINHAS" MasterKeyField="id_LI_LINHAS" />
                    </ParentTableRelation>
                    <Columns>
                   
                        <telerik:GridClientSelectColumn FilterControlAltText="Filter stFilha column" UniqueName="stFilha">
                        </telerik:GridClientSelectColumn>
                        <telerik:GridBoundColumn DataField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" UniqueName="id_LI_LINHAS">
                  
                              </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="LI_LINHAS.numLinha_LI_LINHAS" FilterControlAltText="Filter LI_LINHAS.numLinha_LI_LINHAS column" UniqueName="LI_LINHAS.numLinha_LI_LINHAS" HeaderText="LINHAS VINCULADAS AO CÓDIGO">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("numLinha_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                         
                            <ItemStyle CssClass="col-xs-12" />
                        </telerik:GridTemplateColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>

<ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
            <Columns>
                <telerik:GridClientSelectColumn ColumnGroupName="test" FilterControlAltText="Filter stPai column" UniqueName="stPai" ></telerik:GridClientSelectColumn>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHAS" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="True"></Selecting>
         
        </ClientSettings>
    </telerik:RadGrid>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceLinhas02" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, PS_CLIENTES.codMatriz_PS_CLIENTES, 0 AS ST, LI_LINHAS.id_OP_OPERADORAS, LI_LINHAS.id_PS_CLIENTES, LI_LINHAS.numLinha_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES LEFT OUTER JOIN CL_PLANOSxLINHAS ON LI_LINHAS.id_LI_LINHAS = CL_PLANOSxLINHAS.id_LI_LINHAS WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (CL_PLANOSxLINHAS.id_LI_LINHAS IS NULL)" InsertCommand="INSERT INTO CL_PLANOSxLINHAS(id_LI_LINHAS, id_OP_OPERADORAS_t_LI_LINHAS, id_CL_PLANOS_CLIENTE, idLinhasPai_LI_LINHAS) VALUES (@id_LI_LINHAS, @id_OP_OPERADORAS_t_LI_LINHAS, @id_CL_PLANOS_CLIENTE, @idLinhasPai_LI_LINHAS)">
        <InsertParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
            <asp:Parameter Name="id_OP_OPERADORAS_t_LI_LINHAS" />
            <asp:Parameter Name="id_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="idLinhasPai_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLinhas3" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, PS_CLIENTES.codMatriz_PS_CLIENTES, 0 AS ST, LI_LINHAS.id_OP_OPERADORAS, LI_LINHAS.id_PS_CLIENTES, LI_LINHAS.numLinha_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES LEFT OUTER JOIN CL_PLANOSxLINHAS ON LI_LINHAS.id_LI_LINHAS = CL_PLANOSxLINHAS.id_LI_LINHAS WHERE (LI_LINHAS.codLinha_LI_LINHAS = @codLinha_LI_LINHAS) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.id_OP_OPERADORAS = @id_OP_OPERADORAS) AND (LI_LINHAS.id_LI_LINHAS &lt;&gt; @id_LI_LINHAS) AND (CL_PLANOSxLINHAS.id_LI_LINHAS IS NULL)" InsertCommand="INSERT INTO CL_PLANOSxLINHAS(id_LI_LINHAS, id_OP_OPERADORAS_t_LI_LINHAS, id_CL_PLANOS_CLIENTE) VALUES (@id_LI_LINHAS, @id_OP_OPERADORAS_t_LI_LINHAS, @id_CL_PLANOS_CLIENTE)">
        <InsertParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
            <asp:Parameter Name="id_OP_OPERADORAS_t_LI_LINHAS" />
            <asp:Parameter Name="id_CL_PLANOS_CLIENTE" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="codLinha_LI_LINHAS" />
   <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceBuscaPlanosCliente" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT OP_OPERADORAS.desc_OP_OPERADORAS, CL_PLANOS_CLIENTE.id_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.desc_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.ordem_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.st_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.valor_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.id_OP_OPERADORAS, OP_PLANOS.desc_OP_PLANOS, OP_PLANOS.id_OP_PLANOS FROM CL_PLANOS_CLIENTE INNER JOIN OP_OPERADORAS ON CL_PLANOS_CLIENTE.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN OP_PLANOS ON CL_PLANOS_CLIENTE.id_OP_PLANOS = OP_PLANOS.id_OP_PLANOS WHERE (CL_PLANOS_CLIENTE.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (CL_PLANOS_CLIENTE.id_PS_PESSOA = @id_PS_PESSOA) AND (CL_PLANOS_CLIENTE.id_CL_PLANOS_CLIENTE = @id_CL_PLANOS_CLIENTE)" DeleteCommand="DELETE FROM CL_PLANOSxLINHAS WHERE (ID_CL_PLANOSxLINHAS = @id_CL_PLANOSxLINHAS)" InsertCommand="INSERT INTO CL_PLANOS_CLIENTE(desc_CL_PLANOS_CLIENTE, valor_CL_PLANOS_CLIENTE, id_OP_OPERADORAS, ordem_CL_PLANOS_CLIENTE, st_CL_PLANOS_CLIENTE, codMatriz_PS_CLIENTES, id_PS_PESSOA, id_OP_PLANOS) VALUES (@desc_CL_PLANOS_CLIENTE, @valor_CL_PLANOS_CLIENTE, @id_OP_OPERADORAS, @ordem_CL_PLANOS_CLIENTE, @st_CL_PLANOS_CLIENTE, @codMatriz_PS_CLIENTES, @id_PS_PESSOA, @id_OP_PLANOS)" UpdateCommand="UPDATE CL_PLANOS_CLIENTE SET desc_CL_PLANOS_CLIENTE = @desc_CL_PLANOS_CLIENTE, ordem_CL_PLANOS_CLIENTE = @ordem_CL_PLANOS_CLIENTE, valor_CL_PLANOS_CLIENTE = @valor_CL_PLANOS_CLIENTE, id_OP_PLANOS = @id_OP_PLANOS, st_CL_PLANOS_CLIENTE = @st_CL_PLANOS_CLIENTE WHERE (id_CL_PLANOS_CLIENTE = @id_CL_PLANOS_CLIENTE)">
        <DeleteParameters>
            <asp:Parameter Name="id_CL_PLANOSxLINHAS" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="valor_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="ordem_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="st_CL_PLANOS_CLIENTE" />
           <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
            <asp:Parameter Name="id_OP_PLANOS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" />
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
            <asp:QueryStringParameter Name="id_CL_PLANOS_CLIENTE" QueryStringField="id_CL_PLANOS_CLIENTE" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="ordem_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="valor_CL_PLANOS_CLIENTE"  Type="Decimal" />
            <asp:Parameter Name="id_OP_PLANOS" />
            <asp:Parameter Name="st_CL_PLANOS_CLIENTE" />
            <asp:QueryStringParameter Name="id_CL_PLANOS_CLIENTE" QueryStringField="id_CL_PLANOS_CLIENTE" />
        </UpdateParameters>
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

    <asp:ObjectDataSource ID="ObjectDataSourcePlanos" ConvertNullToDBNull="false"  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownPlanosTableAdapters.OP_PLANOSTableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLInhasAtuais" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.codLinha_LI_LINHAS, CL_PLANOSxLINHAS.ID_CL_PLANOSxLINHAS, 1 AS ST, CL_PLANOSxLINHAS.id_CL_PLANOS_CLIENTE, CL_PLANOSxLINHAS.id_OP_OPERADORAS_t_LI_LINHAS, CL_PLANOSxLINHAS.id_LI_LINHAS, CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS FROM LI_LINHAS INNER JOIN CL_PLANOSxLINHAS ON LI_LINHAS.id_LI_LINHAS = CL_PLANOSxLINHAS.id_LI_LINHAS WHERE (CL_PLANOSxLINHAS.id_CL_PLANOS_CLIENTE = @id_CL_PLANOS_CLIENTE) AND (CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS = CL_PLANOSxLINHAS.id_LI_LINHAS)" DeleteCommand="DELETE FROM CL_PLANOSxLINHAS WHERE (ID_CL_PLANOSxLINHAS = @id_CL_PLANOSxLINHAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_CL_PLANOSxLINHAS" />
        </DeleteParameters>
        <SelectParameters>
           <asp:QueryStringParameter Name="id_CL_PLANOS_CLIENTE" QueryStringField="id_CL_PLANOS_CLIENTE" />
        </SelectParameters>
    </asp:SqlDataSource>
      <br />
    <asp:SqlDataSource ID="SqlDataSourceLInhasAtuais2" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM CL_PLANOSxLINHAS WHERE (ID_CL_PLANOSxLINHAS = @id_CL_PLANOSxLINHAS)" SelectCommand="SELECT CL_PLANOSxLINHAS.ID_CL_PLANOSxLINHAS, 1 AS ST, CL_PLANOSxLINHAS.id_CL_PLANOS_CLIENTE, CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS FROM LI_LINHAS INNER JOIN CL_PLANOSxLINHAS ON LI_LINHAS.id_LI_LINHAS = CL_PLANOSxLINHAS.id_LI_LINHAS WHERE (CL_PLANOSxLINHAS.id_CL_PLANOS_CLIENTE = @id_CL_PLANOS_CLIENTE) AND (CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS = @idLinhasPai_LI_LINHAS) AND (CL_PLANOSxLINHAS.id_LI_LINHAS &lt;&gt; CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_CL_PLANOSxLINHAS" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_CL_PLANOS_CLIENTE" QueryStringField="id_CL_PLANOS_CLIENTE" />
            <asp:Parameter Name="idLinhasPai_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>
      <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
</asp:Content>
