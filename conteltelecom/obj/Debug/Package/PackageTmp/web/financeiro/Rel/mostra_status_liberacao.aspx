<%@ Page Title="STATUS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="mostra_status_liberacao.aspx.vb" Inherits="conteltelecom.mostra_status_liberacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridMostrastatusLiberacao" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceMostraStatusLiberacao">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView DataSourceID="SqlDataSourceMostraStatusLiberacao">
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceMostraStatusLiberacao" runat="server"></asp:SqlDataSource>
</asp:Content>
