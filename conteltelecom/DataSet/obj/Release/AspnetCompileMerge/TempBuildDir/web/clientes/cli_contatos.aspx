<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cli_contatos.aspx.vb" Inherits="conteltelecom.cli_contatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadDataForm ID="RadDataFormContatos" runat="server" DataSourceID="SqlDataSourceRadgridContatos" Skin="Bootstrap">
                    <LayoutTemplate>
            <div id="itemPlaceholder" runat="server"></div>
        </LayoutTemplate>
        <ItemTemplate>
                <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES CLIENTE</legend>
                <div class="col-lg-12">
                    <div class=" form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓDIGO:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="id_PS_PESSOA_JuridicaLabel" Font-Bold="false" runat="server" Text='<%# Eval("id_PS_PESSOA_Juridica") %>' />
                                                             <asp:Label ID="cc" Font-Bold="false" Visible="false"   runat="server" Text='<%# Eval("PS_CLIENTES_id_PS_CLIENTES ") %>' />
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="NOME FANTASIA:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label2" runat="server" Font-Bold="false" Text='<%# Eval("desc_PS_PESSOA_Juridica")%>' />
                            </div>
                        </div>
                                            </div>
                </div>
                

            </fieldset>
            </ItemTemplate>
        </telerik:RadDataForm>
      <br />
       
              
        <telerik:RadGrid ID="RadGridContatos"   runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceRadgridContatos" GroupPanelPosition="Top" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceRadgridContatos" EditMode="InPlace"  CommandItemDisplay="Top" InsertItemDisplay="Top"   NoMasterRecordsText="NÃO EXISTE CONTATOS ">
             <CommandItemSettings  AddNewRecordText="NOVO" CancelChangesText="CANCELAR"  AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR"  SaveChangesText="SALVAR"  />
            <Columns>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TIPO column" DefaultInsertValue="1" HeaderText="TIPO" UniqueName="TIPO">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="RadComboBoxTiposIns" Runat="server" Culture="pt-BR"  AutoPostBack="true"  DataSourceID="SqlDataSourceDroPComboContatos" DataTextField="desc_PS_TP_CONTATOS" DataValueField="id_PS_TP_CONTATOS" Skin="Bootstrap"></telerik:RadDropDownList>
                      
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_TP_CONTATOSLabel" runat="server" Text='<%# Eval("desc_PS_TP_CONTATOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="CÓD" SortExpression="id_PS_PESSOA" UniqueName="id_PS_PESSOA">
                    <EditItemTemplate>
                        <asp:TextBox ID="RadNumericTextBoxid_PS_PESSOA" OnTextChanged="RadNumericTextBoxid_PS_PESSOA_TextChanged" runat="server" CssClass="form-control" Text='<%# Eval("id_PS_PESSOA") %>' ></asp:TextBox>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_PS_PESSOALabel"  runat="server" Text='<%# Eval("id_PS_PESSOA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                    <EditItemTemplate>
                        <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxDesc_ps_pesssoa" OnTextChanged ="RadAutoCompleteBoxDesc_ps_pesssoa_TextChanged"  TextSettings-SelectionMode="Single"  DataModelID="SqlDataSourceBuscaPessoa"  InputType="Text"   DataSourceID ="SqlDataSourceBuscaPessoa"  DataValueField="id_PS_PESSOA"    DataTextField="desc_PS_PESSOA"  runat="server">
                            
                        </telerik:RadAutoCompleteBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_PESSOALabel" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="fone01_PS_FISICA" FilterControlAltText="Filter fone01_PS_FISICA column" HeaderText="TELEFONE" SortExpression="fone01_PS_FISICA" UniqueName="fone01_PS_FISICA" ReadOnly="True">
                    <EditItemTemplate>
                        <asp:TextBox ID="fone01_PS_FISICATextBox" runat="server" Text='<%# Bind("fone01_PS_FISICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="fone01_PS_FISICALabel" runat="server" Text='<%# Me.TelefoneFormat(Eval("fone01_PS_FISICA"))%>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="fone02_PS_FISICA" FilterControlAltText="Filter cpf_PS_FISICA column" HeaderText="CELULAR" SortExpression="fone02_PS_FISICA" UniqueName="fone02_PS_FISICA" ReadOnly="True">
                    <EditItemTemplate>
                        <asp:TextBox ID="fone02_PS_FISICATextBox" runat="server" Text='<%# Bind("fone02_PS_FISICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="fone02_PS_FISICALabel" runat="server" Text='<%# Me.TelefoneFormat(Eval("fone02_PS_FISICA")) %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="id_CL_CONTATOS" DataType="System.Int32" FilterControlAltText="Filter id_CL_CONTATOS column" HeaderText="id_CL_CONTATOS" ReadOnly="True" SortExpression="id_CL_CONTATOS" UniqueName="id_CL_CONTATOS" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="idContato_id_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter idContato_id_PS_PESSOA column" HeaderText="idContato_id_PS_PESSOA" SortExpression="idContato_id_PS_PESSOA" UniqueName="idContato_id_PS_PESSOA" Visible="False" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter id_PS_CLIENTES column" HeaderText="id_PS_CLIENTES" SortExpression="id_PS_CLIENTES" UniqueName="id_PS_CLIENTES" Visible="False" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" HeaderText="DETALHES" UniqueName="DETALHES" ReadOnly="True" Display="true" >
                    <ItemTemplate>
                           <telerik:RadButton ID="RadButtonDetalhes" runat="server" CommandName="Detalhes" Text="DETALHES">
                                <Icon PrimaryIconUrl="../../img/search_page.png" />
                            </telerik:RadButton>
                         <telerik:RadButton ID="UpdateButtonSalvar" runat="server"  Visible ="false"  CommandName="PerformInsert" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>     
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-lg-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter EXCLUIR column" HeaderText="EXCLUIR" UniqueName="EXCLUIR" ReadOnly="True">
                    <ItemTemplate>
                        <telerik:RadButton ID="CancelButtonVoltar" runat="server"  CommandName="Delete" CausesValidation="False" Text="EXCLUIR" ToolTip="EXCLUIR">
                        <Icon PrimaryIconUrl="../../img/delete.png" />
                    </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton" runat="server" Visible="false"  CommandName="Cancel" CausesValidation="False" Text="CANCELAR" ToolTip="CANCLEAR">
                        <Icon PrimaryIconUrl="../../img/block.png" />
                    </telerik:RadButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-lg-1" />
               </telerik:GridTemplateColumn>
          
          
            </Columns>
             </MasterTableView>
    </telerik:RadGrid>
 
    <asp:SqlDataSource ID="SqlDataSourceRadgridContatos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO CL_CONTATOS(id_PS_CLIENTES, idContato_id_PS_PESSOA, id_PS_TP_CONTATOS) VALUES (@id_PS_CLIENTES, @idContato_id_PS_PESSOA, @id_PS_TP_CONTATOS)" SelectCommand="RadGridContatos" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM CL_CONTATOS WHERE (id_CL_CONTATOS = @id_cl_contatos)">
        <DeleteParameters>
            <asp:Parameter Name="id_cl_contatos" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_PS_CLIENTES" />
            <asp:Parameter Name="idContato_id_PS_PESSOA" />
            <asp:Parameter Name="id_PS_TP_CONTATOS" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_pessoaNav" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaPessoa"  CancelSelectOnNullParameter ="false" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadAutoCompleteBox_Ps_Fisica" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="id_PS_PESSOA" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDroPComboContatos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoContato" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </asp:Content>
