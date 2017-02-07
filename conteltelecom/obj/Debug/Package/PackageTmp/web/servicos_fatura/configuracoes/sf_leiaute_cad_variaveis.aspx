<%@ Page Title="VARIÁVEIS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_leiaute_cad_variaveis.aspx.vb" Inherits="conteltelecom.sf_leiaute_cad_variaveis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridCadVariaveis" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadVariaveis" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_CAD_VARIAVEL" DataSourceID="SqlDataSourceCadVariaveis">
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_CAD_VARIAVEL" FilterControlAltText="Filter id_SF_CAD_VARIAVEL column" HeaderText="ID" SortExpression="id_SF_CAD_VARIAVEL" UniqueName="id_SF_CAD_VARIAVEL" DataType="System.Int32" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_SF_CAD_VARIAVEL" FilterControlAltText="Filter desc_SF_CAD_VARIAVEL column" HeaderText="DESCRIÇÃO DA VARIAVEL" SortExpression="desc_SF_CAD_VARIAVEL" UniqueName="desc_SF_CAD_VARIAVEL">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_SF_CAD_VARIAVELTextBox"  Width="95%" runat="server" Text='<%# Bind("desc_SF_CAD_VARIAVEL") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_SF_CAD_VARIAVELLabel" runat="server" Text='<%# Eval("desc_SF_CAD_VARIAVEL") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_CAD_VARIAVEL column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_CAD_VARIAVEL" DataField="st_SF_CAD_VARIAVEL">
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
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSourceCadVariaveis" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM SF_CAD_VARIAVEL WHERE (id_SF_CAD_VARIAVEL = @id_SF_CAD_VARIAVEL)" InsertCommand="INSERT INTO SF_CAD_VARIAVEL(desc_SF_CAD_VARIAVEL, st_SF_CAD_VARIAVEL, id_PS_PESSOA_inc, id_PS_PESSOA_alt) VALUES (@desc_SF_CAD_VARIAVEL, @st_SF_CAD_VARIAVEL, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt)" SelectCommand="SELECT desc_SF_CAD_VARIAVEL, id_SF_CAD_VARIAVEL, st_SF_CAD_VARIAVEL FROM SF_CAD_VARIAVEL" UpdateCommand="UPDATE SF_CAD_VARIAVEL SET desc_SF_CAD_VARIAVEL = @desc_SF_CAD_VARIAVEL, st_SF_CAD_VARIAVEL = @st_SF_CAD_VARIAVEL, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_SF_CAD_VARIAVEL = GETDATE() WHERE (id_SF_CAD_VARIAVEL = @id_SF_CAD_VARIAVEL)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_CAD_VARIAVEL" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_CAD_VARIAVEL" />
            <asp:Parameter Name="st_SF_CAD_VARIAVEL" />
                    <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
                <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_CAD_VARIAVEL" />
            <asp:Parameter Name="st_SF_CAD_VARIAVEL" />
   <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_SF_CAD_VARIAVEL" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
