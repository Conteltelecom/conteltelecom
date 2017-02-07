<%@ Page Language="vb" MasterPageFile="~/Site.Mobile.Master"  AutoEventWireup="false" CodeBehind="Chamados.aspx.vb" Inherits="conteltelecom.Chamados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
                <h2 class="page_title">SAC</h2>
                                        <blockquote>Para melhor atender seus clientes a Conteltelecom disponibiliza um portal completo de atendimento ao consumidor<span class="quote_author"></span></blockquote>
   <asp:HyperLink ID="HyperLinkNovo" NavigateUrl="/web/area_cliente/mobile/Chamados/AbrirChamadoMobile.aspx" runat="server">
        <div class="service_box">
            
            <div class="services_icon" >
                                
            <img src="~/Content/Mobile/images/icons/Sac.png" runat="server" alt="" title="" />  
            </div>
          
            <div class="service_content">
                <h4>Novo Chamado</h4>
                <p>Aqui você pode abrir um novo chamado para nossa equipe.</p>
            </div>
        </div>
      </asp:HyperLink>
      <asp:HyperLink ID="HyperLinkConsulta" NavigateUrl="~/web/area_cliente/mobile/Chamados/FiltroChamadosMesAno.aspx?st_CH_SUBCHAMADOS=1" runat="server">
                                        <div class="service_box" style="border-bottom:1px #ddd solid;">
                                           
                                            <div class="services_icon" style="background-color: #b2b2b2;">
                                              <img src="~/Content/Mobile/images/icons/Sac.png" runat="server" alt="" title="" />

                                            </div>
                                              
                                            <div class="service_content">
                                                <h4>Consulta chamados em aberto</h4>
                                                <p>Chamados em atendimento pelos nossos consultores.</p>
                                            </div>
                                        </div>
       </asp:HyperLink> 
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/web/area_cliente/mobile/Chamados/FiltroChamadosMesAno.aspx?st_CH_SUBCHAMADOS=0" runat="server">
                                        <div class="service_box" style="border-bottom:1px #ddd solid;">
                                             
                                            <div class="services_icon" style="background-color: #b2b2b2;">
                                                <img src="~/Content/Mobile/images/icons/Sac.png" runat="server" alt="" title="" /></div>
                                                
                                            <div class="service_content">
                                                <h4>Consulta chamados em fechados</h4>
                                                <p>Chamados já solucionados pelos nossos consultores</p>
                                            </div>
                                        </div>
         </asp:HyperLink> 
                                        <h3></h3>
                                       
</asp:Content>
