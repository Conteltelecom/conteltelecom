<%@ Page Title="TIPO DE TELEFONE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadTipoTelefone.aspx.vb" Inherits="conteltelecom.CadTipoTelefone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">  
    <telerik:RadGrid ID="RadGridCadTipoTelefone" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadTipoTelefone">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_ADM_TP_TELEFONE" DataSourceID="SqlDataSourceCadTipoTelefone">
            <Columns>
                <telerik:GridBoundColumn DataField="id_ADM_TP_TELEFONE" DataType="System.Int32" FilterControlAltText="Filter id_ADM_TP_TELEFONE column" HeaderText="ID" ReadOnly="True" SortExpression="id_ADM_TP_TELEFONE" UniqueName="id_ADM_TP_TELEFONE">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_ADM_TP_TELEFONE" FilterControlAltText="Filter desc_ADM_TP_TELEFONE column" HeaderText="DESCRIÇÃO" SortExpression="desc_ADM_TP_TELEFONE" UniqueName="desc_ADM_TP_TELEFONE">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_ADM_TP_TELEFONETextBox"  runat="server" Text='<%# Bind("desc_ADM_TP_TELEFONE") %>'></telerik:RadTextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatordesc_ADM_TP_TELEFONETextBox" ControlToValidate="desc_ADM_TP_TELEFONETextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_ADM_TP_TELEFONELabel" runat="server" Width="95%" Text='<%# Eval("desc_ADM_TP_TELEFONE") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_ADM_TP_TELEFONE" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_ADM_TP_TELEFONE column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_ADM_TP_TELEFONE">
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridEditCommandColumn>
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir" CommandName="Delete" ButtonType="ImageButton" >
                </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
    </div> <!-- fim responsive-table -->

    <asp:SqlDataSource ID="SqlDataSourceCadTipoTelefone" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [ADM_TP_TELEFONE] WHERE [id_ADM_TP_TELEFONE] = @id_ADM_TP_TELEFONE" InsertCommand="INSERT INTO ADM_TP_TELEFONE(desc_ADM_TP_TELEFONE, st_ADM_TP_TELEFONE, id_PS_PESSOA_alt, id_PS_PESSOA_inc) VALUES (@desc_ADM_TP_TELEFONE, @st_ADM_TP_TELEFONE, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc)" SelectCommand="SELECT id_ADM_TP_TELEFONE, desc_ADM_TP_TELEFONE, st_ADM_TP_TELEFONE FROM ADM_TP_TELEFONE" UpdateCommand="UPDATE ADM_TP_TELEFONE SET desc_ADM_TP_TELEFONE = @desc_ADM_TP_TELEFONE, st_ADM_TP_TELEFONE = @st_ADM_TP_TELEFONE, dtAlt_ADM_TP_TELEFONE = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt WHERE (id_ADM_TP_TELEFONE = @id_ADM_TP_TELEFONE)">
        <DeleteParameters>
            <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_ADM_TP_TELEFONE" Type="String" />
            <asp:Parameter Name="st_ADM_TP_TELEFONE" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_ADM_TP_TELEFONE" Type="String" />
            <asp:Parameter Name="st_ADM_TP_TELEFONE" Type="Byte" />
             <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="id_ADM_TP_TELEFONE" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
