<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_ramais.aspx.vb" Inherits="conteltelecom.cad_ramais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadDdr" runat="server" CellSpacing="-1" Culture="pt-BR" DataSourceID="SqlDataSourceCadDdr" GridLines="Both" AutoGenerateColumns="False" style="margin-bottom: 0px" Skin="Bootstrap" AllowPaging="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataKeyNames="id_LI_LINHAS" DataSourceID="SqlDataSourceCadDdr" CommandItemDisplay="Top" EditMode="InPlace" >
            <CommandItemSettings ShowRefreshButton="false" AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_LI_LINHAS" DataType="System.Int32" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID LINHA" ReadOnly="True" SortExpression="id_LI_LINHAS" UniqueName="id_LI_LINHAS">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD/ Nº LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS" ReadOnly="True">
                    <EditItemTemplate>
                        <asp:TextBox ID="codLinha_LI_LINHASTextBox" runat="server" Text='<%# Bind("codLinha_LI_LINHAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="RangeIni" DataType="System.Int32" FilterControlAltText="Filter RangeIni column" HeaderText="RANGE INICIAL" SortExpression="RangeIni" UniqueName="RangeIni">
                    <EditItemTemplate>
                         <asp:Label ID="RangeIniLabel" runat="server" Text='<%# Me.mascaraFone(Eval("codLinha_LI_LINHAS")) %>'></asp:Label>
                                   <telerik:RadMaskedTextBox ID="RangeIniTextBox" Mask="<1..9999>" Text='<%# Bind("RangeIni") %>'  runat="server"></telerik:RadMaskedTextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorRangeIniTextBox" ControlToValidate="RangeIniTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="RangeIniLabel" runat="server" Text='<%# Eval("RangeIni") %>'></asp:Label>
                    </ItemTemplate>
                               <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="RangeFim" DataType="System.Int32" FilterControlAltText="Filter RangeFim column" HeaderText="RANGE FINAL" SortExpression="RangeFim" UniqueName="RangeFim">
                    <EditItemTemplate>
                          <asp:Label ID="RangeFimLabel" runat="server" Text='<%# Me.mascaraFone(Eval("codLinha_LI_LINHAS")) %>'></asp:Label>
                        <telerik:RadMaskedTextBox ID="RangeFimTextBox" Mask="<1..9999>" Text='<%# Bind("RangeFim") %>'  runat="server"></telerik:RadMaskedTextBox>

                  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorRangeFimTextBox" ControlToValidate="RangeFimTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="RangeFimLabel" runat="server" Text='<%# Eval("RangeFim") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-3" />
                </telerik:GridTemplateColumn>
                <telerik:GridEditCommandColumn UniqueName="Editar" ButtonType="ImageButton"  EditImageUrl="~\img\edit_32.png" CancelImageUrl="../../../img/block_32.png" InsertImageUrl="../../../img/accept_32.png" UpdateImageUrl="../../../img/accept_32.png">
                
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn FilterControlAltText="Filter EXCLUIR column" ImageUrl=""  UniqueName="EXCLUIR" CommandName="Delete" ConfirmText="ATENÇÃO!!!!! ESTE REGISTRO SERA EXCLUIDO  " ConfirmTitle="EXCLUSÃO DE RAMAL">
                  
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn1 column"  InsertImageUrl="~\img\accept_32.png" UpdateImageUrl="~\img\accept_32.png"  UniqueName="EditCommandColumn1">
                 
                </EditColumn>
                
                
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceCadDdr" runat="server" CancelSelectOnNullParameter="False"  ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT LI_LINHAS.id_LI_LINHAS, LI_LINHAS.codLinha_LI_LINHAS, LI_RANGE_DDR.rangeInicial_LI_RANGE_DDR AS RangeIni, LI_RANGE_DDR.rangeFinal_LI_RANGE_DDR AS RangeFim FROM LI_LINHAS INNER JOIN LI_RANGE_DDR ON LI_LINHAS.id_LI_LINHAS = LI_RANGE_DDR.id_LI_LINHAS WHERE (LI_LINHAS.id_LI_LINHAS = @id_LI_LINHAS)" InsertCommand="INSERT INTO LI_RANGE_DDR(rangeInicial_LI_RANGE_DDR, rangeFinal_LI_RANGE_DDR, id_LI_LINHAS) VALUES (@rangeInicial_LI_RANGE_DDR, @rangeFinal_LI_RANGE_DDR, @id_LI_LINHAS)">
        <InsertParameters>
            <asp:Parameter Name="rangeInicial_LI_RANGE_DDR" />
            <asp:Parameter Name="rangeFinal_LI_RANGE_DDR" />
            <asp:Parameter Name="id_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceInsertRamais" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" InsertCommand="INSERT INTO LI_LINHAS(id_OP_OPERADORAS, id_PS_CLIENTES, id_LI_TIPOS, vlInicial_id_LI_TIPOS, numContrato_LI_LINHAS, codLinha_LI_LINHAS, numLinha_LI_LINHAS, vlIdeal_LI_LINHAS, diaVenc_LI_LINHAS, foraAnalise_LI_LINHAS, st_LI_LINHAS, liCancelada_LI_LINHAS, numF_LI_LINHAS, perIncial_LI_LINHAS, id_PS_CIDADES, bairro_LI_LINHAS, rua_LI_LINHAS, numEndereco_LI_LINHAS, complemeto_LI_LINHAS, obs_LI_LINHAS, cep_LI_LINHAS, linhaVirtual_LI_LINHAS, nomeUnidade_LI_LINHAS) VALUES (@id_OP_OPERADORAS, @id_PS_CLIENTES, @id_LI_TIPOS, @vlInicial_id_LI_TIPOS, @numContrato_LI_LINHAS, @codLinha_LI_LINHAS, @numLinha_LI_LINHAS, @vlIdeal_LI_LINHAS, @diaVenc_LI_LINHAS, @foraAnalise_LI_LINHAS, @st_LI_LINHAS, @liCancelada_LI_LINHAS, @numF_LI_LINHAS, @perIncial_LI_LINHAS, @id_PS_CIDADES, @bairro_LI_LINHAS, @rua_LI_LINHAS, @numEndereco_LI_LINHAS, @complemeto_LI_LINHAS, @obs_LI_LINHAS, @cep_LI_LINHAS, @linhaVirtual_LI_LINHAS, @nomeUnidade_LI_LINHAS)" SelectCommand="SELECT id_OP_OPERADORAS, id_PS_CLIENTES, id_LI_TIPOS, 9999 AS numContrato_LI_LINHAS, codLinha_LI_LINHAS, 0 AS vlIdeal_LI_LINHAS, diaVenc_LI_LINHAS, foraAnalise_LI_LINHAS, st_LI_LINHAS, liCancelada_LI_LINHAS, numF_LI_LINHAS, perIncial_LI_LINHAS, id_PS_CIDADES, bairro_LI_LINHAS, rua_LI_LINHAS, numEndereco_LI_LINHAS, complemeto_LI_LINHAS, obs_LI_LINHAS, cep_LI_LINHAS, linhaVirtual_LI_LINHAS, nomeUnidade_LI_LINHAS, 0 AS vlInicial_id_LI_TIPOS FROM LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
        <InsertParameters>
            <asp:Parameter Name="id_OP_OPERADORAS" />
            <asp:Parameter Name="id_PS_CLIENTES" />
            <asp:Parameter Name="id_LI_TIPOS" />
            <asp:Parameter Name="vlInicial_id_LI_TIPOS" />
            <asp:Parameter Name="numContrato_LI_LINHAS" />
            <asp:Parameter Name="codLinha_LI_LINHAS" />
            <asp:Parameter Name="numLinha_LI_LINHAS" />
            <asp:Parameter Name="vlIdeal_LI_LINHAS" />
            <asp:Parameter Name="diaVenc_LI_LINHAS" />
            <asp:Parameter Name="foraAnalise_LI_LINHAS" />
            <asp:Parameter Name="st_LI_LINHAS" />
            <asp:Parameter Name="liCancelada_LI_LINHAS" />
            <asp:Parameter Name="numF_LI_LINHAS" />
            <asp:Parameter Name="perIncial_LI_LINHAS" />
            <asp:Parameter Name="id_PS_CIDADES" />
            <asp:Parameter Name="bairro_LI_LINHAS" />
            <asp:Parameter Name="rua_LI_LINHAS" />
            <asp:Parameter Name="numEndereco_LI_LINHAS" />
            <asp:Parameter Name="complemeto_LI_LINHAS" />
            <asp:Parameter Name="obs_LI_LINHAS" />
            <asp:Parameter Name="cep_LI_LINHAS" />
            <asp:Parameter Name="linhaVirtual_LI_LINHAS" />
            <asp:Parameter Name="nomeUnidade_LI_LINHAS" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceBuscaLinha" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT codLinha_LI_LINHAS FROM LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_LI_LINHAS" QueryStringField="id_LI_LINHAS" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="GlobalCodLinha" runat="server" />
</asp:Content>
