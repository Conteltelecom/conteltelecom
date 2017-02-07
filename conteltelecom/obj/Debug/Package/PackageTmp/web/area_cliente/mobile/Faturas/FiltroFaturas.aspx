<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="FiltroFaturas.aspx.vb" Inherits="conteltelecom.FiltroFaturas" %>
<% @ Register TagPrefix = "controle" TagName = "list_view_vazia"   Src = "~/web/area_cliente/mobile/ascx/WebUserControlListview.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
     
  <blockquote style=" border-top:0px !important" >
    <h2 class="page_title">FATURAS</h2>
  </blockquote>
    <telerik:RadListView ID="RadListViewAno" runat="server" DataSourceID="SqlDataSourceAno" Skin="Bootstrap"><LayoutTemplate>
        <div>
            <table cellspacing="0" style="width:100%;">
                <thead>
                    <tr class="rlvHeader">
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </tbody>
            </table>
        </div>
</LayoutTemplate>
        <ItemTemplate>
                  <asp:LinkButton ID="LinkButtonAno" runat="server" OnClick="LinkButtonAno_Click">  
           <div class="service_box">
                
            <div class="services_icon">
               
                    <asp:Image ID="ImageAno" runat="server" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_ANO") %>'    />
                
            </div>
             
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelAno" runat="server" Text='<%# Eval("AnoRef") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div>
                </asp:LinkButton>
        </ItemTemplate>
        <AlternatingItemTemplate>
              <asp:LinkButton ID="LinkButtonAno" runat="server" OnClick="LinkButtonAno_Click">
               <div class="client_row"> 
             <div class="service_box" >
              
            <div class="services_icon">
               
                    <asp:Image ID="ImageAno" runat="server" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_ANO") %>'    />
                
            </div>
             
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelAno" runat="server" Text='<%# Eval("AnoRef") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div>
                   </div>
                    </asp:LinkButton>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd" Text=" " ToolTip="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
        <EmptyDataTemplate>
          <controle:list_view_vazia runat="server"  ID="ListVazia" ></controle:list_view_vazia>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr class="rlvISel">
            </tr>
        </SelectedItemTemplate>
       </telerik:RadListView>

    <telerik:RadListView ID="RadListViewMes" Visible="false"  runat="server" DataSourceID="SqlDataSourceMes" Skin="Bootstrap"><LayoutTemplate>
        <div>
            <table cellspacing="0" style="width:100%;">
                <thead>
                    <tr class="rlvHeader">
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </tbody>
            </table>
        </div>
</LayoutTemplate>
        <ItemTemplate>
          <asp:HyperLink ID="HyperLinkMes"  NavigateUrl='<%# String.Format(Eval("url")) %>' runat="server">
                                            <div class="service_box" style="border-bottom: 1px #ddd solid;">
            <div class="services_icon" style="background-color: #b2b2b2;">
                <asp:Image ID="ImageMes" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_MES") %>'   runat="server" />
                         
               
            </div>
                                                  
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelMes" runat="server" Text='<%# Eval("mesReferencia_SF_LEITURA_FATURA") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div>  </asp:HyperLink>  
        </ItemTemplate>
        <AlternatingItemTemplate>
             <asp:HyperLink ID="HyperLinkMes"  NavigateUrl='<%# String.Format(Eval("url")) %>' runat="server">
                                            <div class="service_box" style="border-bottom: 1px #ddd solid;">
            <div class="services_icon" style="background-color: #b2b2b2;">
                <asp:Image ID="ImageMes" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_MES") %>'   runat="server" />
                         
               
            </div>
                                                    
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelMes" runat="server" Text='<%# Eval("mesReferencia_SF_LEITURA_FATURA") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div></asp:HyperLink>  
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd" Text=" " ToolTip="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
        <EmptyDataTemplate>
            <controle:list_view_vazia runat="server"  ID="ListVazia" ></controle:list_view_vazia>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr class="rlvISel">
            </tr>
        </SelectedItemTemplate>
       </telerik:RadListView>      
    
<asp:SqlDataSource ID="SqlDataSourceAno" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT RIGHT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 4) AS AnoRef, ADM_IMAGENS_ANO.imgUrl_ADM_IMAGENS_ANO FROM SF_LEITURA_FATURA INNER JOIN LI_LINHAS ON SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA = LI_LINHAS.numContrato_LI_LINHAS AND SF_LEITURA_FATURA.id_OP_OPERADORAS = LI_LINHAS.id_OP_OPERADORAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN ADM_IMAGENS_ANO ON RIGHT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 4) = ADM_IMAGENS_ANO.desc_ADM_IMAGENS_ANO WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
    <SelectParameters>
        <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
    </SelectParameters>
       </asp:SqlDataSource>

       <asp:SqlDataSource ID="SqlDataSourceMes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT '~/web/area_cliente/mobile/Faturas/Faturas.aspx?MesAtual=' + LEFT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 2) + '&amp;AnoAtual=' + RIGHT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 4) AS url, LEFT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 2) AS ORDEM, ADM_IMAGENS_MES.numMes_ADM_IMAGENS_MES, ADM_IMAGENS_MES.imgUrl_ADM_IMAGENS_MES, ADM_IMAGENS_MES.desc_ADM_IMAGENS_MES AS mesReferencia_SF_LEITURA_FATURA FROM SF_LEITURA_FATURA AS SF_LEITURA_FATURA_1 INNER JOIN LI_LINHAS AS LI_LINHAS_1 ON SF_LEITURA_FATURA_1.id_OP_OPERADORAS = LI_LINHAS_1.id_OP_OPERADORAS AND SF_LEITURA_FATURA_1.cotAgrupador_SF_LEITURA_FATURA = LI_LINHAS_1.numContrato_LI_LINHAS INNER JOIN PS_CLIENTES AS PS_CLIENTES_1 ON LI_LINHAS_1.id_PS_CLIENTES = PS_CLIENTES_1.id_PS_CLIENTES INNER JOIN ADM_IMAGENS_MES ON LEFT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 2) = ADM_IMAGENS_MES.numMes_ADM_IMAGENS_MES WHERE (PS_CLIENTES_1.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (RIGHT (RTRIM(SF_LEITURA_FATURA_1.mesReferencia_SF_LEITURA_FATURA), 4) = @Ano) ORDER BY ORDEM">
           <SelectParameters>
               <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
               <asp:Parameter Name="Ano" />
           </SelectParameters>
       </asp:SqlDataSource>

    </asp:Content>
