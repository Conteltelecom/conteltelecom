<%@ Page Title="LEIAUTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_cad_leiaute_detalhes.aspx.vb" Inherits="conteltelecom.sf_cad_leiaute_detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGri_dsf_cad_leiaute" runat="server"  AutoGenerateColumns="False"  Culture="pt-BR" DataSourceID="SqlDataSource_sf_cad_leiaute" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" >

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_LEIAUTE_VARIAVEL"  DataSourceID="SqlDataSource_sf_cad_leiaute">
   
                        <DetailTables>
                            <telerik:GridTableView runat="server" DataSourceID="SqlDataSourceFilhas" DataKeyNames="id_SF_LEIAUTE_VARIAVEL_EXP">
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="id_SF_LEIAUTE_VARIAVEL" MasterKeyField="id_SF_LEIAUTE_VARIAVEL" />
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id_SF_LEIAUTE_VARIAVEL_EXP" FilterControlAltText="Filter id_SF_LEIAUTE_VARIAVEL_EXP column" HeaderText="ID" UniqueName="id_SF_LEIAUTE_VARIAVEL_EXP" ReadOnly="True">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn DataField="stringPre_SF_LEIAUTE_VARIAVEL_EXP" FilterControlAltText="Filter stringPre_SF_LEIAUTE_VARIAVEL_EXP column" HeaderText="PRÉ TEXTO" UniqueName="stringPre_SF_LEIAUTE_VARIAVEL_EXP">
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="stringPre_SF_LEIAUTE_VARIAVEL_EXPTextBox" runat="server" Text='<%# Bind("stringPre_SF_LEIAUTE_VARIAVEL_EXP") %>'></telerik:RadTextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="stringPre_SF_LEIAUTE_VARIAVEL_EXPLabel" runat="server" Text='<%# Eval("stringPre_SF_LEIAUTE_VARIAVEL_EXP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="col-xs-3" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="regex_SF_LEIAUTE_VARIAVEL_EXP" FilterControlAltText="Filter stringPre_SF_LEIAUTE_VARIAVEL_EXP column" HeaderText="EXPRESSÃO REGULAR" UniqueName="regex_SF_LEIAUTE_VARIAVEL_EXP">
                                        <EditItemTemplate>
                                           <telerik:RadTextBox ID="regex_SF_LEIAUTE_VARIAVEL_EXPTextBox" runat="server" Text='<%# Bind("regex_SF_LEIAUTE_VARIAVEL_EXP") %>' Width="95%"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="regex_SF_LEIAUTE_VARIAVEL_EXPLabel" runat="server" Text='<%# Eval("regex_SF_LEIAUTE_VARIAVEL_EXP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="col-xs-6" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="stringPos_SF_LEIAUTE_VARIAVEL_EXP" FilterControlAltText="Filter stringPos_SF_LEIAUTE_VARIAVEL_EXP column" HeaderText="PÓS" UniqueName="stringPos_SF_LEIAUTE_VARIAVEL_EXP">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="stringPos_SF_LEIAUTE_VARIAVEL_EXPTextBox" runat="server" Text='<%# Bind("stringPos_SF_LEIAUTE_VARIAVEL_EXP") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="stringPos_SF_LEIAUTE_VARIAVEL_EXPLabel" runat="server" Text='<%# Eval("stringPos_SF_LEIAUTE_VARIAVEL_EXP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="col-xs-3" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridCheckBoxColumn DataField="st_SF_LEIAUTE_VARIAVEL_EXP" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_LEIAUTE_VARIAVEL_EXP column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_LEIAUTE_VARIAVEL_EXP">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridEditCommandColumn>
                                    </telerik:GridEditCommandColumn>
                                    <telerik:GridButtonColumn FilterControlAltText="Filter Excluir column" UniqueName="Excluir">
                                    </telerik:GridButtonColumn>
                                </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
                            </telerik:GridTableView>
                        </DetailTables>
   
                        <Columns>
                <telerik:GridBoundColumn DataField="id_SF_LEIAUTE_VARIAVEL" DataType="System.Int32" FilterControlAltText="Filter id_SF_LEIAUTE_VARIAVEL column" HeaderText="ID" ReadOnly="True"  SortExpression="id_SF_LEIAUTE_VARIAVEL" UniqueName="id_SF_LEIAUTE_VARIAVEL">
                </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="desc_SF_LEIAUTE_VARIAVEL" FilterControlAltText="Filter desc_SF_LEIAUTE_VARIAVEL column" HeaderText="NOME VARIÁVEL" SortExpression="id_SF_CAD_VARIAVE" UniqueName="id_SF_CAD_VARIAVE">
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="RadDropDownListCadVariaveis" Width="95%" runat="server" DataSourceID="SqlDataSourceCadVariaveis" DataTextField="desc_SF_CAD_VARIAVEL" DataValueField="id_SF_CAD_VARIAVEL" DropDownHeight="150px" SelectedValue='<%# Bind("id_SF_CAD_VARIAVEL") %>'></telerik:RadDropDownList>
                                                                     
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="desc_SF_LEIAUTE_VARIAVELLabel" runat="server" Text='<%# Eval("desc_SF_CAD_VARIAVEL") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="col-xs-12" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridCheckBoxColumn DataField="st_SF_LEIAUTE_VARIAVEL" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_LEIAUTE_VARIAVEL column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_LEIAUTE_VARIAVEL">
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridEditCommandColumn>
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn FilterControlAltText="Filter Editar column" UniqueName="Excluir">
                            </telerik:GridButtonColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource_sf_cad_leiaute" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_LEIAUTE_VARIAVEL.id_SF_LEIAUTE_VARIAVEL, SF_LEIAUTE_VARIAVEL.st_SF_LEIAUTE_VARIAVEL, SF_CAD_VARIAVEL.id_SF_CAD_VARIAVEL, SF_CAD_VARIAVEL.desc_SF_CAD_VARIAVEL, SF_LEIAUTE_VARIAVEL.id_SF_CAD_LEIAUTE FROM SF_LEIAUTE_VARIAVEL INNER JOIN SF_CAD_VARIAVEL ON SF_LEIAUTE_VARIAVEL.id_SF_CAD_VARIAVEL = SF_CAD_VARIAVEL.id_SF_CAD_VARIAVEL WHERE (SF_LEIAUTE_VARIAVEL.id_SF_CAD_LEIAUTE = @id_SF_CAD_LEIAUTE)" InsertCommand="INSERT INTO SF_LEIAUTE_VARIAVEL(id_SF_CAD_LEIAUTE, id_PS_PESSOA_inc, id_PS_PESSOA_alt, st_SF_LEIAUTE_VARIAVEL, id_SF_CAD_VARIAVEL) VALUES (@id_SF_CAD_LEIAUTE, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @st_SF_LEIAUTE_VARIAVEL, @id_SF_CAD_VARIAVEL)" UpdateCommand="UPDATE SF_LEIAUTE_VARIAVEL SET id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_SF_LEIAUTE_VARIAVEL = GETDATE(), st_SF_LEIAUTE_VARIAVEL = @st_SF_LEIAUTE_VARIAVEL, id_SF_CAD_VARIAVEL = @id_SF_CAD_VARIAVEL WHERE (id_SF_LEIAUTE_VARIAVEL = @id_SF_LEIAUTE_VARIAVEL)" DeleteCommand="DELETE FROM SF_LEIAUTE_VARIAVEL WHERE (id_SF_LEIAUTE_VARIAVEL = @id_SF_LEIAUTE_VARIAVEL)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter QueryStringField="id_SF_CAD_LEIAUTE" Name="id_SF_CAD_LEIAUTE" />
                     <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="st_SF_LEIAUTE_VARIAVEL" />
            <asp:Parameter Name="id_SF_CAD_VARIAVEL" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_SF_CAD_LEIAUTE" QueryStringField="id_SF_CAD_LEIAUTE" />
        </SelectParameters>
        <UpdateParameters>
       <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="st_SF_LEIAUTE_VARIAVEL" />
            <asp:Parameter Name="id_SF_CAD_VARIAVEL" />
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceFilhas" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT st_SF_LEIAUTE_VARIAVEL_EXP, regex_SF_LEIAUTE_VARIAVEL_EXP, stringPre_SF_LEIAUTE_VARIAVEL_EXP, id_SF_LEIAUTE_VARIAVEL_EXP, stringPos_SF_LEIAUTE_VARIAVEL_EXP FROM SF_LEIAUTE_VARIAVEL_EXP WHERE (id_SF_LEIAUTE_VARIAVEL = @id_SF_LEIAUTE_VARIAVEL)" InsertCommand="INSERT INTO SF_LEIAUTE_VARIAVEL_EXP(st_SF_LEIAUTE_VARIAVEL_EXP, id_SF_LEIAUTE_VARIAVEL, id_PS_PESSOA_inc, id_PS_PESSOA_alt, regex_SF_LEIAUTE_VARIAVEL_EXP, stringPre_SF_LEIAUTE_VARIAVEL_EXP, stringPos_SF_LEIAUTE_VARIAVEL_EXP) VALUES (@st_SF_LEIAUTE_VARIAVEL_EXP, @id_SF_LEIAUTE_VARIAVEL, @id_PS_PESSOA_inc, @id_PS_PESSOA_alt, @regex_SF_LEIAUTE_VARIAVEL_EXP, @stringPre_SF_LEIAUTE_VARIAVEL_EXP, @stringPos_SF_LEIAUTE_VARIAVEL_EXP)" DeleteCommand="DELETE FROM SF_LEIAUTE_VARIAVEL_EXP WHERE (id_SF_LEIAUTE_VARIAVEL_EXP = @id_SF_LEIAUTE_VARIAVEL_EXP)" UpdateCommand="UPDATE SF_LEIAUTE_VARIAVEL_EXP SET st_SF_LEIAUTE_VARIAVEL_EXP = @st_SF_LEIAUTE_VARIAVEL_EXP, id_PS_PESSOA_alt = @id_PS_PESSOA_alt, dtAlt_SF_LEIAUTE_VARIAVEL_EXP = GETDATE(), regex_SF_LEIAUTE_VARIAVEL_EXP = @regex_SF_LEIAUTE_VARIAVEL_EXP, stringPre_SF_LEIAUTE_VARIAVEL_EXP = @stringPre_SF_LEIAUTE_VARIAVEL_EXP, stringPos_SF_LEIAUTE_VARIAVEL_EXP = @stringPos_SF_LEIAUTE_VARIAVEL_EXP WHERE (id_SF_LEIAUTE_VARIAVEL_EXP = @id_SF_LEIAUTE_VARIAVEL_EXP)">
        <DeleteParameters>
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL_EXP" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="st_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
              <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_inc" Type="Int32" />
                <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="regex_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="stringPre_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="stringPos_SF_LEIAUTE_VARIAVEL_EXP" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="st_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:SessionParameter SessionField="id_PS_PESSOA_USUARIO" Name="id_PS_PESSOA_alt" Type="Int32" />
            <asp:Parameter Name="regex_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="stringPre_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="stringPos_SF_LEIAUTE_VARIAVEL_EXP" />
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL_EXP" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceSF_TIPO_LEITURA" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_TIPO_LEITURATableAdapters.SF_TIPO_LEITURATableAdapter"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCadVariaveis" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT id_SF_CAD_VARIAVEL, desc_SF_CAD_VARIAVEL FROM View_DropDownCadVariaveis"></asp:SqlDataSource>
</asp:Content>
