<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="solicitacao_fatura.aspx.vb" Inherits="conteltelecom.solicitacao_fatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
      <fieldset class="fieldsetForms">
                        <legend>FILTROS</legend>
         <div class="form-inline">
                            <div class="col-xs-12 form-group">
                                    <asp:Label ID="LabelNome" runat="server" CssClass="col-xs-2 control-label" Text="MÊS/ANO:"></asp:Label>
                                <div class="col-xs-2">
                                 <telerik:RadMaskedTextBox ID="RadTextBoxMesAno"  Mask="<1..12>/<2000..2050>" CssClass="col-xs-2"  Width="100%"  runat="server" Skin="Bootstrap"></telerik:RadMaskedTextBox>
                                  </div>
                                </div>
             <div class="col-xs-12" style="text-align:right">
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
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadGrid ID="RadGridSolicitacaoFaturas" runat="server" AutoGenerateColumns="False" MasterTableView-ExpandCollapseColumn-Display="false" MasterTableView-ExpandCollapseColumn-Visible="false" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaFaturasAbertas" GroupPanelPosition="Top" Skin="Bootstrap" RenderMode="Auto">
        
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

          <ExportSettings>
              <Pdf PageWidth="">
              </Pdf>
          </ExportSettings>

<MasterTableView DataSourceID="SqlDataSourceBuscaFaturasAbertas" DataKeyNames="id_LI_LINHAS">
<ExpandCollapseColumn Visible="False" Display="False"></ExpandCollapseColumn>
    <Columns>
        <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
            <HeaderStyle CssClass="col-xs-3" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
            <HeaderStyle CssClass="col-xs-3" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ST" FilterControlAltText="Filter ST column" HeaderText="TOTAL GERAL" UniqueName="ST">
            <HeaderStyle CssClass="col-xs-3" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ST_VALOR_INFORMADO" FilterControlAltText="Filter ST_VALOR_INFORMADO column" HeaderText="TOTAL INFORMADO" UniqueName="ST_VALOR_INFORMADO">
        <HeaderStyle CssClass="col-xs-3" />
              </telerik:GridBoundColumn>
    </Columns>
</MasterTableView>
        
          </telerik:RadGrid>
        </ContentTemplate>
    </asp:UpdatePanel>

      
      <asp:SqlDataSource ID="SqlDataSourceBuscaFaturasAbertas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_SERVICOS_FATURA.vltotalLinha_SF_SERVICOS_FATURA, LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.id_LI_LINHAS, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, OP_OPERADORAS.desc_OP_OPERADORAS, LI_LINHAS.perIncial_LI_LINHAS, LI_LINHAS.id_PS_CLIENTES, CASE WHEN SF_SERVICOS_FATURA.vltotalLinha_SF_SERVICOS_FATURA IS NULL THEN 'PENDENTE' ELSE 'CONCLUÍDO' END AS ST, CASE WHEN SF_SERVICOS_FATURA.vlTotalIncluido_SF_SERVICOS_FATURA IS NULL THEN 'PENDENTE' WHEN SF_SERVICOS_FATURA.vlTotalIncluido_SF_SERVICOS_FATURA &lt;&gt; SF_SERVICOS_FATURA.vltotalLinha_SF_SERVICOS_FATURA THEN 'PENDENTE' ELSE 'CONCLUÍDO' END AS ST_VALOR_INFORMADO FROM LI_LINHAS INNER JOIN OP_OPERADORAS ON LI_LINHAS.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS LEFT OUTER JOIN SF_SERVICOS_FATURA ON LI_LINHAS.id_LI_LINHAS = SF_SERVICOS_FATURA.id_LI_LINHAS AND SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA WHERE (LI_LINHAS.codLinha_LI_LINHAS IS NOT NULL) AND (LI_LINHAS.id_PS_CLIENTES = @id_PS_CLIENTES)">
          <SelectParameters>
              <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA"  />
             <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_pessoaNav"/>
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSourceValidaTotal" runat="server"></asp:SqlDataSource>
</asp:Content>
