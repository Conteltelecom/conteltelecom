<%@ Page Title="LISTA DE VENCIMENTOS IDEAIS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="lista_vencimento_ideal.aspx.vb" Inherits="conteltelecom.lista_vencimento_ideal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridBuscaClinte" runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceListaVencimentoIdeal" ShowGroupPanel="True">
        <GroupPanel Text="ARRASTE  A COLUNA PARA FILTAR"></GroupPanel>
<GroupingSettings CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip="">
    
</GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
            <Excel Format="Xlsx" />
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSourceListaVencimentoIdeal" CommandItemDisplay="Top" NoMasterRecordsText="SEM REGISTRO" >
            <CommandItemSettings ExportToExcelImageUrl="../../img/Excel_32.png" ShowExportToExcelButton="true" ExportToExcelText="EXCEL" ShowRefreshButton="false"  ShowAddNewRecordButton="false"   />
            <Columns>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME FANTASIA" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="COD" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORAS" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="diaVenc_LI_LINHAS" DataType="System.Byte" FilterControlAltText="Filter diaVenc_LI_LINHAS column" HeaderText="VENCIMENTO IDEAL" SortExpression="diaVenc_LI_LINHAS" UniqueName="diaVenc_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="VencimentoAtual" FilterControlAltText="Filter VencimentoAtual column" HeaderText="VENCIMENTO LANÇADO" ReadOnly="True" SortExpression="VencimentoAtual" UniqueName="VencimentoAtual">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
</telerik:RadGrid>
</div> <!-- fim responsive-table -->
<asp:SqlDataSource ID="SqlDataSourceListaVencimentoIdeal" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SP_At_ListaVencimentoIdeal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.diaVenc_LI_LINHAS, SF_SERVICOS_FATURA.dtVencimento_SF_SERVICOS_FATURA FROM SF_SERVICOS_FATURA INNER JOIN LI_LINHAS ON SF_SERVICOS_FATURA.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS WHERE (SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = '07/2016')">
    <SelectParameters>
        <asp:Parameter Name="codMatriz_PS_CLIENTES" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
