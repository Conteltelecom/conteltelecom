<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="M_Default.aspx.vb" Inherits="conteltelecom.M_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
<link rel="apple-touch-startup-image" href="images/apple-touch-startup-image-320x460.png" />
<meta name="author" content="FamousThemes" />
<meta name="description" content="GoMobile - A next generation web app theme" />
<meta name="keywords" content="mobile web app, mobile template, mobile design, mobile app design, mobile app theme, mobile wordpress theme, my mobile app" />

<link type="text/css" rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/Mobile/css/style.css") %>"  />
<link type="text/css" rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/Mobile/colors/medical/medical.css") %>" />
<link type="text/css" rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/Mobile/css//idangerous.swiper.css")%>" />
<link type="text/css" rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/Mobile/css/swipebox.css")%>" />
<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'/>
</head>
<body>

    <div class="swiper-container swiper-parent">
    <div class="swiper-wrapper">
    
      <!--Menu page-->
      <div class="swiper-slide sliderbg_menu">
          <div class="swiper-container swiper-nested">
                   <div class="swiper-wrapper">
                        <div class="swiper-slide">
                                  <div class="slide-inner">
                                        <div class="logo"><a href="#"></a></div>
                                        <div class="menu">
                                        <ul>
                                         <li><a href="Faturas/FiltroFaturas.aspx" onclick="swiperParent.swipeTo(5);"><img runat="server" src="~/Content/Mobile/images/icons/docs.png" alt="" title="" /><span>FATURAS</span></a></li>
                                        <li><a href="#"><img runat="server" src="~/Content/Mobile/images/icons/Financeiro.png" alt="" title="" /><span>FINANCEIRO</span></a></li>
                                        <li><a href="#" ><img runat="server"  src="~/Content/Mobile/images/icons/report.png" alt="" title="" /><span>RELATÓRIOS</span></a></li>
                                        <li><a href="#" onclick="swiperParent.swipeTo(3);"><img runat="server" src="~/Content/Mobile/images/icons/Grafico.png" alt="" title="" /><span>GRÁFICOS</span></a></li>
                           
                                        <li><a href="~/web/area_cliente/mobile/Chamados/Chamados.aspx" runat="server"  onclick="swiperParent.swipeTo(6);"><img runat="server" src="~/Content/Mobile/images/icons/Sac.png" alt="" title="" /><span>SAC</span></a></li>
                                        <li><a href="#" onclick="swiperParent.swipeTo(2);"><img  runat="server" src="~/Content/Mobile/images/icons/tools.png" alt="" title="" /><span>CONFIGURAÇÕES</span></a></li>
                                         <li><a href="../../../logoff.aspx"><img runat="server" src="~/Content/Mobile/images/icons/Sair.png" alt="" title="" /><span>SAIR</span></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        </div>
                                 </div>
                         </div>
                   </div>
                  <div class="swiper-scrollbar"></div>
          </div> 
      </div>
       
       
     <!--End of pages--> 

    </div>
    <div class="pagination"></div>
  </div>

<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/jquery-1.10.1.min.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/jquery.swipebox.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/idangerous.swiper-2.1.min.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/idangerous.swiper.scrollbar-2.1.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/jquery.tabify.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/jquery.fitvids.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/code.js")%>"></script>
<script type="text/javascript" src="<% = Page.ResolveUrl("~/Scripts/Mobile/load.js")%>"></script>
<!--Twitter Feed-->
    
<script type="text/javascript" src='<% = Page.ResolveUrl("~/Scripts/Mobile/twitter/jquery.tweet.js")%>'  charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
    $('#header').animate({ 'top': '0px' }, 400);
   
    var $ = jQuery.noConflict();
        
jQuery(function($){
$(".tweet").tweet({
  modpath: 'js/twitter/',
  join_text: "auto",
  username: "famousthemes",
  count: 5,
  auto_join_text_default: "we said,",
  auto_join_text_ed: "we",
  auto_join_text_ing: "we were",
  auto_join_text_reply: "we replied",
  auto_join_text_url: "we were checking out",
  loading_text: "loading tweets..."
});
});


</script>
</body>
</html>