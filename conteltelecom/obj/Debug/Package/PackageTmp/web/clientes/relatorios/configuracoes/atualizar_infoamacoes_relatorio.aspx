<%@ Page Title="MANUTENÇÃO PARA CLIENTES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="atualizar_infoamacoes_relatorio.aspx.vb" Inherits="conteltelecom.atualizar_infoamacoes_relatorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
      <telerik:RadScriptBlock runat="server">
        <script>
            function selectAllDetailTables(checkBox)
            {
                var selected = checkBox.checked;
                var grid = $find("<%= RadGridBuscaInformacoesRelatorio.ClientID %>");
                var dataItems = grid.get_masterTableView().get_dataItems();
                setSelectedToAllDataItems(dataItems, selected);
                var detailTables = grid.get_detailTables();
                for (var i = 0; i < detailTables.length; i++)
                {
                    setSelectedToAllDataItems(detailTables[i].get_dataItems(), selected);
                }
            }

            function setSelectedToAllDataItems(dataItems, selected)
            {
                for (var i = 0; i < dataItems.length; i++)
                {
                    dataItems[i].set_selected(selected);
                }
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
     <fieldset>
    
    <div class="panel panel-default">
        <div class="panel-body">

    <legend>FILTRO</legend> 
          <div class="form-horizontal">
                        
                    <br />
                     <div class="form-group"> 
                         <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label"  Font-Bold="true"  Text="MÊS INICIAL"></asp:Label>
                       <div class="col-lg-4">
                           <telerik:RadDatePicker ID="RadDatePickerMesIni" runat="server" Skin="Bootstrap"></telerik:RadDatePicker>
                       </div>
                          
                         <asp:Label ID="Label2" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true"   Text="MÊS INICIAL"></asp:Label>
                       <div class="col-lg-4">
                           <telerik:RadDatePicker ID="RadDatePickerFinal" runat="server" Skin="Bootstrap"></telerik:RadDatePicker>
                       </div> 
                              
           </div>

              <hr />                     
              <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="~\img\accept.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server"  Text="LIMPAR" Skin="Bootstrap">
                         <Icon PrimaryIconUrl ="~\img\Limpar.png" />
             </telerik:RadButton> 
                 </div> 
            </div>

              </div>
           </fieldset> 


    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridBuscaInformacoesRelatorio"  AllowMultiRowSelection="True"   runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaInformacoesRelatorio" Skin="Bootstrap" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaInformacoesRelatorio" CommandItemDisplay="Top"  >
            <CommandItemSettings AddNewRecordImageUrl="../../../../img/Manutencao.png" AddNewRecordText="MANUTENÇÃO EM TODOS OS SELECIONADOS" />
            <Columns>
                <telerik:GridClientSelectColumn ColumnGroupName="test" FilterControlAltText="Filter stPai column" UniqueName="stPai" ></telerik:GridClientSelectColumn>
                <telerik:GridBoundColumn DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="ID" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <HeaderStyle CssClass="col-xs-8" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="MÊS/ANO" SortExpression="mesAnoRefereincia_SF_SERVICOS_FATURA" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numSequencia_SF_SERVICOS_FATURA" DataType="System.Byte" FilterControlAltText="Filter numSequencia_SF_SERVICOS_FATURA column" HeaderText="Nº SEQ" SortExpression="numSequencia_SF_SERVICOS_FATURA" UniqueName="numSequencia_SF_SERVICOS_FATURA">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonManutencao" runat="server" Width="32px" Height="32px" CommandName="Manutencao" Text="" Image-Url="~/img/Manutencao.png"></telerik:RadImageButton>
                                                         </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
          <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="True"></Selecting>
         
        </ClientSettings>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->


     <asp:HiddenField ID="hf1" runat="server" />  
    <asp:SqlDataSource ID="SqlDataSourceBuscaContratos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT TOP (1) MAX(CL_CAD_CONTRATOS.id_CL_CAD_CONTRATOS) AS id_CL_CAD_CONTRATOS, CL_CAD_CONTRATOS.id_PS_CLIENTES, CL_CAD_CONTRATOS.vl_contrato, CL_CAD_CONTRATOS.id_CL_TIPOS_CONTRATOS, PS_CLIENTES.id_PS_PESSOA FROM PS_CLIENTES INNER JOIN CL_CAD_CONTRATOS ON PS_CLIENTES.id_PS_CLIENTES = CL_CAD_CONTRATOS.id_PS_CLIENTES WHERE (PS_CLIENTES.id_PS_PESSOA = @id_PS_PESSOA) GROUP BY CL_CAD_CONTRATOS.id_PS_CLIENTES, CL_CAD_CONTRATOS.vl_contrato, CL_CAD_CONTRATOS.id_CL_TIPOS_CONTRATOS, PS_CLIENTES.id_PS_PESSOA">
        <SelectParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscalinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT LI_LINHAS.nomeUnidade_LI_LINHAS, LI_LINHAS.linhaVirtual_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.foraAnalise_LI_LINHAS, LI_LINHAS.perIncial_LI_LINHAS, LI_LINHAS.id_PS_CIDADES, LI_LINHAS.id_OP_OPERADORAS, PS_CLIENTES.id_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, PS_CLIENTES.codMatriz_PS_CLIENTES, PS_CLIENTES.id_PS_PESSOA, LI_LINHAS.id_LI_TIPOS, LI_LINHAS.vlInicial_id_LI_TIPOS, LI_LINHAS.id_LI_LINHAS FROM PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA INNER JOIN LI_LINHAS ON PS_CLIENTES.id_PS_CLIENTES = LI_LINHAS.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaInformacoesRelatorio" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA FROM PS_JURIDICA INNER JOIN PS_CLIENTES ON PS_JURIDICA.id_PS_JURIDICA = PS_CLIENTES.id_PS_JURIDICA INNER JOIN SF_SERVICOS_FATURA ON PS_CLIENTES.codMatriz_PS_CLIENTES = SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES WHERE (DATEPART(MM, '01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA) &gt;= @mesIni) AND (DATEPART(MM, '01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA) &lt;= @mesFim) AND (DATEPART(YYYY, '01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA) &gt;= @AnoIni) AND (DATEPART(YYYY, '01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA) &lt;= @AnoFim) GROUP BY SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA ORDER BY PS_JURIDICA.razaosocial_PS_JURIDICA, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA" UpdateCommand="UPDATE SF_SERVICOS_FATURA SET codLinha_LI_LINHAS = @codLinha_LI_LINHAS, nomeUnidade_LI_LINHAS = @nomeUnidade_LI_LINHAS, id_CL_TIPOS_CONTRATOS = @id_CL_TIPOS_CONTRATOS, vl_contrato = @vl_contrato, foraAnalise_LI_LINHAS = @foraAnalise_LI_LINHAS, perIncial_LI_LINHAS = @perIncial_LI_LINHAS, vlInicial_id_LI_TIPOS = @vlInicial_id_LI_TIPOS, codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES, id_OP_OPERADORAS = @id_OP_OPERADORAS, id_LI_TIPOS = @id_LI_TIPOS, id_PS_CIDADES = @id_PS_CIDADES, id_PS_PESSOA = @id_PS_PESSOA WHERE (id_LI_LINHAS = @id_LI_LINHAS) AND (mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (numSequencia_SF_SERVICOS_FATURA = @numSequencia_SF_SERVICOS_FATURA)">
        <SelectParameters>
            <asp:Parameter Name="mesIni" />
            <asp:Parameter Name="mesFim" />
            <asp:Parameter Name="AnoIni" />
            <asp:Parameter Name="AnoFim" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="codLinha_LI_LINHAS" ConvertEmptyStringToNull="true" Type="String"  />
            <asp:Parameter Name="nomeUnidade_LI_LINHAS" ConvertEmptyStringToNull="true" Type="String"   />
            <asp:Parameter Name="id_CL_TIPOS_CONTRATOS" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="vl_contrato" ConvertEmptyStringToNull="true" Type="Decimal"   />
            <asp:Parameter Name="foraAnalise_LI_LINHAS" ConvertEmptyStringToNull="true" Type="Int16"   />
            <asp:Parameter Name="perIncial_LI_LINHAS" ConvertEmptyStringToNull="true" Type="String" />
            <asp:Parameter Name="vlInicial_id_LI_TIPOS" ConvertEmptyStringToNull="true"  Type="Decimal"  />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" ConvertEmptyStringToNull="true" Type="Int32"  />
            <asp:Parameter Name="id_OP_OPERADORAS" ConvertEmptyStringToNull="true" Type="Int32"   />
            <asp:Parameter Name="id_LI_TIPOS" ConvertEmptyStringToNull="true" Type="Int32"   />
            <asp:Parameter Name="id_PS_CIDADES" ConvertEmptyStringToNull="true" Type="Int32"  />
            <asp:Parameter Name="id_PS_PESSOA" ConvertEmptyStringToNull="true" Type="Int32"  />
            <asp:Parameter Name="id_LI_LINHAS" ConvertEmptyStringToNull="true" Type="Int32"   />
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" ConvertEmptyStringToNull="true" Type="String"  />
            <asp:Parameter Name="numSequencia_SF_SERVICOS_FATURA"  ConvertEmptyStringToNull="true" Type="Int32"/>
        </UpdateParameters>
    </asp:SqlDataSource>

              <asp:SqlDataSource ID="SqlDataSourceUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT codLinha_LI_LINHAS, id_LI_LINHAS FROM LI_LINHAS WHERE (linhaVirtual_LI_LINHAS = 1)" UpdateCommand="UPDATE SF_VL_USO SET linhaVirtual_LI_LINHAS = 1, id_LI_LINHAS = @id_LI_LINHAS WHERE (codNumLinha_SF_VL_USO = @codNumLinha_SF_VL_USO)">
                  <UpdateParameters>
                      <asp:Parameter Name="id_LI_LINHAS" />
                      <asp:Parameter Name="codNumLinha_SF_VL_USO" />
                  </UpdateParameters>
     </asp:SqlDataSource>
    
              <asp:SqlDataSource ID="SqlDataSourceIdLinha" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT codLinha_LI_LINHAS, id_LI_LINHAS FROM LI_LINHAS " UpdateCommand="UPDATE SF_VL_USO SET  id_LI_LINHAS = @id_LI_LINHAS WHERE (codNumLinha_SF_VL_USO = @codNumLinha_SF_VL_USO)">
                  <UpdateParameters>
                      <asp:Parameter Name="id_LI_LINHAS" />
                      <asp:Parameter Name="codNumLinha_SF_VL_USO" />
                  </UpdateParameters>
     </asp:SqlDataSource>

              <telerik:RadWindowManager ID = "RadWindowManagerMsgSite" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>


</asp:Content>
