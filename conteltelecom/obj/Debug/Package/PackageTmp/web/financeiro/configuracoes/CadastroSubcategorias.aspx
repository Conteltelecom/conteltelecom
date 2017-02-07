<%@ Page Title="CADASTRO DE SUBCATEGORIAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroSubcategorias.aspx.vb" Inherits="conteltelecom.CadastroSubcategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadGrid ID="RadGridConfiguraSubcategorias" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceConfiguraSubcategorias" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_SUBCATEGORIA" DataSourceID="SqlDataSourceConfiguraSubcategorias">
            <Columns>

                <telerik:GridBoundColumn DataField="id_FI_SUBCATEGORIA" DataType="System.Int32" FilterControlAltText="Filter id_FI_SUBCATEGORIA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_SUBCATEGORIA" UniqueName="id_FI_SUBCATEGORIA">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn DataField="desc_FI_SUBCATEGORIA" FilterControlAltText="Filter desc_FI_SUBCATEGORIA column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_SUBCATEGORIA" UniqueName="desc_FI_SUBCATEGORIA">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_SUBCATEGORIATextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_SUBCATEGORIA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_SUBCATEGORIALabel" runat="server" Text='<%# Eval("desc_FI_SUBCATEGORIA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn FilterControlAltText="Filter column1 column" HeaderText="CATEGORIA" UniqueName="column1">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="RadDropDownList1" runat="server" DataSourceID="SqlDataSourceBuscaCategoria" DataTextField="desc_FI_CATEGORIA" DataValueField="id_FI_CATEGORIA" DropDownHeight="150px" SelectedValue='<%# Bind("id_FI_CATEGORIA") %>'></telerik:RadDropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDesc_FI_CATEGORIA" runat="server" Text='<%# Eval("desc_FI_CATEGORIA") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridCheckBoxColumn DataField="st_FI_SUBCATEGORIA" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter column column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="column">
                </telerik:GridCheckBoxColumn>

                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>

                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>

            <EditFormSettings>
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceConfiguraSubcategorias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_SUBCATEGORIA] WHERE [id_FI_SUBCATEGORIA] = @id_FI_SUBCATEGORIA" InsertCommand="INSERT INTO FI_SUBCATEGORIA(desc_FI_SUBCATEGORIA, st_FI_SUBCATEGORIA, dtInc_FI_SUBCATEGORIA, dtAlt_FI_SUBCATEGORIA, id_PS_PESSOA_inc, id_PS_PESSOA_alt, id_FI_CATEGORIA) VALUES (@desc_FI_SUBCATEGORIA, @st_FI_SUBCATEGORIA, getdate(), getdate(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @id_FI_CATEGORIA)" SelectCommand="SELECT FI_SUBCATEGORIA.id_FI_SUBCATEGORIA, FI_SUBCATEGORIA.desc_FI_SUBCATEGORIA, FI_SUBCATEGORIA.st_FI_SUBCATEGORIA, FI_CATEGORIA.desc_FI_CATEGORIA, FI_CATEGORIA.id_FI_CATEGORIA FROM FI_SUBCATEGORIA INNER JOIN FI_CATEGORIA ON FI_SUBCATEGORIA.id_FI_CATEGORIA = FI_CATEGORIA.id_FI_CATEGORIA" UpdateCommand="UPDATE FI_SUBCATEGORIA SET desc_FI_SUBCATEGORIA = @desc_FI_SUBCATEGORIA, st_FI_SUBCATEGORIA = @st_FI_SUBCATEGORIA, dtAlt_FI_SUBCATEGORIA = getdate(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, id_FI_CATEGORIA = @id_FI_CATEGORIA WHERE (id_FI_SUBCATEGORIA = @id_FI_SUBCATEGORIA)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_SUBCATEGORIA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_SUBCATEGORIA" Type="String" />
            <asp:Parameter Name="st_FI_SUBCATEGORIA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_CATEGORIA" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_SUBCATEGORIA" Type="String" />
            <asp:Parameter Name="st_FI_SUBCATEGORIA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_CATEGORIA" Type="Int32" />
            <asp:Parameter Name="id_FI_SUBCATEGORIA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceBuscaCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_FI_CATEGORIA], [desc_FI_CATEGORIA] FROM [FI_CATEGORIA] WHERE ([st_FI_CATEGORIA] = @st_FI_CATEGORIA)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_FI_CATEGORIA" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
