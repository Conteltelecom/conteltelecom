<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="WebUserControlListview.ascx.vb" Inherits="conteltelecom.WebUserControlListview" %>
<div>
      <div class="service_box">
                <asp:LinkButton ID="LinkButtonAno" runat="server" >
            <div class="services_icon">
               
                    <asp:Image ID="ImageAno" runat="server"  ImageUrl="~/Content/Mobile/images/icons/Vazio.png"   />
                
            </div>
               </asp:LinkButton>
            <div class="service_content">
                <h4>
                    <asp:Label ID="LabelAno" runat="server" Text="LISTA VAZIA"></asp:Label></h4>
                <p>Não encontramos registros para sua solicitação.
                </p>
            </div>
        
</div>
    </div> 