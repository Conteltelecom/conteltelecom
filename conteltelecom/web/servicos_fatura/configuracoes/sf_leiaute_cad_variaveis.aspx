<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_leiaute_cad_variaveis.aspx.vb" Inherits="conteltelecom.sf_leiaute_cad_variaveis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadVariaveis" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadVariaveis" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView DataKeyNames="id_SF_VARIAVEIS" DataSourceID="SqlDataSourceCadVariaveis">
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_VARIAVEIS" DataType="System.Int32" FilterControlAltText="Filter id_SF_VARIAVEIS column" HeaderText="id_SF_VARIAVEIS" ReadOnly="True" SortExpression="id_SF_VARIAVEIS" UniqueName="id_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_SF_VARIAVEIS" FilterControlAltText="Filter desc_SF_VARIAVEIS column" HeaderText="desc_SF_VARIAVEIS" SortExpression="desc_SF_VARIAVEIS" UniqueName="desc_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="st_SF_VARIAVEIS" DataType="System.Byte" FilterControlAltText="Filter st_SF_VARIAVEIS column" HeaderText="st_SF_VARIAVEIS" SortExpression="st_SF_VARIAVEIS" UniqueName="st_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tamanho_SF_VARIAVEIS" DataType="System.Int32" FilterControlAltText="Filter tamanho_SF_VARIAVEIS column" HeaderText="tamanho_SF_VARIAVEIS" SortExpression="tamanho_SF_VARIAVEIS" UniqueName="tamanho_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="posIni_SF_VARIAVEIS" DataType="System.Int32" FilterControlAltText="Filter posIni_SF_VARIAVEIS column" HeaderText="posIni_SF_VARIAVEIS" SortExpression="posIni_SF_VARIAVEIS" UniqueName="posIni_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="posFim_SF_VARIAVEIS" DataType="System.Int32" FilterControlAltText="Filter posFim_SF_VARIAVEIS column" HeaderText="posFim_SF_VARIAVEIS" SortExpression="posFim_SF_VARIAVEIS" UniqueName="posFim_SF_VARIAVEIS">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceCadVariaveis" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM [SF_VARIAVEIS] WHERE [id_SF_VARIAVEIS] = @id_SF_VARIAVEIS" InsertCommand="INSERT INTO [SF_VARIAVEIS] ([id_SF_VARIAVEIS], [desc_SF_VARIAVEIS], [st_SF_VARIAVEIS], [tamanho_SF_VARIAVEIS], [posIni_SF_VARIAVEIS], [posFim_SF_VARIAVEIS]) VALUES (@id_SF_VARIAVEIS, @desc_SF_VARIAVEIS, @st_SF_VARIAVEIS, @tamanho_SF_VARIAVEIS, @posIni_SF_VARIAVEIS, @posFim_SF_VARIAVEIS)" SelectCommand="SELECT [id_SF_VARIAVEIS], [desc_SF_VARIAVEIS], [st_SF_VARIAVEIS], [tamanho_SF_VARIAVEIS], [posIni_SF_VARIAVEIS], [posFim_SF_VARIAVEIS] FROM [SF_VARIAVEIS]" UpdateCommand="UPDATE [SF_VARIAVEIS] SET [desc_SF_VARIAVEIS] = @desc_SF_VARIAVEIS, [st_SF_VARIAVEIS] = @st_SF_VARIAVEIS, [tamanho_SF_VARIAVEIS] = @tamanho_SF_VARIAVEIS, [posIni_SF_VARIAVEIS] = @posIni_SF_VARIAVEIS, [posFim_SF_VARIAVEIS] = @posFim_SF_VARIAVEIS WHERE [id_SF_VARIAVEIS] = @id_SF_VARIAVEIS">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_VARIAVEIS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="desc_SF_VARIAVEIS" Type="String" />
            <asp:Parameter Name="st_SF_VARIAVEIS" Type="Byte" />
            <asp:Parameter Name="tamanho_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="posIni_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="posFim_SF_VARIAVEIS" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_VARIAVEIS" Type="String" />
            <asp:Parameter Name="st_SF_VARIAVEIS" Type="Byte" />
            <asp:Parameter Name="tamanho_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="posIni_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="posFim_SF_VARIAVEIS" Type="Int32" />
            <asp:Parameter Name="id_SF_VARIAVEIS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
