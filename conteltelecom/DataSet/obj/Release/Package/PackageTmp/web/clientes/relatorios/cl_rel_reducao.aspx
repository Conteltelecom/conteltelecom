<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Relatorios.master" CodeBehind="cl_rel_reducao.aspx.vb" Inherits="conteltelecom.cl_rel_reducao" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headRelatorio" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRelatorio" runat="server">
    <fieldset style="width:11in">
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
                <asp:Label ID="Label1" runat="server" Text="MÊS/ANO:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-6">
                    <telerik:RadMaskedTextBox ID="RadTextBoxMesAno" Mask="<1..12>/<2000..2050>"  Width="100%" runat="server" Skin="Bootstrap"></telerik:RadMaskedTextBox>
                </div>
 <div class="col-xs-4">
     </div>
            </div>
            <div class="form-group" >
                <div class="col-xs-8" style="text-align: right">
                <telerik:RadImageButton ID="RadImageButtonGerar" class="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" OnClick="RadImageButtonGerar_Click"></telerik:RadImageButton>
            </div>
                <div class="col-xs-4">
                    </div>
                </div>
        </div>
     
           </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSourceBuscaCodRazao" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.Ds_ClientecodRazaoTableAdapters.COD_PS_JURIDICATableAdapter"></asp:ObjectDataSource>
   
            <rsweb:ReportViewer ID="ReportViewerRelReducao" AsyncRendering="true"  runat="server"  Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="11in" Width="9in" >
        <LocalReport ReportPath="rdcl\clientes\RelReducao.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="RelReducao"  />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSourceListaPendencias" Name="ds_ListaPendecia" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
   
      
       
        

    
    <asp:ObjectDataSource ID="ObjectDataSourceListaPendencias" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.ds_busca_pendeciasTableAdapter">
        <SelectParameters>
                      <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"  DefaultValue ="0"/>
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DataSetRelReducaoTableAdapters.spRelReducaoTableAdapter">
    <SelectParameters>
        <asp:SessionParameter Name="mesAnoRefereincia_SF_SERVICOS_FATURA" SessionField="mesAnoRefereincia_SF_SERVICOS_FATURA" Type="String"  DefaultValue="01/2000"/>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="codMatriz_PS_CLIENTES" Type="Int32"  DefaultValue ="0"/>
    </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>
