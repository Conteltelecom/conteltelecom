<%@ Page Title="USUÁRIOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_usuarios.aspx.vb" Inherits="conteltelecom.cad_usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadUseuarios"  runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCriaUsuarios" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" >
<GroupingSettings CollapseAllTooltip="Collapse all groups" CollapseTooltip="Recolher grupo"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView Name="Master" DataSourceID="SqlDataSourceCriaUsuarios" DataKeyNames="id_USUARIOS" EditMode="InPlace" CommandItemDisplay="Top" >
         <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO"  ShowRefreshButton ="false"  ShowPrintButton="true"/>
            <Columns>
                <telerik:GridTemplateColumn DataField="id_USUARIOS" FilterControlAltText="Filter id_USUARIOS column" HeaderText="ID" UniqueName="id_USUARIOS">
                    <EditItemTemplate>
                         <asp:Label ID="id_USUARIOSLabelEdit" runat="server" Text='<%# Eval("id_USUARIOS") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_USUARIOSLabel" runat="server" Text='<%# Eval("id_USUARIOS") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_PS_PESSOA" FilterControlAltText="Filter id_PS_PESSOA column" HeaderText="NOME" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
                    <EditItemTemplate>
                        <asp:Label ID="Labeldesc_PS_PESSOA" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>'></asp:Label>
                        <telerik:RadAutoCompleteBox TextSettings-SelectionMode="Single" DataValueField="id_PS_PESSOA"  ID="RadAutoCompleteBoxBuscaContato" runat="server"   Width="95%" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaPessoasEmpresa" DataTextField="desc_PS_PESSOA" InputType="Text" Skin="Bootstrap" DropDownHeight="150px" HighlightFirstMatch="False"></telerik:RadAutoCompleteBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_PS_PESSOALabel" runat="server" Text='<%# Eval("id_PS_PESSOA") %>' ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="username_USUARIOS" FilterControlAltText="Filter username_USUARIOS column" HeaderText="LOGIN" SortExpression="username_USUARIOS" UniqueName="username_USUARIOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="username_USUARIOSTextBox" runat="server" Text='<%# Bind("username_USUARIOS") %>' Width="95%" LabelWidth="40%" Resize="None"></telerik:RadTextBox>
                      </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="username_USUARIOSLabel" runat="server" Text='<%# Eval("username_USUARIOS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="password_USUARIOS" DefaultInsertValue="******" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="SENHA" SortExpression="password_USUARIOS" UniqueName="password_USUARIOS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="password_USUARIOSTextBox" runat="server"  Text='<%# Bind("password_USUARIOS") %>' TextMode="Password"  Width="95%" LabelWidth="40%" Resize="None" type="password" ></telerik:RadTextBox>
                       <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="password_USUARIOSTextBox" ValidationExpression="^.*(?=.{5,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$" ErrorMessage= "No mínimo 8 caracteres com pelo menos uma letra, um número e um caractere especial." ForeColor="Red" Display="Dynamic"  />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_PS_PESSOALabel" runat="server" Text="***************"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="id_PS_PERMISSAO" DefaultInsertValue="1" FilterControlAltText="Filter id_PS_PERMISSAO column" HeaderText="PERMISSÃO" UniqueName="id_PS_PERMISSAO">
                        <ItemTemplate>
                            <asp:Label ID="Labelid_PS_PERMISSAO" runat="server" Text='<%# Eval("decs_PS_PERMISSAO") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList Width="95%" ID="RadDropDownListdecs_PS_PERMISSAO" runat="server" DataSourceID="SqlDataSourcePS_PERMISSAO" DataTextField="decs_PS_PERMISSAO" DataValueField="id_PS_PERMISSAO" DropDownHeight="150px" SelectedValue='<%# Bind("id_PS_PERMISSAO") %>'></telerik:RadDropDownList>
                           
                        </EditItemTemplate>
                        <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" HeaderText="SETORES" UniqueName="TemplateColumn">
                  <ItemTemplate>
                      <telerik:RadButton ID="RadButtonDetalhesFilho" ButtonType="LinkButton"   NavigateUrl='<%# String.Format("~/web/administrador/configuracoes/Usuario/CadastroSetorUsuario.aspx?id_USUARIOS={0}", Eval("id_USUARIOS")) %>' runat="server" Text="SETORES">
                                              <Icon PrimaryIconUrl ="../../../img/page_process_32.png" />
                                          </telerik:RadButton>
                    
                  </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_USUARIOS" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_USUARIOS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_USUARIOS">
                </telerik:GridCheckBoxColumn>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton">
                 </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                 </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManagerMsg" runat="server"></telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSourceCriaUsuarios" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT USUARIOS.id_PS_PESSOA, USUARIOS.username_USUARIOS, USUARIOS.password_USUARIOS, USUARIOS.dtBloqueio_USUARIOS, USUARIOS.st_USUARIOS, USUARIOS.idEmpresa_PS_PESSOA, CAST(PS_PESSOA.id_PS_PESSOA AS VARCHAR(11)) + ' -' + PS_PESSOA.desc_PS_PESSOA AS desc_PS_PESSOA, PS_PESSOA.email_PS_PESSOA, PS_PERMISSAO.decs_PS_PERMISSAO, PS_PERMISSAO.id_PS_PERMISSAO, USUARIOS.id_USUARIOS, USUARIOS.atendeChamado_USUARIOS FROM USUARIOS INNER JOIN PS_PESSOA ON USUARIOS.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA INNER JOIN PS_PERMISSAO ON USUARIOS.id_PS_PERMISSAO = PS_PERMISSAO.id_PS_PERMISSAO WHERE (USUARIOS.idEmpresa_PS_PESSOA = @codMatriz_PS_CLIENTES)" InsertCommand="INSERT INTO USUARIOS(id_PS_PESSOA, username_USUARIOS, password_USUARIOS, autencicacaoAD_USUARIOS, idEmpresa_PS_PESSOA, id_PS_PERMISSAO, atendeChamado_USUARIOS) VALUES (@id_PS_PESSOA, @username_USUARIOS, PWDENCRYPT(@password_USUARIOS), 0, @idEmpresa_PS_PESSOA, @id_PS_PERMISSAO, @atendeChamado_USUARIOS)">
        <InsertParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="username_USUARIOS" />
            <asp:Parameter Name="password_USUARIOS" />
            <asp:QueryStringParameter Name="idEmpresa_PS_PESSOA" QueryStringField="codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="id_PS_PERMISSAO" />
            <asp:Parameter Name="atendeChamado_USUARIOS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaPessoasEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT CAST(PS_PESSOA.id_PS_PESSOA AS VARCHAR(11)) + ' -' + PS_PESSOA.desc_PS_PESSOA AS desc_PS_PESSOA, PS_PESSOA.id_PS_PESSOA FROM CL_CONTATOS INNER JOIN PS_PESSOA ON CL_CONTATOS.idContato_id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA INNER JOIN PS_CLIENTES ON CL_CONTATOS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (CL_CONTATOS.st_CL_CONTATOS = 1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourcePS_PERMISSAO" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT decs_PS_PERMISSAO, id_PS_PERMISSAO FROM View_DropDown_PS_PERMISSAO"></asp:SqlDataSource>
</asp:Content>
