<%@ Page Title="RELATÓRIO DE DEVOLUÇÕES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="rel_devolucoes_mes.aspx.vb" Inherits="conteltelecom.rel_devolucoes_mes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
      
    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridDevolucoes" ShowFooter="True" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaDevolucoes" CellSpacing="-1" GridLines="Both">

<GroupingSettings CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="True"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView   DataSourceID="SqlDataSourceBuscaDevolucoes" ShowGroupFooter="true" >
            <Columns>
                <telerik:GridBoundColumn     DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="CÓD MATRIZ" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                    <HeaderStyle CssClass="col-xs-8" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesAnoRefereincia_SF_SERVICOS_FATURA" FilterControlAltText="Filter mesAnoRefereincia_SF_SERVICOS_FATURA column" HeaderText="MÊS REF." SortExpression="mesAnoRefereincia_SF_SERVICOS_FATURA" UniqueName="mesAnoRefereincia_SF_SERVICOS_FATURA">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_CL_TIPOS_CONTRATOS" FilterControlAltText="Filter desc_CL_TIPOS_CONTRATOS column" HeaderText="CONTRATO" UniqueName="desc_CL_TIPOS_CONTRATOS">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn  Aggregate="Sum" DataFormatString="{0:c}" FooterText="TOTAL:" DataField="vlDesconto_SF_VL_SERVICO" DataType="System.Decimal" FilterControlAltText="Filter vlDesconto_SF_VL_SERVICO column" HeaderText="VALOR DEVOLUÇÃO" ReadOnly="True" SortExpression="vlDesconto_SF_VL_SERVICO" UniqueName="vlDesconto_SF_VL_SERVICO">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>

    </telerik:RadGrid>
    <div class="table-responsive">
<asp:SqlDataSource ID="SqlDataSourceBuscaDevolucoes" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SUM(SF_VL_SERVICO.vlDesconto_SF_VL_SERVICO) AS vlDesconto_SF_VL_SERVICO, SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, PS_PESSOA.desc_PS_PESSOA, CL_TIPOS_CONTRATOS.desc_CL_TIPOS_CONTRATOS FROM CL_CAD_CONTRATOS INNER JOIN PS_CLIENTES ON CL_CAD_CONTRATOS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN SF_SERVICOS_FATURA INNER JOIN SF_VL_SERVICO ON SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA = SF_VL_SERVICO.id_SF_SERVICOS_FATURA INNER JOIN PS_PESSOA ON SF_SERVICOS_FATURA.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA ON PS_CLIENTES.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA INNER JOIN CL_TIPOS_CONTRATOS ON CL_CAD_CONTRATOS.id_CL_TIPOS_CONTRATOS = CL_TIPOS_CONTRATOS.id_CL_TIPOS_CONTRATOS WHERE (SF_VL_SERVICO.vl_SF_VL_SERVICO &lt;= 0) GROUP BY SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA, PS_PESSOA.desc_PS_PESSOA, CL_TIPOS_CONTRATOS.desc_CL_TIPOS_CONTRATOS">
      </asp:SqlDataSource>
</asp:Content>
