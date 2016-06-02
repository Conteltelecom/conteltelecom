<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="rel_descritivo.aspx.vb" Inherits="conteltelecom.rel_descritivo" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
    <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="CÓD/NOME MATRIZ:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                <div class="col-xs-6">
                    <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxBuscaMatriz" runat="server"  Culture="pt-BR" DataSourceID="ObjectDataSourceBuscaCodRazao" DataTextField="razaosocial_PS_JURIDICA" DataValueField="codMatriz_PS_CLIENTES" InputType="Text" MinFilterLength="3" Skin="Bootstrap" Width="100%" TextSettings-SelectionMode="Single"></telerik:RadAutoCompleteBox>
                </div>
                <div class="col-xs-4">
                    
                </div>
            </div>
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
                 <telerik:RadImageButton  ID="RadImageButtonGerarWord" runat="server"  Width="32px" Height="32px" Image-Url="~/img/Word.png" RenderMode="Auto" Skin="Bootstrap">
                      
                     </telerik:RadImageButton>    
                 </div>
                      </div>
             
            
                
        </div>
     
           </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaCodRazao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.Ds_ClientecodRazaoTableAdapters.COD_PS_JURIDICATableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBusca" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT CL_PLANOSxLINHAS_1.idLinhasPai_LI_LINHAS, CL_PLANOSxLINHAS_1.id_LI_LINHAS, CL_PLANOS_CLIENTE_1.desc_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE_1.ordem_CL_PLANOS_CLIENTE, LI_LINHAS_2.numLinha_LI_LINHAS, LI_LINHAS_1.codLinha_LI_LINHAS, PS_CIDADES_1.desc_PS_CIDADES, PS_JURIDICA_1.CNPJ_PS_JURIDICA, PS_JURIDICA_1.razaosocial_PS_JURIDICA, 0 AS tipoinfo, SF_VL_SERVICO.vl_SF_VL_SERVICO, SF_VL_SERVICO.vlDesconto_SF_VL_SERVICO, SF_VL_SERVICO.desc_SF_VL_SERVICO, SF_VL_SERVICO.qtDias_SF_VL_SERVICO, CL_PLANOS_CLIENTE_1.valor_CL_PLANOS_CLIENTE, OP_PLANOS.desc_OP_PLANOS, '' AS minutos_SF_VL_USO FROM OP_PLANOS INNER JOIN PS_JURIDICA AS PS_JURIDICA_1 INNER JOIN PS_CLIENTES AS PS_CLIENTES_1 ON PS_JURIDICA_1.id_PS_JURIDICA = PS_CLIENTES_1.id_PS_JURIDICA INNER JOIN CL_PLANOS_CLIENTE AS CL_PLANOS_CLIENTE_1 INNER JOIN CL_PLANOSxLINHAS AS CL_PLANOSxLINHAS_1 ON CL_PLANOS_CLIENTE_1.id_CL_PLANOS_CLIENTE = CL_PLANOSxLINHAS_1.id_CL_PLANOS_CLIENTE INNER JOIN LI_LINHAS AS LI_LINHAS_2 ON CL_PLANOSxLINHAS_1.id_LI_LINHAS = LI_LINHAS_2.id_LI_LINHAS INNER JOIN LI_LINHAS AS LI_LINHAS_1 ON CL_PLANOSxLINHAS_1.idLinhasPai_LI_LINHAS = LI_LINHAS_1.id_LI_LINHAS INNER JOIN PS_CIDADES AS PS_CIDADES_1 ON LI_LINHAS_1.id_PS_CIDADES = PS_CIDADES_1.id_PS_CIDADES ON PS_CLIENTES_1.id_PS_PESSOA = CL_PLANOS_CLIENTE_1.id_PS_PESSOA ON OP_PLANOS.id_OP_PLANOS = CL_PLANOS_CLIENTE_1.id_OP_PLANOS LEFT OUTER JOIN SF_VL_SERVICO INNER JOIN SF_SERVICOS_FATURA AS SF_SERVICOS_FATURA_1 ON SF_VL_SERVICO.id_SF_SERVICOS_FATURA = SF_SERVICOS_FATURA_1.id_SF_SERVICOS_FATURA ON CL_PLANOSxLINHAS_1.id_LI_LINHAS = SF_SERVICOS_FATURA_1.id_LI_LINHAS WHERE (SF_SERVICOS_FATURA_1.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA_1.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) UNION ALL SELECT CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS, CL_PLANOSxLINHAS.id_LI_LINHAS, CL_PLANOS_CLIENTE.desc_CL_PLANOS_CLIENTE, CL_PLANOS_CLIENTE.ordem_CL_PLANOS_CLIENTE, LI_LINHAS.numLinha_LI_LINHAS, LI_LINHAS_1.codLinha_LI_LINHAS, PS_CIDADES.desc_PS_CIDADES, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_JURIDICA.razaosocial_PS_JURIDICA, 1 AS tipoinfo, SF_VL_USO.vlUso_SF_VL_USO AS vl_SF_VL_SERVICO, 0 AS vlDesconto_SF_VL_SERVICO, SF_TIPO_USO.desc_SF_TIPO_USO AS desc_SF_VL_SERVICO, '' AS qtDias_SF_VL_SERVICO, CL_PLANOS_CLIENTE.valor_CL_PLANOS_CLIENTE, OP_PLANOS_1.desc_OP_PLANOS, SF_VL_USO.minutos_SF_VL_USO FROM OP_PLANOS AS OP_PLANOS_1 INNER JOIN PS_JURIDICA INNER JOIN PS_CLIENTES ON PS_JURIDICA.id_PS_JURIDICA = PS_CLIENTES.id_PS_JURIDICA INNER JOIN CL_PLANOS_CLIENTE INNER JOIN CL_PLANOSxLINHAS ON CL_PLANOS_CLIENTE.id_CL_PLANOS_CLIENTE = CL_PLANOSxLINHAS.id_CL_PLANOS_CLIENTE INNER JOIN LI_LINHAS ON CL_PLANOSxLINHAS.id_LI_LINHAS = LI_LINHAS.id_LI_LINHAS INNER JOIN LI_LINHAS AS LI_LINHAS_1 ON CL_PLANOSxLINHAS.idLinhasPai_LI_LINHAS = LI_LINHAS_1.id_LI_LINHAS INNER JOIN PS_CIDADES ON LI_LINHAS_1.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES ON PS_CLIENTES.id_PS_PESSOA = CL_PLANOS_CLIENTE.id_PS_PESSOA ON OP_PLANOS_1.id_OP_PLANOS = CL_PLANOS_CLIENTE.id_OP_PLANOS LEFT OUTER JOIN SF_SERVICOS_FATURA INNER JOIN SF_VL_USO ON SF_SERVICOS_FATURA.id_SF_SERVICOS_FATURA = SF_VL_USO.id_SF_SERVICOS_FATURA INNER JOIN SF_TIPO_USO ON SF_VL_USO.id_SF_TIPO_USO = SF_TIPO_USO.id_SF_TIPO_USO ON CL_PLANOSxLINHAS.id_LI_LINHAS = SF_SERVICOS_FATURA.id_LI_LINHAS WHERE (SF_SERVICOS_FATURA.mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (SF_SERVICOS_FATURA.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Width="100%" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" AsyncRendering="true"  >
        <LocalReport ReportPath="rdcl\clientes\RelDiscritivo .rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="ds_discritivo" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>

<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.ds_relDescritivoTableAdapters.RelDiscritivoTableAdapter">
  <SelectParameters>
        <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"  />
    </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
