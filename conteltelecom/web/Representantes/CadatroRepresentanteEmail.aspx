<%@ Page Title="CADASTRO DE EMAIL DE REPRESENTANTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/web/Representantes/Representante.master" CodeBehind="CadatroRepresentanteEmail.aspx.vb" Inherits="conteltelecom.CadatroRepresentanteEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderRepresentanteHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderRepresentanteBody" runat="server">


    <div class="table-responsive">
        <telerik:RadGrid ID="RadGridEmail" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceEmail" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="-1" GridLines="Both">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_PS_EMAIL" DataSourceID="SqlDataSourceEmail">
            <Columns>

                <telerik:GridBoundColumn DataField="id_PS_EMAIL" DataType="System.Int32" FilterControlAltText="Filter id_PS_EMAIL column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_EMAIL" UniqueName="id_PS_EMAIL">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn DataField="email_PS_EMAIL" FilterControlAltText="Filter email_PS_EMAIL column" HeaderText="EMAIL" SortExpression="email_PS_EMAIL" UniqueName="email_PS_EMAIL">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="email_PS_EMAILTextBox" runat="server" Text='<%# Bind("email_PS_EMAIL") %>' Width="95%"></telerik:RadTextBox>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" SetFocusOnError="true" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#ff3300" ControlToValidate="email_PS_EMAILTextBox" ErrorMessage="*" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorRadMaskedemail_PS_EMAILTextBox" ControlToValidate="email_PS_EMAILTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="email_PS_EMAILLabel" runat="server" Text='<%# Eval("email_PS_EMAIL") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-12" />
                </telerik:GridTemplateColumn>

                <telerik:GridCheckBoxColumn DataField="st_PS_EMAIL" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_PS_EMAIL column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_PS_EMAIL">
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





    <asp:SqlDataSource ID="SqlDataSourceEmail" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [PS_EMAIL] WHERE [id_PS_EMAIL] = @id_PS_EMAIL" InsertCommand="INSERT INTO PS_EMAIL(email_PS_EMAIL, id_PS_PESSOA_alt, id_PS_PESSOA_inc, codTabela, id_PS_PESSOA, st_PS_EMAIL) VALUES (@email_PS_EMAIL, @id_PS_PESSOA_alt, @id_PS_PESSOA_inc, 'PS_REPRESENTANTE', @id_PS_PESSOA, @st_PS_EMAIL)" SelectCommand="SELECT id_PS_EMAIL, email_PS_EMAIL, id_PS_PESSOA, st_PS_EMAIL FROM PS_EMAIL WHERE (id_PS_PESSOA = @id_PS_PESSOA)" UpdateCommand="UPDATE PS_EMAIL SET email_PS_EMAIL = @email_PS_EMAIL, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, st_PS_EMAIL = @st_PS_EMAIL, dtAlt_PS_EMAIL = GETDATE() WHERE (id_PS_EMAIL = @id_PS_EMAIL)">
        <DeleteParameters>
            <asp:Parameter Name="id_PS_EMAIL" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email_PS_EMAIL" Type="String" />
             <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO"  Name="id_PS_PESSOA_inc" Type="Int32" />
           <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
            <asp:Parameter Name="st_PS_EMAIL" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_PS_PESSOA" QueryStringField="id_PS_PESSOA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="email_PS_EMAIL" Type="String" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="st_PS_EMAIL" />
            <asp:Parameter Name="id_PS_EMAIL" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
