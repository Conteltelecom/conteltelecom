<%@ Page Title="CADASTRO DE CIDADES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_cidades.aspx.vb" Inherits="conteltelecom.ps_cidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
      <fieldset id="fieldset"> 
      <legend>FILTRO</legend> 
         <div class="form-inline">

       <div class="col-lg-12 form-group"> 
                     <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label"  runat="server" Text="CÓD INI:" ></asp:Label>
                <div class="col-lg-4">
                       <asp:TextBox ID="TextBoxCodini" CssClass ="form-control"  runat="server" ></asp:TextBox>
                    </div>
                     <asp:Label ID="Label3" Font-Bold="true" CssClass="col-lg-2 control-label"  runat="server" Text="CÓD FIM:" ></asp:Label>
                 <div class="col-lg-4">
                      <asp:TextBox ID="TextBoxFim"  CssClass="form-control" runat="server"  ></asp:TextBox>
                </div> 

                </div> 
              <div class=" col-lg-12 form-group"> 
                    <asp:Label ID="LabelDescCidade" Font-Bold="true"  CssClass="col-lg-2 control-label" runat="server" Text="CIDADE:" ></asp:Label>
               <div class="col-lg-10">
                   <asp:TextBox ID="TextBoxDesc" CssClass="form-control"  runat="server" ></asp:TextBox>
                   </div> 
                   </div>
             <div class=" col-lg-12 form-group"> 
                 <asp:Label ID="Label5"  Font-Bold="true" runat="server" CssClass="col-lg-2 control-label"  Text="UF:" ></asp:Label>
                  <div class="col-lg-3">
                      <telerik:RadDropDownList ID="RadDropDownListuF" DropDownHeight="150px"  AutoPostBack="true" Width="100%"  DefaultMessage="RS" runat ="server" DataSourceID="SqlDataSourceUF"  DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap"></telerik:RadDropDownList>
                   </div> 
                       <div class="col-lg-7">
                        
                 </div>
                 </div>
          <div class=" col-lg-12" style="text-align:right">
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
            <telerik:RadGrid ID="RadGridCidade" runat="server" RenderMode="Auto"  Culture="pt-BR" DataSourceID="SqlDataSourcePs_cidades"  Skin="Bootstrap" AutoGenerateColumns="False" CellSpacing="-1"  GroupPanelPosition="Top" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
           <ExportSettings>
               <Pdf PageWidth="">
               </Pdf>
           </ExportSettings>
           <ClientSettings>
               <Selecting AllowRowSelect="True" />
               <Resizing AllowResizeToFit="true" />
          
           </ClientSettings>
           <MasterTableView DataKeyNames="id_PS_CIDADES"    TableLayout="Auto" EditMode="InPlace"    DataSourceID="SqlDataSourcePs_cidades" CommandItemDisplay="Top" NoMasterRecordsText="SEM REGISTRO" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"    >
               
              <CommandItemSettings AddNewRecordText="NOVO" CancelChangesText="CANCELAR" AddNewRecordImageUrl="../../img/add.png" RefreshText="ATUALIZAR" SaveChangesText="SALVAR" />
            
               <Columns>
                   <telerik:GridTemplateColumn DataField="id_PS_CIDADES" DataType="System.Int32" FilterControlAltText="Filter id_PS_CIDADES column" HeaderText="CÓD" SortExpression="id_PS_CIDADES" UniqueName="id_PS_CIDADES" ReadOnly="True">
                       <EditItemTemplate>
                           <asp:TextBox ID="id_PS_CIDADESTextBox" runat="server" Text='<%# Bind("id_PS_CIDADES") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="id_PS_CIDADESLabel" runat="server" Text='<%# Eval("id_PS_CIDADES") %>'></asp:Label>
                       </ItemTemplate>
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn DataField="desc_PS_CIDADES" FilterControlAltText="Filter desc_PS_CIDADES column" HeaderText="DESCRIÇÃO" SortExpression="desc_PS_CIDADES" UniqueName="desc_PS_CIDADES">
                       <EditItemTemplate>
                           <telerik:RadTextBox ID="desc_PS_CIDADESTextBox" Text='<%# Bind("desc_PS_CIDADES") %>' Width="100%" runat="server"></telerik:RadTextBox>                    
                           
                      
                               </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="desc_PS_CIDADESLabel" runat="server" Text='<%# Eval("desc_PS_CIDADES") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="col-xs-10" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF" SortExpression="cod_PS_UF" UniqueName="cod_PS_UF">
                       <EditItemTemplate>
                           <telerik:RadDropDownList ID="RadDropDownList1" runat="server" DropDownHeight="150px" DataSourceID="SqlDataSourceUF" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap" SelectedValue='<%# Bind("cod_PS_UF") %>'></telerik:RadDropDownList>
                         
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="cod_PS_UFLabel" runat="server" Text='<%# Eval("cod_PS_UF") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle Width="5px" />
                       <ItemStyle HorizontalAlign="Center" Width="5px" />
                   </telerik:GridTemplateColumn>
                   <telerik:GridCheckBoxColumn DataField="st_PS_CIDADES" DataType="System.Boolean" FilterControlAltText="Filter st_PS_CIDADES column" HeaderText="ST" StringFalseValue="0" StringTrueValue="1" UniqueName="st_PS_CIDADES">
                       <HeaderStyle Width="5px" />
                       <ItemStyle Width="5px" />
                   </telerik:GridCheckBoxColumn>
                  <telerik:GridTemplateColumn >  
<ItemTemplate >
    <telerik:RadImageButton ID="RadImageButtonEditar" runat="server" Width="32px" Height="32px" CommandName="Edit" Text="" Image-Url="~/img/edit_32.png"></telerik:RadImageButton>
</ItemTemplate>
 <EditItemTemplate>
     <telerik:RadImageButton ID="RadImageButtonOK" runat="server" Width="32px" Height="32px" Text="" Image-Url="~/img/accept_32.png"  CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'> </telerik:RadImageButton>
    <telerik:RadImageButton ID="RadImageButtonCancel" runat="server" Width="32px" Height="32px" CommandName="Cancel" Text="" Image-Url="~/img/block_32.png"></telerik:RadImageButton>
 </EditItemTemplate>
                
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
            <asp:ControlParameter ControlID="TextBoxCodini" Name="codIni" PropertyName="Text" Type="Int32"  />
            <asp:ControlParameter ControlID="TextBoxFim" Name="codFim" PropertyName="Text" Type="Int32"  />
            <asp:ControlParameter ControlID="TextBoxDesc" Name="Desc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="RadDropDownListuF" Name="UF" PropertyName="SelectedValue" Type="String" DefaultValue="RS" />
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
