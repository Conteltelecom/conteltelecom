<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastraStatusFatura.aspx.vb" Inherits="conteltelecom.CadastraStatusFatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridStatusFatura" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceStatusFatura" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_AN_STATUS" DataSourceID="SqlDataSourceStatusFatura">
            <Columns>
                <telerik:GridBoundColumn DataField="id_AN_STATUS" DataType="System.Int32" FilterControlAltText="Filter id_AN_STATUS column" HeaderText="ID" ReadOnly="True" SortExpression="id_AN_STATUS" UniqueName="id_AN_STATUS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_AN_STATUS" FilterControlAltText="Filter desc_AN_STATUS column" HeaderText="DESCRIÇÃO" SortExpression="desc_AN_STATUS" UniqueName="desc_AN_STATUS">
                    <EditItemTemplate>
                        <telerik:RadTextBox  ID="desc_AN_STATUSTextBox" Width="95%" runat="server" Text='<%# Bind("desc_AN_STATUS") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_AN_STATUSLabel" runat="server" Text='<%# Eval("desc_AN_STATUS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-10" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="corFonte_AN_STATUS" FilterControlAltText="Filter corFonte_AN_STATUS column" HeaderText="COR FONTE" SortExpression="corFonte_AN_STATUS" UniqueName="corFonte_AN_STATUS">
                    <EditItemTemplate>
                        <telerik:RadColorPicker ID="RadColorPickerCor" Preset="Grayscale"  Width="100px" EnableCustomColor="true" ShowRecentColors="true" ShowEmptyColor="false" PreviewColor="false" CssClass="RemoveBorder" SelectedColor="#000000" runat="server"></telerik:RadColorPicker>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="corFonte_AN_STATUSLabel" runat="server"    Text='<%# Eval("corFonte_AN_STATUS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="strikeout_AN_STATUS" DataType="System.Int16" DefaultInsertValue="0" FilterControlAltText="Filter strikeout_AN_STATUS column" HeaderText="RISCADO" StringFalseValue="0" StringTrueValue="1" UniqueName="strikeout_AN_STATUS">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="st_AN_STATUS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_AN_STATUS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_AN_STATUS">
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

    <asp:SqlDataSource ID="SqlDataSourceStatusFatura" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [AN_STATUS] WHERE [id_AN_STATUS] = @id_AN_STATUS" InsertCommand="INSERT INTO AN_STATUS(desc_AN_STATUS, id_PS_PESSOA_alt, id_PS_PESSOA_inc, st_AN_STATUS, corFonte_AN_STATUS, strikeout_AN_STATUS) VALUES (@desc_AN_STATUS, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @st_AN_STATUS, @corFonte_AN_STATUS, @strikeout_AN_STATUS)" SelectCommand="SELECT id_AN_STATUS, desc_AN_STATUS, st_AN_STATUS, corFonte_AN_STATUS, strikeout_AN_STATUS FROM AN_STATUS" UpdateCommand="UPDATE AN_STATUS SET desc_AN_STATUS = @desc_AN_STATUS, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_AN_STATUS = GETDATE(), st_AN_STATUS = @st_AN_STATUS, corFonte_AN_STATUS = @corFonte_AN_STATUS, strikeout_AN_STATUS = @strikeout_AN_STATUS WHERE (id_AN_STATUS = @id_AN_STATUS)">
        <DeleteParameters>
            <asp:Parameter Name="id_AN_STATUS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_AN_STATUS" Type="String" />
           <asp:SessionParameter  SessionField="id_PS_PESSOA_USUARIO"  Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter  SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="st_AN_STATUS" Type="Byte" />
            <asp:Parameter Name="corFonte_AN_STATUS" Type="String" />
            <asp:Parameter Name="strikeout_AN_STATUS" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_AN_STATUS" Type="String" />
           <asp:SessionParameter  SessionField="id_PS_PESSOA_USUARIO"  Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="st_AN_STATUS" Type="Byte" />
            <asp:Parameter Name="corFonte_AN_STATUS" Type="String" />
            <asp:Parameter Name="strikeout_AN_STATUS" Type="Byte" />
            <asp:Parameter Name="id_AN_STATUS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
