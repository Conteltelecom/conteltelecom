<%@ Page Title="PAÍS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ps_pais.aspx.vb" Inherits="conteltelecom.ps_pais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset id="fieldset"> 
      <legend id="legend">FILTRO</legend> 
       
       <br />
       <br />
       <br />
       
   </fieldset>
    <br />
    <br />
     <telerik:RadGrid ID="RadGridPais"  runat="server" MasterTableView-EditMode="EditForms" AutoGenerateColumns="False" Culture="pt-BR" Width="100%" DataSourceID="conteltelecom" GroupPanelPosition="Top" Skin="Bootstrap">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
    </ExportSettings>
         <ClientSettings>
             <Selecting AllowRowSelect="True" />
         </ClientSettings>
        <MasterTableView DataKeyNames="cod_PS_PAIS" DataSourceID="conteltelecom" CommandItemDisplay="Top" >
            <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" RefreshText="ATUAIZAR" SaveChangesText="SALVAR" AddNewRecordImageUrl="../../img/add.png" />
            <Columns>
                <telerik:GridBoundColumn DataField="id_PS_PAIS" DataType="System.Int32" FilterControlAltText="Filter id_PS_PAIS column" HeaderText="ID" ReadOnly="True" SortExpression="id_PS_PAIS" UniqueName="id_PS_PAIS">
                    <HeaderStyle Width="50px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cod_PS_PAIS" FilterControlAltText="Filter cod_PS_PAIS column" HeaderText="CÓD PAÍS" ReadOnly="True" SortExpression="cod_PS_PAIS" UniqueName="cod_PS_PAIS">
                    <HeaderStyle Width="70px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_PS_PAIS" FilterControlAltText="Filter desc_PS_PAIS column" HeaderText="DECRIÇÃO" SortExpression="desc_PS_PAIS" UniqueName="desc_PS_PAIS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codTelefonico_PS_PAIS" FilterControlAltText="Filter codTelefonico_PS_PAIS column" SortExpression="codTelefonico_PS_PAIS" UniqueName="codTelefonico_PS_PAIS" HeaderText="DDD INT.">
                    <HeaderStyle Width="70px" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="st_PS_PAIS" DataType="System.Byte" FilterControlAltText="Filter st_PS_PAIS column" HeaderText="STATUS" SortExpression="st_PS_PAIS" UniqueName="st_PS_PAIS">
                    <EditItemTemplate>
                        <asp:TextBox ID="st_PS_PAISTextBox" runat="server" Text='<%# Bind("st_PS_PAIS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("st_PS_PAIS") %>' />
                    </ItemTemplate>
                    <HeaderStyle Width="50px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
              
                <telerik:GridEditCommandColumn  EditImageUrl="../../img/Editar.png" FilterControlAltText="Filter EditCommandColumn column" HeaderText="EDITAR"   ButtonType = "ImageButton"  UniqueName="EDITAR" >
                    <HeaderStyle Width="50px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridEditCommandColumn>
                 <telerik:GridButtonColumn  CommandName = "Delete" ButtonType="ImageButton" ImageUrl ="../../img/Editar.png"   Text = "Delete"   HeaderText = "Delete"  
UniqueName = "DeleteColumn"   >  
                    <HeaderStyle Width="50px"  />
                    <ItemStyle HorizontalAlign="Center"  />
                </telerik:GridButtonColumn>
            </Columns>
           
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="conteltelecom" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO PS_PAIS(cod_PS_PAIS, desc_PS_PAIS, codTelefonico_PS_PAIS) VALUES (@cod_PS_PAIS, @desc_PS_PAIS, @codTelefonico_PS_PAIS)" SelectCommand="SELECT cod_PS_PAIS, desc_PS_PAIS, codTelefonico_PS_PAIS, st_PS_PAIS, id_PS_PAIS FROM PS_PAIS WHERE (st_PS_PAIS = 1)" UpdateCommand="UPDATE PS_PAIS SET cod_PS_PAIS = @cod_PS_PAIS, desc_PS_PAIS = @desc_PS_PAIS, codTelefonico_PS_PAIS = @codTelefonico_PS_PAIS, st_PS_PAIS = @st_PS_PAIS WHERE (id_PS_PAIS = @id_PS_PAIS)">
        <InsertParameters>
            <asp:Parameter Name="cod_PS_PAIS" />
            <asp:Parameter Name="desc_PS_PAIS" />
            <asp:Parameter Name="codTelefonico_PS_PAIS" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cod_PS_PAIS" />
            <asp:Parameter Name="desc_PS_PAIS" />
            <asp:Parameter Name="codTelefonico_PS_PAIS" />
            <asp:Parameter Name="st_PS_PAIS" />
            <asp:Parameter Name="id_PS_PAIS" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
