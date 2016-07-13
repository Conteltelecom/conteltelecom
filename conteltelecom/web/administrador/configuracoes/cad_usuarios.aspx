<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_usuarios.aspx.vb" Inherits="conteltelecom.cad_usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadUseuarios" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCriaUsuarios" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataSourceID="SqlDataSourceCriaUsuarios" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" EditMode="InPlace" CommandItemDisplay="Top" >
         <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO"  ShowRefreshButton ="false"  ShowPrintButton="true"/>
            <Columns>
                <telerik:GridTemplateColumn DataField="desc_PS_PESSOA" DataType="System.Int32" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="NOME" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                    <EditItemTemplate>
                        <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxBuscaContato" runat="server" Width="95%" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaPessoasEmpresa" DataTextField="desc_PS_PESSOA" DataValueField="id_PS_PESSOA" InputType="Text" Skin="Bootstrap"></telerik:RadAutoCompleteBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_PS_PESSOALabel" runat="server" Text='<%# Eval("id_PS_PESSOA") %>' ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="username_USUARIOS" FilterControlAltText="Filter username_USUARIOS column" HeaderText="LOGIN" SortExpression="username_USUARIOS" UniqueName="username_USUARIOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="username_USUARIOSTextBox" runat="server" Text='<%# Bind("username_USUARIOS") %>' Width="95%"></telerik:RadTextBox>
                      </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="username_USUARIOSLabel" runat="server" Text='<%# Eval("username_USUARIOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="password_USUARIOS" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="SENHA" SortExpression="password_USUARIOS" UniqueName="password_USUARIOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_PS_PESSOATextBox" runat="server"  Text="********" TextMode="Password"  Width="95%" ></telerik:RadTextBox>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_PESSOALabel" runat="server" Text="***************"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_USUARIOS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_USUARIOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_USUARIOS">
                </telerik:GridCheckBoxColumn>
                 <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceCriaUsuarios" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT USUARIOS.id_PS_PESSOA, USUARIOS.username_USUARIOS, USUARIOS.password_USUARIOS, USUARIOS.dtBloqueio_USUARIOS, USUARIOS.st_USUARIOS, USUARIOS.idEmpresa_PS_PESSOA, CAST(PS_PESSOA.id_PS_PESSOA AS VARCHAR(11)) + ' -' + PS_PESSOA.desc_PS_PESSOA AS desc_PS_PESSOA, PS_PESSOA.email_PS_PESSOA FROM USUARIOS INNER JOIN PS_PESSOA ON USUARIOS.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (USUARIOS.idEmpresa_PS_PESSOA = 1)" InsertCommand="INSERT INTO USUARIOS(id_PS_PESSOA, username_USUARIOS, password_USUARIOS, autencicacaoAD_USUARIOS, idEmpresa_PS_PESSOA) VALUES (@id_PS_PESSOA, @username_USUARIOS, PWDENCRYPT(@password_USUARIOS), 1, 1)" UpdateCommand="UPDATE USUARIOS SET username_USUARIOS = @username_USUARIOS, id_PS_PESSOA = @id_PS_PESSOA, password_USUARIOS = PWDENCRYPT(@password_USUARIOS), autencicacaoAD_USUARIOS = @autencicacaoAD_USUARIOS WHERE (id_USUARIOS = @id_USUARIOS)">
        <InsertParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="username_USUARIOS" />
            <asp:Parameter Name="password_USUARIOS" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username_USUARIOS" />
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="password_USUARIOS" />
            <asp:Parameter Name="autencicacaoAD_USUARIOS" />
            <asp:Parameter Name="id_USUARIOS" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaPessoasEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT CAST(PS_PESSOA.id_PS_PESSOA AS VARCHAR(11)) + ' -' + PS_PESSOA.desc_PS_PESSOA AS desc_PS_PESSOA, PS_PESSOA.id_PS_PESSOA FROM CL_CONTATOS INNER JOIN PS_PESSOA ON CL_CONTATOS.idContato_id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA WHERE (CL_CONTATOS.id_PS_CLIENTES = 1)">
    </asp:SqlDataSource>

</asp:Content>
