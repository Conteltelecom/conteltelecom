<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="atualizar_infoamacoes_relatorio.aspx.vb" Inherits="conteltelecom.atualizar_infoamacoes_relatorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridBuscaInformacoesRelatorio" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaInformacoesRelatorio" GroupPanelPosition="Top" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaInformacoesRelatorio">
            <Columns>
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
    </telerik:RadGrid>

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
    <asp:SqlDataSource ID="SqlDataSourceBuscaInformacoesRelatorio" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA FROM PS_JURIDICA INNER JOIN PS_CLIENTES ON PS_JURIDICA.id_PS_JURIDICA = PS_CLIENTES.id_PS_JURIDICA INNER JOIN SF_SERVICOS_FATURA ON PS_CLIENTES.codMatriz_PS_CLIENTES = SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES GROUP BY SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, SF_SERVICOS_FATURA.numSequencia_SF_SERVICOS_FATURA" UpdateCommand="UPDATE SF_SERVICOS_FATURA SET codLinha_LI_LINHAS = @codLinha_LI_LINHAS, nomeUnidade_LI_LINHAS = @nomeUnidade_LI_LINHAS, id_CL_TIPOS_CONTRATOS = @id_CL_TIPOS_CONTRATOS, vl_contrato = @vl_contrato, foraAnalise_LI_LINHAS = @foraAnalise_LI_LINHAS, perIncial_LI_LINHAS = @perIncial_LI_LINHAS, vlInicial_id_LI_TIPOS = @vlInicial_id_LI_TIPOS, codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES, id_OP_OPERADORAS = @id_OP_OPERADORAS, id_LI_TIPOS = @id_LI_TIPOS, id_PS_CIDADES = @id_PS_CIDADES, id_PS_PESSOA = @id_PS_PESSOA WHERE (id_LI_LINHAS = @id_LI_LINHAS) AND (mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (numSequencia_SF_SERVICOS_FATURA = @numSequencia_SF_SERVICOS_FATURA)">
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

              <telerik:RadWindowManager ID = "RadWindowManagerMsgSite" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>


</asp:Content>
