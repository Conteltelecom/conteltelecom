<%@ Page Title="DETALHES DE UF" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_uf_detalhes.aspx.vb" Inherits="conteltelecom.ps_uf_detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadDataForm ID="RadDataFormUF" runat="server" DataSourceID="SqlDataSourceUF">
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
                </div> </div>
            <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES UF</legend>
                <div class="col-lg-12">
                    <div class=" form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓDIGO UF:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="id_PS_CIDADESLabel" Font-Bold="false" runat="server" Text='<%# Eval("cod_PS_UF") %>' />
                            </div>

                        </div>
                         <div class="form-group">

                            <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="DESCRIÇÃO:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label2" Font-Bold="false" runat="server" Text='<%# Eval("desc_PS_UF") %>' />
                            </div>

                        </div>
                          <div class="form-group">

                            <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label5" Font-Bold="false" runat="server" Text='<%# If(Eval("st_PS_UF") = 1, "ATIVO", "INATIVO") %>' />
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
                            <telerik:RadButton ID="CancelButton_Ins" runat="server" CausesValidation="False" OnClick="CancelButtonVoltar_Click"   Text="CANCELAR" ToolTip="CANCLEAR">
                                <Icon PrimaryIconUrl="../../img/block.png" />
                            </telerik:RadButton>
                        </div> 
            <fieldset class="fieldsetForms">
                            <legend>INFORMAÇÕES DO CLIENTE</legend>
                            <div class="form-inline">
                                <div class="col-lg-12 form-group">
                                   <asp:Label ID="LabelCond_ins" runat="server" CssClass="col-lg-2 control-label" Text="CÓDIGO UF:"></asp:Label>
                                    <div class="col-lg-10">
                                         <asp:TextBox ID="TextBoxcod_PS_UF_ins"  MaxLength="2"   runat="server" CssClass="form-control" />
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorcod_PS_UF_Ins" ControlToValidate="TextBoxcod_PS_UF_ins" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" />
                                    </div>
                                    </div>
                                <div class="col-lg-12 form-group">
                                   <asp:Label ID="Label6" runat="server" CssClass="col-lg-2 control-label" Text="DESCRIÇÃO:"></asp:Label>
                                    <div class="col-lg-10">
                                        <asp:TextBox ID="TextBoxdesc_PS_UF_ins" Width="100%" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxdesc_PS_UF_ins" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" />
                                         </div>
                                    </div>
                                <div class="col-lg-12 form-group">
                                   <asp:Label ID="Label7" runat="server" CssClass="col-lg-2 control-label" Text="SITUAÇÃO:"></asp:Label>
                                    <div class="col-lg-10">
                                        <asp:CheckBox ID="CheckBoxSituacao_ins" Checked="true"  runat="server" />
                                    </div>
                                    </div>
                                </div>
                </fieldset>
        </InsertItemTemplate>
        <EditItemTemplate>
            <div style="text-align:right">
                        <telerik:RadButton ID="UpdateButton" runat="server" ValidationGroup="Sim"  CommandName="Update" Text="SALVAR" ToolTip="SALVAR">
                                   <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"  Text="CANCELAR" ToolTip="CANCLEAR">
                                <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                          </div> 
            <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES UF</legend>
                <div class="col-lg-12">
                    <div class=" form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓDIGO UF:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:label ID="id_PS_CIDADESLabel" Font-Bold="false" CssClass="form-control" runat="server" Text='<%# Eval("cod_PS_UF") %>' />
                            </div>

                        </div>
                         <div class="form-group">

                            <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="DESCRIÇÃO:" />

                            <div class="col-lg-10" style="text-align: left !important">
                                <asp:textbox ID="TextBoxdesc_PS_UF" runat="server" Text='<%# Eval("desc_PS_UF") %>' />
                            </div>

                        </div>
                          <div class="form-group">

                            <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />

                            <div class="col-lg-10 " style="text-align: left !important">
                                <asp:CheckBox ID="CheckBoxSituacao" Checked='<%# Bind("st_PS_UF") %>' runat="server" />
                            </div>

                        </div>
                        </div>
                    </div>
                </fieldset>
        </EditItemTemplate>
    </telerik:RadDataForm>

    <asp:SqlDataSource ID="SqlDataSourceUF" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPs_UF" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_UF(cod_PS_UF, desc_PS_UF, st_PS_UF) VALUES (@cod_PS_UF, @desc_PS_UF, @st_PS_UF)" UpdateCommand="UPDATE PS_UF SET desc_PS_UF = @desc_PS_UF, st_PS_UF = @st_PS_UF WHERE (cod_PS_UF = @cod_PS_UF)">
        <InsertParameters>
            <asp:Parameter Name="cod_PS_UF" />
            <asp:Parameter Name="desc_PS_UF" />
            <asp:Parameter Name="st_PS_UF" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="cod_PS_UF" QueryStringField="cod_PS_UF" Type="String" />
            <asp:Parameter Name="Desc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_UF" />
            <asp:Parameter Name="st_PS_UF" />
            <asp:Parameter Name="cod_PS_UF" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
