<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="rel_projecao.aspx.vb" Inherits="conteltelecom.rel_projecao" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
    <fieldset >
        <legend>FILTRO</legend>
        <div class="form-horizontal">
                             
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="MÊS:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListMes" runat="server" Width="95%">
                        <Items>
                            <telerik:DropDownListItem Text="JANEIRO" Value="1" />
                                                        <telerik:DropDownListItem Text="FEVEREIRO" Value="2" />
                                                        <telerik:DropDownListItem Text="MARÇO" Value="3" />
                                                        <telerik:DropDownListItem Text="ABRIL" Value="4" />
                                                        <telerik:DropDownListItem Text="MAIO" Value="5" />
                                                        <telerik:DropDownListItem Text="JUNHO" Value="6" />
                                                        <telerik:DropDownListItem Text="JULHO" Value="7" />
                                                        <telerik:DropDownListItem Text="AGOSTO" Value="8" />
                                                        <telerik:DropDownListItem Text="SETEMBRO" Value="9" />
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
                 <div class="col-xs-12" style="text-align: right">
              <telerik:RadImageButton ID="RadImageButtonGerar" class="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" OnClick="RadImageButtonGerar_Click"></telerik:RadImageButton>
                     </div>
                      </div>
             
           
                
        </div>
     
           </fieldset>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" SizeToReportContent="true"   Height ="95%" ZoomPercent="100" ZoomMode="Percent">
        <LocalReport ReportPath="rdcl\relacionamento\Rel_Projecao.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceProjecao" Name="DataSetProjecao" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSourceProjecao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetProjecaoTableAdapters.SF_VL_USOTableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.numLinha_LI_LINHAS, LI_LINHAS.nomeUnidade_LI_LINHAS, PS_CIDADES.desc_PS_CIDADES, LI_LINHAS.id_LI_LINHAS FROM LI_LINHAS INNER JOIN PS_CIDADES ON LI_LINHAS.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (LI_LINHAS.linhaVirtual_LI_LINHAS = 0) AND (LI_LINHAS.st_LI_LINHAS = 1) AND (LI_LINHAS.liCancelada_LI_LINHAS = 0) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceValorUso" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SUM(SF_VL_USO.vlUso_SF_VL_USO) AS vlUso_SF_VL_USO, SF_VL_USO.id_LI_LINHAS, SF_SERVICOS_FATURA.dtaPerFim_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.dtaPerIni_SF_SERVICOS_FATURA, SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA FROM SF_VL_USO INNER JOIN SF_SERVICOS_FATURA ON SF_VL_USO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA INNER JOIN SF_TIPO_USO ON SF_VL_USO.id_SF_TIPO_USO = SF_TIPO_USO.id_SF_TIPO_USO INNER JOIN SF_TIPO_USO_CATEGORIAS ON SF_TIPO_USO.id_SF_TIPO_USO_CATEGORIAS = SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS WHERE (SF_VL_USO.linhaVirtual_LI_LINHAS = 0) AND (SF_VL_USO.id_LI_LINHAS = @id_LI_LINHAS) AND (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS = @id_SF_TIPO_USO_CATEGORIAS) GROUP BY SF_VL_USO.id_LI_LINHAS, SF_SERVICOS_FATURA.dtaPerFim_SF_SERVICOS_FATURA, SF_SERVICOS_FATURA.dtaPerIni_SF_SERVICOS_FATURA, SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS, SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA">
        <SelectParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT dtMovel_LI_CAD_PROGRAMACAO, dtLdn_LI_CAD_PROGRAMACAO FROM LI_CAD_PROGRAMACAO WHERE (id_LI_LINHAS = @id_LI_LINHAS) AND (tpLancamento_LI_CAD_PROGRAMACAO = 0)">
        <SelectParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
