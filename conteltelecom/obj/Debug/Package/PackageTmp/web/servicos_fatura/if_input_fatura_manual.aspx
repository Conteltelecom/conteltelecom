<%@ Page Title="LANÇAMENTO DE FATURAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="if_input_fatura_manual.aspx.vb" Inherits="conteltelecom.if_input_fatura_manual" %>
  <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
  
      <script type="text/javascript">
        //Put your JavaScript code here.
        function confirmDeleteBackFn(arg) {
     
            var grid = $find("<%= RadGridFaturas.ClientID %>");
           if (arg) {
      
                grid.get_masterTableView().fireCommand("DeleteChecked", 0);
            }
        }
    </script>
    <fieldset>

<div class="panel panel-default">
    <div class="panel-body">

    <legend>FILTRO</legend> 
          <div class="form-horizontal">

       
              <div class="form-group"> 
                    <asp:Label ID="LabelCodIni0" CssClass="col-lg-2 control-label"  Font-Bold="true" runat="server" Text="RAZÃO SOCIAL:" ></asp:Label>
               <div class="col-lg-4">
                   <asp:TextBox ID="TextBoxRazao" CssClass="form-control"   runat="server" ></asp:TextBox>
                   </div> 
                     <asp:Label ID="Label1" CssClass="col-lg-2 control-label"  Font-Bold="true" runat="server" Text="CNPJ:" ></asp:Label>
               <div class="col-lg-4">
                 <telerik:RadMaskedTextBox ID="RadMaskedTextBoxCnpjI" Width="100%" Mask="##.###.###/####-##" CssClass="form-control"   runat="server" Skin="Bootstrap"></telerik:RadMaskedTextBox> 
                   </div> 
                      </div>
             
              <div class="form-group">
      <telerik:RadLabel ID="RadLabelImportacaoManual" Text="CÓD/Nº LINHA:"  CssClass ="col-sm-2 control-label" Font-Bold="true"  runat="server" Skin="Bootstrap"></telerik:RadLabel>
      <div class="col-sm-4">

  <telerik:RadTextBox ID="RadTextBoxcodLinha_LI_LINHAS"   runat="server" Skin="Bootstrap"  Width="100%" ></telerik:RadTextBox>
          </div>
      
      <div class="col-sm-6">
       

          </div>
      </div>
                       <div class="form-group">
      <telerik:RadLabel ID="RadLabel2" Text="MÊS/ANO"  CssClass ="col-sm-2 control-label" Font-Bold="true"  runat="server" Skin="Bootstrap"></telerik:RadLabel>
      <div class="col-sm-4">
          <telerik:RadMaskedTextBox ID="RadMaskedTextBoxMesAno_ins"  Mask="<1..12>/<2000..2050>"  Width="100%"  runat="server"></telerik:RadMaskedTextBox>
          <asp:CustomValidator ID="CustomValidator1" runat="server"  ErrorMessage="CustomValidator"></asp:CustomValidator>
          
            </div>
       <div class="col-sm-6">
 
          </div>

      </div>
              
               
             <div class="col-lg-12" style="text-align:right">
                 <hr />
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButton2" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                     
   
                 
                    
</div>
             </div> 
        </div>
    </div>
        
   </fieldset>
    


    <hr />
    <br />
      <asp:UpdatePanel ID="UpdatePanelGridFauturas" runat="server" UpdateMode="Conditional" >
        <ContentTemplate>
            <div class="table-responsive"> 
            <telerik:RadGrid ID="RadGridFaturas" runat="server" AutoGenerateColumns="False" RenderMode="Auto" Culture="pt-BR" DataSourceID="SqlDataSourceLinhas" Skin="Bootstrap" >
                                  <GroupPanel Text="ARRASTE  A COLUNA PARA FILTRAR"></GroupPanel>
<GroupingSettings CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip="">
    
</GroupingSettings>

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhas" DataKeyNames="id_SF_SERVICOS_FATURA" EditMode="InPlace" CommandItemDisplay="Top" AllowAutomaticDeletes="True" NoMasterRecordsText="SEM REGISTROS"   >
          <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR"  />
            <Columns>
                <telerik:GridTemplateColumn DataField="id_SF_SERVICOS_FATURA" DataType="System.Int32" FilterControlAltText="Filter id_SF_SERVICOS_FATURA column" HeaderText="ID" SortExpression="id_SF_SERVICOS_FATURA" UniqueName="id_SF_SERVICOS_FATURA" ReadOnly="True">
                    <EditItemTemplate>
                        <asp:TextBox ID="id_SF_SERVICOS_FATURATextBox" runat="server" Text='<%# Bind("id_SF_SERVICOS_FATURA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("id_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn1 column" HeaderText="NUM FATURA" UniqueName="TemplateColumn1">
                    <EditItemTemplate>
                       
                      
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                        
                                          
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                        <asp:Label ID="Labelid_LI_LINHAS" runat="server" Text='<%# Eval("id_LI_LINHAS")  %>' Visible="false"></asp:Label>
                      <asp:Label ID="desc_OP_OPERADORASLabelEdit" runat="server" Text='<%# Eval("desc_OP_OPERADORAS")  %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
          
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtaPerIni_SF_SERVICOS_FATURA"  FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="DT INICIAL" SortExpression="dtaPerIni_SF_SERVICOS_FATURA" UniqueName="dtaPerIni_SF_SERVICOS_FATURA" Visible="False">
                    <EditItemTemplate>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="dtaPerIni_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("dtaPerIni_SF_SERVICOS_FATURA", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtaPerFim_SF_SERVICOS_FATURA"  FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="DT FIM" SortExpression="dtaPerFim_SF_SERVICOS_FATURA" UniqueName="dtaPerFim_SF_SERVICOS_FATURA" Visible="False" >
                    <EditItemTemplate>
                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="dtaPerFim_SF_SERVICOS_FATURALabel"  runat="server" Text='<%# Eval("dtaPerFim_SF_SERVICOS_FATURA", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                   <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="dtVencimento_SF_SERVICOS_FATURA"  FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="DT VENCIMENTO" SortExpression="dtVencimento_SF_SERVICOS_FATURA" UniqueName="dtVencimento_SF_SERVICOS_FATURA" Visible="False" >
                    <EditItemTemplate>
                     
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="dtVencimento_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("dtVencimento_SF_SERVICOS_FATURA", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="razaosocial_PS_JURIDICA"  FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <EditItemTemplate>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="razaosocial_PS_JURIDICALabel" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'> </asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                   
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="MÊS/ANO" SortExpression="mesAnoRefereincia_SF_SERVICOS_FATURA" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA" ReadOnly="false">
                    <EditItemTemplate>
                 
                        
                         </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mesAnoRefereincia_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("mesAnoRefereincia_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
               
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="tpConta" FilterControlAltText="Filter tpConta column" HeaderText="TP CONTA" ReadOnly="True" UniqueName="tpConta">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="vltotalLinha_SF_SERVICOS_FATURA" FilterControlAltText="Filter vltotalLinha_SF_SERVICOS_FATURA column" HeaderText="VL TOTAL R$" UniqueName="vltotalLinha_SF_SERVICOS_FATURA">
                    <EditItemTemplate>
                      
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vltotalLinha_SF_SERVICOS_FATURALabel" runat="server" Text='<%# Eval("vltotalLinha_SF_SERVICOS_FATURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
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
             <th colspan="2">
            <asp:Label ID="Label3" runat="server"  Font-Bold="true"  Text="NÚMERO DA FATURA:"></asp:Label>
        
        </th>
         
            <th>
           <asp:Label ID="Label1" runat="server"  Font-Bold="true"  Text="CÓD/LINHA:"></asp:Label>
        </th>
            
           
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow">
            <td class="col-xs-3" colspan="2">
           
               
                    <telerik:RadAutoCompleteBox  ID="RadAutoCompleteBoxNumFatura"  CssClass="RadAutoCompleteBox"   Width="95%"   TextSettings-SelectionMode = "Single"  OnTextChanged="RadAutoCompleteBoxNumFatura_TextChanged"  runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceBuscafaturas" DataTextField="FATURAS" DataValueField="id_SF_LEITURA_FATURA" InputType="Text">
                        <TextSettings SelectionMode="Single"  />
                      <TokensSettings AllowTokenEditing="false" />
                    </telerik:RadAutoCompleteBox>


             
                  
                
                       </div>
            </td>
               
                                            
                 
         
         <td class="col-xs-3" colspan="2"> 
            
             <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxCodLInhas"  CssClass="RadAutoCompleteBox" OnTextChanged="RadAutoCompleteBoxCodLInhas_TextChanged"    Width="95%" runat="server"  MaxResultCount="10"  TextSettings-SelectionMode = "Single" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasXOperadoras" DataTextField="Linha" DataValueField="id_LI_LINHAS"  InputType="Text" >
                 <TokensSettings AllowTokenEditing="false" />
                 <TextSettings SelectionMode ="Single" />
             </telerik:RadAutoCompleteBox>
                </td>
      
         </tr>
                </tbody>
                        <thead>

        <tr>
         <th>
        
               <asp:Label ID="Label5" runat="server"  Font-Bold="true"  Text="PERÍODO INICIAL:"></asp:Label>
        </th>
            <th>
                
               <asp:Label ID="Label8" runat="server"  Font-Bold="true"  Text="PERÍODO FINAL:"></asp:Label>
        </th>
             <th>
         <asp:Label ID="Label12" runat="server"  Font-Bold="true"  Text="DATA VENCIMENTO:"></asp:Label>
        </th>
            <th>
            <asp:Label ID="Label13" runat="server"  Font-Bold="true"  Text="MÊS/ANO:"></asp:Label>
        </th>
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3">
                 <telerik:RadDatePicker ID="RadDatePickerDataInicial" Width="95%" Runat="server" Culture="pt-BR" SelectedDate='<%# System.DateTime.Today %>'  DbSelectedDate='<%# Bind("dtaPerIni_SF_SERVICOS_FATURA") %>'>
                        </telerik:RadDatePicker>
         
                   </td>
         <td class="col-xs-3">
                  <telerik:RadDatePicker ID="RadDatePickerDataIniFinal"  Width="95%" SelectedDate='<%# System.DateTime.Today %>'  Runat="server" Culture="pt-BR" DbSelectedDate='<%# Bind("dtaPerFim_SF_SERVICOS_FATURA") %>'>
                        </telerik:RadDatePicker>
          
                </td>
           <td class="col-xs-3">
              
              
                   <telerik:RadDatePicker ID="RadDatePickerdtVencimento_SF_SERVICOS_FATURA"  Width="95%" SelectedDate='<%# System.DateTime.Today %>'  Runat="server" Culture="pt-BR" DbSelectedDate='<%# Bind("dtVencimento_SF_SERVICOS_FATURA") %>'>
                        </telerik:RadDatePicker>
             
                </td>
         <td class="col-xs-3"> 
                  <telerik:RadMaskedTextBox ID="RadMaskedTextBoxmesAno"  Mask="<1..12>/<2000..2050>"  Width="95%" OnTextChanged="RadMaskedTextBoxmesAno_TextChanged"  runat="server" Text='<%#Bind("mesAnoRefereincia_SF_SERVICOS_FATURA") %>'></telerik:RadMaskedTextBox>
                    <asp:RequiredFieldValidator ID="RequiRadMaskedTextBoxmesAno" ControlToValidate="RadMaskedTextBoxmesAno" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                </td>
         </tr>
                </tbody>
                                                                                     <thead>

        <tr>
             <th>
          <asp:Label ID="Label14" runat="server"  Font-Bold="true"  Text="TOTAL:" Width="95%"  ></asp:Label>
        </th>
         <th>
         <asp:Label ID="Label2" runat="server"  Font-Bold="true"  Text="RAZÃO SOCIAL:" Width="95%"  ></asp:Label>
        </th>
            <th>
       
        </th>
            
            <th>
          
        </th>
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3">
                 <telerik:RadNumericTextBox ID="vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox" runat="server" Width="90%" DbValue='<%#Eval("vltotalLinha_SF_SERVICOS_FATURA") %>' Type="Number" NumberFormat-DecimalDigits="2">
                        <IncrementSettings InterceptMouseWheel="false" />
						</telerik:RadNumericTextBox>
                         <asp:RequiredFieldValidator ID="RequivltotalLinha" ControlToValidate="vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
        <td class="col-xs-3">
             <asp:Label ID="razaosocial_PS_JURIDICALabelEdit" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'> </asp:Label>
                   </td>
         <td class="col-xs-3">
           
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

                                 </fieldset></FormTemplate>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column"  UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
     </telerik:RadGrid>
    </div> <!-- fim responsive-table -->
  
        </ContentTemplate>

    </asp:UpdatePanel>
    
      <asp:SqlDataSource ID="SqlDataSourceLinhas" CancelSelectOnNullParameter="False"   runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadLabelImportacaoManual" InsertCommand="Sp_Insert_SF_SERVICOS_FATURA" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM SF_SERVICOS_FATURA WHERE (id_SF_SERVICOS_FATURA = @id_SF_SERVICOS_FATURA)">
          <DeleteParameters>
              <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" />
              <asp:Parameter Name="id_LI_LINHAS" Type="Int32" />
              <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
              <asp:Parameter Name="vltotalLinha_SF_SERVICOS_FATURA" Type="Decimal"  />
              <asp:Parameter Name="id_PS_PESSOA"  Type="Int32" />
              <asp:Parameter Name="id_PS_CIDADES" Type="Int32"/>
              <asp:Parameter Name="id_LI_TIPOS"  Type="Int32" />
              <asp:Parameter Name="codMatriz_PS_CLIENTES" Type="Int32" />
              <asp:Parameter Name="id_OP_OPERADORAS" Type="Int32" />
            
              <asp:Parameter Name="vlInicial_id_LI_TIPOS"  Type="Decimal"  />
              <asp:Parameter Name="perIncial_LI_LINHAS" Type="String" />
              <asp:Parameter Name="foraAnalise_LI_LINHAS" Type="Int32" />
            
              <asp:Parameter Name="vl_contrato" Type="Decimal" />
              <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" Type="Int32" />
            
              <asp:Parameter Name="nomeUnidade_LI_LINHAS" Type="String" />
              <asp:Parameter Name="codLinha_LI_LINHAS" Type="String" />
            
              <asp:Parameter DbType="Date" Name="dtaPerIni_SF_SERVICOS_FATURA" />
              <asp:Parameter DbType="Date" Name="dtaPerFim_SF_SERVICOS_FATURA" />
              <asp:Parameter DbType="Date" Name="dtVencimento_SF_SERVICOS_FATURA" />
        
             <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_USUARIO" Type="Int32" />
     
        
            
          </InsertParameters>
          <SelectParameters>
              <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" ConvertEmptyStringToNull="true"  />
              <asp:Parameter DefaultValue="" Name="codLinha_LI_LINHAS" Type="String"  ConvertEmptyStringToNull="true"  />
              <asp:ControlParameter ControlID="RadMaskedTextBoxCnpjI" Name="CNPJ_PS_JURIDICA" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true"  />
              <asp:ControlParameter ControlID="RadMaskedTextBoxCnpjI" Name="razaosocial_PS_JURIDICA" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
          </SelectParameters>
     </asp:SqlDataSource>
    
     <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>
    
     <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceLinhasXOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT MIN(LI_LINHAS.id_LI_LINHAS) AS id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS Linha FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS WHERE (LI_LINHAS.st_LI_LINHAS = 1) GROUP BY OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.codLinha_LI_LINHAS"></asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceUltimoServico" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_VL_SERVICO.id_SF_SERVICOS_FATURA, SF_VL_SERVICO.desc_SF_VL_SERVICO, SF_VL_SERVICO.vl_SF_VL_SERVICO, SF_VL_SERVICO.vlDesconto_SF_VL_SERVICO, SF_VL_SERVICO.codNumLinha_SF_VL_SERVICO, SF_SERVICOS_FATURA.id_LI_LINHAS, SF_VL_SERVICO.qtDias_SF_VL_SERVICO FROM SF_VL_SERVICO INNER JOIN SF_SERVICOS_FATURA ON SF_VL_SERVICO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA WHERE (SF_SERVICOS_FATURA.id_LI_LINHAS = @id_LI_LINHAS) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA = 0) ORDER BY SF_VL_SERVICO.id_SF_SERVICOS_FATURA DESC" InsertCommand="INSERT INTO SF_VL_SERVICO(id_SF_SERVICOS_FATURA, desc_SF_VL_SERVICO, qtDias_SF_VL_SERVICO, vl_SF_VL_SERVICO, vlDesconto_SF_VL_SERVICO, codNumLinha_SF_VL_SERVICO) VALUES (@id_SF_SERVICOS_FATURA, @desc_SF_VL_SERVICO, @qtDias_SF_VL_SERVICO, @vl_SF_VL_SERVICO, @vlDesconto_SF_VL_SERVICO, @codNumLinha_SF_VL_SERVICO)">
         <InsertParameters>
             <asp:Parameter Name="id_SF_SERVICOS_FATURA" Type="Int32" />
             <asp:Parameter Name="desc_SF_VL_SERVICO" />
             <asp:Parameter Name="qtDias_SF_VL_SERVICO" Type="Int16" />
             <asp:Parameter Name="vl_SF_VL_SERVICO"  Type="Double" />
             <asp:Parameter Name="vlDesconto_SF_VL_SERVICO" Type="Double"  />
             <asp:Parameter Name="codNumLinha_SF_VL_SERVICO" />
         </InsertParameters>
         <SelectParameters>
             <asp:Parameter Name="id_LI_LINHAS" />
             <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
         </SelectParameters>
     </asp:SqlDataSource>
    
     <asp:SqlDataSource ID="SqlDataSourceUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO SF_VL_USO(id_SF_TIPO_USO, id_OP_OPERADORAS, vlUso_SF_VL_USO, minutos_SF_VL_USO, id_SF_SERVICOS_FATURA, codNumLinha_SF_VL_USO) VALUES (@id_SF_TIPO_USO, @id_OP_OPERADORAS, @vlUso_SF_VL_USO, @minutos_SF_VL_USO, @id_SF_SERVICOS_FATURA, @codNumLinha_SF_VL_USO)" SelectCommand="SELECT SF_VL_USO.id_SF_TIPO_USO, SF_VL_USO.id_OP_OPERADORAS, SF_VL_USO.vlUso_SF_VL_USO, SF_VL_USO.minutos_SF_VL_USO, SF_VL_USO.codNumLinha_SF_VL_USO FROM SF_VL_USO INNER JOIN SF_SERVICOS_FATURA ON SF_VL_USO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA WHERE (SF_SERVICOS_FATURA.id_LI_LINHAS = @id_LI_LINHAS) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA = 0)">
         <InsertParameters>
             <asp:Parameter Name="id_SF_TIPO_USO" />
             <asp:Parameter Name="id_OP_OPERADORAS" />
             <asp:Parameter Name="vlUso_SF_VL_USO" Type="Decimal"  />
             <asp:Parameter Name="minutos_SF_VL_USO" />
             <asp:Parameter Name="id_SF_SERVICOS_FATURA" />
             <asp:Parameter Name="codNumLinha_SF_VL_USO" />
         </InsertParameters>
         <SelectParameters>
             <asp:Parameter Name="id_LI_LINHAS" />
             <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
         </SelectParameters>
     </asp:SqlDataSource>
       <asp:HiddenField ID="HiddenField1" runat="server" Value="false" />
      <asp:SqlDataSource ID="SqlDataSourceBuscafaturas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CAST(SF_LEITURA_FATURA.numFatura_SF_LEITURA_FATURA AS VARCHAR(18)) + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS FATURAS, SF_LEITURA_FATURA.id_SF_LEITURA_FATURA FROM SF_LEITURA_FATURA INNER JOIN OP_OPERADORAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS WHERE (SF_LEITURA_FATURA.stImportacao_SF_LEITURA_FATURA = 0)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLinhasFatura" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT MIN(LI_LINHAS.id_LI_LINHAS) AS id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS + '-' + OP_OPERADORAS.desc_OP_OPERADORAS AS Linha FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN SF_SOLICITACAO_FATURA_NOTA ON dbo.MascaraSomenteNumeros(LI_LINHAS.numContrato_LI_LINHAS) = dbo.MascaraSomenteNumeros(SF_SOLICITACAO_FATURA_NOTA.cotAgrupado_SF_SOLICITACAO_FATURA_NOTA) WHERE (LI_LINHAS.st_LI_LINHAS = 1) AND (SF_SOLICITACAO_FATURA_NOTA.id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA) GROUP BY OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.codLinha_LI_LINHAS">
        <SelectParameters>
            <asp:Parameter Name="id_SF_LEITURA_FATURA" />
        </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSourceBuscaValorFaturas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SF_LEITURA_FATURA.id_SF_LEITURA_FATURA, SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA, SF_LEITURA_FATURA.id_OP_OPERADORAS, SF_LEITURA_FATURA.dtPeriodo_ini_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtPeriodo_Fim_SF_LEITURA_FATURA, PS_JURIDICA.razaosocial_PS_JURIDICA, OP_OPERADORAS.desc_OP_OPERADORAS, SF_SOLICITACAO_FATURA_NOTA.vlTotal_SF_SOLICITACAO_FATURA_NOTA FROM OP_OPERADORAS INNER JOIN SF_LEITURA_FATURA INNER JOIN SF_SOLICITACAO_FATURA_NOTA ON SF_LEITURA_FATURA.id_SF_LEITURA_FATURA = SF_SOLICITACAO_FATURA_NOTA.id_SF_LEITURA_FATURA ON OP_OPERADORAS.id_OP_OPERADORAS = SF_LEITURA_FATURA.id_OP_OPERADORAS INNER JOIN PS_CLIENTES INNER JOIN LI_LINHAS ON PS_CLIENTES.id_PS_CLIENTES = LI_LINHAS.id_PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA ON dbo.MascaraSomenteNumeros(SF_SOLICITACAO_FATURA_NOTA.cotAgrupado_SF_SOLICITACAO_FATURA_NOTA) = dbo.MascaraSomenteNumeros(LI_LINHAS.numContrato_LI_LINHAS) WHERE (SF_LEITURA_FATURA.id_SF_LEITURA_FATURA = @id_SF_LEITURA_FATURA) AND (LI_LINHAS.id_LI_LINHAS = @id_LI_LINHAS)">
          <SelectParameters>
              <asp:Parameter Name="id_SF_LEITURA_FATURA" />
              <asp:Parameter Name="id_LI_LINHAS" />
          </SelectParameters>
      </asp:SqlDataSource>
</asp:Content>
