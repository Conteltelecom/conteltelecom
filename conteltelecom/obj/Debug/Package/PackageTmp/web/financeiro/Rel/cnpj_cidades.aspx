<%@ Page Title="CIDADES X CNPJ" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="cnpj_cidades.aspx.vb" Inherits="conteltelecom.cnpj_cidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <div class="table-responsive">
    <telerik:RadGrid ID="RadGridCnpjCidades" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceCidadesCnpj" CellSpacing="-1" GridLines="Both"  >
    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
       <ExportSettings>
           <Pdf PageWidth="">
           </Pdf>
       </ExportSettings>
 
       <MasterTableView DataSourceID="SqlDataSourceCidadesCnpj">
           <Columns>
               <telerik:GridBoundColumn DataField="desc_PS_PESSOA"   FilterControlWidth="80%" FilterControlAltText="Filter desc_PS_PESSOA column" HeaderText="FANTASIA" SortExpression="desc_PS_PESSOA" UniqueName="desc_PS_PESSOA">
              
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="RAZÃO SOCIAL" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="TIPO" FilterControlAltText="Filter TIPO column" HeaderText="TIPO" UniqueName="TIPO">
               </telerik:GridBoundColumn>
               <telerik:GridTemplateColumn DataField="CNPJ_PS_JURIDICA" FilterControlAltText="Filter CNPJ_PS_JURIDICA column" HeaderText="CPF/CNPJ" SortExpression="CNPJ_PS_JURIDICA" UniqueName="CNPJ_PS_JURIDICA">
                   <EditItemTemplate>
                       <asp:TextBox ID="CNPJ_PS_JURIDICATextBox" runat="server" Text='<%# Bind("CNPJ_PS_JURIDICA") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="CNPJ_PS_JURIDICALabel" runat="server" Text='<%# Me.FcnpjFormat(Eval("CNPJ_PS_JURIDICA")) %>'></asp:Label>
                   </ItemTemplate>
               </telerik:GridTemplateColumn>
               <telerik:GridBoundColumn DataField="cod_PS_UF" FilterControlAltText="Filter cod_PS_UF column" HeaderText="UF" SortExpression="cod_PS_UF" UniqueName="cod_PS_UF">
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="desc_PS_CIDADES" FilterControlAltText="Filter desc_PS_CIDADES column" HeaderText="CIDADES" SortExpression="desc_PS_CIDADES" UniqueName="desc_PS_CIDADES">
               </telerik:GridBoundColumn>
           </Columns>
       </MasterTableView>

   </telerik:RadGrid>
    </div> <!-- fim responsive-table -->
<asp:SqlDataSource ID="SqlDataSourceCidadesCnpj" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT PS_CIDADES.desc_PS_CIDADES, PS_CIDADES.cod_PS_UF, PS_PESSOA.desc_PS_PESSOA, PS_JURIDICA.CNPJ_PS_JURIDICA, PS_JURIDICA.razaosocial_PS_JURIDICA, CASE WHEN PS_CLIENTES.codMatriz_PS_CLIENTES = PS_PESSOA.id_PS_PESSOA THEN 'MATRIZ' ELSE 'FILIAL' END AS TIPO FROM PS_PESSOA INNER JOIN PS_CIDADES ON PS_PESSOA.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES INNER JOIN PS_CLIENTES ON PS_PESSOA.id_PS_PESSOA = PS_CLIENTES.id_PS_PESSOA INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA WHERE (PS_PESSOA.st_PS_PESSOA = 1)"></asp:SqlDataSource>
</asp:Content>
