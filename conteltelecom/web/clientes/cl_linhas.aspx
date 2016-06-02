<%@ Page Title="CADASTRO DE LINHAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPageCli.master" CodeBehind="cl_linhas.aspx.vb" Inherits="conteltelecom.cl_linhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
            
            <telerik:RadGrid ID="RadGridLinhas"  runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceLinhasCliente" GroupPanelPosition="Top" Skin="Bootstrap" RenderMode="Auto" AllowAutomaticDeletes="True">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView  DataSourceID="SqlDataSourceLinhasCliente" DataKeyNames="id_LI_LINHAS"  CommandItemDisplay="Top"  ShowHeadersWhenNoRecords="true" NoMasterRecordsText="SEM REGISTROS" editmode="InPlace"   >
             <CommandItemSettings  AddNewRecordText="NOVO" CancelChangesText="CANCELAR"  AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" />
            <Columns>
               
                <telerik:GridHyperLinkColumn AllowSorting="False" DataTextField="id_LI_LINHAS" FilterControlAltText="Filter id_LI_LINHAS column" HeaderText="ID" UniqueName="id_LI_LINHAS">
                </telerik:GridHyperLinkColumn>
               
                <telerik:GridBoundColumn DataField="numContrato_LI_LINHAS" FilterControlAltText="Filter numContrato_LI_LINHAS column" HeaderText="Nº CONTRATO" SortExpression="numContrato_LI_LINHAS" UniqueName="numContrato_LI_LINHAS">
                    <HeaderStyle CssClass="col-lg-4" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="codLinha_LI_LINHAS" FilterControlAltText="Filter codLinha_LI_LINHAS column" HeaderText="CÓD LINHA" SortExpression="codLinha_LI_LINHAS" UniqueName="codLinha_LI_LINHAS">
                    <EditItemTemplate>
                        <asp:TextBox ID="codLinha_LI_LINHASTextBox" runat="server" Text='<%# Bind("codLinha_LI_LINHAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="codLinha_LI_LINHASLabel" runat="server" Text='<%# Eval("codLinha_LI_LINHAS") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-lg-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="numLinha_LI_LINHAS" FilterControlAltText="Filter numLinha_LI_LINHAS column" HeaderText="Nº LINHA" SortExpression="numLinha_LI_LINHAS" UniqueName="numLinha_LI_LINHAS">
                    <EditItemTemplate>
                       <telerik:RadMaskedTextBox Width="100%"  ID="numLinha_LI_LINHASRadMaskedTextBox" runat="server" Mask="(##)####-#####" Text='<%# Bind("numLinha_LI_LINHAS") %>'>
                                </telerik:RadMaskedTextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="numLinha_LI_LINHASLabel" runat="server" Text='<%# Me.mascaraFone(Eval("numLinha_LI_LINHAS")) %>'></asp:Label>
                  
                    
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-lg-4" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CNPJ" UniqueName="CNPJ_PS_JURIDICA">
                    <EditItemTemplate>
                        <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.FCnpjFormat(Eval("CNPJ_PS_JURIDICA")) %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_LI_LINHAS" DataType="System.Int16" FilterControlAltText="Filter st_LI_LINHAS column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_LI_LINHAS" DefaultInsertValue="1">
                </telerik:GridCheckBoxColumn>
               <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text="" Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png" CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'></telerik:RadImageButton>
                                <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false"  Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
                            </EditItemTemplate>
               </telerik:GridTemplateColumn>
            </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
        </MasterTableView>

<FilterMenu RenderMode="Auto"></FilterMenu>

<HeaderContextMenu RenderMode="Auto"></HeaderContextMenu>

    </telerik:RadGrid>
     
    
<asp:SqlDataSource ID="SqlDataSourceLinhasCliente" CancelSelectOnNullParameter ="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridLinhas" SelectCommandType="StoredProcedure" InsertCommand="Sp_InsertLInhaDefault" InsertCommandType="StoredProcedure" DeleteCommand="DELETE FROM LI_LINHAS WHERE (id_LI_LINHAS = @id_LI_LINHAS)">
    <DeleteParameters>
        <asp:Parameter Name="id_LI_LINHAS" />
    </DeleteParameters>
    <InsertParameters>
       <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
        <asp:Parameter Name="id" Direction="InputOutput" Type="Int32" />
        <asp:Parameter Name="numContrato_LI_LINHAS"/>
        <asp:Parameter Name="codLinha_LI_LINHAS" />
        <asp:Parameter Name="numLinha_LI_LINHAS" />
        <asp:Parameter Name="st_LI_LINHAS" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="id_PS_CLIENTES" SessionField="id_PS_CLIENTES" Type="Int32" />
        <asp:Parameter Name="id_LI_LINHAS" Type="Int32" DefaultValue="" />
        <asp:Parameter DefaultValue="0" Name="EditMode" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="linhaVirtual_LI_LINHAS" Type="Int32" />
        <asp:QueryStringParameter Name="codMatriz_PS_CLIENTES" QueryStringField="codMatriz_PS_CLIENTES" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
     </asp:Content>
