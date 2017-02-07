<%@ Page Title="CLIENTES E CNPJ" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="razaoSocial_Cnpj.aspx.vb" Inherits="conteltelecom.razaoSocial_Cnpj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridRazaoSocialCnpj" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceRazãoSocial" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings ExportOnlyData="True" FileName="RadGridCnpj" HideStructureColumns="True" OpenInNewWindow="True">
            <Pdf AllowAdd="True" AllowCopy="True" AllowModify="True" PageWidth="">
            </Pdf>
            <Excel Format="Xlsx" />
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceRazãoSocial" CommandItemDisplay="Top" >
            <CommandItemSettings  ShowExportToExcelButton="true" ExportToPdfImageUrl="~\img\pdf_32.png"  ShowExportToPdfButton="true" ExportToExcelImageUrl="~\img\Excel_32.png" ShowAddNewRecordButton="false"  ShowRefreshButton="false"  />
            <Columns>
                <telerik:GridBoundColumn DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="ID" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="NOME FANTASIA" UniqueName="desc_PS_PESSOA">
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CNPJ" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.FcnpjFormat(Eval("CNPJ_PS_JURIDICA")) %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceRazãoSocial" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_CLIENTES.codMatriz_PS_CLIENTES, PS_JURIDICA.razaosocial_PS_JURIDICA, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_PESSOA.desc_PS_PESSOA, PS_PESSOA.st_PS_PESSOA FROM PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA AND PS_CLIENTES.id_PS_PESSOA = PS_JURIDICA.id_PS_PESSOA AND PS_CLIENTES.codMatriz_PS_CLIENTES = PS_JURIDICA.id_PS_PESSOA INNER JOIN PS_PESSOA ON PS_JURIDICA.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (PS_PESSOA.st_PS_PESSOA = 1)"></asp:SqlDataSource>
</asp:Content>
