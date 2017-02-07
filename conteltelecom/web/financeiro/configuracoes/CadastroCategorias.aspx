<%@ Page Title="CADASTRO DE CATEGORIAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroCategorias.aspx.vb" Inherits="conteltelecom.CadastroCategorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridConfiguraCategorias" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCategorias" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_CATEGORIA" DataSourceID="SqlDataSourceCategorias" AllowNaturalSort="False" NoDetailRecordsText="Sem registros para exibir." NoMasterRecordsText="Sem registros para exibir.">
            <CommandItemSettings AddNewRecordText="Adicionar Registro" CancelChangesText="Cancelar Alterações" RefreshText="Atualizar" SaveChangesText="Salvar Alterações" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_CATEGORIA" DataType="System.Int32" FilterControlAltText="Filter id_FI_CATEGORIA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_CATEGORIA" UniqueName="id_FI_CATEGORIA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_CATEGORIA" FilterControlAltText="Filter desc_FI_CATEGORIA column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_CATEGORIA" UniqueName="desc_FI_CATEGORIA">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_CATEGORIATextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_CATEGORIA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_CATEGORIALabel" runat="server" Text='<%# Eval("desc_FI_CATEGORIA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_FI_CATEGORIA" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_FI_CATEGORIA column" StringFalseValue="0" StringTrueValue="1" UniqueName="st_FI_CATEGORIA" HeaderText="ST">
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                </telerik:GridButtonColumn>
            </Columns>

            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>

        </MasterTableView>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_CATEGORIA] WHERE [id_FI_CATEGORIA] = @id_FI_CATEGORIA" InsertCommand="INSERT INTO FI_CATEGORIA(desc_FI_CATEGORIA, st_FI_CATEGORIA, dtInc_FI_CATEGORIA, dtAlt_FI_CATEGORIA, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_FI_CATEGORIA, @st_FI_CATEGORIA, GETDATE(), GETDATE(), @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT id_FI_CATEGORIA, st_FI_CATEGORIA, desc_FI_CATEGORIA FROM FI_CATEGORIA" UpdateCommand="UPDATE FI_CATEGORIA SET desc_FI_CATEGORIA = @desc_FI_CATEGORIA, st_FI_CATEGORIA = @st_FI_CATEGORIA, dtAlt_FI_CATEGORIA = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_FI_CATEGORIA = @id_FI_CATEGORIA)">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_CATEGORIA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_CATEGORIA" Type="String" />
            <asp:Parameter Name="st_FI_CATEGORIA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_CATEGORIA" Type="String" />
            <asp:Parameter Name="st_FI_CATEGORIA" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_FI_CATEGORIA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
