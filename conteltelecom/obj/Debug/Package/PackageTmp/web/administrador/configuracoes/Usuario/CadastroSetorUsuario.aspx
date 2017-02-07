<%@ Page Title="SETORES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroSetorUsuario.aspx.vb" Inherits="conteltelecom.CadastroSetorUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadastroSetorUsuario" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceSetorUsuario" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_PS_SETOR_USUARIO" DataSourceID="SqlDataSourceSetorUsuario">
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_SETOR_USUARIO" DataType="System.Int32" FilterControlAltText="Filter id_PS_SETOR_USUARIO column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_SETOR_USUARIO" UniqueName="id_PS_SETOR_USUARIO">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CH_SETORES" FilterControlAltText="Filter desc_CH_SETORES column" HeaderText="SETOR" SortExpression="desc_CH_SETORES" UniqueName="desc_CH_SETORES">
                    <EditItemTemplate>
                        <telerik:RadDropDownList Width="95%" ID="RadDropDownListdesc_CH_SETORES" runat="server" DataSourceID="SqlDataSourceSetores" DataTextField="desc_CH_SETORES" DataValueField="id_CH_SETORES" DropDownHeight="150px" SelectedValue='<%# Bind("id_CH_SETORES") %>'></telerik:RadDropDownList>
                        
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_SETORESLabel" runat="server" Text='<%# Eval("desc_CH_SETORES") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
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
    <asp:SqlDataSource ID="SqlDataSourceSetorUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_SETOR_USUARIO] WHERE [id_PS_SETOR_USUARIO] = @id_PS_SETOR_USUARIO" InsertCommand="INSERT INTO PS_SETOR_USUARIO(id_CH_SETORES, id_USUARIOS, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@id_CH_SETORES, @id_USUARIOS, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT PS_SETOR_USUARIO.id_PS_SETOR_USUARIO, PS_SETOR_USUARIO.id_CH_SETORES, CH_SETORES.desc_CH_SETORES FROM PS_SETOR_USUARIO INNER JOIN CH_SETORES ON PS_SETOR_USUARIO.id_CH_SETORES = CH_SETORES.id_CH_SETORES WHERE (PS_SETOR_USUARIO.id_USUARIOS = @id_USUARIOS)" UpdateCommand="UPDATE PS_SETOR_USUARIO SET id_CH_SETORES = @id_CH_SETORES, dtAlt_PS_SETOR_USUARIO = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_PS_SETOR_USUARIO = @id_PS_SETOR_USUARIO)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_SETOR_USUARIO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
                   <asp:QueryStringParameter QueryStringField="id_USUARIOS" Name="id_USUARIOS" Type="Int32" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_USUARIOS" QueryStringField="id_USUARIOS" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_CH_SETORES" Type="Int32" />
               <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_PS_SETOR_USUARIO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSetores" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [id_CH_SETORES], [desc_CH_SETORES] FROM [View_DropDown_CH_SETORES]"></asp:SqlDataSource>
</asp:Content>
