<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="DetalhesChamados.aspx.vb" Inherits="conteltelecom.DetalhesChamados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
    <telerik:RadGrid ID="RadGridDetalhes" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" GridLines="Both"></telerik:RadGrid>
</asp:Content>
