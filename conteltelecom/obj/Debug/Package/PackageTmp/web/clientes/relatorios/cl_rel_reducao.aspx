<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="cl_rel_reducao.aspx.vb" Inherits="conteltelecom.cl_rel_reducao" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
     <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="CÓD/NOME MATRIZ:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                <div class="col-xs-4">
                    <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxBuscaMatriz" runat="server"  Culture="pt-BR" DataSourceID="ObjectDataSourceBuscaCodRazao" DataTextField="razaosocial_PS_JURIDICA" DataValueField="codMatriz_PS_CLIENTES" InputType="Text" MinFilterLength="3" Skin="Bootstrap" Width="100%" TextSettings-SelectionMode="Single"></telerik:RadAutoCompleteBox>
                </div>
                <div class="col-xs-6">
                    
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
                             <asp:Label ID="Label3" runat="server" Text="TIPO RELÁTORIO:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>
                     <div class="col-xs-4">
                         <telerik:RadDropDownList ID="RadDropDownListTipoRel" runat="server">
                             <Items>
                                
                                 <telerik:DropDownListItem Text="CLIENTE" Value ="1" />
                                  <telerik:DropDownListItem Text="CONTEL" Value="2" />
                             </Items>
                         </telerik:RadDropDownList>

                         </div>
      <div class="col-xs-6">
                         </div>
                </div>
                  <div class="form-group">
                 <div class="col-xs-12" style="text-align: right; top: 0px; left: 0px;">
              <telerik:RadImageButton ID="RadImageButtonGerar" class="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" OnClick="RadImageButtonGerar_Click"></telerik:RadImageButton>
                     </div>
                      </div>
             
            
                
        </div>
     
           </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaCodRazao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.Ds_ClientecodRazaoTableAdapters.COD_PS_JURIDICATableAdapter"></asp:ObjectDataSource>
    <telerik:RadGrid ID="RadGridPendecias" runat="server" AutoGenerateColumns="False" Culture="pt-BR" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView Caption="PENDÊCIAS">
            <Columns>
                <telerik:GridBoundColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ST" FilterControlAltText="Filter ST column" HeaderText="VALORTOTAL" ReadOnly="True" SortExpression="ST" UniqueName="ST">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ST_VALOR_INFORMADO" FilterControlAltText="Filter ST_VALOR_INFORMADO column" HeaderText="VALOR INFORMADO" ReadOnly="True" SortExpression="ST_VALOR_INFORMADO" UniqueName="ST_VALOR_INFORMADO">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
     </telerik:RadGrid>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaPendecias" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.ds_busca_pendeciasTableAdapter">
         <SelectParameters>
             <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" />
             <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32" />
         </SelectParameters>
     </asp:ObjectDataSource>
    <div style="width:100%; height:100%">
        <rsweb:ReportViewer ID="ReportViewerRelReducao"  SizeToReportContent="true"  Width="100%" Height ="95%" ZoomPercent="100" ZoomMode="Percent" runat="server"  Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="rdcl\clientes\RelReducao.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="RelReducao"  />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceListaPendencias" Name="ds_ListaPendecia" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
    </div>    
   
      
       
        

    
    <asp:ObjectDataSource ID="ObjectDataSourceListaPendencias" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.ds_busca_pendeciasTableAdapter">
        <SelectParameters>
                      <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"  DefaultValue ="0"/>
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.spRelReducaoTableAdapter">
    <SelectParameters>
        <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"/>
    </SelectParameters>
</asp:ObjectDataSource>
     <asp:SqlDataSource ID="SqlDataSourceBuscaLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.codLinha_LI_LINHAS, LI_LINHAS.id_PS_CLIENTES FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LI_LINHAS.liCancelada_LI_LINHAS = 0)">
         <SelectParameters>
             <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceValidaLInha" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT vltotalLinha_SF_SERVICOS_FATURA, vlInicial_id_LI_TIPOS FROM SF_SERVICOS_FATURA WHERE (vlInicial_id_LI_TIPOS &lt;&gt; vltotalLinha_SF_SERVICOS_FATURA) AND (mesAnoRefereincia_SF_SERVICOS_FATURA = @mesAnoRefereincia_SF_SERVICOS_FATURA) AND (id_LI_LINHAS = @id_LI_LINHAS)">
         <SelectParameters>
             <asp:Parameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" />
             <asp:Parameter Name="id_LI_LINHAS" />
         </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
