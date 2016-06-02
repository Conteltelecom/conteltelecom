<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_agrupamento_tipo_uso.aspx.vb" Inherits="conteltelecom.sf_agrupamento_tipo_uso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridAgrupamentoTipoUso" runat="server" AutoGenerateColumns="False" RenderMode="Auto"  Culture="pt-BR" DataSourceID="SqlDataSourceAgrupamantos" GroupPanelPosition="Top" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_TIPO_USO_CATEGORIAS" DataSourceID="SqlDataSourceAgrupamantos" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CommandItemDisplay="Top"  CommandItemSettings-ShowRefreshButton="false" CommandItemSettings-AddNewRecordImageUrl="../../../img/add.png" CommandItemSettings-AddNewRecordText="NOVO"  EditMode ="InPlace" >
<CommandItemSettings AddNewRecordText="NOVO" AddNewRecordImageUrl="../../../img/add.png" ShowRefreshButton="False"></CommandItemSettings>
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_TIPO_USO_CATEGORIAS" DataType="System.Int32" FilterControlAltText="Filter id_SF_TIPO_USO_CATEGORIAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_SF_TIPO_USO_CATEGORIAS" UniqueName="id_SF_TIPO_USO_CATEGORIAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_SF_TIPO_USO_CATEGORIAS" FilterControlAltText="Filter desc_SF_TIPO_USO_CATEGORIAS column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_TIPO_USO_CATEGORIAS" UniqueName="desc_SF_TIPO_USO_CATEGORIAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_SF_TIPO_USO_CATEGORIASTextBox" runat="server" Text='<%# Bind("desc_SF_TIPO_USO_CATEGORIAS") %>' Width="95%"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="ReqUso" ControlToValidate="desc_SF_TIPO_USO_CATEGORIASTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_SF_TIPO_USO_CATEGORIASLabel" runat="server" Text='<%# Eval("desc_SF_TIPO_USO_CATEGORIAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_SF_TIPO_USO_CATEGORIAS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_TIPO_USO_CATEGORIAS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_TIPO_USO_CATEGORIAS">
                </telerik:GridCheckBoxColumn>
                <telerik:GridDropDownColumn FilterControlAltText="Filter column column" HeaderText="CATEGORIA" ListValueField="id_SF_TIPO_USO_CATEGORIAS" UniqueName="column">
                </telerik:GridDropDownColumn>
                <telerik:GridTemplateColumn>
                    <ItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                        <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>

<FilterMenu RenderMode="Auto"></FilterMenu>

<HeaderContextMenu RenderMode="Auto"></HeaderContextMenu>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceAgrupamantos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM [SF_TIPO_USO_CATEGORIAS] WHERE [id_SF_TIPO_USO_CATEGORIAS] = @id_SF_TIPO_USO_CATEGORIAS" InsertCommand="INSERT INTO [SF_TIPO_USO_CATEGORIAS] ([desc_SF_TIPO_USO_CATEGORIAS], [st_SF_TIPO_USO_CATEGORIAS]) VALUES (@desc_SF_TIPO_USO_CATEGORIAS, @st_SF_TIPO_USO_CATEGORIAS)" SelectCommand="SELECT [id_SF_TIPO_USO_CATEGORIAS], [desc_SF_TIPO_USO_CATEGORIAS], [st_SF_TIPO_USO_CATEGORIAS] FROM [SF_TIPO_USO_CATEGORIAS] ORDER BY [id_SF_TIPO_USO_CATEGORIAS]" UpdateCommand="UPDATE [SF_TIPO_USO_CATEGORIAS] SET [desc_SF_TIPO_USO_CATEGORIAS] = @desc_SF_TIPO_USO_CATEGORIAS, [st_SF_TIPO_USO_CATEGORIAS] = @st_SF_TIPO_USO_CATEGORIAS WHERE [id_SF_TIPO_USO_CATEGORIAS] = @id_SF_TIPO_USO_CATEGORIAS">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
            <asp:Parameter Name="st_SF_TIPO_USO_CATEGORIAS" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
            <asp:Parameter Name="st_SF_TIPO_USO_CATEGORIAS" Type="Byte" />
            <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
