<%@ Page Title="STATUS DA CONTA" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroStatusConta.aspx.vb" Inherits="conteltelecom.CadastroStatusConta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridConfiguraStatusConta" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSource1" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_FI_STATUS_CONTA" DataSourceID="SqlDataSource1">
            <Columns>
                <telerik:GridBoundColumn DataField="id_FI_STATUS_CONTA" DataType="System.Int32" FilterControlAltText="Filter id_FI_STATUS_CONTA column" HeaderText="ID" ReadOnly="True" SortExpression="id_FI_STATUS_CONTA" UniqueName="id_FI_STATUS_CONTA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_FI_STATUS_CONTA" FilterControlAltText="Filter desc_FI_STATUS_CONTA column" HeaderText="DESCRIÇÃO" SortExpression="desc_FI_STATUS_CONTA" UniqueName="desc_FI_STATUS_CONTA">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_FI_STATUS_CONTATextBox" Width="95%" runat="server" Text='<%# Bind("desc_FI_STATUS_CONTA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_FI_STATUS_CONTALabel" runat="server" Text='<%# Eval("desc_FI_STATUS_CONTA") %>'></asp:Label>
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
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [FI_STATUS_CONTA] WHERE [id_FI_STATUS_CONTA] = @id_FI_STATUS_CONTA" InsertCommand="INSERT INTO [FI_STATUS_CONTA] ([desc_FI_STATUS_CONTA]) VALUES (@desc_FI_STATUS_CONTA)" SelectCommand="SELECT [id_FI_STATUS_CONTA], [desc_FI_STATUS_CONTA] FROM [FI_STATUS_CONTA]" UpdateCommand="UPDATE [FI_STATUS_CONTA] SET [desc_FI_STATUS_CONTA] = @desc_FI_STATUS_CONTA WHERE [id_FI_STATUS_CONTA] = @id_FI_STATUS_CONTA">
        <DeleteParameters>
            <asp:Parameter Name="id_FI_STATUS_CONTA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_FI_STATUS_CONTA" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_FI_STATUS_CONTA" Type="String" />
            <asp:Parameter Name="id_FI_STATUS_CONTA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
