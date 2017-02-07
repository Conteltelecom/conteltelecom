<%@ Page Title="STATUS DO CHAMADO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="CadastroStatusChamado.aspx.vb" Inherits="conteltelecom.CadastroStatusChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <div class="table-responsive">  
    <telerik:RadGrid ID="RadGridCadastroStatusChamado" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceStatusChamado">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_CH_STATUS" DataSourceID="SqlDataSourceStatusChamado">
            <Columns>

                <telerik:GridBoundColumn DataField="id_CH_STATUS" DataType="System.Int32" FilterControlAltText="Filter id_CH_STATUS column" HeaderText="ID" ReadOnly="True" SortExpression="id_CH_STATUS" UniqueName="id_CH_STATUS">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn DataField="desc_CH_STATUS" FilterControlAltText="Filter desc_CH_STATUS column" HeaderText="DESCRIÇÃO" SortExpression="desc_CH_STATUS" UniqueName="desc_CH_STATUS">
                    <EditItemTemplate>
                        <telerik:RadTextBox  ID="desc_CH_STATUSTextBox" Width="95%" runat="server" Text='<%# Bind("desc_CH_STATUS") %>'></telerik:RadTextBox>
                         <asp:RequiredFieldValidator ID="Rq_desc_CH_STATUSTextBox" ControlToValidate="desc_CH_STATUSTextBox" ErrorMessage="*" ToolTip="COMPO OBRIGATÓRIO" Display="Dynamic" runat="server" ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_CH_STATUSLabel" runat="server" Text='<%# Eval("desc_CH_STATUS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridTemplateColumn>


                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="MENSAGEM" UniqueName="TemplateColumn">
                    <EditItemTemplate>

                        <telerik:RadDropDownList Width="95%" ID="RadDropDownList1" runat="server" DataSourceID="SqlDataSourceTeste" DataTextField="titulo_CH_MENSAGENS" DataValueField="id_CH_MENSAGENS" SelectedValue='<%# Bind("id_CH_MENSAGENS") %>'>
                        </telerik:RadDropDownList>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="titulo_CH_MENSAGENSLabel" runat="server" Text='<%# Eval("titulo_CH_MENSAGENS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>


                <telerik:GridTemplateColumn DataField="vl_CH_STATUS" DataType="System.Int32" FilterControlAltText="Filter vl_CH_STATUS column" HeaderText="ORDEM" SortExpression="vl_CH_STATUS" UniqueName="vl_CH_STATUS">
                    <EditItemTemplate>
                        <telerik:RadNumericTextBox NumberFormat-DecimalDigits="0" Width="95%"  ID="vl_CH_STATUSTextBox" runat="server" Text='<%# Bind("vl_CH_STATUS") %>'></telerik:RadNumericTextBox>
                     <asp:RequiredFieldValidator ID="Rq_vl_CH_STATUSTextBox" ControlToValidate="desc_CH_STATUSTextBox" ErrorMessage="*" ToolTip="COMPO OBRIGATÓRIO" Display="Dynamic" runat="server" ForeColor="Red" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vl_CH_STATUSLabel" runat="server" Text='<%# Eval("vl_CH_STATUS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridCheckBoxColumn DataField="st_CH_STATUS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_CH_STATUS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_CH_STATUS">
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

    <asp:SqlDataSource ID="SqlDataSourceStatusChamado" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [CH_STATUS] WHERE [id_CH_STATUS] = @id_CH_STATUS" InsertCommand="INSERT INTO CH_STATUS(desc_CH_STATUS, st_CH_STATUS, id_PS_PESSOA_alt, id_PS_PESSOA_inc, vl_CH_STATUS, id_CH_MENSAGENS) VALUES (@desc_CH_STATUS, @st_CH_STATUS, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, @vl_CH_STATUS, @id_CH_MENSAGENS)" SelectCommand="SELECT CH_STATUS.id_CH_STATUS, CH_STATUS.desc_CH_STATUS, CH_STATUS.st_CH_STATUS, CH_STATUS.vl_CH_STATUS, CH_STATUS.id_CH_MENSAGENS, CH_MENSAGENS.titulo_CH_MENSAGENS FROM CH_STATUS INNER JOIN CH_MENSAGENS ON CH_STATUS.id_CH_MENSAGENS = CH_MENSAGENS.id_CH_MENSAGENS" UpdateCommand="UPDATE CH_STATUS SET desc_CH_STATUS = @desc_CH_STATUS, st_CH_STATUS = @st_CH_STATUS, dtAlt_CH_STATUS = GETDATE(), id_PS_PESSOA_alt = @id_PS_PESSOA_alt, vl_CH_STATUS = @vl_CH_STATUS, id_CH_MENSAGENS = @id_CH_MENSAGENS WHERE (id_CH_STATUS = @id_CH_STATUS)">
        <DeleteParameters>
            <asp:Parameter Name="id_CH_STATUS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_CH_STATUS" Type="String" />
            <asp:Parameter Name="st_CH_STATUS" Type="Byte" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:Parameter Name="vl_CH_STATUS" Type="Int32" />
            <asp:Parameter Name="id_CH_MENSAGENS" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_CH_STATUS" Type="String" />
            <asp:Parameter Name="st_CH_STATUS" Type="Byte" />
         <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="vl_CH_STATUS" Type="Int32" />
            <asp:Parameter Name="id_CH_MENSAGENS" Type="Int32" />
            <asp:Parameter Name="id_CH_STATUS" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTeste" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT [titulo_CH_MENSAGENS], [id_CH_MENSAGENS] FROM [CH_MENSAGENS] WHERE ([st_CH_MENSAGENS] = @st_CH_MENSAGENS)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="st_CH_MENSAGENS" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
   
</asp:Content>
