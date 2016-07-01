<%@ Page Title="DETALHES DAS CIDADES" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_cidades_detalhes.aspx.vb" Inherits="conteltelecom.ps_cidades_detalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
   
    <telerik:RadDataForm ID="RadDataFormCidades"  runat="server" DataSourceID="SqlDataSourceCidades">
        <LayoutTemplate>
            <div id="itemPlaceholder" runat="server"></div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="rdfCommandButtons">
                <div style="text-align: right">
                    <telerik:RadButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="EDITAR" ToolTip="EDITAR">
                        <Icon PrimaryIconUrl="../../img/Editar.png" />
                    </telerik:RadButton>

                    <telerik:RadButton ID="CancelButtonVoltar" runat="server" OnClick="CancelButtonVoltar_Click" CausesValidation="False" Text="CANCELAR" ToolTip="CANCLEAR" NavigateUrl="javascript:history.go(-1);">
                        <Icon PrimaryIconUrl="../../img/block.png" />
                    </telerik:RadButton>
                </div>
            </div>

            <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES CIDADE</legend>
                <div class="col-lg-12">
                    <div class=" form-horizontal">
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓDIGO:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="id_PS_CIDADESLabel" Font-Bold="false" runat="server" Text='<%# Eval("id_PS_CIDADES") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="DESCRIÇÃO:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label2" runat="server" Font-Bold="false" Text='<%# Eval("desc_PS_CIDADES") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="UF:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label5" runat="server" Font-Bold="false" Text='<%# Eval("cod_PS_UF") %>' />
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="Label9" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label10" runat="server" Font-Bold="false" Text='<%# If(Eval("st_PS_CIDADES") = 1, "ATIVO", "INATIVO") %>' />
                            </div>
                        </div>
                    </div>
                </div>
                </div>

            </fieldset>
        </ItemTemplate>
        <InsertItemTemplate>
         <div style="text-align: right">
                        <telerik:RadButton ID="UpdateButtonI" runat="server" ValidationGroup="Sim" CommandName="PerformInsert" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton_Ins" runat="server" CausesValidation="False" OnClick="CancelButtonVoltar_Click" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
                    <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO CLIENTE</legend>
                        <div class="form-inline">
                                                        <div class="col-lg-12 form-group">
                                <asp:Label ID="desc_PS_CIDADESLabeNome_ins" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_CIDADES_Ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8_ins" ControlToValidate="TextBoxdesc_PS_CIDADES_Ins" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelUF_ins" runat="server" CssClass="col-lg-2 control-label" Text="UF:"></asp:Label>
                                <div class="col-lg-10">
                                    <telerik:RadComboBox ID="RadComboBoxUF_Ins" DataSourceID="SqlDataSourceUF" DataValueField="cod_PS_UF" DataTextField="cod_PS_UF" runat="server"></telerik:RadComboBox>
                                </div>
                            </div>
                             <div class="col-lg-12 form-group">
                                <asp:Label ID="Label8" runat="server" CssClass="col-lg-2 control-label" Text="SITUAÇÃO:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:CheckBox ID="CheckBoxst_PS_CIDADES_Ins"  Checked="true"  runat="server" />
                                </div>
                            </div>
                        </div>
                    </fieldset> 
                   
               
        </InsertItemTemplate>
        <EditItemTemplate>
            
                <div style="text-align: right">
                        <telerik:RadButton ID="UpdateButton" runat="server" ValidationGroup="Sim" CommandName="Salvar"   Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
            
                     <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO CLIENTE</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelCond" runat="server" CssClass="col-lg-2 control-label" Text="CÓDIGO:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:Label ID="Labelid_PS_CIDADES" runat="server" Text='<%# Bind("id_PS_CIDADES") %>' CssClass="col-lg-2 control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="desc_PS_CIDADESLabeNome" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_CIDADES" Width="100%" runat="server"  Text='<%# Bind("desc_PS_CIDADES") %>' CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBoxdesc_PS_CIDADES" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label6" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxUF" Text='<%#Bind("cod_PS_UF") %>'  Visible="false"  runat="server"></asp:TextBox>
                                    <telerik:RadComboBox ID="RadComboBoxUF" DataSourceID="SqlDataSourceUF" DataValueField="cod_PS_UF" DataTextField="cod_PS_UF" runat="server"></telerik:RadComboBox>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label7" runat="server" CssClass="col-lg-2 control-label" Text="SITUACÃO:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:CheckBox ID="CheckBoxst_PS_CIDADES" Checked='<%#Bind("st_PS_CIDADES")%>' runat="server" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                          </EditItemTemplate>
    </telerik:RadDataForm>

     
    <asp:SqlDataSource ID="SqlDataSourceUF" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCidades" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPs_Cidades" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_CIDADES(desc_PS_CIDADES, st_PS_CIDADES, cod_PS_UF) VALUES (@desc_PS_CIDADES, @st_PS_CIDADES, @cod_PS_UF)" UpdateCommand="UPDATE PS_CIDADES SET desc_PS_CIDADES = @desc_PS_CIDADES, cod_PS_UF = @cod_PS_UF, st_PS_CIDADES = @st_PS_CIDADES WHERE (id_PS_CIDADES = @id_PS_CIDADES)">
        <InsertParameters>
            <asp:Parameter Name="desc_PS_CIDADES" />
            <asp:Parameter Name="st_PS_CIDADES" />
            <asp:Parameter Name="cod_PS_UF" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codIni" QueryStringField="id_PS_CIDADES" Type="Int32" />
            <asp:QueryStringParameter Name="codFim" QueryStringField="id_PS_CIDADES" Type="Int32" />
            <asp:Parameter Name="Desc" Type="String" />
            <asp:Parameter Name="UF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_CIDADES"  />
            <asp:Parameter Name="cod_PS_UF"  />
            <asp:Parameter Name="st_PS_CIDADES"   />
            <asp:Parameter Name="id_PS_CIDADES" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>

