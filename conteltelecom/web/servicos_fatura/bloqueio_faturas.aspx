<%@ Page Title="FATURAMENTO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="bloqueio_faturas.aspx.vb" Inherits="conteltelecom.bloqueio_faturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="CÓD/NOME MATRIZ:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                <div class="col-xs-4">
                  
                </div>
                <div class="col-xs-6">
                    
                </div>
            </div>
               <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="MÊS:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListMes" runat="server" Width="95%">
                        <Items>
                            <telerik:DropDownListItem Text="JANEIRO" Value="01" />
                                                        <telerik:DropDownListItem Text="FEVEREIRO" Value="02" />
                                                        <telerik:DropDownListItem Text="MARÇO" Value="03" />
                                                        <telerik:DropDownListItem Text="ABRIL" Value="04" />
                                                        <telerik:DropDownListItem Text="MAIO" Value="05" />
                                                        <telerik:DropDownListItem Text="JUNHO" Value="06" />
                                                        <telerik:DropDownListItem Text="JULHO" Value="07" />
                                                        <telerik:DropDownListItem Text="AGOSTO" Value="08" />
                                                        <telerik:DropDownListItem Text="SETEMBRO" Value="09" />
                                                        <telerik:DropDownListItem Text="OUTUBRO" Value="10" />
                            <telerik:DropDownListItem Text="NOVEMBRO" Value="11" />
                            <telerik:DropDownListItem Text="DEZEMBRO" Value="12" />

                        </Items>
                    </telerik:RadDropDownList>
                    </div>
                  <asp:Label ID="Label4" runat="server" Text="ANO:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                     <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListAno" runat="server" Width="95%" >
                        <Items>
                            <telerik:DropDownListItem Text="2014" Value="2014" />
                             <telerik:DropDownListItem Text="2015" Value="2015" />
                             <telerik:DropDownListItem Text="2016" Value="2016" />
                             <telerik:DropDownListItem Text="2017" Value="2017" />
                             <telerik:DropDownListItem Text="2018" Value="2018" />
                             <telerik:DropDownListItem Text="2019" Value="2019" />
                             <telerik:DropDownListItem Text="2020" Value="2020" />

                        </Items>
                    </telerik:RadDropDownList>
                                           
                </div>
                 </div>
            <div class="form-group">
                             
             <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR" OnClick="RadButtonPesquisar_Click">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButton2" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                </div>
                  <div class="form-group">
                 <div class="col-xs-12" style="text-align: right; top: 0px; left: 0px;">
            
                     </div>
                      </div>
             
            
                
        </div>
     </div>
           </fieldset>
    
   
    <telerik:RadGrid ID="RadGridBloquiosFatura" runat="server" AutoGenerateColumns="False" MasterTableView-EditMode="InPlace" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaClientes" Skin="Bootstrap" AllowSorting="True" ShowGroupPanel="True">
  <GroupPanel Text="ARRASTE  A COLUNA PARA FILTAR"></GroupPanel>
<GroupingSettings CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip="">
   
</GroupingSettings>
       
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
      
                    <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
      
                    <MasterTableView DataSourceID="SqlDataSourceBuscaClientes"  EditMode="InPlace"   NoMasterRecordsText="SEM REGISTROS PARA O FILTRO SELECIONADO"   HierarchyLoadMode="ServerBind"  DataKeyNames="codMatriz_PS_CLIENTES">
            <ColumnGroups>
               
            </ColumnGroups>
            <DetailTables>
                <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceBuscaLinhas"  DataKeyNames="codMatriz_PS_CLIENTES">
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="codMatriz_PS_CLIENTES" MasterKeyField="codMatriz_PS_CLIENTES" />
                    </ParentTableRelation>
                    <Columns>
                        <telerik:GridTemplateColumn   DataField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" UniqueName="id_LI_LINHAS">
                            <EditItemTemplate>
                                <asp:TextBox ID="id_LI_LINHASTextBox" runat="server" Text='<%# Bind("id_LI_LINHAS") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id_LI_LINHASLabel" runat="server" Text='<%# Eval("id_LI_LINHAS") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/ Nº LINHA" UniqueName="codLinha_LI_LINHAS">
                            <HeaderStyle CssClass="col-xs-6" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="MES03" FilterControlAltText="Filter column4 column" UniqueName="column4">
                            <EditItemTemplate>
                                <asp:TextBox ID="MES03TextBox" runat="server" Text='<%# Bind("MES03") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="LinkButtonMes03" runat="server"  Text='<%# Eval("MES03", "{0:C}") %>'  NavigateUrl='<%# String.Format("~/web/clientes/relatorios/rel_descritivo.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA={0}&codMatriz_PS_CLIENTES={1}&descritivoPorLinha={2}&id_LI_LINHAS={3}", Session("DtMes03"), Eval("codMatriz_PS_CLIENTES"), 1, Eval("id_LI_LINHAS")) %>'  Target="_blank" ></asp:HyperLink>
                                                   
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                             <HeaderTemplate>
                                <asp:Label ID="DtMes03Label" runat="server" Text='<%#  Session("DtMes03")  %>'></asp:Label>
                            </HeaderTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="MES02" FilterControlAltText="Filter column3 column" UniqueName="column3">
                            <EditItemTemplate>
                                <asp:TextBox ID="MES02TextBox" runat="server" Text='<%# Bind("MES02") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                           <asp:HyperLink ID="LinkButtonMes02" runat="server"  Text='<%# Eval("MES02", "{0:C}") %>'  NavigateUrl='<%# String.Format("~/web/clientes/relatorios/rel_descritivo.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA={0}&codMatriz_PS_CLIENTES={1}&descritivoPorLinha={2}&id_LI_LINHAS={3}", Session("DtMes02"), Eval("codMatriz_PS_CLIENTES"), 1, Eval("id_LI_LINHAS")) %>'  Target="_blank" ></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:Label ID="DtMes02Label" runat="server" Text='<%#  Session("DtMes02")  %>'>></asp:Label>
                            </HeaderTemplate>
                            <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="MES01"   FilterControlAltText="Filter column2 column" UniqueName="column2">
                            <EditItemTemplate>
                                <asp:TextBox ID="MES01TextBox" runat="server" Text='<%# Bind("MES01") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                 <asp:HyperLink ID="LinkButtonMes01" runat="server"  Text='<%# Eval("MES01", "{0:C}") %>'  NavigateUrl='<%# String.Format("~/web/clientes/relatorios/rel_descritivo.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA={0}&codMatriz_PS_CLIENTES={1}&descritivoPorLinha={2}&id_LI_LINHAS={3}", Session("DtMes01"), Eval("codMatriz_PS_CLIENTES"), 1, Eval("id_LI_LINHAS")) %>'  Target="_blank" ></asp:HyperLink>

                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:Label ID="DtMes01Label" runat="server" Text='<%#  Session("DtMes01")  %>'></asp:Label>
                            </HeaderTemplate>

                                                     <HeaderStyle CssClass="col-xs-2" />
                        </telerik:GridTemplateColumn>
                                               

                                               
                        <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkdESCRITIVO" runat="server"  ImageUrl="~/img/Word.png"   NavigateUrl='<%# String.Format("~/web/clientes/relatorios/rel_descritivo.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA={0}&codMatriz_PS_CLIENTES={1}&descritivoPorLinha={2}", Session("DtMes01"), Eval("codMatriz_PS_CLIENTES"), 2) %>'  Target="_blank" ></asp:HyperLink>
             
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                                               

                                               
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridTemplateColumn GroupByExpression="codMatriz_PS_CLIENTES group BY codMatriz_PS_CLIENTES"    DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="ID" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES" ReadOnly="True">
                    <EditItemTemplate>
                     <asp:Label ID="codMatriz_PS_CLIENTESLabelEdit" runat="server" Text='<%# Eval("codMatriz_PS_CLIENTES") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>                       
                        <asp:Label ID="codMatriz_PS_CLIENTESLabel" runat="server" Text='<%# Eval("codMatriz_PS_CLIENTES") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn GroupByExpression="razaosocial_PS_JURIDICA group BY razaosocial_PS_JURIDICA"    DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA" ReadOnly="True">
                    <EditItemTemplate>
                          <asp:Label ID="razaosocial_PS_JURIDICALabelEdit" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="razaosocial_PS_JURIDICALabel" runat="server" Text='<%# Eval("razaosocial_PS_JURIDICA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="MenorValor" GroupByExpression="MenorValor group BY MenorValor"  DataFormatString="{0:C}" FilterControlAltText="Filter MenorValor column" HeaderText="VL IDEAL" UniqueName="MenorValor" ReadOnly="True">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DifValor"  GroupByExpression="DifValor group BY DifValor"   FilterControlAltText="Filter DifValor column" HeaderText="VALOR" UniqueName="DifValor" ReadOnly="True" DataFormatString="{0:C}">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="percentValor" GroupByExpression="percentValor group BY percentValor"  FilterControlAltText="Filter percentValor column" HeaderText="%" UniqueName="percentValor">
                    <EditItemTemplate>
                        <asp:Label ID="percentValorLabelEdit" runat="server" Text='<%# Eval("percentValor", "{0:F}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="percentValorLabel" runat="server" Text='<%# Eval("percentValor", "{0:F}%") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn GroupByExpression="MES03 group BY MES03" DataField="MES03" FilterControlAltText="Filter mes03 column"  SortExpression="MES03" UniqueName="MES03" ReadOnly="True">
                   <HeaderTemplate >

                        <asp:Label ID="Headermes03Label" runat="server" Text='<%#  Session("DtMes03")  %>'></asp:Label>
                   </HeaderTemplate>
                     <EditItemTemplate>
                            <asp:Label ID="mes03LabelsqEdit" runat="server" Text='<%# Eval("MES03") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>

                        <asp:Label ID="mes03Label" runat="server"  Text='<%# Eval("MES03", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn  GroupByExpression="MES02 group BY MES02"  DataField="MES02" FilterControlAltText="Filter mes02 column" SortExpression="MES02" UniqueName="MES02" ReadOnly="True">
                    <HeaderTemplate >
                        <asp:Label ID="Headermes02Label" runat="server" Text='<%#  Session("DtMes02")  %>'></asp:Label>
                   </HeaderTemplate>
                     <EditItemTemplate>
                        <asp:Label ID="mes02LabelEdit" runat="server" Text='<%# Bind("MES02", "{0:C}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mes02Label" runat="server" Text='<%# Eval("MES02", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn GroupByExpression="MES01 group BY MES01" DataField="MES01" FilterControlAltText="Filter mes01 column"  SortExpression="MES01" UniqueName="MES01" ReadOnly="True">
               <HeaderTemplate >
                        <asp:Label ID="Headermes01Label" runat="server" Text='<%#  Session("DtMes01")  %>'></asp:Label>
                   </HeaderTemplate>
                          <EditItemTemplate>
                       <asp:Label ID="mes01LabelEdit" runat="server" Text='<%# Bind("MES01", "{0:C}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="mes01Label" runat="server" Text='<%# Eval("MES01", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="vlReducao" GroupByExpression="vlReducao group BY vlReducao"  DataFormatString="{0:C}" FilterControlAltText="Filter vlReducao column" HeaderText="VL REDUÇÃO" ReadOnly="true"  UniqueName="vlReducao">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn GroupByExpression="SITUACAO group BY SITUACAO"  DataField="SITUACAO" DataType="System.Int32" FilterControlAltText="Filter situacao column" HeaderText="SITUACAO" SortExpression="SITUACAO" UniqueName="SITUACAO">
                    <EditItemTemplate>
                        <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxSituacao"  TextSettings-SelectionMode="Single"   Width="95%" runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceAutoComplete" DataTextField="desc_ADM_CAD_TIPO_BLOQUEIO" DataValueField="id_ADM_CAD_TIPO_BLOQUEIO" DropDownHeight="150px" InputType="Text" Skin="Bootstrap" ></telerik:RadAutoCompleteBox>
                                          
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="situacaoLabel" runat="server" Text='<%# Eval("situacao") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                              
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px"  Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonFuturar" runat="server" Width="32px" Height="32px" CommandName="Faturar" Text="" Image-Url="~/img/dollar.png" Target="_blank" ></telerik:RadImageButton>
                              
                            </ItemTemplate>
                            <EditItemTemplate>
                               
                            </EditItemTemplate>
               </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>


    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBuscaClientes" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SP_Listafaturas" UpdateCommand="UPDATE SF_SOLICITACAO_FATURA SET id_ADM_CAD_TIPO_BLOQUEIO = @id_ADM_CAD_TIPO_BLOQUEIO WHERE (id_codMatriz_PS_CLIENTES = @id_codMatriz_PS_CLIENTES) AND (mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA)" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="DtMes01" Type="String" />
            <asp:Parameter Name="DtMes02" Type="String" />
            <asp:Parameter Name="DtMes03" Type="String" />
            <asp:QueryStringParameter DefaultValue="1" Name="TipoBloqIni" QueryStringField="TipoBloqIni" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="9999" Name="TipoBloqFim" QueryStringField="TipoBloqFim" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_ADM_CAD_TIPO_BLOQUEIO" />
            <asp:Parameter Name="id_codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaValorMes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SUM(SF_SERVICOS_FATURA.vlTotalIncluido_SF_SERVICOS_FATURA) AS vlTotalIncluido_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, CAST(ADM_CAD_TIPO_BLOQUEIO.numSeq_ADM_CAD_TIPO_BLOQUEIO AS VARCHAR(11)) + ' -' + ADM_CAD_TIPO_BLOQUEIO.desc_ADM_CAD_TIPO_BLOQUEIO AS desc_ADM_CAD_TIPO_BLOQUEIO, ADM_CAD_TIPO_BLOQUEIO.id_ADM_CAD_TIPO_BLOQUEIO, SF_SOLICITACAO_FATURA.id_SF_SOLICITACAO_FATURA FROM ADM_CAD_TIPO_BLOQUEIO INNER JOIN SF_SOLICITACAO_FATURA ON ADM_CAD_TIPO_BLOQUEIO.id_ADM_CAD_TIPO_BLOQUEIO = SF_SOLICITACAO_FATURA.id_ADM_CAD_TIPO_BLOQUEIO RIGHT OUTER JOIN SF_SERVICOS_FATURA ON SF_SOLICITACAO_FATURA.id_codMatriz_PS_CLIENTES = SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES WHERE (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) GROUP BY SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, ADM_CAD_TIPO_BLOQUEIO.numSeq_ADM_CAD_TIPO_BLOQUEIO, ADM_CAD_TIPO_BLOQUEIO.desc_ADM_CAD_TIPO_BLOQUEIO, ADM_CAD_TIPO_BLOQUEIO.id_ADM_CAD_TIPO_BLOQUEIO, SF_SOLICITACAO_FATURA.id_SF_SOLICITACAO_FATURA" InsertCommand="INSERT INTO SF_SOLICITACAO_FATURA(id_codMatriz_PS_CLIENTES, mesAnoRefereincia_SF_SERVICOS_FATURA, id_ADM_CAD_TIPO_BLOQUEIO, id_PS_PESSOA_USUARIO) VALUES (@id_codMatriz_PS_CLIENTES, @mesAnoRefereincia_SF_SERVICOS_FATURA, @id_ADM_CAD_TIPO_BLOQUEIO, @id_PS_PESSOA_USUARIO)">
        <InsertParameters>
            <asp:Parameter Name="id_codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="id_ADM_CAD_TIPO_BLOQUEIO" />
            <asp:Parameter Name="id_PS_PESSOA_USUARIO" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAutoComplete" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_ADM_CAD_TIPO_BLOQUEIO, CAST(numSeq_ADM_CAD_TIPO_BLOQUEIO AS VARCHAR(11)) + ' - ' + desc_ADM_CAD_TIPO_BLOQUEIO AS desc_ADM_CAD_TIPO_BLOQUEIO FROM ADM_CAD_TIPO_BLOQUEIO WHERE (st_ADM_CAD_TIPO_BLOQUEIO = 1) AND (numSeq_ADM_CAD_TIPO_BLOQUEIO &gt;= @TipoBloqIni) AND (numSeq_ADM_CAD_TIPO_BLOQUEIO &lt;= @TipoBloqFim) UNION SELECT id_ADM_CAD_TIPO_BLOQUEIO, CAST(numSeq_ADM_CAD_TIPO_BLOQUEIO AS VARCHAR(11)) + ' - ' + desc_ADM_CAD_TIPO_BLOQUEIO AS desc_ADM_CAD_TIPO_BLOQUEIO FROM ADM_CAD_TIPO_BLOQUEIO AS ADM_CAD_TIPO_BLOQUEIO_1 WHERE (st_ADM_CAD_TIPO_BLOQUEIO = 1) AND (numSeq_ADM_CAD_TIPO_BLOQUEIO IN (100, 200, 300, 400, 500, 600, 700, 800, 900))">
        <SelectParameters>
            <asp:QueryStringParameter Name="TipoBloqIni" QueryStringField="TipoBloqIni" />
            <asp:QueryStringParameter Name="TipoBloqFim" QueryStringField="TipoBloqFim" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SP_bloqueio_faturas_BuscaLinhas" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="DtMes01" SessionField="DtMes01" Type="String" />
            <asp:SessionParameter Name="DtMes02" SessionField="DtMes02" Type="String" />
            <asp:SessionParameter Name="DtMes03" SessionField="DtMes03" Type="String" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
