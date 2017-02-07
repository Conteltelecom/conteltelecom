﻿<%@ Page Title="FATURAS DO CLIENTE" Language="vb" AutoEventWireup="false" MasterPageFile="~/web/area_cliente/web/ac_web.master" CodeBehind="ac_faturas.aspx.vb" Inherits="conteltelecom.ac_faturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">    

    <%-- filtro --%>
    <br />
    <fieldset>
        <div class="panel panel-default">
            <div class="panel-body">
               
                <legend>FILTRO</legend>
                <div class="form-horizontal">
                    <br />

                    <div class="form-group">
                        <asp:Label ID="Label1" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="MÊS REF.:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDatePicker Width="95%" ID="RadDatePickerMesReferencia" runat="server">
                                <DateInput ID="DateInput1" DateFormat="MMMM yyyy" Width="95%" runat="server" Enabled="true">
                                </DateInput>
                            </telerik:RadDatePicker>
                        </div>
                        <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label" runat="server" Text="VENCIMENTO:"></asp:Label>
                        <div class="col-lg-4">
                            <telerik:RadDatePicker Width="95%" ID="RadDatePickerVencimento" runat="server">
                                <DateInput ID="DateInput2" DateFormat="MMMM yyyy" Width="95%" runat="server" Enabled="true">
                                </DateInput>
                            </telerik:RadDatePicker>
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align: right">
                        <hr />
                        <div>
                            <telerik:RadButton ID="RadButtonPesquisar" OnClick="RadButtonPesquisar_Click" runat="server" Skin="Bootstrap" Text="PESQUISAR">
                                <Icon PrimaryIconUrl="../../../img/search.png" />
                            </telerik:RadButton>
                            <telerik:RadButton ID="RadButtonLimpar" runat="server" Skin="Bootstrap" Text="LIMPAR">
                                <Icon PrimaryIconUrl="../../../img/Limpar.png" />
                            </telerik:RadButton>
                        </div>
                    </div>

                </div><!-- fim form-horizontal -->
            </div><!-- fim panel-body -->
        </div><!-- fim panel panel-default -->
    </fieldset>
    <hr />


    <telerik:RadGrid ID="RadGridAcFaturas" runat="server" RenderMode="Auto" Width="100%" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceFaturas">
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <MasterTableView DataKeyNames="id_ANEXOS_FATURAS" DataSourceID="SqlDataSourceFaturas">

            <Columns>
                <telerik:GridClientSelectColumn FilterControlAltText="Filter Selecionar column" UniqueName="Selecionar">
                </telerik:GridClientSelectColumn>
                <telerik:GridBoundColumn DataField="id_ANEXOS_FATURAS" DataType="System.Int32" FilterControlAltText="Filter id_ANEXOS_FATURAS column" HeaderText="ID" ReadOnly="True" SortExpression="id_ANEXOS_FATURAS" UniqueName="id_ANEXOS_FATURAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="desc_OP_OPERADORAS" FilterControlAltText="Filter desc_OP_OPERADORAS column" HeaderText="OPERADORA" SortExpression="desc_OP_OPERADORAS" UniqueName="desc_OP_OPERADORAS">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mesReferencia_SF_LEITURA_FATURA" FilterControlAltText="Filter mesReferencia_SF_LEITURA_FATURA column" HeaderText="MÊS REF." SortExpression="mesReferencia_SF_LEITURA_FATURA" UniqueName="mesReferencia_SF_LEITURA_FATURA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dtVencimento_SF_LEITURA_FATURA" DataType="System.DateTime" FilterControlAltText="Filter dtVencimento_SF_LEITURA_FATURA column" HeaderText="VENCIMENTO" SortExpression="dtVencimento_SF_LEITURA_FATURA" UniqueName="dtVencimento_SF_LEITURA_FATURA" DataFormatString="{0:d}">
                    <ItemStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vlTotal_SF_CAD_LEIAUTE" DataType="System.Decimal" FilterControlAltText="Filter vlTotal_SF_CAD_LEIAUTE column" HeaderText="TOTAL" SortExpression="vlTotal_SF_CAD_LEIAUTE" UniqueName="vlTotal_SF_CAD_LEIAUTE">
                    <ItemStyle CssClass="col-xs-3" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter visualizar column" UniqueName="visualizar">
                    <ItemTemplate>
                        <asp:HyperLink ID="VISUALIZAR" runat="server" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "0") %>' ImageUrl="~/img/pdf_Visualizar_32.png"></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle Width="32px" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="caminho_ANEXOS_FATURAS" FilterControlAltText="Filter caminho_ANEXOS_FATURAS column" SortExpression="caminho_ANEXOS_FATURAS" UniqueName="baixar">
                    <EditItemTemplate>
                        <asp:TextBox ID="caminho_ANEXOS_FATURASTextBox" runat="server" Text='<%# Bind("caminho_ANEXOS_FATURAS") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="Baixar" runat="server" ImageUrl="~/img/pdf_32.png" NavigateUrl='<%# String.Format("~/visualizar_pdf.aspx?caminho_ANEXOS_FATURAS={0}&id_ANEXOS_FATURAS={1}&IsDownload={2}", Eval("caminho_ANEXOS_FATURAS"), Eval("id_ANEXOS_FATURAS"), "1") %>'></asp:HyperLink>
                    </ItemTemplate>

                    <HeaderStyle Width="32px" />

                </telerik:GridTemplateColumn>

            </Columns>
        </MasterTableView>
    </telerik:RadGrid>


    <%-- mensagem de erro do try catch --%>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Skin="Sunset" MaxWidth="300px" MaxHeight="200px"  >
     </telerik:RadWindowManager>


    <asp:SqlDataSource ID="SqlDataSourceFaturas" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecom %>" SelectCommand="SELECT DISTINCT ANEXOS_FATURAS.id_ANEXOS_FATURAS, ANEXOS_FATURAS.desc_ANEXOS_FATURAS, SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA, SF_LEITURA_FATURA.id_OP_OPERADORAS, SF_LEITURA_FATURA.vlTotal_SF_CAD_LEIAUTE, OP_OPERADORAS.desc_OP_OPERADORAS, ANEXOS_FATURAS.caminho_ANEXOS_FATURAS, SF_LEITURA_FATURA.id_SF_LEITURA_FATURA, SF_LEITURA_FATURA.numFatura_SF_LEITURA_FATURA, SF_LEITURA_FATURA.numFoneAgrupador_SF_LEITURA_FATURA, SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtPeriodo_ini_SF_LEITURA_FATURA, SF_LEITURA_FATURA.dtPeriodo_Fim_SF_LEITURA_FATURA, '01/' + SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA AS Mes FROM ANEXOS_FATURAS INNER JOIN SF_LEITURA_FATURA ON ANEXOS_FATURAS.id_SF_LEITURA_FATURA = SF_LEITURA_FATURA.id_SF_LEITURA_FATURA INNER JOIN OP_OPERADORAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = OP_OPERADORAS.id_OP_OPERADORAS INNER JOIN LI_LINHAS ON SF_LEITURA_FATURA.id_OP_OPERADORAS = LI_LINHAS.id_OP_OPERADORAS AND dbo.MascaraSomenteNumeros(SF_LEITURA_FATURA.cotAgrupador_SF_LEITURA_FATURA) = dbo.MascaraSomenteNumeros(LI_LINHAS.numContrato_LI_LINHAS) INNER JOIN PS_CLIENTES ON LI_LINHAS.id_PS_CLIENTES = PS_CLIENTES.id_PS_CLIENTES WHERE (PS_CLIENTES.codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES)">
        <SelectParameters>
            <asp:SessionParameter Name="codMatriz_PS_CLIENTES" SessionField="idEmpresa_PS_PESSOA" />
        </SelectParameters>
    </asp:SqlDataSource>
    

</asp:Content>