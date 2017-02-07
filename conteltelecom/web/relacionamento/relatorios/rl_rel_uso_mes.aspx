<%@ Page Title="RELATÓRIO DE USO POR CLIENTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="rl_rel_uso_mes.aspx.vb" Inherits="conteltelecom.rl_rel_uso_mes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridUso" runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceUso" CellSpacing="-1" GridLines="Both" style="margin-top: 0px" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceUso" ShowGroupFooter="true" >
            <Columns>
                <telerik:GridBoundColumn DataField="Expr1" FilterControlAltText="Filter Expr1 column" HeaderText="Expr1" SortExpression="Expr1" UniqueName="Expr1" DataType="System.DateTime" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vlUso_SF_VL_USO"  FilterControlAltText="Filter vlUso_SF_VL_USO column" HeaderText="vlUso_SF_VL_USO" ReadOnly="True" SortExpression="vlUso_SF_VL_USO" UniqueName="vlUso_SF_VL_USO" DataType="System.Decimal">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="mesAnoRefereincia_SF_SERVICOS_FATURA" SortExpression="mesAnoRefereincia_SF_SERVICOS_FATURA" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="desc_PS_PESSOA" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MESINICIAL" DataType="System.DateTime" FilterControlAltText="Filter MESINICIAL column" HeaderText="MESINICIAL" ReadOnly="True" SortExpression="MESINICIAL" UniqueName="MESINICIAL">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT CAST('01/' + SF_SERVICOS_FATURA_1.mesAnoRefereincia_SF_SERVICOS_FATURA AS date) AS Expr1, SUM(SF_VL_USO.vlUso_SF_VL_USO) AS vlUso_SF_VL_USO, SF_SERVICOS_FATURA_1.mesAnoRefereincia_SF_SERVICOS_FATURA, PS_PESSOA_1.desc_PS_PESSOA, (SELECT TOP (1) MIN(CAST('01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA AS date)) AS Expr1 FROM PS_PESSOA INNER JOIN SF_SERVICOS_FATURA ON PS_PESSOA.id_PS_PESSOA = SF_SERVICOS_FATURA.id_PS_PESSOA WHERE (SF_SERVICOS_FATURA.foraAnalise_LI_LINHAS = 0) AND (SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES = SF_SERVICOS_FATURA_1.codMatriz_PS_CLIENTES) AND (SF_SERVICOS_FATURA.id_CL_TIPOS_CONTRATOS = 2) AND (CAST('01/' + SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA AS date) &gt;= '01/05/2016') GROUP BY SF_SERVICOS_FATURA.id_PS_PESSOA) AS MESINICIAL FROM SF_SERVICOS_FATURA AS SF_SERVICOS_FATURA_1 INNER JOIN SF_VL_USO ON SF_SERVICOS_FATURA_1.id_SF_SERVICOS_FATURA = SF_VL_USO.id_SF_SERVICOS_FATURA INNER JOIN SF_TIPO_USO ON SF_VL_USO.id_SF_TIPO_USO = SF_TIPO_USO.id_SF_TIPO_USO INNER JOIN SF_TIPO_USO_CATEGORIAS ON SF_TIPO_USO.id_SF_TIPO_USO_CATEGORIAS = SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS INNER JOIN PS_PESSOA AS PS_PESSOA_1 ON SF_SERVICOS_FATURA_1.id_PS_PESSOA = PS_PESSOA_1.id_PS_PESSOA WHERE (SF_SERVICOS_FATURA_1.foraAnalise_LI_LINHAS = 0) AND (SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS IN (8, 2, 1)) AND (SF_SERVICOS_FATURA_1.id_CL_TIPOS_CONTRATOS = 2) AND (CAST('01/' + SF_SERVICOS_FATURA_1.mesAnoRefereincia_SF_SERVICOS_FATURA AS date) &gt; '01/05/2016') GROUP BY SF_SERVICOS_FATURA_1.mesAnoRefereincia_SF_SERVICOS_FATURA, PS_PESSOA_1.desc_PS_PESSOA, SF_SERVICOS_FATURA_1.codMatriz_PS_CLIENTES ORDER BY Expr1">
</asp:SqlDataSource>
  

</asp:Content>
