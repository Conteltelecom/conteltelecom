<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="conteltelecom.login" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CONTELTELECOM</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
    
                  
        <div id="wrap">
            
            <div id="content">
                <h2><asp:Image ID="ImageLogo" Width="200px" runat="server" ImageUrl="~/Account/css/LogoLogin.png" /></h2>
                <br />
                <br />
                <br />
                <br />
                <br />
                 
                <form id="logar" class="active" runat="server">

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <telerik:RadNotification ID="RadNotification1" runat="server" ForeColor="Black" Text="USUÁRIO OU SENHA INCORETOS" Skin="Sunset" Position="Center"></telerik:RadNotification>
                    <asp:TextBox ID="nome" runat="server" placeholder="LOGIN"></asp:TextBox>
                    <asp:TextBox ID="password" TextMode="Password" runat="server" placeholder="SENHA"></asp:TextBox>

                    <asp:Button runat="server" Text="LOGAR" OnClick="RadButtonlog_Click" />
                    <a href="#" id="to-up" onclick="">Não cadastrado</a>
                </form>
                
            </div>
        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/zepto/1.1.4/zepto.min.js"></script>
        <script>
            Zepto(function($){
                $('a').on('click', function(){
                    if($(this).attr("id") == "to-up") {
                        $("#sign-in").removeClass("active");
                        $("#sign-up").addClass("active");
                    } else {
                        $("#sign-up").removeClass("active");
                        $("#sign-in").addClass("active");
                    }
                });
            })
        </script>

    </body>
</html>