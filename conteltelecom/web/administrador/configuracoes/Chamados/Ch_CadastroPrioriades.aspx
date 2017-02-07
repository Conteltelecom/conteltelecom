<%@ Page Title="PRIORIDADES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="Ch_CadastroPrioriades.aspx.vb" Inherits="conteltelecom.Ch_CadastroPrioriades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridPrioridades" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourcePrioridades" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CH_PRIORIDADE" DataSourceID="SqlDataSourcePrioridades">
            <Columns>
                <telerik:GridBoundColumn DataField="id_CH_PRIORIDADE" DataType="System.Int32" FilterControlAltText="Filter id_CH_PRIORIDADE column" HeaderText="ID" ReadOnly="True" SortExpression="id_CH_PRIORIDADE" UniqueName="id_CH_PRIORIDADE">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_CH_PRIORIDADE" FilterControlAltText="Filter desc_CH_PRIORIDADE column" HeaderText="DESCRIÇÃO" SortExpression="desc_CH_PRIORIDADE" UniqueName="desc_CH_PRIORIDADE">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_CH_PRIORIDADETextBox" runat="server" Width="95%" Text='<%# Bind("desc_CH_PRIORIDADE") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_PRIORIDADELabel" runat="server" Text='<%# Eval("desc_CH_PRIORIDADE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-10" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="vlPrioridade_CH_PRIORIDADE" FilterControlAltText="Filter vlPrioridade_CH_PRIORIDADE column" HeaderText="VALOR" UniqueName="vlPrioridade_CH_PRIORIDADE">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox NumberFormat-DecimalDigits="0" ID="vlPrioridade_CH_PRIORIDADETextBox" Width ="95%" runat="server" Text='<%# Bind("vlPrioridade_CH_PRIORIDADE") %>'></telerik:RadNumericTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vlPrioridade_CH_PRIORIDADELabel" runat="server" Text='<%# Eval("vlPrioridade_CH_PRIORIDADE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_CH_PRIORIDADE" DataType="System.Int16" FilterControlAltText="Filter st_CH_PRIORIDADE column" HeaderText="ST" UniqueName="st_CH_PRIORIDADE" DefaultInsertValue="1" StringFalseValue="0" StringTrueValue="1">
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
<div class="table-responsive">


<asp:SqlDataSource ID="SqlDataSourcePrioridades" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CH_PRIORIDADE] WHERE [id_CH_PRIORIDADE] = @id_CH_PRIORIDADE" InsertCommand="INSERT INTO CH_PRIORIDADE(desc_CH_PRIORIDADE, st_CH_PRIORIDADE, id_PS_PESSOA_alt, id_PS_PESSOA_inc, vlPrioridade_CH_PRIORIDADE) VALUES (@desc_CH_PRIORIDADE, @st_CH_PRIORIDADE, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @vlPrioridade_CH_PRIORIDADE)" SelectCommand="SELECT id_CH_PRIORIDADE, desc_CH_PRIORIDADE, st_CH_PRIORIDADE, vlPrioridade_CH_PRIORIDADE FROM CH_PRIORIDADE" UpdateCommand="UPDATE CH_PRIORIDADE SET desc_CH_PRIORIDADE = @desc_CH_PRIORIDADE, st_CH_PRIORIDADE = @st_CH_PRIORIDADE, dtAlt_CH_PRIORIDADE = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, vlPrioridade_CH_PRIORIDADE = @vlPrioridade_CH_PRIORIDADE WHERE (id_CH_PRIORIDADE = @id_CH_PRIORIDADE)">
    <DeleteParameters>
        <asp:Parameter Name="id_CH_PRIORIDADE" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="desc_CH_PRIORIDADE" Type="String" />
        <asp:Parameter Name="st_CH_PRIORIDADE" Type="Byte" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
          <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        <asp:Parameter Name="vlPrioridade_CH_PRIORIDADE" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="desc_CH_PRIORIDADE" Type="String" />
        <asp:Parameter Name="st_CH_PRIORIDADE" Type="Byte" />
                  <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        <asp:Parameter Name="vlPrioridade_CH_PRIORIDADE" />
        <asp:Parameter Name="id_CH_PRIORIDADE" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
