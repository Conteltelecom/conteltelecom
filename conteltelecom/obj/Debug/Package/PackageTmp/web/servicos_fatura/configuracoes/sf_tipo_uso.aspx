<%@ Page Title="TIPO DE USO" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="sf_tipo_uso.aspx.vb" Inherits="conteltelecom.sf_tipo_uso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    
    <telerik:RadGrid ID="RadGridTiposUso"   runat="server"  AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaTipoUso" GroupPanelPosition="Top"  Skin="Bootstrap" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Width ="100%" AllowAutomaticDeletes="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaTipoUso" Caption="CADASTRO TIPOS DE USO" EditFormSettings-FormCaptionStyle-HorizontalAlign="Center"  EditFormSettings-EditColumn-ButtonType="ImageButton" InsertItemDisplay="Top" CommandItemDisplay="Top" DataKeyNames="id_SF_TIPO_USO" NoMasterRecordsText="SEM REGISTROS" EditMode="InPlace"    >
            <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" RefreshText="ATUALIZAR" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_SF_TIPO_USO" FilterControlAltText="Filter COD column" HeaderText="CÓD" MaxLength="11" UniqueName="COD" ReadOnly="True">
                    <ItemStyle Width="50px" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="desc_SF_TIPO_USO" FilterControlAltText="Filter DESCRICAO column" HeaderText="DESCRIÇÃO" UniqueName="DESCRICAO">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_SF_TIPO_USOTextBox" runat="server" Text='<%# Bind("desc_SF_TIPO_USO") %>' Width="95%"></telerik:RadTextBox>
                      <asp:RequiredFieldValidator ID="RequiRadMaskeddesc_SF_TIPO_USO" ControlToValidate="desc_SF_TIPO_USOTextBox" runat="server" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ForeColor="RED"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_SF_TIPO_USOLabel" runat="server" Text='<%# Eval("desc_SF_TIPO_USO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-lg-11" />
                </telerik:GridTemplateColumn>
                <telerik:GridDropDownColumn FilterControlAltText="Filter id_SF_TIPO_USO_CATEGORIAS column"   DataSourceID="ObjectDataSourceUsoCategoria" DataField="id_SF_TIPO_USO_CATEGORIAS"  HeaderText="CATEGORIAS" UniqueName="id_SF_TIPO_USO_CATEGORIAS" ListTextField="desc_SF_TIPO_USO_CATEGORIAS" ListValueField="id_SF_TIPO_USO_CATEGORIAS">
                 <HeaderStyle CssClass="col-lg-1" />
                </telerik:GridDropDownColumn>
                <telerik:GridCheckBoxColumn DataField="st_SF_TIPO_USO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter column column" HeaderText="ST" UniqueName="ST" StringFalseValue="0" StringTrueValue="1" HeaderStyle-Width="5px">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"  Width="5px" />
                </telerik:GridCheckBoxColumn>
             <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>

</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>
            </Columns>

<EditFormSettings>
<EditColumn ButtonType="ImageButton"></EditColumn>

<FormCaptionStyle HorizontalAlign="Center"></FormCaptionStyle>
</EditFormSettings>
        </MasterTableView>
</telerik:RadGrid>
    <asp:ObjectDataSource ID="ObjectDataSourceUsoCategoria" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="conteltelecom.DropDownSF_TIPO_USO_CATTableAdapters.SF_TIPO_USO_CATEGORIASTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_SF_TIPO_USO_CATEGORIAS" Type="String" />
            <asp:Parameter Name="Original_id_SF_TIPO_USO_CATEGORIAS" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSourceBuscaTipoUso" CancelSelectOnNullParameter="False"   runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT SF_TIPO_USO.id_SF_TIPO_USO, SF_TIPO_USO.desc_SF_TIPO_USO, SF_TIPO_USO.st_SF_TIPO_USO, SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS, SF_TIPO_USO_CATEGORIAS.desc_SF_TIPO_USO_CATEGORIAS FROM SF_TIPO_USO INNER JOIN SF_TIPO_USO_CATEGORIAS ON SF_TIPO_USO.id_SF_TIPO_USO_CATEGORIAS = SF_TIPO_USO_CATEGORIAS.id_SF_TIPO_USO_CATEGORIAS" InsertCommand="INSERT INTO SF_TIPO_USO(desc_SF_TIPO_USO, st_SF_TIPO_USO, id_SF_TIPO_USO_CATEGORIAS) VALUES (@desc_SF_TIPO_USO, @st_SF_TIPO_USO, @id_SF_TIPO_USO_CATEGORIAS)" UpdateCommand="UPDATE SF_TIPO_USO SET st_SF_TIPO_USO = @st_SF_TIPO_USO, desc_SF_TIPO_USO = @desc_SF_TIPO_USO, id_SF_TIPO_USO_CATEGORIAS = @id_SF_TIPO_USO_CATEGORIAS WHERE (id_SF_TIPO_USO = @id_SF_TIPO_USO)" DeleteCommand="DELETE FROM SF_TIPO_USO WHERE (id_SF_TIPO_USO = @id_SF_TIPO_USO)">
    <DeleteParameters>
        <asp:Parameter Name="id_SF_TIPO_USO" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="desc_SF_TIPO_USO" />
        <asp:Parameter Name="st_SF_TIPO_USO" />
        <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="st_SF_TIPO_USO" />
        <asp:Parameter Name="desc_SF_TIPO_USO" />
        <asp:Parameter Name="id_SF_TIPO_USO_CATEGORIAS" />
        <asp:Parameter Name="id_SF_TIPO_USO" />
    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
