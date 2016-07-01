<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="adm_paginas_menu.aspx.vb" Inherits="conteltelecom.adm_paginas_menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <table style="width: 100%;">
         <tr>
            <td colspan="2">
                 <telerik:RadImageButton ID="RadImageButtonAdd" runat="server" Width="32px" Height="32px" CommandName="Novo" Text="" Image-Url="~/img/add.png"></telerik:RadImageButton>
                </td>

        <tr>
            <td style="width:30%">

                <telerik:RadTreeView ID="RadTreeViewMenus" runat="server" AllowNodeEditing="True" CheckBoxes="True" CheckChildNodes="True" DataFieldID="id_CONFIG_CAD_MENU" DataFieldParentID="menuPai_CONFIG_CAD_MENU" DataSourceID="SqlDataSourceBuscaMenus" DataTextField="desc_id_CONFIG_CAD_MENU" DataValueField="id_CONFIG_CAD_MENU" Skin="Bootstrap"></telerik:RadTreeView>


                <asp:SqlDataSource ID="SqlDataSourceBuscaMenus" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_CONFIG_CAD_MENU], [menuPai_CONFIG_CAD_MENU], [desc_id_CONFIG_CAD_MENU] FROM [CONFIG_CAD_MENU] WHERE ([st_CONFIG_CAD_MENU] = @st_CONFIG_CAD_MENU)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="st_CONFIG_CAD_MENU" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </td>
            <td style="width:70%">
                <telerik:RadGrid ID="RadGrid1" runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaPagina" AutoGenerateColumns="False">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ExportSettings>
                        <Pdf PageWidth="">
                        </Pdf>
                    </ExportSettings>
                    <MasterTableView DataKeyNames="id_CONFIG_CAD_MENU" DataSourceID="SqlDataSourceBuscaPagina">
                        <Columns>
                            <telerik:GridBoundColumn DataField="id_CONFIG_CAD_MENU" DataType="System.Int32" FilterControlAltText="Filter id_CONFIG_CAD_MENU column" HeaderText="ID" ReadOnly="True" SortExpression="id_CONFIG_CAD_MENU" UniqueName="id_CONFIG_CAD_MENU">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="desc_id_CONFIG_CAD_MENU" FilterControlAltText="Filter desc_id_CONFIG_CAD_MENU column" HeaderText="NOME DO MENU" SortExpression="desc_id_CONFIG_CAD_MENU" UniqueName="desc_id_CONFIG_CAD_MENU">
                                <EditItemTemplate>
                                    <asp:TextBox ID="desc_id_CONFIG_CAD_MENUTextBox" runat="server" Text='<%# Bind("desc_id_CONFIG_CAD_MENU") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="desc_id_CONFIG_CAD_MENULabel" runat="server" Text='<%# Eval("desc_id_CONFIG_CAD_MENU") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="url_CONFIG_CAD_PAGINAS" FilterControlAltText="Filter url_CONFIG_CAD_PAGINAS column" HeaderText="URL PÁGINA" SortExpression="url_CONFIG_CAD_PAGINAS" UniqueName="url_CONFIG_CAD_PAGINAS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="url_CONFIG_CAD_PAGINASTextBox" runat="server" Text='<%# Bind("url_CONFIG_CAD_PAGINAS") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="url_CONFIG_CAD_PAGINASLabel" runat="server" Text='<%# Eval("url_CONFIG_CAD_PAGINAS") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </telerik:GridTemplateColumn>
                            <telerik:GridCheckBoxColumn DataType="System.Boolean" FilterControlAltText="Filter visualizar column" UniqueName="visualizar">
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridCheckBoxColumn DataType="System.Boolean" FilterControlAltText="Filter incluir column" UniqueName="incluir" HeaderImageUrl="~/img/add_16.png">
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridCheckBoxColumn DataType="System.Boolean" FilterControlAltText="Filter editar column" UniqueName="editar">
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridCheckBoxColumn DataType="System.Boolean" FilterControlAltText="Filter excluir column" UniqueName="excluir">
                            </telerik:GridCheckBoxColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceBuscaPagina" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CONFIG_CAD_MENU.desc_id_CONFIG_CAD_MENU, CONFIG_CAD_PAGINAS.url_CONFIG_CAD_PAGINAS, CONFIG_CAD_MENU.id_CONFIG_CAD_MENU FROM CONFIG_CAD_PAGINAS RIGHT OUTER JOIN CONFIG_CAD_MENU ON CONFIG_CAD_PAGINAS.id_CONFIG_CAD_PAGINAS = CONFIG_CAD_MENU.id_CONFIG_CAD_PAGINAS"></asp:SqlDataSource>
            </td>
        </tr>
       
    </table>


</asp:Content>
