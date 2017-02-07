<%@ Page Title="LINHAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_linhas_virtuais.aspx.vb" Inherits="conteltelecom.cl_linhas_virtuais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
  
       
    <telerik:RadGrid ID="RadGridLinhasVirtuais" runat="server" RenderMode="Auto" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasCliente" GroupPanelPosition="Top" Skin="Bootstrap" AllowAutomaticDeletes="True">

        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSourceLinhasCliente" CommandItemDisplay="Top" EditMode="InPlace" DataKeyNames="id_LI_LINHAS" ShowHeadersWhenNoRecords="true" NoMasterRecordsText="SEM REGISTROS">
            <CommandItemSettings AddNewRecordText="NOVO"  CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
            <Columns>

                <telerik:GridHyperLinkColumn AllowSorting="False" DataTextField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" UniqueName="id_LI_LINHAS">
                </telerik:GridHyperLinkColumn>

                <telerik:GridTemplateColumn DataField="numContrato_LI_LINHAS" FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="Nº CONTRATO" SortExpression="numContrato_LI_LINHAS" UniqueName="numContrato_LI_LINHAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="numContrato_LI_LINHASTextBox" runat="server" Text='<%# Bind("numContrato_LI_LINHAS") %>'></telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="RequiredFielnumContrato_LI_LINHASTextBox" ControlToValidate="numContrato_LI_LINHASTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="numContrato_LI_LINHASLabel" runat="server" Text='<%# Eval("numContrato_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="codLinha_LI_LINHASTextBox" runat="server" Width="95%" Text='<%# Bind("codLinha_LI_LINHAS") %>'></telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="RequiredcodLinha_LI_LINHASTextBox" ControlToValidate="codLinha_LI_LINHASTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter column column" HeaderText="OPERADORA" UniqueName="desc_OP_OPERADORAS" DefaultInsertValue="OI">
                    <EditItemTemplate>
                        <telerik:RadComboBox runat="server" ID="RadComboBoxOPeradoras" Culture="pt-BR" DataSourceID="SqlDataSourceOperadoras" DataTextField="desc_OP_OPERADORAS" DataValueField="id_OP_OPERADORAS" SelectedValue='<%# Bind("id_OP_OPERADORAS") %>'>
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="labelOperadora" Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_LI_TIPOS" FilterControlAltText="Filter id_LI_TIPOS column" HeaderText="TIPO" UniqueName="id_LI_TIPOS" Visible="False">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="RadComboBoxTiposLInhas" SelectedValue='<%# Bind("id_LI_TIPOS") %>' runat="server" Culture="pt-BR" DataSourceID="SqlDataSourceTipoLinhas" DataTextField="desc_LI_TIPOS" DataValueField="id_LI_TIPOS">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="labelDestipos" Text='<%# Eval("desc_LI_TIPOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter ST column" HeaderText="ST" UniqueName="ST">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxST" runat="server" Checked="true" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="5px" />
                    <ItemStyle HorizontalAlign="Center" Width="5px" />
                </telerik:GridTemplateColumn>
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
            
    <asp:SqlDataSource ID="SqlDataSourceLinhasCliente" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridLinhas" SelectCommandType="StoredProcedure" InsertCommand="RadGridLinhasVirtuais_Insert" InsertCommandType="StoredProcedure" DeleteCommand="DELETE FROM LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
        <DeleteParameters>
            <asp:Parameter Name="id_LI_LINHAS" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="id" Type="Int32" />
            <asp:Parameter Name="id_OP_OPERADORAS" DefaultValue="1" />
            <asp:Parameter Name="id_LI_TIPOS" />
            <asp:Parameter Name="numContrato_LI_LINHAS" />
            <asp:Parameter Name="codLinha_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
            <asp:Parameter Name="id_LI_LINHAS" Type="Int32" DefaultValue="" />
            <asp:Parameter DefaultValue="0" Name="EditMode" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="linhaVirtual_LI_LINHAS" Type="Int32" />
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOperadoras" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownOperadoras" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTipoLinhas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoLinhas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
