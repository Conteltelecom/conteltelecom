<%@ Page Title="CADASTRO DE BLOQUEIOS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cad_tipo_bloqueios.aspx.vb" Inherits="conteltelecom.cad_tipo_bloqueios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridCadBloqueios" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCadBloqueios" Skin="Bootstrap" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True" CellSpacing="-1" GridLines="Both">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataKeyNames="id_ADM_CAD_TIPO_BLOQUEIO" CommandItemDisplay="Top" EditMode="InPlace"   DataSourceID="SqlDataSourceCadBloqueios" NoDetailRecordsText="" NoMasterRecordsText="" AllowPaging="False">
        <CommandItemSettings AddNewRecordImageUrl="../../../img/add.png" AddNewRecordText="NOVO" ShowRefreshButton="false"   />
                <Columns>
                <telerik:GridBoundColumn DataField="id_ADM_CAD_TIPO_BLOQUEIO" DataType="System.Int32" FilterControlAltText="Filter id_ADM_CAD_TIPO_BLOQUEIO column" HeaderText="ID" ReadOnly="True" SortExpression="id_ADM_CAD_TIPO_BLOQUEIO" UniqueName="id_ADM_CAD_TIPO_BLOQUEIO">
                </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="numSeq_ADM_CAD_TIPO_BLOQUEIO" DecimalDigits="0" DefaultInsertValue="0" FilterControlAltText="Filter numSeq_ADM_CAD_TIPO_BLOQUEIO column" HeaderText="Nº SEQUÊNCIA" MinValue="0" UniqueName="numSeq_ADM_CAD_TIPO_BLOQUEIO">
                        <HeaderStyle CssClass="col-xs-1" />
                    </telerik:GridNumericColumn>
                <telerik:GridTemplateColumn DataField="desc_ADM_CAD_TIPO_BLOQUEIO" FilterControlAltText="Filter desc_ADM_CAD_TIPO_BLOQUEIO column" HeaderText="DESCRIÇÃO" SortExpression="desc_ADM_CAD_TIPO_BLOQUEIO" UniqueName="desc_ADM_CAD_TIPO_BLOQUEIO">
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="desc_ADM_CAD_TIPO_BLOQUEIOTextBox" runat="server" Text='<%# Bind("desc_ADM_CAD_TIPO_BLOQUEIO") %>' Width="95%"></telerik:RadTextBox>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="desc_ADM_CAD_TIPO_BLOQUEIOLabel" runat="server" Text='<%# Eval("desc_ADM_CAD_TIPO_BLOQUEIO") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="col-xs-11" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="st_ADM_CAD_TIPO_BLOQUEIO" DataType="System.Int16" DefaultInsertValue="1" FilterControlAltText="Filter st_ADM_CAD_TIPO_BLOQUEIO column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_ADM_CAD_TIPO_BLOQUEIO">
                </telerik:GridCheckBoxColumn>
                <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
 <telerik:RadImageButton ID="RadImageButtonDelete" runat="server" Width="32px" Height="32px" CommandName="Delete" Text=""  Image-Url="~/img/delete_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" CausesValidation="false" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
 </telerik:GridTemplateColumn>

            </Columns>
        </MasterTableView>

    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceCadBloqueios" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" DeleteCommand="DELETE FROM [ADM_CAD_TIPO_BLOQUEIO] WHERE [id_ADM_CAD_TIPO_BLOQUEIO] = @id_ADM_CAD_TIPO_BLOQUEIO" InsertCommand="INSERT INTO ADM_CAD_TIPO_BLOQUEIO(desc_ADM_CAD_TIPO_BLOQUEIO, st_ADM_CAD_TIPO_BLOQUEIO, numSeq_ADM_CAD_TIPO_BLOQUEIO) VALUES (@desc_ADM_CAD_TIPO_BLOQUEIO, @st_ADM_CAD_TIPO_BLOQUEIO, @numSeq_ADM_CAD_TIPO_BLOQUEIO)" SelectCommand="SELECT desc_ADM_CAD_TIPO_BLOQUEIO, id_ADM_CAD_TIPO_BLOQUEIO, st_ADM_CAD_TIPO_BLOQUEIO, numSeq_ADM_CAD_TIPO_BLOQUEIO FROM ADM_CAD_TIPO_BLOQUEIO" UpdateCommand="UPDATE ADM_CAD_TIPO_BLOQUEIO SET desc_ADM_CAD_TIPO_BLOQUEIO = @desc_ADM_CAD_TIPO_BLOQUEIO, st_ADM_CAD_TIPO_BLOQUEIO = @st_ADM_CAD_TIPO_BLOQUEIO, numSeq_ADM_CAD_TIPO_BLOQUEIO = @numSeq_ADM_CAD_TIPO_BLOQUEIO WHERE (id_ADM_CAD_TIPO_BLOQUEIO = @id_ADM_CAD_TIPO_BLOQUEIO)">
        <DeleteParameters>
            <asp:Parameter Name="id_ADM_CAD_TIPO_BLOQUEIO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="desc_ADM_CAD_TIPO_BLOQUEIO" Type="String" />
            <asp:Parameter Name="st_ADM_CAD_TIPO_BLOQUEIO" Type="Byte" />
            <asp:Parameter Name="numSeq_ADM_CAD_TIPO_BLOQUEIO" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_ADM_CAD_TIPO_BLOQUEIO" Type="String" />
            <asp:Parameter Name="st_ADM_CAD_TIPO_BLOQUEIO" Type="Byte" />
            <asp:Parameter Name="numSeq_ADM_CAD_TIPO_BLOQUEIO" />
            <asp:Parameter Name="id_ADM_CAD_TIPO_BLOQUEIO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
