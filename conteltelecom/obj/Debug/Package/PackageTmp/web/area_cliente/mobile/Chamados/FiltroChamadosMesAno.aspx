<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="FiltroChamadosMesAno.aspx.vb" Inherits="conteltelecom.FiltroChamadosMesAno" %>
<% @ Register TagPrefix = "controle" TagName = "list_view_vazia"   Src = "~/web/area_cliente/mobile/ascx/WebUserControlListview.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
       </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
    <blockquote style=" border-top:0px !important" >
    <h2 class="page_title">CHAMADOS</h2>
        </blockquote> 
            <telerik:RadListView ID="RadListViewAno"  runat="server" DataSourceID="SqlDataSourceAno" Skin="Bootstrap"><LayoutTemplate>
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
          <asp:LinkButton ID="LinkButtonMes"  OnClick ="LinkButtonMes_Click"   runat="server">
                               <div class="service_box" style="border-bottom: 1px #ddd solid;">
                                   
                                   <div class="services_icon" style="background-color: #b2b2b2;">
                                      <img alt="0"  src='<%# Eval("imgUrl_ADM_IMAGENS_ANO") %>'  runat="server"  />
                                       
                                   </div>
                  
                                   <div class="service_content">
                                       <h4>
                                           <asp:Label ID="LabelAno" runat="server" Text='<%# Eval("Ano") %>' ></asp:Label>
                                       </h4>
                                       <p>
                                          </p>
                                   </div>
                               </div>
                             </asp:LinkButton>
               </ItemTemplate>
               <AlternatingItemTemplate>
             <asp:LinkButton ID="LinkButtonMes"  OnClick ="LinkButtonMes_Click"   runat="server">
                               <div class="service_box" style="border-bottom: 1px #ddd solid;">
                                  
                                   <div class="services_icon" style="background-color: #b2b2b2;">
                                      <img alt="0"  src='<%# Eval("imgUrl_ADM_IMAGENS_ANO") %>'  runat="server"  />
                                       
                                   </div>
               
                                   <div class="service_content">
                                       <h4>
                                           <asp:Label ID="LabelAno" runat="server" Text='<%# Eval("Ano") %>' ></asp:Label>
                                       </h4>
                                       <p>
                                          </p>
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

    <telerik:RadListView ID="RadListViewMes" Visible="False"  runat="server" DataSourceID="SqlDataSourceMes" Skin="Bootstrap"><LayoutTemplate>
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
       
           <div class="service_box">
               <asp:HyperLink ID="HyperLinkMes"  NavigateUrl='<%# String.Format(Eval("url")) + "&st_CH_SUBCHAMADOS=" + Request.QueryString("st_CH_SUBCHAMADOS") %>' runat="server">
            <div class="services_icon">
                    
                <asp:Image ID="ImageMes" runat="server" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_MES") %>'   />          
               
            </div>
                    </asp:HyperLink>    
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelMes" runat="server" Text='<%# Eval("desc_ADM_IMAGENS_MES") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div>
       
        </ItemTemplate>
        <AlternatingItemTemplate>
           
           <div class="service_box">
              <asp:HyperLink ID="HyperLinkMes"  NavigateUrl='<%# String.Format(Eval("url")) + "&st_CH_SUBCHAMADOS=" + Request.QueryString("st_CH_SUBCHAMADOS") %>' runat="server">
            <div class="services_icon">
                    
                <asp:Image ID="ImageMes" runat="server" ImageUrl='<%# Eval("imgUrl_ADM_IMAGENS_MES") %>'   />          
               
            </div>
                    </asp:HyperLink>    
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelMes" runat="server" Text='<%# Eval("desc_ADM_IMAGENS_MES") %>' ></asp:Label></h4>
                <p></p>
            </div>
        </div>
       
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
    
<asp:SqlDataSource ID="SqlDataSourceAno" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT YEAR(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) AS Ano, ADM_IMAGENS_ANO.imgUrl_ADM_IMAGENS_ANO FROM CH_SUBCHAMADOS INNER JOIN ADM_IMAGENS_ANO ON YEAR(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) = ADM_IMAGENS_ANO.desc_ADM_IMAGENS_ANO WHERE (CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA = @abertoPor_id_PS_PESSOA) AND (CH_SUBCHAMADOS.st_CH_SUBCHAMADOS = @st_CH_SUBCHAMADOS)">
    <SelectParameters>
        <asp:SessionParameter  Name="abertoPor_id_PS_PESSOA" SessionField="id_PS_PESSOA_USUARIO" />
        <asp:QueryStringParameter Name="st_CH_SUBCHAMADOS" QueryStringField="st_CH_SUBCHAMADOS" />
    </SelectParameters>
       </asp:SqlDataSource>

       <asp:SqlDataSource ID="SqlDataSourceMes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT ADM_IMAGENS_MES.numMes_ADM_IMAGENS_MES, ADM_IMAGENS_MES.desc_ADM_IMAGENS_MES, ADM_IMAGENS_MES.imgUrl_ADM_IMAGENS_MES, '~/web/area_cliente/mobile/Chamados/ConsultaChamados.aspx?MesAtual=' + CAST(ADM_IMAGENS_MES.numMes_ADM_IMAGENS_MES AS varchar(11)) + '&amp;AnoAtual=' + CAST(@Ano AS varchar(11)) AS url, CH_SUBCHAMADOS.st_CH_SUBCHAMADOS, CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA FROM CH_SUBCHAMADOS INNER JOIN ADM_IMAGENS_MES ON MONTH(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) = ADM_IMAGENS_MES.numMes_ADM_IMAGENS_MES WHERE (YEAR(CH_SUBCHAMADOS.dtAbertura_CH_SUBCHAMADOS) = @Ano) AND (CH_SUBCHAMADOS.st_CH_SUBCHAMADOS = @st_CH_SUBCHAMADOS) AND (CH_SUBCHAMADOS.abertoPor_id_PS_PESSOA = @abertoPor_id_PS_PESSOA)">
           <SelectParameters>
               <asp:Parameter Name="Ano" />
               <asp:QueryStringParameter Name="st_CH_SUBCHAMADOS" QueryStringField="st_CH_SUBCHAMADOS" />
               <asp:SessionParameter DefaultValue="" Name="abertoPor_id_PS_PESSOA" SessionField="id_PS_PESSOA_USUARIO" />
           </SelectParameters>
       </asp:SqlDataSource>

</asp:Content>
