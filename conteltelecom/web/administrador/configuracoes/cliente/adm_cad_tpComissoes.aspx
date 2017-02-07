<%@ Page Title="TIPO DE COMISSÃO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="adm_cad_tpComissoes.aspx.vb" Inherits="conteltelecom.adm_cad_tpComissoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    
    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridCad_tpcomissoes" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadTpComissao" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCadTpComissao" DataKeyNames="id_ADM_TP_COMISSOES">
            <Columns>
                <telerik:GridBoundColumn DataField="id_ADM_TP_COMISSOES" DataType="System.Int32" FilterControlAltText="Filter id_ADM_TP_COMISSOES column" HeaderText="ID" ReadOnly="True" SortExpression="id_ADM_TP_COMISSOES" UniqueName="id_ADM_TP_COMISSOES">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_ADM_TP_COMISSOES" FilterControlAltText="Filter desc_ADM_TP_COMISSOES column" HeaderText="DESCRIÇÃO" SortExpression="desc_ADM_TP_COMISSOES" UniqueName="desc_ADM_TP_COMISSOES">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_ADM_TP_COMISSOESTextBox" runat="server" Text='<%# Bind("desc_ADM_TP_COMISSOES") %>' Width="95%"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatordesc_ADM_TP_COMISSOESTextBox" ControlToValidate="desc_ADM_TP_COMISSOESTextBox" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_ADM_TP_COMISSOESLabel" runat="server" Text='<%# Eval("desc_ADM_TP_COMISSOES") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_ADM_TP_COMISSOES" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_ADM_TP_COMISSOES column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_ADM_TP_COMISSOES">
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

    <asp:SqlDataSource ID="SqlDataSourceCadTpComissao" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [ADM_TP_COMISSOES] WHERE [id_ADM_TP_COMISSOES] = @id_ADM_TP_COMISSOES" InsertCommand="INSERT INTO ADM_TP_COMISSOES(desc_ADM_TP_COMISSOES, st_ADM_TP_COMISSOES, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@desc_ADM_TP_COMISSOES, @st_ADM_TP_COMISSOES, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" SelectCommand="SELECT id_ADM_TP_COMISSOES, desc_ADM_TP_COMISSOES, st_ADM_TP_COMISSOES FROM ADM_TP_COMISSOES" UpdateCommand="UPDATE ADM_TP_COMISSOES SET desc_ADM_TP_COMISSOES = @desc_ADM_TP_COMISSOES, st_ADM_TP_COMISSOES = @st_ADM_TP_COMISSOES, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_ADM_TP_COMISSOES = GETDATE() WHERE (id_ADM_TP_COMISSOES = @id_ADM_TP_COMISSOES)">
        <DeleteParameters>
            <asp:Parameter Name="id_ADM_TP_COMISSOES" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_ADM_TP_COMISSOES" Type="String" />
            <asp:Parameter Name="st_ADM_TP_COMISSOES" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
                    <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_ADM_TP_COMISSOES" Type="String" />
            <asp:Parameter Name="st_ADM_TP_COMISSOES" Type="Byte" />
            <asp:Parameter Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_ADM_TP_COMISSOES" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
