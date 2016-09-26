<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="mostra_faturamento.aspx.vb" Inherits="conteltelecom.mostra_faturamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
       <fieldset >
        <legend>FILTRO</legend>
        <div class="form-horizontal">
                             
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="MÊS:" CssClass="col-xs-2 control-label" Font-Bold="true"></asp:Label>

                <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListMes" runat="server" Width="95%">
                        <Items>
                            <telerik:DropDownListItem Text="JANEIRO" Value="01" />
                                                        <telerik:DropDownListItem Text="FEVEREIRO" Value="02" />
                                                        <telerik:DropDownListItem Text="MARÇO" Value="03" />
                                                        <telerik:DropDownListItem Text="ABRIL" Value="04" />
                                                        <telerik:DropDownListItem Text="MAIO" Value="05" />
                                                        <telerik:DropDownListItem Text="JUNHO" Value="06" />
                                                        <telerik:DropDownListItem Text="JULHO" Value="07" />
                                                        <telerik:DropDownListItem Text="AGOSTO" Value="08" />
                                                        <telerik:DropDownListItem Text="SETEMBRO" Value="09" />
                                                        <telerik:DropDownListItem Text="OUTUBRO" Value="10" />
                            <telerik:DropDownListItem Text="NOVEMBRO" Value="11" />
                            <telerik:DropDownListItem Text="DEZEMBRO" Value="12" />

                        </Items>
                    </telerik:RadDropDownList>
                    </div>
                  <asp:Label ID="Label4" runat="server" Text="ANO:" CssClass="col-xs-2 control-label" Font-Bold="true" ></asp:Label>
                     <div class="col-xs-4">
                    <telerik:RadDropDownList ID="RadDropDownListAno" runat="server" Width="95%" >
                        <Items>
                            <telerik:DropDownListItem Text="2014" Value="2014" />
                             <telerik:DropDownListItem Text="2015" Value="2015" />
                             <telerik:DropDownListItem Text="2016" Value="2016" />
                             <telerik:DropDownListItem Text="2017" Value="2017" />
                             <telerik:DropDownListItem Text="2018" Value="2018" />
                             <telerik:DropDownListItem Text="2019" Value="2019" />
                             <telerik:DropDownListItem Text="2020" Value="2020" />

                        </Items>
                    </telerik:RadDropDownList>
                                           
                </div>
                 </div>

                  <div class="form-group">
                 <div class="col-xs-12" style="text-align: right">
              <telerik:RadImageButton ID="RadImageButtonGerar" class="col-xs-8" runat="server" Image-Url="~/img/Detalhes_32.png" Width="32px" Height="32px" OnClick="RadImageButtonGerar_Click"></telerik:RadImageButton>
                     </div>
                      </div>
             
           
                
        </div>
     
           </fieldset>





    <telerik:RadGrid ID="RadGridMostraFaturamento" runat="server" RenderMode="Lightweight"   AllowSorting="True" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceBuscaFaturamento" ShowGroupPanel="True" Skin="Bootstrap" CellSpacing="-1" GridLines="Both" >

 <GroupPanel Text="ARRASTE  A COLUNA PARA FILTAR"></GroupPanel>
   <GroupingSettings CollapseAllTooltip="DESAGRUPAR" ShowUnGroupButton="True" UnGroupButtonTooltip="DESAGRUPAR" UnGroupTooltip="" RetainGroupFootersVisibility="true" >
       </GroupingSettings>
        <ExportSettings ExportOnlyData="True" FileName="Faturamento">
            <Pdf PageWidth="">
            </Pdf>
            <Excel Format="Xlsx" />
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSourceBuscaFaturamento" ShowFooter="true" CommandItemDisplay="Top" NoMasterRecordsText=" " >
         <CommandItemSettings ShowAddNewRecordButton="false"  ShowPrintButton="true" ShowExportToExcelButton="true"  ExportToExcelImageUrl="../../../img/Excel_32.png"  ShowRefreshButton="false" ExportToExcelText=""  />          
            <Columns>
                <telerik:GridBoundColumn  DataField="codMatriz_PS_CLIENTES" DataType="System.Int32" FilterControlAltText="Filter codMatriz_PS_CLIENTES column" HeaderText="ID PESSOA" SortExpression="codMatriz_PS_CLIENTES" UniqueName="codMatriz_PS_CLIENTES">
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="razaosocial_PS_JURIDICA" FilterControlAltText="Filter razaosocial_PS_JURIDICA column" HeaderText="NOME FANTASIA" SortExpression="razaosocial_PS_JURIDICA" UniqueName="razaosocial_PS_JURIDICA">
                    <HeaderStyle CssClass="col-xs-6" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SITUACAO" FilterControlAltText="Filter SITUACAO column" HeaderText="SITUACAO" ReadOnly="True" SortExpression="SITUACAO" UniqueName="SITUACAO">
                    <HeaderStyle CssClass="col-xs-2" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn  Aggregate="Sum" FooterAggregateFormatString="{0:C}"  DataField="vlReducao01" DataType="System.Decimal" FilterControlAltText="Filter vlReducao01 column"  SortExpression="vlReducao01" UniqueName="vlReducao01">
                    <EditItemTemplate>
                        <asp:TextBox ID="vlReducao01TextBox" runat="server" Text='<%# Bind("vlReducao01") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vlReducao01Label" runat="server" Text='<%# Eval("vlReducao01", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                     <HeaderTemplate>
                           <asp:Label ID="Headermes01Label" runat="server" Text='<%#  Session("DtMes01")  %>'></asp:Label>
                    </HeaderTemplate>
                    <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Aggregate="Sum"   FooterAggregateFormatString="{0:C}"  DataField="vlReducao02" DataType="System.Decimal" FilterControlAltText="Filter vlReducao02 column"  SortExpression="vlReducao02" UniqueName="vlReducao02">
                    <EditItemTemplate>
                        <asp:TextBox ID="vlReducao02TextBox" runat="server" Text='<%# Bind("vlReducao02") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="vlReducao02Label" runat="server" Text='<%# Eval("vlReducao02", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                <HeaderTemplate>
                    
                       <asp:Label ID="Headermes02Label"  runat="server" Text='<%#  Session("DtMes02")  %>'></asp:Label>
                   </HeaderTemplate>
                   
                    <HeaderStyle CssClass="col-xs-1" />
           
                </telerik:GridTemplateColumn>
                          <telerik:GridTemplateColumn  FilterControlAltText="Filter DIFERENCA column" HeaderText="DIFERENÇA" UniqueName="DIFERENCA">
                              <ItemTemplate>
                                    <asp:Label ID="DtMes02DDLabel" runat="server" Text='<%# FormatCurrency(Decimal.Subtract(IIf(Eval("vlReducao02") Is DBNull.Value, "0", Eval("vlReducao02")), IIf(Eval("vlReducao01") Is DBNull.Value, "0", Eval("vlReducao01")))) %>'></asp:Label>
                              </ItemTemplate>
                              <HeaderStyle CssClass="col-xs-1" />
                </telerik:GridTemplateColumn>
                          </Columns>
        </MasterTableView>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>

    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSourceBuscaFaturamento"  CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SP_FI_TOTALFAURADO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="DtMes01" SessionField="DtMes01" Type="String" />
            <asp:SessionParameter Name="DtMes02" SessionField="DtMes02" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
