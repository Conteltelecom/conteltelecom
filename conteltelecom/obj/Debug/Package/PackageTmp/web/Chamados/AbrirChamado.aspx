<%@ Page Title="ABRIR CHAMADO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="AbrirChamado.aspx.vb" Inherits="conteltelecom.AbrirChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
   
        <style>
       .RadGrid_Bootstrap .rgRow [type="text"], .RadGrid_Bootstrap .rgAltRow [type="text"], .RadGrid_Bootstrap .rgEditForm [type="text"] {
           border:0px !important
}
    </style>
    <telerik:RadMenu ID="RadMenuAtendimentos" runat="server" EnableRoundedCorners = "true" EnableShadows = "true" Skin="Bootstrap"  >
          
        <Items>

             <telerik:RadMenuItem Text="MEUS CHAMADOS" Selected="true" >
                
             </telerik:RadMenuItem>
          
                      
           <telerik:RadMenuItem Text="EM ATENDIMENTO" ></telerik:RadMenuItem>
               <telerik:RadMenuItem Text="AGUARDANDO ATENDIMENTO"></telerik:RadMenuItem>
            <telerik:RadMenuItem Text="TODOS"> </telerik:RadMenuItem>
        </Items>
    </telerik:RadMenu>
    <telerik:RadGrid ID="RadGridChamados" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceAbrirChamado" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <ExportSettings>
        <Pdf PageWidth="">
        </Pdf>
    </ExportSettings>
    <MasterTableView DataKeyNames="id_CH_CHAMADOS" DataSourceID="SqlDataSourceAbrirChamado">
        <Columns>
            <telerik:GridBoundColumn DataField="id_CH_CHAMADOS" DataType="System.Int32" FilterControlAltText="Filter id_CH_CHAMADOS column" HeaderText="NÚMERO" ReadOnly="True" SortExpression="id_CH_CHAMADOS" UniqueName="id_CH_CHAMADOS">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="numSeq_CH_SUBCHAMADOS" DataType="System.Int32" FilterControlAltText="Filter numSeq_CH_SUBCHAMADOS column" HeaderText="SEQ." SortExpression="numSeq_CH_SUBCHAMADOS" UniqueName="numSeq_CH_SUBCHAMADOS">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PS_JURIDICA.razaosocial_PS_JURIDICA" FilterControlAltText="Filter PS_JURIDICA.razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" UniqueName="PS_JURIDICA.razaosocial_PS_JURIDICA">
                <HeaderStyle CssClass="col-xs-3" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="dtFim_CH_SUBCHAMADOS" DataType="System.DateTime" FilterControlAltText="Filter dtFim_CH_SUBCHAMADOS column" HeaderText="PRAZO" SortExpression="dtFim_CH_SUBCHAMADOS" UniqueName="dtFim_CH_SUBCHAMADOS">
                <HeaderStyle CssClass="col-xs-1" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="assunto_CH_SUBCHAMADOS" FilterControlAltText="Filter assunto_CH_SUBCHAMADOS column" HeaderText="ASSUNTO" SortExpression="assunto_CH_SUBCHAMADOS" UniqueName="assunto_CH_SUBCHAMADOS">
                <HeaderStyle CssClass="col-xs-4" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="desc_CH_TIPO_TAREFA" FilterControlAltText="Filter desc_CH_TIPO_TAREFA column" HeaderText="PROBLEMA" UniqueName="desc_CH_TIPO_TAREFA">
                <HeaderStyle CssClass="col-xs-3" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                <ItemTemplate>
                     <telerik:RadButton ID="RadButtonDetalhesFilho" runat="server" Text="DETALHES" ButtonType="LinkButton"  NavigateUrl=' <% #String.Format("~/web/Chamados/ChamadosDetalhes.aspx?id_CH_CHAMADOS={0}&numSeq_CH_SUBCHAMADOS={1}", Eval("id_CH_CHAMADOS"), Eval("numSeq_CH_SUBCHAMADOS")) %>' CommandName="Detalhes">
                                    <Icon PrimaryIconUrl ="~\img\search_page.png" />
                                </telerik:RadButton>       
                </ItemTemplate>
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
            <th colspan="1">
                 <asp:Label ID="Label7" runat="server"  Font-Bold="true"  Text="NOME DO CLIENTE"></asp:Label>
                 </th>
             <th colspan="1">
                 <asp:Label ID="Label6" runat="server"  Font-Bold="true"  Text="CONTATO"></asp:Label>
                 </th>
            <th colspan="1">
                 <asp:Label ID="Label8" runat="server"  Font-Bold="true"  Text="E-MAIL"></asp:Label>
                 </th>
            <th colspan="1">
                 <asp:Label ID="Label9" runat="server"  Font-Bold="true"  Text="TELEFONE"></asp:Label>
                 </th>
            </tr>
                          </thead>   

                                     <tbody>
     <tr class="rgEditRow" >
         <td class="col-xs-3" colspan="1">
                       
             <telerik:RadSearchBox ID="RadSearchBoxBuscaPessoa"   Width="95%" runat="server"  Culture="pt-BR" DataSourceID="SqlDataSourceClientesNomeFantasia" DataTextField="CLIENTE" DataValueField="codMatriz_PS_CLIENTES"></telerik:RadSearchBox>
                </td>
            <td class="col-xs-3" colspan="1">
                <telerik:RadTextBox ID="RadTextBoxNomeContato" Width="99%" runat="server" LabelWidth="40%" Resize="None" Text='<%# Bind("contato_CH_SUBCHAMADOS") %>'></telerik:RadTextBox>
                </td>
          <td class="col-xs-3" colspan="1">
              <telerik:RadTextBox ID="RadTextBoxEmail" Width="99%"   runat="server" LabelWidth="40%" Resize="None" Text='<%# Bind("email_CH_SUBCHAMADOS") %>'></telerik:RadTextBox>
                </td>
          <td class="col-xs-3" colspan="1">
              <telerik:RadMaskedTextBox ID="RadMaskedTextBoxFone" Width="99%" Mask="(##)#-####-####"  runat="server" LabelWidth="40%" Text='<%# Bind("telefone_CH_SUBCHAMADOS") %>'></telerik:RadMaskedTextBox>
                </td>
         </tr>
       </tbody>
  
                                                                                     <thead>

        <tr>
             <th colspan="1">
            <asp:Label ID="Label3" runat="server"  Font-Bold="true"  Text="SETOR RESPONSÁVEL"></asp:Label>
        
        </th>
     
            <th colspan="1">
           <asp:Label ID="LabelNomeTarefa" runat="server"  Font-Bold="true"  Text="NOME DA TAREFA"></asp:Label>
        </th>
            <th colspan="2">
                 <asp:Label ID="Label5" runat="server"  Font-Bold="true"  Text="ASSUNTO"></asp:Label>
                 </th>
            
        </tr>
    </thead> 
<tbody>
     <tr class="rgEditRow" >
                      <td class="col-xs-3" colspan="1">
               <telerik:RadDropDownList Width="99%" ID="RadDropDownListSetor"  AppendDataBoundItems="false" runat="server" DataSourceID="SqlDataSourceSetores" DataTextField="desc_CH_SETORES" DataValueField="id_CH_SETORES" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_SETORES") %>'></telerik:RadDropDownList>
                          
                                </td>
                 <td class="col-xs-3" colspan="1" > 
             
             <telerik:RadDropDownList ID="RadDropDownListTarefas" Width="99%" AppendDataBoundItems="false" runat="server" DataSourceID="SqlDataSourceTarefas" DataTextField="desc_CH_TIPO_TAREFA" DataValueField="id_CH_TIPO_TAREFA" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_TIPO_TAREFA") %>'></telerik:RadDropDownList>
                
                </td>
         <td class="col-xs-3" colspan="2">
                <telerik:RadTextBox ID="RadTextBoxAssunto" Width="99%" runat="server" LabelWidth="40%" Resize="None" Text='<%# Bind("assunto_CH_SUBCHAMADOS") %>'></telerik:RadTextBox>
                </td>
                  </tr>
                </tbody>
                       
                      <thead>

        <tr>
             <th colspan="4">
                   <asp:Label ID="LabelTexto" runat="server"  Font-Bold="true"  Text="TEXTO"></asp:Label>
                 </th>
            </tr>
                          </thead>     
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3" colspan="4">
                <telerik:RadEditor ID="RadEditorHistorico" Width="99%" runat="server" EditModes="Design">
                    <Tools>
        <telerik:EditorToolGroup>
            <telerik:EditorTool Name="Cut"/>
            <telerik:EditorTool Name="Copy"/>
            <telerik:EditorTool Name="Paste"/>
                   <telerik:EditorTool Name="FontName"/>
            <telerik:EditorTool Name="ConvertToLower"/>
            <telerik:EditorTool Name="ConvertToUpper"/>
            <telerik:EditorTool Name="Bold"/>
            <telerik:EditorTool Name="Italic"/>
            <telerik:EditorTool Name="Underline"/>
            <telerik:EditorTool Name="ForeColor"/>
            <telerik:EditorTool Name="BackColor"/>
           
        </telerik:EditorToolGroup>
    </Tools>
                </telerik:RadEditor>
                </td>
         </tr>
       </tbody>
                                     
                                                <thead>

        <tr>
             <th colspan="1">
            <asp:Label ID="Label1" runat="server"  Font-Bold="true"  Text="ENCAMINHRA O CHAMADO PARA"></asp:Label>
        
        </th>
     
            <th colspan="3">
           <asp:Label ID="Label2" runat="server"  Font-Bold="true"  Text="ANEXO"></asp:Label>
        </th>
            
            
        </tr>
    </thead>
<tbody>
     <tr class="rgEditRow" >
            <td class="col-xs-3" colspan="1">
                <telerik:RadDropDownList ID="RadDropDownListAtendentes"  Width="99%" runat="server" DataSourceID="SqlDataSourceAtendentes" DataTextField="desc_PS_PESSOA" DataValueField="id_PS_PESSOA" DropDownHeight="150px"></telerik:RadDropDownList>
                          
                                
                          
                                </td>
                 <td class="col-xs-3" colspan="3" > 
             <telerik:RadAsyncUpload MultipleFileSelection="Disabled"  InputSize="2" ID="RadAsyncUploadAnexos" AllowedFileExtensions=".pdf" MaxFileInputsCount="1"  Width="95%" Localization-Select="..." runat="server"></telerik:RadAsyncUpload>
             
                
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
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column"  UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
    </MasterTableView>
</telerik:RadGrid>


<asp:SqlDataSource ID="SqlDataSourceAbrirChamado" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CH_CHAMADOS.id_CH_CHAMADOS, CH_SUBCHAMADOS.numSeq_CH_SUBCHAMADOS, CH_SUBCHAMADOS.st_CH_SUBCHAMADOS, CH_SUBCHAMADOS.dtFim_CH_SUBCHAMADOS, CH_SUBCHAMADOS.assunto_CH_SUBCHAMADOS, CH_SUBCHAMADOS.contato_CH_SUBCHAMADOS, CH_SUBCHAMADOS.email_CH_SUBCHAMADOS, CH_SUBCHAMADOS.telefone_CH_SUBCHAMADOS, CH_TIPO_TAREFA.desc_CH_TIPO_TAREFA, CH_TIPO_TAREFA.id_CH_TIPO_TAREFA, CH_PRIORIDADE.id_CH_PRIORIDADE, CH_PRIORIDADE.desc_CH_PRIORIDADE, CH_SETORES.id_CH_SETORES, CH_SETORES.desc_CH_SETORES, PS_JURIDICA.razaosocial_PS_JURIDICA FROM CH_CHAMADOS INNER JOIN CH_SUBCHAMADOS ON CH_CHAMADOS.id_CH_CHAMADOS = CH_SUBCHAMADOS.id_CH_CHAMADOS INNER JOIN CH_TIPO_TAREFA ON CH_SUBCHAMADOS.id_CH_TIPO_TAREFA = CH_TIPO_TAREFA.id_CH_TIPO_TAREFA INNER JOIN CH_PRIORIDADE ON CH_TIPO_TAREFA.id_CH_PRIORIDADE = CH_PRIORIDADE.id_CH_PRIORIDADE INNER JOIN CH_SETORES ON CH_TIPO_TAREFA.id_CH_SETORES = CH_SETORES.id_CH_SETORES INNER JOIN PS_CLIENTES ON CH_CHAMADOS.idEmpresa_Pessoa = PS_CLIENTES.codMatriz_PS_CLIENTES AND CH_CHAMADOS.idEmpresa_Pessoa = PS_CLIENTES.id_PS_PESSOA INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA WHERE (CH_CHAMADOS.st_CH_CHAMADOS &gt;= @st_CH_CHAMADOS) AND (CH_CHAMADOS.st_CH_CHAMADOS &lt;= @st_CH_CHAMADOSFim)" InsertCommand="Sp_Insert_AbreChamado" InsertCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="idEmpresa_Pessoa" Type="Int32" />
        <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
        <asp:Parameter Name="id_PS_PESSOA_inc" Type="Int32" />
        <asp:Parameter Name="id_CH_TIPO_TAREFA" Type="Int32" />
        <asp:Parameter Name="id_PS_PERMISSAO" Type="Int32" />
        <asp:Parameter Name="assunto_CH_SUBCHAMADOS" Type="String" />
        <asp:Parameter Name="abertoPor_id_PS_PESSOA" Type="Int32" />
        <asp:Parameter Name="contato_CH_SUBCHAMADOS" Type="String" />
        <asp:Parameter Name="email_CH_SUBCHAMADOS" Type="String" />
        <asp:Parameter Name="telefone_CH_SUBCHAMADOS" Type="String" />
        <asp:Parameter Name="texto_CH_HISTORICO" Type="String" />
        <asp:Parameter Name="id_CH_STATUS" Type="Int32" />
        <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
        <asp:Parameter Name="emAtendimentoPor_id_PS_PESSOA" Type="Int32" />
    </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_CH_CHAMADOS" />
            <asp:Parameter DefaultValue="1" Name="st_CH_CHAMADOSFim" />
    </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceClientesNomeFantasia" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT codMatriz_PS_CLIENTES, CLIENTE FROM View_RadAutoCompleteBoxClientesMatriz"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSetores" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_SETORES, desc_CH_SETORES FROM View_DropDown_CH_SETORES"></asp:SqlDataSource>  
    <asp:SqlDataSource ID="SqlDataSourceTarefas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_CH_TIPO_TAREFA, id_CH_TIPO_TAREFA FROM View_DropDown_CH_TIPO_TAREFAS"></asp:SqlDataSource>   
 <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_CH_STATUS, desc_CH_STATUS FROM View_DropDown_CH_STATUS"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAtendentes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.id_PS_PESSOA, USUARIOS.atendeChamado_USUARIOS FROM USUARIOS INNER JOIN PS_PESSOA ON USUARIOS.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (USUARIOS.st_USUARIOS = 1) AND (PS_PESSOA.st_PS_PESSOA = 1) AND (USUARIOS.atendeChamado_USUARIOS = 1)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceContatos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_FISICA.fone01_PS_FISICA, PS_FISICA.email_PS_FISICA, PS_PESSOA.desc_PS_PESSOA FROM PS_PESSOA INNER JOIN PS_FISICA ON PS_PESSOA.id_PS_PESSOA = PS_FISICA.id_PS_PESSOA WHERE (PS_PESSOA.id_PS_PESSOA = @id_PS_PESSOA)">
        <SelectParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
