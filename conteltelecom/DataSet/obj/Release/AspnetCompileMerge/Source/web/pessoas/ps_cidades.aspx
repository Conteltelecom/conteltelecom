<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Menu.master" CodeBehind="ps_cidades.aspx.vb" Inherits="conteltelecom.ps_cidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMenuhead" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenu" runat="server">
      <fieldset> 
      <legend>FILTRO</legend> 
         <div class="form-horizontal">

       <div class="form-group"> 
                     <asp:Label ID="Label2" Font-Bold="true" CssClass="col-xs-2 control-label"  runat="server" Text="CÓD INI:" ></asp:Label>
                <div class="col-xs-4">
                       <asp:TextBox ID="TextBoxCodini" CssClass ="form-control"  runat="server" ></asp:TextBox>
                    </div>
                     <asp:Label ID="Label3" Font-Bold="true" CssClass="col-xs-2 control-label"  runat="server" Text="CÓD FIM:" ></asp:Label>
                 <div class="col-xs-4">
                      <asp:TextBox ID="TextBoxFim"  CssClass="form-control" runat="server"  ></asp:TextBox>
                </div> 

                </div> 
              <div class="form-group"> 
                    <asp:Label ID="LabelDescCidade" Font-Bold="true"  CssClass="col-xs-2 control-label" runat="server" Text="CIDADE:" ></asp:Label>
               <div class="col-xs-10">
                   <asp:TextBox ID="TextBoxDesc" CssClass="form-control"  runat="server" ></asp:TextBox>
                   </div> 
                   </div>
             <div class="form-group"> 
                 <asp:Label ID="Label5"  Font-Bold="true" runat="server" CssClass="col-xs-2 control-label"  Text="UF:" ></asp:Label>
                  <div class="col-xs-3">
                      <telerik:RadDropDownList ID="RadDropDownListuF" AutoPostBack="true"  DefaultMessage=" " runat ="server" DataSourceID="SqlDataSourceUF"  DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap"></telerik:RadDropDownList>
                   </div> 
                       <div class="col-xs-7">
                           <asp:HyperLink ID="HyperLinkPronptUF" Target="_blank"   ImageUrl="~/img/promotion.png" runat="server" NavigateUrl="~/web/pessoas/ps_uf.aspx"></asp:HyperLink>
                        
                 </div>
                 </div>
            <div class="col-lg-12" style="text-align:right">
                 <div>
                     <telerik:RadButton ID="RadButtonPesquisar" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                         <Icon PrimaryIconUrl ="../../img/search.png" />
                     </telerik:RadButton>
         <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR   ">
                         <Icon PrimaryIconUrl ="../../img/Limpar.png" />
             </telerik:RadButton> 
                 </div>
                </div> 
        </div> 
   </fieldset>
    
    <br />
    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadGrid ID="RadGridCidade" runat="server"   Culture="pt-BR" DataSourceID="SqlDataSourcePs_cidades" GroupPanelPosition="Top" Skin="Bootstrap" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
           <ExportSettings>
               <Pdf PageWidth="">
               </Pdf>
           </ExportSettings>
           <ClientSettings>
               <Selecting AllowRowSelect="True" />
               <Resizing AllowResizeToFit="true" />
          
           </ClientSettings>
           <MasterTableView DataKeyNames="id_PS_CIDADES"    TableLayout="Auto"   DataSourceID="SqlDataSourcePs_cidades" CommandItemDisplay="Top"    >
               
              <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
            
               <Columns>
                   <telerik:GridTemplateColumn DataField="id_PS_CIDADES" DataType="System.Int32" FilterControlAltText="Filter id_PS_CIDADES column" HeaderText="CÓD" SortExpression="id_PS_CIDADES" UniqueName="id_PS_CIDADES">
                       <EditItemTemplate>
                           <asp:TextBox ID="id_PS_CIDADESTextBox" runat="server" Text='<%# Bind("id_PS_CIDADES") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="id_PS_CIDADESLabel" runat="server" Text='<%# Eval("id_PS_CIDADES") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn DataField="desc_PS_CIDADES" FilterControlAltText="Filter desc_PS_CIDADES column" HeaderText="DESCRIÇÃO" SortExpression="desc_PS_CIDADES" UniqueName="desc_PS_CIDADES">
                       <EditItemTemplate>
                                                    
                           <asp:TextBox ID="desc_PS_CIDADESTextBox" runat="server" Width="280px" Text='<%# Bind("desc_PS_CIDADES") %>'></asp:TextBox>
                      
                               </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="desc_PS_CIDADESLabel" runat="server" Text='<%# Eval("desc_PS_CIDADES") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-8" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF" SortExpression="cod_PS_UF" UniqueName="cod_PS_UF">
                       <EditItemTemplate>
                           <telerik:RadDropDownList ID="RadDropDownList1" runat="server" DataSourceID="SqlDataSourceUF" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap" SelectedValue='<%# Bind("cod_PS_UF") %>'>
                           </telerik:RadDropDownList><asp:HyperLink ID="HyperLinkPronptUF1" Target="_blank"   ImageUrl="~/img/promotion.png" runat="server" NavigateUrl="~/web/pessoas/ps_uf.aspx"></asp:HyperLink>
                          
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn HeaderStyle-CssClass="gridColunm_50px_center" ItemStyle-CssClass="gridColunm_50px_center" DataField="st_PS_CIDADES" DataType="System.Byte" FilterControlAltText="Filter st_PS_CIDADES column" HeaderText="SITUAÇÃO" SortExpression="st_PS_CIDADES" UniqueName="st_PS_CIDADES">
                       <EditItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Checked='<%# Bind("st_PS_CIDADES") %>' />
                       </EditItemTemplate>
                       <InsertItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" Checked="true"  Enabled="false"   runat="server" />
                       </InsertItemTemplate>
                       <ItemTemplate>
                           <asp:CheckBox ID="CheckBoxSt" runat="server" Checked='<%# Bind("st_PS_CIDADES") %>'  Enabled="false" />
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-lg-1" />

<ItemStyle  HorizontalAlign="Center"></ItemStyle>
                   </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Groupable="False" HeaderText="DETALHES" UniqueName="DETALHES" FilterControlAltText="Filter DETALHES column">
                        <EditItemTemplate>
                            <asp:Button runat="server" CommandName="Update" Text="Update" />
                            &nbsp;<asp:Button runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <telerik:RadButton ID="RadButtonDetalhes" runat="server" CommandName="Detalhes" Text="DETALHES">
                                <Icon PrimaryIconUrl="../../img/search_page.png" />
                            </telerik:RadButton>
                        </ItemTemplate>
                        <HeaderStyle CssClass="col-lg-1" />
                   </telerik:GridTemplateColumn>
               </Columns>
            
             <EditFormSettings EditColumn-ButtonType="ImageButton" PopUpSettings-Modal="true" PopUpSettings-ShowCaptionInEditForm="true" >
                 
<EditColumn ButtonType="ImageButton"></EditColumn>

<PopUpSettings Modal="True"></PopUpSettings>
                 
             </EditFormSettings>
           </MasterTableView>
    </telerik:RadGrid>
        </ContentTemplate>
    </asp:UpdatePanel>
       
    <asp:SqlDataSource ID="SqlDataSourcePs_cidades" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO PS_CIDADES(desc_PS_CIDADES, cod_PS_UF) VALUES (@desc_PS_CIDADES, @cod_PS_UF)" SelectCommand="RadGridPs_Cidades" UpdateCommand="UPDATE PS_CIDADES SET desc_PS_CIDADES = @desc_PS_CIDADES, cod_PS_UF = @cod_PS_UF, st_PS_CIDADES = @st_PS_CIDADES WHERE (id_PS_CIDADES = @id_PS_CIDADES)" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="desc_PS_CIDADES" />
            <asp:Parameter Name="cod_PS_UF" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxCodini" Name="codIni" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TextBoxFim" Name="codFim" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TextBoxDesc" Name="Desc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="RadDropDownListuF" Name="UF" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_CIDADES" />
            <asp:Parameter Name="cod_PS_UF" />
            <asp:Parameter Name="st_PS_CIDADES" />
            <asp:Parameter Name="id_PS_CIDADES" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceUF" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
       <br />
</asp:Content>
