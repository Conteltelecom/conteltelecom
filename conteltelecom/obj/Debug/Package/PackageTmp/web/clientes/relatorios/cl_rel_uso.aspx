﻿<%@ Page Title="RELATÓRIO DE USO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="cl_rel_uso.aspx.vb" Inherits="conteltelecom.cl_rel_uso" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio"  runat="server">
         <fieldset >
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
              <asp:Label ID="Label3" runat="server" Text="ORDENAR POR:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>
                <div class="col-xs-4" >
                    <telerik:RadDropDownList ID="RadDropDownLisTipo" runat="server" Width="95%">
                        <Items>
                            <telerik:DropDownListItem Text="UNIDADES"  Value="0" />
                            
                            <telerik:DropDownListItem Text="CIDADES"  Value="1"/>
                        </Items>
                       
                    </telerik:RadDropDownList>
                 </div>
                <div class="col-xs-6" >
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
                     </div>
                      </div>
             
           
                
        </div>
     
           </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaCodRazao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.Ds_ClientecodRazaoTableAdapters.COD_PS_JURIDICATableAdapter"></asp:ObjectDataSource>
      <rsweb:ReportViewer ID="ReportViewerUso" runat="server"  DocumentMapWidth="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" SizeToReportContent="true"  Width="100%" Height ="95%" ZoomPercent="100" ZoomMode="Percent">
        <LocalReport ReportPath="rdcl\clientes\RelUso.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceRelUso" Name="RelUso" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSourceRelUso" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelUsoTableAdapters.LI_LINHASTableAdapter">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="01/2000" Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String" />
        <asp:SessionParameter  Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32" />
    </SelectParameters>
       </asp:ObjectDataSource>
</asp:Content>
