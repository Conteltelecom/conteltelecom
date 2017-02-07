<%@ Page Title="REPRESENTANTES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadatroRepresentante.aspx.vb" Inherits="conteltelecom.CadatroRepresentante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

<div class="table-responsive">    
<telerik:RadGrid ID="RadGridCadRepresentantes" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadRepresentante" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCadRepresentante">
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_REPRESENTANTE" DataType="System.Int32" FilterControlAltText="Filter id_PS_REPRESENTANTE column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_REPRESENTANTE" UniqueName="id_PS_REPRESENTANTE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="ID PESSOA" ReadOnly="True" SortExpression="id_PS_PESSOA" UniqueName="id_PS_PESSOA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME REPRESENTANTE" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CNPJ/CPF" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%#Me.MascaraCpfCnpj(Eval("CNPJ_PS_JURIDICA"))%>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
             <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" UniqueName="DETALHES" HeaderText="DETALHES">
                                      <EditItemTemplate>
                                      
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <telerik:RadButton ID="RadButtonDetalhes" ButtonType="LinkButton" NavigateUrl='<%# String.Format("~/web/Representantes/CadatroRepresentanteTelefone.aspx?id_PS_PESSOA={0}", Eval("id_PS_PESSOA"))%>' runat="server" Text="DETALHES" CommandName="Pesquisar">
                                              <Icon PrimaryIconUrl ="../../img/search_page.png" />
                                          </telerik:RadButton>
                                      
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-xs-1" />
                                      <ItemStyle HorizontalAlign="Center" />
                                  </telerik:GridTemplateColumn>
            </Columns>
            <EditFormSettings>
                <FormTemplate>
                    <fieldset class="form-group" style="border: 1px solid #ccc;  padding: 10px;">
                        
                                 <table class="rgMasterTable" style="width: 100%">
                           <colgroup>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                        </colgroup>
                                                <thead>

        <tr>
             <th>
            <asp:Label ID="Label3" runat="server"  Font-Bold="true"  Text="NOME FANTASIA:"></asp:Label>
        
        </th>
         <th>
           <asp:Label ID="Label7" runat="server"  Font-Bold="true"  Text="RAZÃO SOCIAL"></asp:Label>
        </th>
            <th>
           <asp:Label ID="Label1" runat="server"  Font-Bold="true"  Text="TIPO PESSOA"></asp:Label>
        </th>
            
            <th>
                 <asp:Label ID="Label6" runat="server"  Font-Bold="true"  Text="CNPJ/CPF:"></asp:Label>

        </th>
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3">
                <telerik:RadTextBox ID="RadTextBoxdesc_PS_PESSOA" Width="95%"  Text='<%# Bind("desc_PS_PESSOA") %>' runat="server"></telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxdesc_PS_PESSOA" ControlToValidate="RadTextBoxdesc_PS_PESSOA" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
         <td class="col-xs-3">
             <telerik:RadTextBox ID="RadTextBoxRazaosocial_PS_JURIDICA" Width="95%"  Text='<%# Bind("razaosocial_PS_JURIDICA") %>' runat="server"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxRazaosocial_PS_JURIDICA" ControlToValidate="RadTextBoxRazaosocial_PS_JURIDICA" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
              
                </td>
         <td class="col-xs-3"> 
             <telerik:RadDropDownList ID="RadDropDownListTipoPessoa" runat="server" Width="95%"  selectedvalue='<%# Bind("tipoCadastro_PS_PESSOA") %>' DropDownHeight="150" AppendDataBoundItems="true" OnSelectedIndexChanged="RadDropDownListTipoPessoa_SelectedIndexChanged" >
                 <Items>
                     <telerik:DropDownListItem Text="FISÍCA" Value="0" />
                      <telerik:DropDownListItem Text="JURÍDICA" Value="1" />
                 </Items>
             </telerik:RadDropDownList>
             
                </td>
          <td class="col-xs-3">
               <telerik:RadMaskedTextBox ID="RadTextBoxCNPJ_PS_JURIDICA" Mask="##.###.###/####-##"  Text ='<%# Bind("CNPJ_PS_JURIDICA") %>'  Width="95%" runat="server" Skin="Bootstrap" LabelWidth="40%"  ></telerik:RadMaskedTextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxCNPJ_PS_JURIDICA" ControlToValidate="RadTextBoxCNPJ_PS_JURIDICA" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator> 
               </td>
         </tr>
                </tbody>
                        <thead>

        <tr>
         <th>
        
               <asp:Label ID="Label5" runat="server"  Font-Bold="true"  Text="CEP:"></asp:Label>
        </th>
            <th>
                
               <asp:Label ID="Label8" runat="server"  Font-Bold="true"  Text="UF:"></asp:Label>
        </th>
             <th>
         <asp:Label ID="Label12" runat="server"  Font-Bold="true"  Text="CIDADE:"></asp:Label>
        </th>
            <th>
            <asp:Label ID="Label13" runat="server"  Font-Bold="true"  Text="BAIRRO:"></asp:Label>
        </th>
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3">
                
                          <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcep_PS_PESSOA" Mask="#####-###"  Text ='<%# Bind("cep_PS_PESSOA") %>'  Width="95%" runat="server" Skin="Bootstrap" LabelWidth="40%" ></telerik:RadMaskedTextBox>   
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadMaskedTextBoxcep_PS_PESSOA"  ControlToValidate="RadMaskedTextBoxcep_PS_PESSOA" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator> 
                   </td>
         <td class="col-xs-3">
              
             <telerik:RadDropDownList ID="RadDropDownListUF" AutoPostBack="true"  OnSelectedIndexChanged="RadDropDownListUF_SelectedIndexChanged" DataSourceID="SqlDataSourceUF"  DataTextField="cod_PS_UF" AppendDataBoundItems="false" DataValueField="cod_PS_UF" SelectedValue='<%# Bind("cod_PS_UF") %>'   runat="server" Width="95%"  ></telerik:RadDropDownList>
                </td>
           <td class="col-xs-3">
               <asp:Label ID="LabelDropCidades" Visible="false" runat="server" Text ='<%# Bind("id_PS_CIDADES") %>' ></asp:Label>
                       <telerik:RadDropDownList ID="RadDropDownListCidade"  DataSourceID="SqlDataSourceCidades"   DataTextField="desc_PS_CIDADES" AppendDataBoundItems="true" DataValueField="id_PS_CIDADES"    runat="server" Width="95%" ></telerik:RadDropDownList>
                
             
                </td>
         <td class="col-xs-3"> 
             <telerik:RadTextBox ID="RadTextBoxBairro" runat="server" Width="95%"  Text ='<%# Bind("bairro_PS_PESSOA") %>'  ></telerik:RadTextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxBairro" ControlToValidate="RadTextBoxBairro" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator> 
                </td>
         </tr>
                </tbody>
                                                                                     <thead>

        <tr>
             <th>
          <asp:Label ID="Label14" runat="server"  Font-Bold="true"  Text="RUA:" Width="95%"  ></asp:Label>
        </th>
         <th>
           <asp:Label ID="Label2" runat="server"  Font-Bold="true"  Text="NÚMERO:" Width="95%" ></asp:Label>
        </th>
            <th>
          <asp:Label ID="Label4" runat="server"  Font-Bold="true"  Text="COMPLEMENTO:" Width="95%" ></asp:Label>
        </th>
            
            <th>
          
        </th>
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3">
                <telerik:RadTextBox ID="RadTextBoxRua" runat="server" Width="95%" Text ='<%# Bind("endereco_PS_PESSOA") %>' ></telerik:RadTextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxRua" ControlToValidate="RadTextBoxRua" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator> 
                                </td>
        <td class="col-xs-3">
            <telerik:RadNumericTextBox ID="RadNumericTextBoxNumero" runat="server" Text ='<%# Bind("numEndereco_PS_PESSOA") %>'  Width="95%"  ></telerik:RadNumericTextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadNumericTextBoxNumero" ControlToValidate="RadNumericTextBoxNumero" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>              
                   </td>
         <td class="col-xs-3">
              <telerik:RadTextBox ID="RadTextBoxComplemento" runat="server" Width="95%" Text ='<%# Bind("complemeto_PS_PESSOA") %>' ></telerik:RadTextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadTextBoxComplemento" ControlToValidate="RadTextBoxComplemento" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>              
                                </td>
         <td class="col-xs-3">
              
                                </td>

         </tr>
                </tbody>
                                     <tbody>

         
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
</table>

                                 </fieldset>
                </FormTemplate>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column"  UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSourceCadRepresentante" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.endereco_PS_PESSOA, PS_PESSOA.numEndereco_PS_PESSOA, PS_PESSOA.bairro_PS_PESSOA, PS_PESSOA.cep_PS_PESSOA, PS_PESSOA.complemeto_PS_PESSOA, PS_PESSOA.obs_PS_PESSOA, PS_PESSOA.email_PS_PESSOA, PS_JURIDICA.razaosocial_PS_JURIDICA, PS_JURIDICA.InsEstadual_PS_JURIDICA, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_CIDADES.desc_PS_CIDADES, PS_CIDADES.id_PS_CIDADES, PS_CIDADES.cod_PS_UF, PS_PESSOA.id_PS_PESSOA, PS_REPRESENTANTE.id_PS_REPRESENTANTE, PS_PESSOA.tipoCadastro_PS_PESSOA FROM PS_PESSOA INNER JOIN PS_REPRESENTANTE ON PS_PESSOA.id_PS_PESSOA = PS_REPRESENTANTE.id_PS_PESSOA INNER JOIN PS_JURIDICA ON PS_PESSOA.id_PS_PESSOA = PS_JURIDICA.id_PS_PESSOA INNER JOIN PS_CIDADES ON PS_PESSOA.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES" InsertCommand="INSERT INTO PS_REPRESENTANTE(id_PS_PESSOA, id_PS_PESSOA_alt, id_PS_PESSOA_inc, id_PS_EMPRESAS, idEmpresa_PS_PESSOA) VALUES (@id_PS_PESSOA, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @id_PS_EMPRESAS, @idEmpresa_PS_PESSOA)">
        <InsertParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_PS_PESSOA_inc" />
            <asp:Parameter Name="id_PS_EMPRESAS" />
            <asp:Parameter Name="idEmpresa_PS_PESSOA" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEmail" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM PS_EMAIL WHERE (id_PS_EMAIL = @id_PS_EMAIL)" InsertCommand="INSERT INTO PS_EMAIL(email_PS_EMAIL, id_PS_PESSOA_alt, id_PS_PESSOA_inc, codTabela) VALUES (@email_PS_EMAIL, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @codTabela)" SelectCommand="SELECT email_PS_EMAIL, id_PS_EMAIL FROM PS_EMAIL WHERE (codTabela = 'PS_REPRESENTANTE') AND (CNPJ_PS_JURIDICA = @CNPJ_PS_JURIDICA)" UpdateCommand="UPDATE PS_EMAIL SET email_PS_EMAIL = @email_PS_EMAIL, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_PS_EMAIL = GETDATE() WHERE (id_PS_EMAIL = @id_PS_EMAIL)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_EMAIL" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email_PS_EMAIL" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_PS_PESSOA_inc" />
            <asp:Parameter Name="codTabela" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="CNPJ_PS_JURIDICA" DefaultValue="" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="email_PS_EMAIL" />
            <asp:Parameter Name="id_PS_PESSOA_alt" />
            <asp:Parameter Name="id_PS_EMAIL" />
        </UpdateParameters>

    </asp:SqlDataSource>
    
      <asp:SqlDataSource ID="SqlDataSourceTelefone" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_TELEFONE] WHERE [id_PS_TELEFONE] = @id_PS_TELEFONE" InsertCommand="INSERT INTO PS_TELEFONE(num_PS_TELEFONE, id_PS_PESSOA_alt, id_ADM_TP_TELEFONE, codTabela, CNPJ_PS_JURIDICA, dtAlt_PS_TELEFONE, id_PS_PESSOA_inc) VALUES (@num_PS_TELEFONE, @id_PS_PESSOA_alt, @id_ADM_TP_TELEFONE, @codTabela, @CNPJ_PS_JURIDICA, GETDATE(), @id_PS_PESSOA_inc)" SelectCommand="SELECT PS_TELEFONE.id_PS_TELEFONE, PS_TELEFONE.num_PS_TELEFONE, ADM_TP_TELEFONE.desc_ADM_TP_TELEFONE, ADM_TP_TELEFONE.id_ADM_TP_TELEFONE FROM PS_TELEFONE INNER JOIN ADM_TP_TELEFONE ON PS_TELEFONE.id_ADM_TP_TELEFONE = ADM_TP_TELEFONE.id_ADM_TP_TELEFONE" UpdateCommand="UPDATE PS_TELEFONE SET num_PS_TELEFONE = @num_PS_TELEFONE, dtAlt_PS_TELEFONE = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, id_ADM_TP_TELEFONE = @id_ADM_TP_TELEFONE WHERE (id_PS_TELEFONE = @id_PS_TELEFONE)">
          <DeleteParameters>
              <asp:Parameter Name="id_PS_TELEFONE" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="num_PS_TELEFONE" Type="String" />
              <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
              <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
              <asp:Parameter Name="codTabela" Type="String" />
              <asp:Parameter Name="CNPJ_PS_JURIDICA" />
              <asp:Parameter Name="id_PS_PESSOA_inc" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="num_PS_TELEFONE" Type="String" />
                   <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
                            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
              <asp:Parameter Name="id_PS_TELEFONE" Type="Int32" />
          </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTiposTelefone" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_ADM_TP_TELEFONE, desc_ADM_TP_TELEFONE FROM ADM_TP_TELEFONE WHERE (st_ADM_TP_TELEFONE = 1)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUF" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT cod_PS_UF FROM View_DropDownUF"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCidades" runat="server" CancelSelectOnNullParameter="false" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_PS_CIDADES, id_PS_CIDADES FROM View_DropDownCidade WHERE (cod_PS_UF = @cod_PS_UF)">
        <SelectParameters>
            <asp:Parameter Name="cod_PS_UF" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePsJuridica" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_JURIDICA] WHERE [id_PS_JURIDICA] = @id_PS_JURIDICA" InsertCommand="INSERT INTO PS_JURIDICA(razaosocial_PS_JURIDICA, id_PS_PESSOA, CNPJ_PS_JURIDICA) VALUES (@razaosocial_PS_JURIDICA, @id_PS_PESSOA, @CNPJ_PS_JURIDICA)" SelectCommand="SELECT id_PS_JURIDICA, razaosocial_PS_JURIDICA, id_PS_PESSOA, InsEstadual_PS_JURIDICA, st_PS_JURIDICA, CNPJ_PS_JURIDICA FROM PS_JURIDICA WHERE (st_PS_JURIDICA = 3)" UpdateCommand="UPDATE [PS_JURIDICA] SET [razaosocial_PS_JURIDICA] = @razaosocial_PS_JURIDICA, [id_PS_PESSOA] = @id_PS_PESSOA, [InsEstadual_PS_JURIDICA] = @InsEstadual_PS_JURIDICA, [st_PS_JURIDICA] = @st_PS_JURIDICA, [CNPJ_PS_JURIDICA] = @CNPJ_PS_JURIDICA WHERE [id_PS_JURIDICA] = @id_PS_JURIDICA">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_JURIDICA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="razaosocial_PS_JURIDICA" Type="String" />
            <asp:Parameter Name="id_PS_PESSOA" Type="Int32" />
            <asp:Parameter Name="CNPJ_PS_JURIDICA" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="razaosocial_PS_JURIDICA" Type="String" />
            <asp:Parameter Name="id_PS_PESSOA" Type="Int32" />
            <asp:Parameter Name="InsEstadual_PS_JURIDICA" Type="String" />
            <asp:Parameter Name="st_PS_JURIDICA" Type="Byte" />
            <asp:Parameter Name="CNPJ_PS_JURIDICA" Type="String" />
            <asp:Parameter Name="id_PS_JURIDICA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server"></telerik:RadWindowManager>
    
      </asp:Content>
