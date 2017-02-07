<%@ Page Title="RELATÓRIO DE USO POR DATA" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="RelUsoAnual.aspx.vb" Inherits="conteltelecom.RelUsoAnual" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
       <fieldset>
    <legend>FILTRO</legend> 
          <div class="form-horizontal">
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

                                   <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../../img/accept.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server"  Text="LIMPAR" Skin="Bootstrap">
                         <Icon PrimaryIconUrl ="../../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                       
                 
                    
</div>
              </div>
           </fieldset>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>

               
    <rsweb:ReportViewer ID="ReportViewerUsoAnual" SizeToReportContent="true"  Width="100%" Height ="95%" ZoomPercent="100" ZoomMode="Percent"  runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
  
        <LocalReport ReportPath="rdcl\relacionamento\RelUsoAnual.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceBuscUsoAnual" Name="DataSetUsoAnual" />
            </DataSources>
        </LocalReport>


    </rsweb:ReportViewer>
                   </ContentTemplate>
          </asp:UpdatePanel>
    <asp:ObjectDataSource ID="ObjectDataSourceBuscUsoAnual"  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetBuscaUsoTableAdapters.LI_LINHASTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="DtIni" Type="DateTime" />
            <asp:Parameter Name="DtFim" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
