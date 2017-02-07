<%@ Page Title="CADASTRO DE UNIDADES" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_cad_unidades.aspx.vb" Inherits="conteltelecom.cl_cad_unidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
    <telerik:RadGrid ID="RadGridUnidades" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceTiposContratos" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Skin="Bootstrap" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CL_UNIDADES" DataSourceID="SqlDataSourceTiposContratos" CommandItemDisplay="Top"  EditMode="InPlace" >
            <CommandItemSettings AddNewRecordImageUrl="~/img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false"  />
            <Columns>
                <telerik:GridBoundColumn DataField="id_CL_UNIDADES" DataType="System.Int32" FilterControlAltText="Filter id_CL_UNIDADES column" HeaderText="ID" ReadOnly="True" SortExpression="id_CL_UNIDADES" UniqueName="id_CL_UNIDADES">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CL_UNIDADES" FilterControlAltText="Filter desc_CL_UNIDADES column" HeaderText="DESCRIÇÃO" SortExpression="desc_CL_UNIDADES" UniqueName="desc_CL_UNIDADES">
                    <EditItemTemplate>
                        <telerik:RadTextBox  ID="desc_CL_UNIDADESTextBox" Width="100%" runat="server" Text='<%# Bind("desc_CL_UNIDADES") %>' ></telerik:RadTextBox>
             <asp:RequiredFieldValidator ID="redesc_CL_UNIDADESTextBox" ControlToValidate="desc_CL_UNIDADESTextBox"  runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED" >

             </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CL_UNIDADESLabel" runat="server" Text='<%# Eval("desc_CL_UNIDADES") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CL_UNIDADES" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CL_UNIDADES column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CL_UNIDADES">
                </telerik:GridCheckBoxColumn>
                <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>
               </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSourceTiposContratos" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM [CL_UNIDADES] WHERE [id_CL_UNIDADES] = @id_CL_UNIDADES" InsertCommand="INSERT INTO CL_UNIDADES(desc_CL_UNIDADES, st_CL_UNIDADES, codMatriz_PS_CLIENTES) VALUES (@desc_CL_UNIDADES, @st_CL_UNIDADES, @codMatriz_PS_CLIENTES)" SelectCommand="SELECT id_CL_UNIDADES, desc_CL_UNIDADES, st_CL_UNIDADES, dtInc_CL_UNIDADES, codMatriz_PS_CLIENTES FROM CL_UNIDADES WHERE (codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)" UpdateCommand="UPDATE CL_UNIDADES SET desc_CL_UNIDADES = @desc_CL_UNIDADES, st_CL_UNIDADES = @st_CL_UNIDADES WHERE (id_CL_UNIDADES = @id_CL_UNIDADES)">
    <DeleteParameters>
        <asp:Parameter Name="id_CL_UNIDADES" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="desc_CL_UNIDADES" Type="String" />
        <asp:Parameter Name="st_CL_UNIDADES" Type="Byte" />
   <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="desc_CL_UNIDADES" Type="String" />
        <asp:Parameter Name="st_CL_UNIDADES" Type="Byte" />
        <asp:Parameter Name="id_CL_UNIDADES" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
