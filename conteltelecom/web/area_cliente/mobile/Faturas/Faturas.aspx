<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="Faturas.aspx.vb" Inherits="conteltelecom.Faturas" %>
<% @ Register TagPrefix = "controle" TagName = "list_view_vazia"   Src = "~/web/area_cliente/mobile/ascx/WebUserControlListview.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
    <blockquote style=" border-top:0px !important" >
    <h2 class="page_title">FATURAS</h2>
       <h6 class="page_title">
         
        <asp:Label ID="LabelMesAtual" runat="server" Text=""></asp:Label>-<asp:Label ID="LabelAnoAtual" runat="server" Text=""></asp:Label></h6>
    </blockquote> 
    <telerik:RadListView ID="RadListViewFaturas" runat="server" DataSourceID="SqlDataSourceFaturas" Skin="Bootstrap" DataKeyNames="id_ANEXOS_FATURAS"><LayoutTemplate>
        <div>
            <table cellspacing="0" style="width:100%;">
                <thead>
                    <tr class="rlvHeader">
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </tbody>
            </table>
        </div>
</LayoutTemplate>
        <ItemTemplate>
             <asp:HyperLink ID="HyperLinkMes"  Target="_blank"  NavigateUrl='<%# String.Format(Eval("caminho_ANEXOS_FATURAS")) %>' runat="server">

                             <div class="service_box">
                           
                                 <asp:Label ID="Labelid_ANEXOS_FATURAS" runat="server" Visible="false"  Text='<%# Eval("id_ANEXOS_FATURAS") %>'></asp:Label>
                         
                                  <asp:Label ID="Label_caminho_ANEXOS_FATURAS" runat="server" Visible="false"  Text='<%# Eval("caminho_ANEXOS_FATURAS") %>'></asp:Label>
                                            <div class="services_icon" >
                                                    <asp:Image id="ImgOperadora" runat="server" ImageUrl='<%# Eval("url_OP_OPERADORAS") %>' />
                                            </div>
                                              
                                           <div class="service_content">
                                              <h4>FATURA: <asp:Label ID="vlTotal_SF_CAD_LEIAUTELabel" Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'     runat="server" Text='<%# Eval("vlTotal_SF_CAD_LEIAUTE", "{0:C}") %>'></asp:Label></h4>
                                              <h6>VENCIMENTO: <asp:Label ID="Label1" runat="server" Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'  Text='<%# Eval("dtVencimento_SF_LEITURA_FATURA", "{0:d}") %>'></asp:Label> </h6>
                                              <h6>OPERADORA: <asp:Label ID="Label2" runat="server" Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'  Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label> <h6>
                                          </div>
                                        </div>
               </asp:HyperLink>  

        </ItemTemplate>
        <AlternatingItemTemplate>
        <asp:HyperLink ID="HyperLinkMes"  Target="_blank"  NavigateUrl='<%# String.Format(Eval("caminho_ANEXOS_FATURAS")) %>' runat="server">

                      <div class="service_box">
                            
                                       <asp:Label ID="Labelid_ANEXOS_FATURAS" runat="server" Visible="false"  Text='<%# Eval("id_ANEXOS_FATURAS") %>'></asp:Label>
                         
                                  <asp:Label ID="Label_caminho_ANEXOS_FATURAS" runat="server" Visible="false"  Text='<%# Eval("caminho_ANEXOS_FATURAS") %>'></asp:Label>
                                            <div class="services_icon" >
                                                    <asp:Image id="ImgOperadora" runat="server" ImageUrl='<%# Eval("url_OP_OPERADORAS") %>' />
                                            </div>
                                             
                                           <div class="service_content">
                                              <h4>FATURA:<asp:Label ID="vlTotal_SF_CAD_LEIAUTELabel"  Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'    runat="server" Text='<%# Eval("vlTotal_SF_CAD_LEIAUTE", "{0:C}") %>'></asp:Label></h4>
                                              <h6>VENCIMENTO: <asp:Label ID="Label1" runat="server"  Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'   Text='<%# Eval("dtVencimento_SF_LEITURA_FATURA", "{0:d}") %>'></asp:Label> </h6>
                                              <h6>OPERADORA: <asp:Label ID="Label2" runat="server" Font-Strikeout  ='<%# If(Eval("strikeout_AN_STATUS").ToString() = "0", "False", "True")  %>'  Text='<%# Eval("desc_OP_OPERADORAS") %>'></asp:Label> <h6>
                                          </div>
                                        </div>
               </asp:HyperLink>   
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr class="rlvIEdit">
                <td>
                    <table cellspacing="0" class="rlvEditTable">
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd" Text=" " ToolTip="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
        <EmptyDataTemplate>
            <controle:list_view_vazia runat="server"  ID="ListVazia" ></controle:list_view_vazia>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr class="rlvISel">
            </tr>
        </SelectedItemTemplate>
    </telerik:RadListView>



    


    <asp:SqlDataSource ID="SqlDataSourceFaturas" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA, SF_LEITURA_FATURA.id_OP_OPERADORAS, OP_OPERADORAS.desc_OP_OPERADORAS, SF_LEITURA_FATURA.vlTotal_SF_CAD_LEIAUTE, ANEXOS_FATURAS.id_ANEXOS_FATURAS, ANEXOS_FATURAS.caminho_ANEXOS_FATURAS, OP_OPERADORAS.url_OP_OPERADORAS, AN_STATUS.corFonte_AN_STATUS, AN_STATUS.strikeout_AN_STATUS FROM SF_LEITURA_FATURA INNER JOIN OP_OPERADORAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN LI_LINHAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = LI_LINHAS.id_OP_OPERADORAS AND dbo.MascaraSomenteNumeros(SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA) = dbo.MascaraSomenteNumeros(LI_LINHAS.numContrato_LI_LINHAS) INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES INNER JOIN ANEXOS_FATURAS ON SF_LEITURA_FATURA.id_SF_LEITURA_FATURA = ANEXOS_FATURAS.id_SF_LEITURA_FATURA INNER JOIN AN_STATUS ON ANEXOS_FATURAS.id_AN_STATUS = AN_STATUS.id_AN_STATUS WHERE (RIGHT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 4) = @AnoAtual) AND (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES) AND (LEFT (RTRIM(SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA), 2) = @MesAtual) ORDER BY SF_LEITURA_FATURA.id_OP_OPERADORAS, SF_LEITURA_FATURA.vlTotal_SF_CAD_LEIAUTE DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="AnoAtual" QueryStringField="AnoAtual" />
            <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
            <asp:QueryStringParameter Name="MesAtual" QueryStringField="MesAtual" />
        </SelectParameters>
</asp:SqlDataSource>


</asp:Content>
