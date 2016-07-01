<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_cliente.aspx.vb" Inherits="conteltelecom.ps_cliente" %>
  <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
      
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
 
       <fieldset>
    <legend>FILTRO</legend> 
          <div class="form-horizontal">

       <div class="form-group"> 
                     <asp:Label ID="Label1" Font-Bold="true" CssClass="col-lg-2 control-label"  runat="server" Text="CÓD INI:" ></asp:Label>
                <div class="col-lg-4">
                      <asp:TextBox ID="TextBoxIni" CssClass="form-control"  runat="server" ></asp:TextBox>
                           <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTextBoxCNPJI" runat="server" Enabled="True" TargetControlID="TextBoxIni" ValidChars="0123456789">
                                </asp:FilteredTextBoxExtender>
                    </div>
                     <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label"  runat="server" Text="CÓD FIM:" ></asp:Label>
                 <div class="col-lg-4">
                      <asp:TextBox ID="TextBoxFim" CssClass="form-control" runat="server" ></asp:TextBox>  
                       <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTextBoxFim" runat="server" Enabled="True" TargetControlID="TextBoxFim" ValidChars="0123456789">
                                </asp:FilteredTextBoxExtender>
                </div> 

                </div> 
              <div class="form-group"> 
                    <asp:Label ID="LabelCodIni0" CssClass="col-lg-2 control-label"  Font-Bold="true" runat="server" Text="RAZÃO SOCIAL:" ></asp:Label>
               <div class="col-lg-4">
                   <asp:TextBox ID="TextBoxRazao" CssClass="form-control"   runat="server" ></asp:TextBox>
                   </div> 
            
                    <asp:Label ID="Label4" CssClass="col-lg-2 control-label"  Font-Bold="true" runat="server" Text="NOME FANTASIA:" ></asp:Label>
               <div class="col-lg-4">
                   <asp:TextBox ID="TextBoxNomeFantasia" CssClass="form-control"   runat="server" ></asp:TextBox>
                   </div> 
                      </div>
             <div class="form-group"> 
                    <asp:Label ID="LabelCnpj" CssClass="col-lg-2 control-label"  Font-Bold="true" runat="server" Text="CNPJ:" ></asp:Label>
               <div class="col-lg-4">
         
                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxCnpjI" Width="100%" Mask="##.###.###/####-##" CssClass="form-control"   runat="server" Skin="Bootstrap"></telerik:RadMaskedTextBox> 
                   </div> 
                   </div>
             <div class="form-group"> 
                 <asp:Label ID="Label3"  Font-Bold="true" runat="server" CssClass="col-lg-2 control-label"  Text="UF:" ></asp:Label>
                  <div class="col-lg-2">
                      <telerik:RadDropDownList ID="RadDropDownListuF"  DefaultMessage=" "  runat ="server" DataSourceID="SqlDataSourceUf"  DataTextField="cod_PS_UF" DataValueField="cod_PS_UF"  Skin="Bootstrap" AutoPostBack="True" ></telerik:RadDropDownList>
               </div> 
                      <div class="col-lg-2">
                       <asp:HyperLink ID="HyperLinkPronptUF" Target="_blank"   ImageUrl="~/img/promotion.png" runat="server" NavigateUrl="~/web/pessoas/ps_uf.aspx"></asp:HyperLink>
                       </div>              
             <asp:Label ID="Label7"  Font-Bold="true" runat="server" CssClass="col-lg-2 control-label"  Text="CIDADE:" ></asp:Label>
                  <div class="col-lg-2">
                      <telerik:RadDropDownList ID="RadDropDownListFiltroCidade"  DefaultMessage=" " runat ="server" DataSourceID="SqlDataSourceDropGrid"  DataTextField="desc_PS_CIDADES" DataValueField="id_PS_CIDADES"  Skin="Bootstrap"></telerik:RadDropDownList>
                                       </div>
                  <div class="col-lg-2">
                       <asp:HyperLink ID="HyperLinkFiltroCidade" Target="_blank"   ImageUrl="~/img/promotion.png" runat="server" NavigateUrl="~/web/pessoas/ps_cidades.aspx"></asp:HyperLink>
                       </div>
                 </div>
             <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                     
   
                 
                    
</div>
             </div> 
        
   </fieldset>
    <hr />
    <br />
  
            
     <telerik:RadGrid ID="RadGridPessoas" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourcePesoas" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both" >

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
             <ExportSettings>
                 <Pdf PageWidth="">
                 </Pdf>
         </ExportSettings>
             <ClientSettings>
             <Selecting AllowRowSelect="True" />
            <ClientEvents OnPopUpShowing="popUpShowing" />
        </ClientSettings>
         <MasterTableView DataSourceID="SqlDataSourcePesoas"  CommandItemDisplay="Top" DataKeyNames="id_PS_PESSOA"  >
             <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
                              <Columns>
                                  <telerik:GridTemplateColumn DataField="id_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="CÓD" SortExpression="id_PS_PESSOA" UniqueName="id_PS_PESSOA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="id_PS_PESSOATextBox" runat="server" Text='<%# Bind("id_PS_PESSOA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="id_PS_PESSOALabel" runat="server" Text='<%# Eval("id_PS_PESSOA") %>'></asp:Label>
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-lg-1" />
                                  </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" UniqueName="razaosocial_PS_JURIDICA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="razaosocial_PS_JURIDICATextBox" runat="server" Text='<%# Bind("razaosocial_PS_JURIDICA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="razaosocial_PS_JURIDICALabel" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'></asp:Label>
                                      </ItemTemplate>
                                  </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CNPJ" UniqueName="CNPJ_PS_JURIDICA">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.CnpjFormat(Eval("CNPJ_PS_JURIDICA")) %>'></asp:Label>
                                      </ItemTemplate>
                                  </telerik:GridTemplateColumn>
                      <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF-CIDADE" ReadOnly="True" SortExpression="cod_PS_UF" UniqueName="cod_PS_UF">
                        
                          <ItemTemplate>
                              <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>-<asp:Label ID="LabelDescCidade" runat="server" Text='<%# Eval("desc_PS_CIDADES") %>'></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle CssClass="col-lg-3" />
                        </telerik:GridTemplateColumn>
                      <telerik:GridTemplateColumn DefaultInsertValue="1" DataField="st_PS_PESSOA" DataType="System.Byte" FilterControlAltText="Filter st_PS_PESSOA column" HeaderText="SITUAÇÃO" SortExpression="st_PS_PESSOA" UniqueName="st_PS_PESSOA">
                          <ItemTemplate>
                              <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("st_PS_PESSOA") %>' />
                          </ItemTemplate>
                          <HeaderStyle Width="50px" CssClass="col-lg-1" />
                          <ItemStyle HorizontalAlign="Center" />
                      </telerik:GridTemplateColumn>

                                  <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" UniqueName="DETALHES" HeaderText="DETALHES">
                                      <EditItemTemplate>
                                          <telerik:RadUpload ID="RUC_DETALHES" runat="server" AllowedFileExtensions="" ControlObjectsVisibility="None" InitialFileInputsCount="1" MaxFileInputsCount="1" MaxFileSize="0" ReadOnlyFileInputs="true" Skin="Bootstrap">
                                          </telerik:RadUpload>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <telerik:RadButton ID="RadButtonDetalhes" runat="server" Text="DETALHES" CommandName="Pesquisar">
                                              <Icon PrimaryIconUrl ="../../img/search_page.png" />
                                          </telerik:RadButton>
                                      
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-lg-21" />
                                      <ItemStyle HorizontalAlign="Center" />
                                  </telerik:GridTemplateColumn>

             </Columns>
           
         
           <EditFormSettings    EditColumn-ButtonType="ImageButton"  EditFormType="Template" FormStyle-CssClass="col-lg-12">
                 <EditColumn ButtonType="ImageButton" >
             </EditColumn>
          
<FormStyle CssClass="col-lg-12"></FormStyle>
          
                </EditFormSettings>
             
         </MasterTableView>
   
     </telerik:RadGrid>
   
     <asp:SqlDataSource ID="SqlDataSourcePesoas"  CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPessoas" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_PESSOA(desc_PS_PESSOA, endereco_PS_PESSOA, numEndereco_PS_PESSOA, bairro_PS_PESSOA, cep_PS_PESSOA, id_PS_CIDADES, complemeto_PS_PESSOA, obs_PS_PESSOA, st_PS_PESSOA, tipoCadastro_PS_PESSOA) VALUES (@desc_PS_PESSOA, @endereco_PS_PESSOA, @numEndereco_PS_PESSOA, @bairro_PS_PESSOA, @cep_PS_PESSOA, @id_PS_CIDADES, @complemeto_PS_PESSOA, @obs_PS_PESSOA, @st_PS_PESSOA, @tipoCadastro_PS_PESSOA)" UpdateCommand="UPDATE PS_PESSOA SET desc_PS_PESSOA = @desc_PS_PESSOA, endereco_PS_PESSOA = @endereco_PS_PESSOA, numEndereco_PS_PESSOA = @numEndereco_PS_PESSOA, bairro_PS_PESSOA = @bairro_PS_PESSOA, cep_PS_PESSOA = @cep_PS_PESSOA, complemeto_PS_PESSOA = @complemeto_PS_PESSOA, id_PS_CIDADES = @id_PS_CIDADES, obs_PS_PESSOA = @obs_PS_PESSOA, st_PS_PESSOA = @st_PS_PESSOA, tipoCadastro_PS_PESSOA = @tipoCadastro_PS_PESSOA WHERE (id_PS_PESSOA = @id_PS_PESSOA)">
         <InsertParameters>
             <asp:Parameter Name="desc_PS_PESSOA" />
             <asp:Parameter Name="endereco_PS_PESSOA" />
             <asp:Parameter Name="numEndereco_PS_PESSOA" />
             <asp:Parameter Name="bairro_PS_PESSOA" />
             <asp:Parameter Name="cep_PS_PESSOA" />
             <asp:Parameter Name="id_PS_CIDADES" />
             <asp:Parameter Name="complemeto_PS_PESSOA" />
             <asp:Parameter Name="obs_PS_PESSOA" />
             <asp:Parameter Name="st_PS_PESSOA" />
             <asp:Parameter Name="tipoCadastro_PS_PESSOA" />
         </InsertParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="TextBoxIni" Name="codIni" PropertyName="Text" Type="Int32" />
             <asp:ControlParameter ControlID="TextBoxFim" Name="codFim" PropertyName="Text" Type="Int32" />
             <asp:ControlParameter ControlID="TextBoxNomeFantasia" Name="Desc" PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="RadDropDownListuF" Name="UF" PropertyName="SelectedValue" Type="String" />
             <asp:ControlParameter ControlID="RadDropDownListFiltroCidade" Name="id_PS_CIDADES" PropertyName="SelectedValue" Type="Int32" />
             <asp:Parameter Name="codDetalhes" Type="Int32" />
                  <asp:Parameter Name="CNPJ_PS_JURIDICA" Type="String"  />
             <asp:ControlParameter ControlID="TextBoxRazao" Name="razaosocial_PS_JURIDICA" PropertyName="Text" Type="String" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="desc_PS_PESSOA" />
             <asp:Parameter Name="endereco_PS_PESSOA" />
             <asp:Parameter Name="numEndereco_PS_PESSOA" />
             <asp:Parameter Name="bairro_PS_PESSOA" />
             <asp:Parameter Name="cep_PS_PESSOA" />
             <asp:Parameter Name="complemeto_PS_PESSOA" />
             <asp:Parameter Name="id_PS_CIDADES" />
             <asp:Parameter Name="obs_PS_PESSOA" />
             <asp:Parameter Name="st_PS_PESSOA" />
             <asp:Parameter Name="tipoCadastro_PS_PESSOA" />
             <asp:Parameter Name="id_PS_PESSOA" />
         </UpdateParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceUf" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
         <br />
       <asp:SqlDataSource ID="SqlDataSourceDropGrid" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownCidade" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:Parameter Name="cod_PS_UF"  DefaultValue="RS"/>
                                  </SelectParameters>
                              </asp:SqlDataSource>
    <br />
</asp:Content>
