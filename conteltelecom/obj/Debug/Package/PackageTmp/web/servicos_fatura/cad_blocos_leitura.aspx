<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_blocos_leitura.aspx.vb" Inherits="conteltelecom.cad_blocos_leitura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadBlocosLeitura" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBocosLeitura" Skin="Bootstrap" CellSpacing="-1" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">


<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="id_SF_BLOCO_LEITURA" DataSourceID="SqlDataSourceBocosLeitura" CommandItemDisplay="Top" EditMode="InPlace"  >
            <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="NOVO" AddNewRecordImageUrl="~\img\add.png"/>
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_BLOCO_LEITURA" DataType="System.Int32" FilterControlAltText="Filter id_SF_BLOCO_LEITURA column" HeaderText="ID" ReadOnly="True" SortExpression="id_SF_BLOCO_LEITURA" UniqueName="id_SF_BLOCO_LEITURA">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_SF_BLOCO_LEITURA" FilterControlAltText="Filter desc_SF_BLOCO_LEITURA column" HeaderText="DESCRIÇÃO" SortExpression="desc_SF_BLOCO_LEITURA" UniqueName="desc_SF_BLOCO_LEITURA">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_SF_BLOCO_LEITURATextBox" runat="server" Text='<%# Bind("desc_SF_BLOCO_LEITURA") %>'></telerik:RadTextBox>
                       <asp:RequiredFieldValidator ID="RequiredFielddesc_SF_BLOCO_LEITURATextBox" ControlToValidate="desc_SF_BLOCO_LEITURATextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>   
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_SF_BLOCO_LEITURALabel" runat="server" Text='<%# Eval("desc_SF_BLOCO_LEITURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="desc_SF_TIPO_BLOCO" FilterControlAltText="Filter desc_SF_TIPO_BLOCO column" HeaderText="TIPO DE BLOCO" SortExpression="desc_SF_TIPO_BLOCO" UniqueName="desc_SF_TIPO_BLOCO">
                  <EditItemTemplate>
                      <telerik:RadDropDownList ID="RadDropDownListTipoBloco" AppendDataBoundItems="true"  Width="95%" runat="server" DataSourceID="ObjectDataSourceBuscaTipoBloco" DataTextField="desc_SF_TIPO_BLOCO" DataValueField="id_SF_TIPO_BLOCO" DropDownHeight="150px" SelectedValue='<%# Bind("id_SF_TIPO_BLOCO") %>'></telerik:RadDropDownList>
                  </EditItemTemplate>
                      <ItemTemplate>
                        <asp:Label ID="desc_SF_TIPO_BLOCOLabel" runat="server" Text='<%# Eval("desc_SF_TIPO_BLOCO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="strPre_SF_LEIAUTE_ITENS" FilterControlAltText="Filter strPre_SF_LEIAUTE_ITENS column" HeaderText="PRÉ" UniqueName="strPre_SF_LEIAUTE_ITENS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="strPre_SF_LEIAUTE_ITENSTextBox" runat="server" Text='<%# Bind("strPre_SF_BLOCO_LEITURA") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="strPre_SF_LEIAUTE_ITENSLabel" runat="server" Text='<%# Eval("strPre_SF_BLOCO_LEITURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="tamanho_SF_LEIAUTE_ITENS" FilterControlAltText="Filter tamanho_SF_LEIAUTE_ITENS column" HeaderText="TAM" UniqueName="tamanho_SF_LEIAUTE_ITENS">
                    <EditItemTemplate>
                         <telerik:RadTextBox ID="tamanho_SF_LEIAUTE_ITENSTextBox" runat="server" Text='<%# Bind("tamanho_SF_BLOCO_LEITURA") %>'></telerik:RadTextBox>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="tamanho_SF_LEIAUTE_ITENSLabel" runat="server" Text='<%# Eval("tamanho_SF_BLOCO_LEITURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="strPos_SF_LEIAUTE_ITENS" FilterControlAltText="Filter strPos_SF_LEIAUTE_ITENS column" HeaderText="PÓS" UniqueName="strPos_SF_LEIAUTE_ITENS">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="strPos_SF_LEIAUTE_ITENSTextBox" runat="server" Text='<%# Bind("strPos_SF_BLOCO_LEITURA") %>'></telerik:RadTextBox>
                           </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="strPos_SF_LEIAUTE_ITENSLabel" runat="server" Text='<%# Eval("strPos_SF_BLOCO_LEITURA") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="id_SF_LEIAUTE_VARIAVEL" FilterControlAltText="Filter id_SF_LEIAUTE_VARIAVEL column" HeaderText="VAR" UniqueName="id_SF_LEIAUTE_VARIAVEL">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="RadDropDownListVariavel" runat="server" Width="95%" DataSourceID="ObjectDataSourceSF_LEIAUTE_VARIAVEL" DataTextField="desc_SF_LEIAUTE_VARIAVEL" DataValueField="id_SF_LEIAUTE_VARIAVEL" DropDownHeight="150px" SelectedValue='<%# Bind("id_SF_LEIAUTE_VARIAVEL") %>'></telerik:RadDropDownList>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="id_SF_LEIAUTE_VARIAVELLabel" runat="server" Text='<%# Eval("desc_SF_LEIAUTE_VARIAVEL") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_SF_BLOCO_LEITURA" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_SF_BLOCO_LEITURA column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_SF_BLOCO_LEITURA">
                </telerik:GridCheckBoxColumn>
                 <telerik:GridEditCommandColumn ButtonType="ImageButton"  EditImageUrl="~\img\Editar_32.png" UpdateImageUrl="~\img\accept_32.png" CancelImageUrl="~\img\block_32.png" InsertImageUrl="~\img\accept_32.png" >
                 </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn FilterControlAltText="Filter EXCLUIR column" ConfirmDialogType="RadWindow"  UniqueName="EXCLUIR" ButtonType="ImageButton" ImageUrl="~\img\delete_32.png" ConfirmText="ATENÇÃO O REGISTRO SERA EXCLUÍDO">
                 </telerik:GridButtonColumn>
                 <telerik:GridTemplateColumn>
                     <ItemTemplate>
                         <asp:HyperLink ID="HyperLinkAvancar" runat="server" NavigateUrl='<%# String.Format("~/web/servicos_fatura/cad_blocos_leitura.aspx?idBlocoPai_SF_BLOCO_LEITURA={0}", Eval("id_SF_BLOCO_LEITURA")) %>' ImageUrl="~/img/Detalhes_32.png"></asp:HyperLink>
                     </ItemTemplate>
                 </telerik:GridTemplateColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>


    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceBocosLeitura" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SF_BLOCO_LEITURA.desc_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.st_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.id_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.idBlocoPai_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.strPre_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.strPos_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.tamanho_SF_BLOCO_LEITURA, SF_BLOCO_LEITURA.id_SF_LEIAUTE_VARIAVEL, SF_LEIAUTE_VARIAVEL.desc_SF_LEIAUTE_VARIAVEL, SF_TIPO_BLOCO.desc_SF_TIPO_BLOCO, SF_TIPO_BLOCO.id_SF_TIPO_BLOCO FROM SF_TIPO_BLOCO INNER JOIN SF_BLOCO_LEITURA ON SF_TIPO_BLOCO.id_SF_TIPO_BLOCO = SF_BLOCO_LEITURA.id_SF_TIPO_BLOCO LEFT OUTER JOIN SF_LEIAUTE_VARIAVEL ON SF_BLOCO_LEITURA.id_SF_LEIAUTE_VARIAVEL = SF_LEIAUTE_VARIAVEL.id_SF_LEIAUTE_VARIAVEL WHERE (SF_BLOCO_LEITURA.idBlocoPai_SF_BLOCO_LEITURA = @idBlocoPai_SF_BLOCO_LEITURA)" InsertCommand="INSERT INTO SF_BLOCO_LEITURA(desc_SF_BLOCO_LEITURA, id_SF_TIPO_BLOCO, st_SF_BLOCO_LEITURA, idBlocoPai_SF_BLOCO_LEITURA, strPre_SF_BLOCO_LEITURA, strPos_SF_BLOCO_LEITURA, tamanho_SF_BLOCO_LEITURA, id_SF_LEIAUTE_VARIAVEL) VALUES (@desc_SF_BLOCO_LEITURA, @id_SF_TIPO_BLOCO, @st_SF_BLOCO_LEITURA, @idBlocoPai_SF_BLOCO_LEITURA, @strPre_SF_BLOCO_LEITURA, @strPos_SF_BLOCO_LEITURA, @tamanho_SF_BLOCO_LEITURA, @id_SF_LEIAUTE_VARIAVEL)" UpdateCommand="UPDATE SF_BLOCO_LEITURA SET desc_SF_BLOCO_LEITURA = @desc_SF_BLOCO_LEITURA, id_SF_TIPO_BLOCO = @id_SF_TIPO_BLOCO, st_SF_BLOCO_LEITURA = @st_SF_BLOCO_LEITURA, strPre_SF_BLOCO_LEITURA = @strPre_SF_BLOCO_LEITURA, strPos_SF_BLOCO_LEITURA = @strPos_SF_BLOCO_LEITURA, tamanho_SF_BLOCO_LEITURA = @tamanho_SF_BLOCO_LEITURA, id_SF_LEIAUTE_VARIAVEL = @id_SF_LEIAUTE_VARIAVEL WHERE (id_SF_BLOCO_LEITURA = @id_SF_BLOCO_LEITURA)">
        <InsertParameters>
            <asp:Parameter Name="desc_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="id_SF_TIPO_BLOCO" />
            <asp:Parameter Name="st_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="idBlocoPai_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="strPre_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="strPos_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="tamanho_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idBlocoPai_SF_BLOCO_LEITURA" QueryStringField="idBlocoPai_SF_BLOCO_LEITURA" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="id_SF_TIPO_BLOCO" />
            <asp:Parameter Name="st_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="strPre_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="strPos_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="tamanho_SF_BLOCO_LEITURA" />
            <asp:Parameter Name="id_SF_LEIAUTE_VARIAVEL" />
            <asp:Parameter Name="id_SF_BLOCO_LEITURA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBocosLeituraItens" runat="server"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceBuscaTipoBloco" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_TIPO_BLOCOTableAdapters.SF_TIPO_BLOCOTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceSF_LEIAUTE_VARIAVEL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_LEIAUTE_VARIAVELTableAdapters.SF_LEIAUTE_VARIAVELTableAdapter"></asp:ObjectDataSource>
</asp:Content>
