<%@ Page Title="RELATÓRIO DE CAPACITAÇÃO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="AtestadoQualificacaoTecnica.aspx.vb" Inherits="conteltelecom.AtestadoQualificacaoTecnica1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
    <rsweb:ReportViewer ID="ReportViewerRelQualificacaoTecnica" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="rdcl\relacionamento\AtestadoQualificacaoTecnica.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceCapacitacaoTecnica" Name="DataSetPessoasJuridica" />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceAtestado2" Name="DataSetValores" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSourceAtestado2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.AtestadoQualificacaoTecnicaTableAdapters.SF_SERVICOS_FATURATableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceCapacitacaoTecnica" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.AtestadoQualificacaoTecnicaTableAdapters.DataTableCNPJ_PS_JURIDICATableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="id_PS_PESSOA" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
