<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sinc_clientes.aspx.vb" Inherits="conteltelecom.sinc_clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <asp:Button ID="ButtonSincronizar" runat="server" Text="SINCRONIZAR CLIENTES" />
    <asp:SqlDataSource ID="SqlDataSourceCIdades" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT DISTINCT PS_CIDADES.desc_PS_CIDADES FROM PS_PESSOA INNER JOIN PS_CIDADES ON PS_PESSOA.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" InsertCommand="INSERT INTO CL_UNIDADES(desc_CL_UNIDADES, codMatriz_PS_CLIENTES) VALUES (@desc_CL_UNIDADES, @codMatriz_PS_CLIENTES)" SelectCommand="SELECT DISTINCT LI_LINHAS.nomeUnidade_LI_LINHAS, PS_CLIENTES.codMatriz_PS_CLIENTES FROM LI_LINHAS INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES">
        <InsertParameters>
            <asp:Parameter Name="desc_CL_UNIDADES" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT desc_CL_UNIDADES, codMatriz_PS_CLIENTES FROM CL_UNIDADES WHERE (desc_CL_UNIDADES = @desc_CL_UNIDADES) AND (codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:Parameter Name="desc_CL_UNIDADES" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MyslDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT CONVERT (varchar(30), PS_PESSOA.id_PS_PESSOA) + '-' + PS_PESSOA.desc_PS_PESSOA AS desc_PS_PESSOA FROM PS_CLIENTES INNER JOIN PS_PESSOA ON PS_CLIENTES.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA AND PS_CLIENTES.codMatriz_PS_CLIENTES = PS_PESSOA.id_PS_PESSOA"></asp:SqlDataSource>



</asp:Content>
