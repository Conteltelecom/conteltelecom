<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="solicitacao_fatura.aspx.vb" Inherits="conteltelecom.solicitacao_fatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
    
<script type="text/javascript">
    function OnClientClicking(button, args) {
        window.location = button.get_navigateUrl();
        args.set_cancel(true);
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
      <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
            
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
                 <div class="col-xs-12" style="text-align: right; top: 0px; left: 0px;">
              <telerik:RadImageButton ID="RadImageButtonGerar" class="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" ></telerik:RadImageButton>
                     </div>
                      </div>
             
            
                
        </div>
     
           </fieldset>

    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadGrid ID="RadGridSolicitacaoFaturas" runat="server" AutoGenerateColumns="False" MasterTableView-ExpandCollapseColumn-Display="false" MasterTableView-ExpandCollapseColumn-Visible="false" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaFaturasAbertas" Skin="Bootstrap" RenderMode="Auto" CellSpacing="-1" GridLines="Both" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True">
        
                <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                </ClientSettings>
        
  <GroupPanel Text="ARRASTE  A COLUNA PARA FILTAR"></GroupPanel>
<GroupingSettings CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip="">
   
</GroupingSettings>

          <ExportSettings>
              <Pdf PageWidth="">
              </Pdf>
          </ExportSettings>

<MasterTableView DataSourceID="SqlDataSourceBuscaFaturasAbertas" DataKeyNames="id_PS_PESSOA" PageSize="50">
<ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
    <Columns>
        <telerik:GridBoundColumn DataField="id_PS_PESSOA" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="ID PESSOA" SortExpression="id_PS_PESSOA" UniqueName="id_PS_PESSOA" DataType="System.Int32" ReadOnly="True">
            <HeaderStyle CssClass="col-xs-1" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="nomeFantasia" FilterControlAltText="Filter nomeFantasia column" HeaderText="NOME FANTASIA DA MATRIZ" SortExpression="nomeFantasia" UniqueName="nomeFantasia">
            <HeaderStyle CssClass="col-xs-8" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="diaVenc_LI_LINHAS" FilterControlAltText="Filter diaVenc_LI_LINHAS column" HeaderText="VENCIMENTO IDEAL" SortExpression="diaVenc_LI_LINHAS" UniqueName="diaVenc_LI_LINHAS" DataType="System.Byte" ReadOnly="True">
            <HeaderStyle CssClass="col-xs-2" />
        </telerik:GridBoundColumn>
        <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumn">
            <ItemTemplate>
                <telerik:RadButton  ID="RadButtonVisualizar"   OnClientClicking="OnClientClicking"  ButtonType ="LinkButton"  NavigateUrl='<%# String.Format("~/web/servicos_fatura/sf_solicitacao_fatura_pendecias.aspx?codMatriz_PS_CLIENTES={0}", Eval("id_PS_PESSOA"))    %>' runat="server" Text="DETALHES">
                    <Icon PrimaryIconUrl ="../../img/search_page.png" />
                </telerik:RadButton>
                 <HeaderStyle CssClass="col-xs-1" />
                                      <ItemStyle HorizontalAlign="Center" />
            </ItemTemplate>
            <HeaderStyle CssClass="col-xs-2" />
        </telerik:GridTemplateColumn>
    </Columns>
</MasterTableView>
        
                <FilterMenu RenderMode="Auto">
                </FilterMenu>
                <HeaderContextMenu RenderMode="Auto">
                </HeaderContextMenu>
        
          </telerik:RadGrid>
        </ContentTemplate>
    </asp:UpdatePanel>

      
      <asp:SqlDataSource ID="SqlDataSourceBuscaFaturasAbertas" CancelSelectOnNullParameter ="false" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT PS_PESSOA.desc_PS_PESSOA AS nomeFantasia, PS_PESSOA.id_PS_PESSOA, MAX(LI_LINHAS.diaVenc_LI_LINHAS) AS diaVenc_LI_LINHAS FROM PS_PESSOA INNER JOIN PS_CLIENTES ON PS_PESSOA.id_PS_PESSOA = PS_CLIENTES.id_PS_PESSOA AND PS_PESSOA.id_PS_PESSOA = PS_CLIENTES.codMatriz_PS_CLIENTES INNER JOIN LI_LINHAS ON PS_CLIENTES.id_PS_CLIENTES = LI_LINHAS.id_PS_CLIENTES LEFT OUTER JOIN SF_SOLICITACAO_FATURA_NOTA ON LI_LINHAS.id_OP_OPERADORAS = SF_SOLICITACAO_FATURA_NOTA.id_OP_OPERADORAS AND LI_LINHAS.id_LI_LINHAS = SF_SOLICITACAO_FATURA_NOTA.id_LI_LINHAS WHERE (PS_PESSOA.st_PS_PESSOA = 1) AND (CAST(LI_LINHAS.diaVenc_LI_LINHAS AS VARCHAR(10)) + '/' + RIGHT ('0' + CAST(MONTH(GETDATE()) AS VARCHAR(10)), 2) + '/' + RIGHT ('0000' + CAST(YEAR(GETDATE()) AS VARCHAR(10)), 4) &gt; @diaVenc_LI_LINHAS) AND (SF_SOLICITACAO_FATURA_NOTA.id_SF_SOLICITACAO_FATURA_NOTA IS NULL) GROUP BY PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.id_PS_PESSOA ORDER BY nomeFantasia">
          <SelectParameters>
              <asp:Parameter Name="diaVenc_LI_LINHAS" DefaultValue="19"  />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSourceValidaTotal" runat="server"></asp:SqlDataSource>
</asp:Content>
