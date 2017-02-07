<%@ Page Title="CADASTRO DE AGRUPAMENTO DE LINHAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="li_cad_linhas_chave.aspx.vb" Inherits="conteltelecom.li_cad_linhas_chave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    
<style type="text/css" >


</style>
    <telerik:RadGrid ID="RadGridCadLinhaChave" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadLinhaChave" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCadLinhaChave" DataKeyNames="id_LI_CAD_LINHA_CHAVE, id_PS_ENDERECO">

            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_CAD_LINHA_CHAVE"  DataType="System.Int32" FilterControlAltText="Filter id_LI_CAD_LINHA_CHAVE column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_CAD_LINHA_CHAVE" UniqueName="id_LI_CAD_LINHA_CHAVE">

                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID LINHA" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD / NºLINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                        <asp:TextBox ID="codLinha_LI_LINHASTextBox" runat="server" Text='<%# Bind("codLinha_LI_LINHAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                         
                        <asp:Label   ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-9" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="cep_PS_ENDERECO" FilterControlAltText="Filter cep_PS_ENDERECO column" HeaderText="CEP" SortExpression="cep_PS_ENDERECO" UniqueName="cep_PS_ENDERECO" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="cep_PS_ENDERECOTextBox" runat="server" Text='<%# Bind("cep_PS_ENDERECO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="cep_PS_ENDERECOLabel" runat="server" Text='<%# Eval("cep_PS_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF" SortExpression="cod_PS_UF" UniqueName="cod_PS_UF" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="cod_PS_UFTextBox" runat="server" Text='<%# Bind("cod_PS_UF") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_PS_CIDADES" FilterControlAltText="Filter desc_PS_CIDADES column" HeaderText="CIDADE" SortExpression="desc_PS_CIDADES" UniqueName="desc_PS_CIDADES" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="desc_PS_CIDADESTextBox" runat="server" Text='<%# Bind("desc_PS_CIDADES") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_CIDADESLabel" runat="server" Text='<%# Eval("desc_PS_CIDADES") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="bairro_PS_ENDERECO" FilterControlAltText="Filter bairro_PS_ENDERECO column" HeaderText="BAIRRO" SortExpression="bairro_PS_ENDERECO" UniqueName="bairro_PS_ENDERECO" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="bairro_PS_ENDERECOTextBox" runat="server" Text='<%# Bind("bairro_PS_ENDERECO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="bairro_PS_ENDERECOLabel" runat="server" Text='<%# Eval("bairro_PS_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="rua_PS_ENDERECO" FilterControlAltText="Filter rua_PS_ENDERECO column" HeaderText="RUA" SortExpression="rua_PS_ENDERECO" UniqueName="rua_PS_ENDERECO" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="rua_PS_ENDERECOTextBox" runat="server" Text='<%# Bind("rua_PS_ENDERECO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="rua_PS_ENDERECOLabel" runat="server" Text='<%# Eval("rua_PS_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="num_PS_ENDERECO" DataType="System.Int32" FilterControlAltText="Filter num_PS_ENDERECO column" HeaderText="NÚMERO" SortExpression="num_PS_ENDERECO" UniqueName="num_PS_ENDERECO" Visible="False">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox ID="RadNumericTextBoxnum_PS_ENDERECO"  Width="95%" runat="server" Text='<%# Bind("num_PS_ENDERECO") %>'></telerik:RadNumericTextBox>
                                              
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="num_PS_ENDERECOLabel" runat="server" Text='<%# Eval("num_PS_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="complemeto_PS_ENDERECO" FilterControlAltText="Filter complemeto_PS_ENDERECO column" HeaderText="COMPLEMENTO" SortExpression="complemeto_PS_ENDERECO" UniqueName="complemeto_PS_ENDERECO" Visible="False">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="RadTextBoxcomplemeto_PS_ENDERECO" Width="95%" runat="server" Text='<%# Bind("complemeto_PS_ENDERECO") %>'></telerik:RadTextBox>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="complemeto_PS_ENDERECOLabel" runat="server" Text='<%# Eval("complemeto_PS_ENDERECO") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridEditCommandColumn >
                </telerik:GridEditCommandColumn>

                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column"  UniqueName="Excluir" >
             
                </telerik:GridButtonColumn>
                 <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
            <ItemTemplate>
                <telerik:RadButton  ID="RadButtonVisualizar"  UniqueName="NovaPagina" CommandName="NovaPagina"    ButtonType ="StandardButton"  runat="server" Text="DETALHES">
                    <Icon PrimaryIconUrl ="../../../img/search_page.png" />
                </telerik:RadButton>
                 <HeaderStyle CssClass="col-xs-1" />
                                      <ItemStyle HorizontalAlign="Center" />
            </ItemTemplate>
            <HeaderStyle CssClass="col-xs-2" />
        </telerik:GridTemplateColumn>
                

            </Columns>
            <EditFormSettings>
                <FormTemplate>
                    <fieldset class="form-group" style="border: 1px solid #ccc;  padding: 10px;">
                          <table class="rgMasterTable" style="width: 100%">
                       <tbody>
                            <tr class="rgEditRow">
                                <td class="col-xs-3">
                                    <asp:Label ID="Label12" runat="server" Font-Bold="true" Text='<%# Bind("id_LI_LINHAS") %>' Visible="true"></asp:Label>
                                    <asp:Label ID="Labelid_PS_ENDERECO" runat="server" Font-Bold="true" Text='<%# Bind("id_PS_ENDERECO") %>' Visible="false"></asp:Label>
                                </td>
                                <td class="col-xs-3">
                                    <asp:Label ID="LabelCodLInhas" runat="server" Font-Bold="true" Text='<%# Bind("codLinha_LI_LINHAS") %>' Visible="true"></asp:Label>
                                    <telerik:RadAutoCompleteBox  ID="RadAutoCompleteBoxCodLInhas"  Visible="false"  Width="95%" runat="server" MaxResultCount="10" TextSettings-SelectionMode="Single" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasXOperadoras" DataTextField="Linha" DataValueField="id_LI_LINHAS" OnTextChanged="RadAutoCompleteBoxCodLInhas_TextChanged"  MinFilterLength="3"></telerik:RadAutoCompleteBox>
                                      
                                     </td>
                                <td class="col-xs-3">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="true" Text="" Visible="true"></asp:Label>
                                </td>
                                <td class="col-xs-3">
                                    <asp:Label ID="Label11" runat="server" Font-Bold="true" Text="" Visible="true"></asp:Label>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                        </table>
                         <table class="rgMasterTable" style="width: 100%">
                           <colgroup>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                        </colgroup>
                        <thead>
        <tr>
             
            <th class="col-xs-3 rgHeader" scope="col">
                <asp:Label ID="Label1" runat="server"  Font-Bold="true"  Text="CEP:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
                <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="UF:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
         <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="CIDADE:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col">
                <asp:Label ID="Label4" runat="server" Text="BAIRRO:" Font-Bold="true" ></asp:Label>
            </th>
        </tr>
    </thead>
<tbody>
        <tr class="rgEditRow" >
            <td class="col-xs-3">
                <telerik:RadMaskedTextBox ID="RadMaskedTextBoxCep" Mask="#####-###" Skin="Bootstrap" Text='<%# Eval("cep_PS_ENDERECO") %>'  runat="server" Width="95%"></telerik:RadMaskedTextBox>
            </td>
            <td class="col-xs-3" >
                
                  <telerik:RadDropDownList ID="RadDropDownListUF"  Width="95%" AppendDataBoundItems="false" SelectedValue='<%#Eval("cod_PS_UF") %>'   OnSelectedIndexChanged="RadDropDownListUF_SelectedIndexChanged" runat="server" DataSourceID="ObjectDataSourceUF" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap" AutoPostBack="True" DefaultMessage="RS"  DropDownHeight="150"> </telerik:RadDropDownList>
             
            </td>
            <td class="col-xs-3" >
                <asp:UpdatePanel ID="UpdatePanelCidade" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadDropDownList ID="RadDropDownListCidade"   DataTextField="desc_PS_CIDADES" DataValueField="id_PS_CIDADES"   AppendDataBoundItems="false"  Width="95%"  DataSourceID="ObjectDataSourceCidade" runat="server" DefaultMessage=" " Skin="Bootstrap"   DropDownHeight="150" ></telerik:RadDropDownList>
                        <asp:HiddenField ID="HiddenFieldIdCidade" Value='<%#Eval("id_PS_CIDADES") %>' runat="server" />
                         </ContentTemplate>
                </asp:UpdatePanel>
             
            </td>
            <td class="col-xs-3">
                <telerik:RadTextBox ID="RadTextBoxBairro" Text='<%# Eval("bairro_PS_ENDERECO") %>'  Width="95%" runat="server" Skin="Bootstrap" ></telerik:RadTextBox>
            </td>
        </tr>
    </tbody>

                    </table> 

                            <table class="rgMasterTable" style="width: 100%">

                        <colgroup>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                        </colgroup>
        <thead>
        <tr>
             
                                <th class="col-xs-3 rgHeader" scope="col" >
                <asp:Label ID="Label6" runat="server"  Font-Bold="true"  Text="LOGRADOURO:"></asp:Label>
            </th>
             <th class="col-xs-3 rgHeader" scope="col" >
             <asp:Label ID="Label5" runat="server" Text="Nº:" Font-Bold="true"></asp:Label>
            </th>
             <th class="col-xs-3 rgHeader" scope="col" >
                <asp:Label ID="Label9" runat="server" Text="COMPLEMENTO:" Font-Bold="true"></asp:Label>
            </th>
             <th class="col-xs-3 rgHeader" scope="col" >
              
            </th>
        </tr>
    </thead>

    <tbody>
        <tr class="rgEditRow">
                        <td class="col-xs-3" >
                <telerik:RadTextBox ID="RadTextBoxLogradouro" runat="server" Width="95%" Text='<%# Eval("rua_PS_ENDERECO") %>' Skin="Bootstrap"></telerik:RadTextBox>
            </td>
            <td class="col-xs-3" >
                <telerik:RadNumericTextBox ID="RadNumericTextBoxNumericNum" Text='<%# Eval("num_PS_ENDERECO") %>'  NumberFormat-DecimalDigits="0" Width="95%" runat="server" Skin="Bootstrap"></telerik:RadNumericTextBox>
            </td>
            <td colspan="2">
                  <telerik:RadTextBox ID="RadTextBoxcomplemeto_PS_ENDERECO" runat="server" Text='<%# Eval("complemeto_PS_ENDERECO") %>'  Width="95%" Skin="Bootstrap"></telerik:RadTextBox>
            </td>
        </tr>
    </tbody>
                                 <tfoot style="width:100%">
            <tr class="rgRow">
                <td class="rgEditForm"  >
                    
                      <telerik:RadImageButton  ID="RadImageButtonOK" runat="server" Skin=""  CssClass="gEditForm [type='image']"   Width="32px" Height="32px"  Image-Url="~/img/accept_32.png"   CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'>
                          
                                             </telerik:RadImageButton>
                      <telerik:RadImageButton ID="RadImageButtonCancel" runat="server"   Width="32px" Height="32px" CommandName="Cancel"   Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                </td>
                <td class="rgCommandCell"  >
                    </td>
                 <td class="rgCommandCell"  >
                    </td>
                 <td class="rgCommandCell"  >
                    </td>
            </tr>
        </tfoot>
     </table>
                  </fieldset>             
                </FormTemplate>
         
               
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
            
            </EditFormSettings>
        </MasterTableView>
</telerik:RadGrid>
   <asp:SqlDataSource ID="SqlDataSourceCadLinhaChave"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_CAD_LINHA_CHAVE.id_LI_CAD_LINHA_CHAVE, LI_CAD_LINHA_CHAVE.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.numLinha_LI_LINHAS, PS_ENDERECO.num_PS_ENDERECO, PS_ENDERECO.rua_PS_ENDERECO, PS_ENDERECO.bairro_PS_ENDERECO, PS_ENDERECO.cep_PS_ENDERECO, PS_ENDERECO.complemeto_PS_ENDERECO, PS_ENDERECO.id_PS_CIDADES, PS_CIDADES.desc_PS_CIDADES, PS_CIDADES.cod_PS_UF, LI_CAD_LINHA_CHAVE.id_PS_ENDERECO FROM LI_CAD_LINHA_CHAVE INNER JOIN LI_LINHAS ON LI_CAD_LINHA_CHAVE.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS INNER JOIN PS_ENDERECO ON LI_CAD_LINHA_CHAVE.id_PS_ENDERECO = PS_ENDERECO.id_PS_ENDERECO INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES LEFT OUTER JOIN PS_CIDADES ON PS_ENDERECO.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)" InsertCommand="SqlDataSourceInsertCadEndereco" InsertCommandType="StoredProcedure" UpdateCommand="UPDATE PS_ENDERECO SET dtAlt_PS_ENDERECO = @dtAlt_PS_ENDERECO, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, id_PS_CIDADES = @id_PS_CIDADES, complemeto_PS_ENDERECO = @complemeto_PS_ENDERECO, cep_PS_ENDERECO = @cep_PS_ENDERECO, bairro_PS_ENDERECO = @bairro_PS_ENDERECO, num_PS_ENDERECO = @num_PS_ENDERECO, rua_PS_ENDERECO = @rua_PS_ENDERECO WHERE (id_PS_ENDERECO = @id_PS_ENDERECO)" DeleteCommand="DELETE FROM LI_CAD_LINHA_CHAVE WHERE (id_LI_CAD_LINHA_CHAVE = @id_LI_CAD_LINHA_CHAVE)">
       <DeleteParameters>
           <asp:Parameter Name="id_LI_CAD_LINHA_CHAVE" />
       </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="complemeto_PS_ENDERECO" Type="String" />
        <asp:Parameter Name="id_PS_CIDADES" Type="Int32" />
        <asp:Parameter Name="id_PS_PESSOA_inc" Type="Int32" />
        <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
        <asp:Parameter Name="cep_PS_ENDERECO" Type="String" />
        <asp:Parameter Name="bairro_PS_ENDERECO" Type="String" />
        <asp:Parameter Name="num_PS_ENDERECO" Type="Int32" />
        <asp:Parameter Name="rua_PS_ENDERECO" Type="String" />
        <asp:Parameter Name="id_PS_TP_ENDERECO" Type="Int32" />
        <asp:Parameter Name="id_LI_LINHAS" Type="Int32" />
    </InsertParameters>
       <SelectParameters>
           <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
       </SelectParameters>
       <UpdateParameters>
           <asp:Parameter Name="dtAlt_PS_ENDERECO" />
           <asp:Parameter Name="id_PS_PESSOA_alt" />
           <asp:Parameter Name="id_PS_CIDADES" />
           <asp:Parameter Name="complemeto_PS_ENDERECO" />
           <asp:Parameter Name="cep_PS_ENDERECO" />
           <asp:Parameter Name="bairro_PS_ENDERECO" />
           <asp:Parameter Name="num_PS_ENDERECO" />
           <asp:Parameter Name="rua_PS_ENDERECO" />
           <asp:Parameter Name="id_PS_ENDERECO" />
       </UpdateParameters>
    </asp:SqlDataSource>
 <asp:SqlDataSource ID="SqlDataSourceLinhasXOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT MIN(LI_LINHAS.id_LI_LINHAS) AS id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS Linha FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.st_LI_LINHAS = 1) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.liCancelada_LI_LINHAS = 0) GROUP BY OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.codLinha_LI_LINHAS">
     <SelectParameters>
         <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
     </SelectParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceUF"  runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownUFTableAdapters.PS_UFTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_cod_PS_UF" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Original_cod_PS_UF" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceCidade"  runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownCidadeTableAdapters.PS_CIDADESTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_PS_CIDADES" Type="Int32" DefaultValue="1" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldUf" Name="cod_PS_UF" PropertyName="Value" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_CIDADES" Type="String" />
            <asp:Parameter Name="Original_id_PS_CIDADES" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT MIN(LI_LINHAS.id_LI_LINHAS) AS id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS Linha FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS WHERE (LI_LINHAS.st_LI_LINHAS = 1) GROUP BY OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.codLinha_LI_LINHAS"></asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldUf" Value="RS" runat="server" />

</asp:Content>
