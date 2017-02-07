<%@ Page Title="RELATÓRIO MÓVEL X INTER." Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="rl_rel_movel_x_inter.aspx.vb" Inherits="conteltelecom.rl_rel_movel_x_inter" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
     <fieldset>
        <legend>FILTRO</legend>
        <div class="form-horizontal">
      
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="MÊS/ANO:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-4">
                    <telerik:RadMaskedTextBox ID="RadTextBoxMesAno" Mask="<1..12>/<2000..2050>"  Width="100%" runat="server" Skin="Bootstrap"></telerik:RadMaskedTextBox>
                </div>
                 <div class="col-xs-6" style="text-align: left">
              <telerik:RadImageButton ID="RadImageButtonGerar" CssClass ="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" OnClick="RadImageButtonGerar_Click"></telerik:RadImageButton>
                     </div>
              
            </div>
            
                
        </div>
     
           </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaCodRazao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.Ds_ClientecodRazaoTableAdapters.COD_PS_JURIDICATableAdapter"></asp:ObjectDataSource>

            <rsweb:ReportViewer ID="ReportViewerRelReducao"  runat="server"  Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"  SizeToReportContent="true"  Width="100%" Height ="95%" ZoomPercent="100" ZoomMode="Percent">
        <LocalReport ReportPath="rdcl\relacionamento\RelMovel_x_Inter.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceListaPendencias" Name="ds_movel_inter"  />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
   
      
       
        

    
    <asp:ObjectDataSource ID="ObjectDataSourceListaPendencias" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.RelMovel_InterurbanoTableAdapters.movel_x_interubanoTableAdapter">
        <SelectParameters>
                      <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.spRelReducaoTableAdapter">
    <SelectParameters>
        <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"/>
    </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>
