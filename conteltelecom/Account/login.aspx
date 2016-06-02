<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="conteltelecom.login" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/style.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    
    <section>
 
  <h1>
        <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/Account/css/logoLogin.png" /></h1>
        <hr/>

  <form runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <telerik:RadNotification ID="RadNotification1" runat="server" Text="USUÁRIO OU SENHA INCORETOS" Skin="Sunset" Position="Center" ></telerik:RadNotification>
      <div style="margin-bottom:10px">
 <telerik:RadTextBox ID="RadTextBoxNome" runat="server" Width="90%" placeholder="NOME" Skin="Bootstrap"></telerik:RadTextBox>
  </div>
      <div style="margin-bottom:10px">
              <telerik:RadTextBox ID="RadTextBoxSenha" runat="server" Width="90%" placeholder="SENHA" Skin="Bootstrap" TextMode="Password" ></telerik:RadTextBox>
     
          </div>
      <div style="text-align:right !important">
         <telerik:RadButton ID="RadButtonlog" runat="server" Width="50%" Text="LOGAR" Skin="BlackMetroTouch"></telerik:RadButton>
                </div>
      <div>
          <br />
          <br />
      </div>
  </form>
 
  <h2>

  </h2>
</section>
</body>
</html>
