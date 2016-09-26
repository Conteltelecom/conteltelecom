<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_solicitacao_fatura_pendecias.aspx.vb" Inherits="conteltelecom.sf_solicitacao_fatura_pendecias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    

    <telerik:RadGrid ID="RadGridCnpj" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaCpj" CellSpacing="-1" GridLines="Both" style="margin-bottom: 2px" ShowGroupPanel="True">


<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaCpj" EditMode="EditForms" NoMasterRecordsText="SEM REGISTRO"  >
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_CAD_LINHA_CHAVE" FilterControlAltText="Filter id_LI_CAD_LINHA_CHAVE column" HeaderText="ID" UniqueName="id_LI_CAD_LINHA_CHAVE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID LINHA " SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
<telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" HeaderText="OPERADORA" UniqueName="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column">
<HeaderStyle CssClass="col-xs-2"></HeaderStyle>
</telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="COD/LINHA  CHAVE" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME FANTASIA" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                    <HeaderStyle CssClass="col-xs-2" />
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CNPJ" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.CNPJFormat(Eval("CNPJ_PS_JURIDICA"))%>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn FilterControlAltText="Filter DETALHES column" UniqueName="DETALHES" HeaderText="DETALHES">
                                      <EditItemTemplate>
                                      
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <telerik:RadButton ID="RadButtonDetalhesEdit" runat="server" Text="DETALHES" CommandName="Edit">
                                               <Icon PrimaryIconUrl ="../../img/search_page.png" />
                                                                                        </telerik:RadButton>
                                      
                                      </ItemTemplate>
                                      <HeaderStyle CssClass="col-xs-1" />
                                      <ItemStyle HorizontalAlign="Center" />
                                  </telerik:GridTemplateColumn>

                        
                        </Columns>
            
            <EditFormSettings EditFormType="Template" >
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                <FormTemplate>
                    <fieldset class="form-group" style="border: 1px solid #ccc;  padding: 10px;">
                        <figcaption><asp:Label ID="Label17" runat="server" Font-Bold="true"   Text="ENDEREÇO LINHA CHAVE:"></asp:Label></figcaption>
                   
                                 
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
                <asp:Label ID="Label3" runat="server"   Text="CEP:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
                <asp:Label ID="Label4" runat="server" Text="UF:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
         <asp:Label ID="Label5" runat="server"  Text="CIDADE:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col">
                <asp:Label ID="Label6" runat="server" Text="BAIRRO:"  ></asp:Label>
            </th>
        </tr>
    </thead>
<tbody>
        <tr class="rgEditRow" >
            <td class="col-xs-3">
                     <asp:Label ID="Label7" runat="server" Font-Bold="true" Text='<%# Eval("cep_PS_ENDERECO") %>' Visible="true"></asp:Label>
               
            </td>
            <td class="col-xs-3" >
                  <asp:Label ID="Label8" runat="server" Font-Bold="true" Text='<%# Eval("cod_PS_UF") %>' Visible="true"></asp:Label>
                
             
            </td>
            <td class="col-xs-3" >
                   <asp:Label ID="Label9" runat="server" Font-Bold="true" Text='<%# Eval("desc_PS_CIDADES") %>' Visible="true"></asp:Label>
                       
                                  
            </td>
            <td class="col-xs-3">
                  <asp:Label ID="Label10" runat="server" Font-Bold="true" Text='<%# Eval("bairro_PS_ENDERECO") %>' Visible="true"></asp:Label>
      
            </td>
        </tr>
    </tbody>
                                                 <colgroup>
                            <col/>
                            <col/>
                            <col/>
                            <col/>
                        </colgroup>
                        <thead>
        <tr>
             
            <th class="col-xs-3 rgHeader" scope="col">
                <asp:Label ID="Label2" runat="server"   Text="RUA:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
                <asp:Label ID="Label11" runat="server" Text="NÚMERO:"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col" >
         <asp:Label ID="Label12" runat="server"  Text="COMPLEMENTO"></asp:Label>
            </th>
            <th class="col-xs-3 rgHeader" scope="col">
                <asp:Label ID="Label13" runat="server" Text=""  ></asp:Label>
            </th>
        </tr>
    </thead>
<tbody>
        <tr class="rgEditRow" >
            <td class="col-xs-3">
                     <asp:Label ID="Label14" runat="server" Font-Bold="true" Text='<%# Eval("rua_PS_ENDERECO") %>' Visible="true"></asp:Label>
               
            </td>
            <td class="col-xs-3" >
                  <asp:Label ID="Label15" runat="server" Font-Bold="true" Text='<%# Eval("num_PS_ENDERECO") %>' Visible="true"></asp:Label>
                
             
            </td>
            <td class="col-xs-3" >
                   <asp:Label ID="Label16" runat="server" Font-Bold="true" Text='<%# Eval("complemeto_PS_ENDERECO") %>' Visible="true"></asp:Label>
                       
                                  
            </td>
            <td class="col-xs-3">
             
      
            </td>
        </tr>
    </tbody>
</table>
                         <fieldset class="form-group" style="border: 1px solid #ccc;  padding: 10px;">
                              <figcaption><asp:Label ID="Label1" runat="server" Font-Bold="true"   Text="LINHAS AGRUPADAS:"></asp:Label></figcaption>
                      <telerik:RadGrid ID="RadGridLinhasAgrupadas" runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceLinhaAgrupadas" AutoGenerateColumns="False" AllowAutomaticUpdates="True" AutoGenerateHierarchy="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhaAgrupadas" DataKeyNames="id_LI_CAD_LINHA_FILHAS">
            <DetailTables>
                <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceObs" CommandItemDisplay="Top"  DataKeyNames="id_LI_LINHA_FILHAS_OBS"  >
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="id_LI_CAD_LINHA_FILHAS" MasterKeyField="id_LI_CAD_LINHA_FILHAS" />
                    </ParentTableRelation>
                    <Columns>
                         <telerik:GridBoundColumn DataField="id_LI_LINHA_FILHAS_OBS" FilterControlAltText="Filter id_LI_CAD_LINHA_CHAVE column" ReadOnly="true" HeaderText="ID" UniqueName="id_LI_LINHA_FILHAS_OBS"></telerik:GridBoundColumn>
                         <telerik:GridTemplateColumn DataField="desc_LI_LINHA_FILHAS_OBS" FilterControlAltText="Filter id_LI_CAD_LINHA_CHAVE column" HeaderText="OBSERVAÇÕES" UniqueName="desc_LI_LINHA_FILHAS_OBS" >
                             <ItemTemplate>
                                 <asp:Label ID="LabeloBS"  runat="server" Text='<%# Eval("desc_LI_LINHA_FILHAS_OBS") %>'></asp:Label>
                             </ItemTemplate>
                             <EditItemTemplate>
                                 <telerik:RadTextBox TextMode="MultiLine"  Height="100px" Width="100%" ID="RadTextBoxdesc_LI_LINHA_FILHAS_OBS" Text='<%#Bind("desc_LI_LINHA_FILHAS_OBS") %>'  runat="server"></telerik:RadTextBox>
                             </EditItemTemplate>
                             <ItemStyle CssClass="col-xs-12" />
                         </telerik:GridTemplateColumn>                          
                        <telerik:GridEditCommandColumn >
                </telerik:GridEditCommandColumn>

                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column"  UniqueName="Excluir" >
             
                </telerik:GridButtonColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_CAD_LINHA_CHAVE" FilterControlAltText="Filter id_LI_CAD_LINHA_CHAVE column" HeaderText="id_LI_CAD_LINHA_CHAVE" Visible="false"   SortExpression="id_LI_CAD_LINHA_CHAVE" UniqueName="id_LI_CAD_LINHA_CHAVE" DataType="System.Int32">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" UniqueName="codLinha_LI_LINHAS" SortExpression="codLinha_LI_LINHAS">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                
                 <telerik:GridBoundColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column"  HeaderText="CNPJ" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                         <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                  <HeaderStyle CssClass="col-xs-8" />
                                      </telerik:GridBoundColumn>
            
                  <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column"  HeaderTooltip="Confirmar"  UniqueName="Confirmar" >
                             </telerik:GridButtonColumn>
                
            </Columns>
            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
                             <tfoot style="width:100%">
            <tr class="rgRow">
                <td class="col-xs-12 rgCommandCell">
                    
                      <telerik:RadImageButton ID="RadImageButtonCancel" runat="server"   Width="32px" Height="32px" CommandName="Cancel"   Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                </td>
               
            </tr>
        </tfoot>
                               </fieldset>
 
       </fieldset>           

                </FormTemplate>
            </EditFormSettings>
        </MasterTableView>


    </telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceBuscaCpj" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_CAD_LINHA_CHAVE.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, PS_ENDERECO.id_PS_CIDADES, PS_ENDERECO.complemeto_PS_ENDERECO, PS_ENDERECO.cep_PS_ENDERECO, PS_ENDERECO.bairro_PS_ENDERECO, PS_ENDERECO.num_PS_ENDERECO, PS_ENDERECO.rua_PS_ENDERECO, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_PESSOA.desc_PS_PESSOA, PS_CIDADES.desc_PS_CIDADES, PS_CIDADES.cod_PS_UF, PS_CLIENTES.codMatriz_PS_CLIENTES, LI_CAD_LINHA_CHAVE.id_LI_CAD_LINHA_CHAVE, OP_OPERADORAS.desc_OP_OPERADORAS FROM PS_ENDERECO INNER JOIN LI_CAD_LINHA_CHAVE ON PS_ENDERECO.id_PS_ENDERECO = LI_CAD_LINHA_CHAVE.id_PS_ENDERECO INNER JOIN LI_LINHAS ON LI_CAD_LINHA_CHAVE.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA INNER JOIN PS_PESSOA ON PS_JURIDICA.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS LEFT OUTER JOIN PS_CIDADES ON PS_ENDERECO.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
    <SelectParameters>
        <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
    </SelectParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_ENDERECO.id_PS_CIDADES, PS_ENDERECO.complemeto_PS_ENDERECO, PS_ENDERECO.cep_PS_ENDERECO, PS_ENDERECO.bairro_PS_ENDERECO, PS_ENDERECO.num_PS_ENDERECO, PS_ENDERECO.rua_PS_ENDERECO, PS_CIDADES.desc_PS_CIDADES, PS_CIDADES.cod_PS_UF FROM LI_CAD_LINHA_CHAVE INNER JOIN PS_ENDERECO ON LI_CAD_LINHA_CHAVE.id_PS_ENDERECO = PS_ENDERECO.id_PS_ENDERECO AND LI_CAD_LINHA_CHAVE.id_PS_TP_ENDERECO = PS_ENDERECO.id_PS_TP_ENDERECO INNER JOIN PS_CIDADES ON PS_ENDERECO.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES LEFT OUTER JOIN LI_CAD_LINHA_FILHAS ON LI_CAD_LINHA_CHAVE.id_LI_CAD_LINHA_CHAVE = LI_CAD_LINHA_FILHAS.id_LI_CAD_LINHA_CHAVE"></asp:SqlDataSource>
     
    <asp:SqlDataSource ID="SqlDataSourceLinhaAgrupadas" CancelSelectOnNullParameter="false" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.codLinha_LI_LINHAS, LI_CAD_LINHA_FILHAS.id_LI_CAD_LINHA_CHAVE, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_JURIDICA.razaosocial_PS_JURIDICA, LI_CAD_LINHA_FILHAS.id_LI_CAD_LINHA_FILHAS FROM LI_CAD_LINHA_FILHAS INNER JOIN LI_LINHAS ON LI_CAD_LINHA_FILHAS.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA ">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceObs" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [LI_LINHA_FILHAS_OBS] WHERE [id_LI_LINHA_FILHAS_OBS] = @id_LI_LINHA_FILHAS_OBS" InsertCommand="INSERT INTO LI_LINHA_FILHAS_OBS(desc_LI_LINHA_FILHAS_OBS, id_PS_PESSOA_inc, id_PS_PESSOA_alt, id_LI_CAD_LINHA_FILHAS) VALUES (@desc_LI_LINHA_FILHAS_OBS, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @id_LI_CAD_LINHA_FILHAS)" SelectCommand="SELECT desc_LI_LINHA_FILHAS_OBS, id_LI_LINHA_FILHAS_OBS FROM LI_LINHA_FILHAS_OBS WHERE (id_LI_CAD_LINHA_FILHAS = @id_LI_CAD_LINHA_FILHAS)" UpdateCommand="UPDATE LI_LINHA_FILHAS_OBS SET desc_LI_LINHA_FILHAS_OBS = @desc_LI_LINHA_FILHAS_OBS, dtAlt_LI_LINHA_FILHAS_OBS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_LI_LINHA_FILHAS_OBS = @id_LI_LINHA_FILHAS_OBS)">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_LINHA_FILHAS_OBS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_LI_LINHA_FILHAS_OBS" Type="String" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
      <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
       <asp:Parameter Name="id_LI_CAD_LINHA_FILHAS" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_LI_CAD_LINHA_FILHAS" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_LI_LINHA_FILHAS_OBS" Type="String" />
              <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_LI_LINHA_FILHAS_OBS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>
