<%@ Page Title="" Language="vb" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageCli.master" CodeBehind="ps_cliente_detalhes.aspx.vb" Inherits="conteltelecom.ps_cliente_detalhes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder12" runat="server">
        <telerik:RadDataForm ID="RadDataForm1" runat="server" DataSourceID="SqlDataSourcePessaoas" Skin="Bootstrap">
                    <LayoutTemplate>
            <div id="itemPlaceholder" runat="server"></div>
        </LayoutTemplate>
        <ItemTemplate>
                        <div class="rdfCommandButtons">
                <div style="text-align: right">
                    <telerik:RadButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="EDITAR" ToolTip="EDITAR">
                        <Icon PrimaryIconUrl="../../img/Editar.png" />
                    </telerik:RadButton>

                    <telerik:RadButton ID="CancelButtonVoltar" runat="server" OnClick="CancelButton_Click" CausesValidation="False" Text="CANCELAR" ToolTip="CANCLEAR" NavigateUrl="javascript:history.go(-1);">
                        <Icon PrimaryIconUrl="../../img/block.png" />
                    </telerik:RadButton>
                </div>

            </div>

            <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES CLIENTE</legend>
                <div class="col-lg-12">
                    <div class=" form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓDIGO:" />

                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="id_PS_CIDADESLabel" Font-Bold="false" runat="server" Text='<%# Eval("id_PS_PESSOA") %>' />
                            </div>

                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="NOME FANTASIA:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label2" runat="server" Font-Bold="false" Text='<%# Eval("desc_PS_PESSOA")%>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="RAZÃO SOCIAL:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label5" runat="server" Font-Bold="false" Text='<%# Eval("razaosocial_PS_JURIDICA") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CNPJ:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label7" runat="server" Font-Bold="false" Text='<%# Eval("CNPJ_PS_JURIDICA") %>' />
                            </div>
                            <asp:Label ID="Label8" runat="server" CssClass="col-lg-3 control-label" Font-Bold="true" Text="INSCRIÇÃO ESTADUAL:" />
                            <div class="col-lg-3 control-label" style="text-align: left !important">
                                <asp:Label ID="Label9" runat="server" Font-Bold="false" Text='<%# Eval("InsEstadual_PS_JURIDICA") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label22" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CÓD DA MATRIZ:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label23" runat="server" Font-Bold="false" Text='<%# Eval("codMatriz_PS_CLIENTES") %>' />
                                -<asp:Label ID="Label41" runat="server" Font-Bold="false" Text='<%# Eval("descMatriz") %>' />
                            </div>
                        </div>
                    </div>
                </div>
                

            </fieldset>
            <br />
            <fieldset class="fieldsetForms">
                <legend>ENDEREÇO</legend>
                <div class="col-lg-12">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <asp:Label ID="Label24" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="UF:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label26" Font-Bold="false" runat="server" Text='<%# Eval("cod_PS_UF") %>' />
                            </div>
                            <asp:Label ID="Label27" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CIDADE:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label28" runat="server" Font-Bold="false" Text='<%# Eval("desc_PS_CIDADES") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label29" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="BAIRRO:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label30" Font-Bold="false" runat="server" Text='<%# Eval("bairro_PS_PESSOA") %>' />
                            </div>
                            <asp:Label ID="Label31" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="CEP:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label32" Font-Bold="false" runat="server" Text='<%# Eval("cep_PS_PESSOA") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label25" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="RUA:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label33" Font-Bold="false" runat="server" Text='<%# Eval("endereco_PS_PESSOA") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label34" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="NÚMERO:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label35" Font-Bold="false" runat="server" Text='<%# Eval("numEndereco_PS_PESSOA") %>' />
                            </div>
                            <asp:Label ID="Label36" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="COMPLMENETO:" />
                            <div class="col-lg-4 control-label" style="text-align: left !important">
                                <asp:Label ID="Label37" runat="server" Font-Bold="false" Text='<%# Eval("complemeto_PS_PESSOA") %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label38" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="OBSERVAÇÕES:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label39" runat="server" Font-Bold="false" Text='<%# Eval("obs_PS_PESSOA") %>' />
                            </div>

                        </div>
                          <div class="form-group">
                            <asp:Label ID="Label42" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:Label ID="Label43" runat="server" Font-Bold="false" Text='<%# If(Eval("st_PS_PESSOA") = 1, "ATIVO", "INATIVO") %>' />
                            </div>

                        </div>
                    </div>
                </div>

            </fieldset>

        </ItemTemplate>
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanelRadDataForm_Ins" runat="server">

                <ContentTemplate>
                    <div style="text-align: right">

                        <telerik:RadButton ID="UpdateButtonI" runat="server" ValidationGroup="Sim" CommandName="PerformInsert" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton_Ins" runat="server" CausesValidation="False" OnClick="CancelButton_Click" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
                    <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO CLIENTE</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelCondI" runat="server" CssClass="col-lg-2 control-label" Text="CÓDIGO:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:Label ID="Labelid_PS_PESSOAI" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="desc_PS_CIDADESLabeNome" runat="server" CssClass="col-lg-2 control-label" Text="NOME FANTASIA:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8i" ControlToValidate="TextBoxdesc_PS_PESSOA_Ins" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label10I" runat="server" CssClass="col-lg-2 control-label" Text="RAZÃO SOCIAL:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxrazaosocial_PS_JURIDICA_Ins" runat="server" CssClass="form-control" Width="100%" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label11i" runat="server" CssClass="col-lg-2 control-label" Text="CNPJ:"></asp:Label>
                                <div class="col-lg-4 ">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxCnpj_Ins" Width="100%" Mask="##.###.###/####-##" CssClass="form-control" runat="server"></telerik:RadMaskedTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxCNPJ_PS_JURIDICAI" ControlToValidate="RadMaskedTextBoxCnpj_Ins"   ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                
                                </div>
                                <asp:Label ID="Label12I" runat="server" CssClass="col-lg-2 control-label" Text="INSCRIÇÃO ESTADUAL:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxInsEstadual_PS_JURIDICA_Ins" Width="100%" runat="server" CssClass="form-control" />

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label21I" runat="server" CssClass="col-lg-2 control-label" Text="CÓD DA MATRIZ"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcodMatriz_PS_CLIENTES_Ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTextBoxCNPJI" runat="server" Enabled="True" TargetControlID="TextBoxcodMatriz_PS_CLIENTES_Ins" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="LabeldescMatriz_ins" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </fieldset>
                    <br />
                    <fieldset class="fieldsetForms">
                        <legend>ENDEREÇO</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label13I" runat="server" CssClass="col-lg-2 control-label" Text="UF:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxuF_Ins" runat="server" Visible="false"></asp:TextBox>
                                    <telerik:RadDropDownList ID="RadDropDownListuF_Ins" Width="100%" OnSelectedIndexChanged="RadDropDownListuF_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSourceUf" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                                </div>
                                <asp:Label ID="Label17i" runat="server" CssClass="col-lg-2 control-label" Text="CIDADES:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:UpdatePanel ID="UpdatePanelRadDropDownListCidade_ins" runat="server" UpdateMode="Always">
                                        <ContentTemplate>
                                            <asp:TextBox ID="TextBoxid_PS_CIDADES_Ins" runat="server" Visible="false"></asp:TextBox>

                                            <telerik:RadDropDownList ID="RadDropDownListCidade_Ins" Width="100%" runat="server" DataSourceID="SqlDataSourceDropGrid" DataTextField="desc_PS_CIDADES" DataValueField="id_PS_CIDADES" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label15i" runat="server" CssClass="col-lg-2 control-label" Text="BAIRRO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxbairro_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                                <asp:Label ID="Label16I" runat="server" CssClass="col-lg-2 control-label" Text="CEP:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcep_PS_PESSOA_Ins" runat="server" Width="100%" CssClass="form-control" Visible="false" />
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcep_PS_PESSOA_Ins" Width="100%" Mask="#####-###" runat="server"></telerik:RadMaskedTextBox>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label14i" runat="server" CssClass="col-lg-2 control-label" Text="RUA:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxendereco_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label18i" runat="server" CssClass="col-lg-2 control-label" Text="NÚMERO:"></asp:Label>
                                <div class="col-lg-4 ">
                                    <asp:TextBox ID="TextBoxnumEndereco_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNUM_Ins" runat="server" Enabled="True" TargetControlID="TextBoxnumEndereco_PS_PESSOA_Ins" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
                                </div>
                                <asp:Label ID="Label19I" runat="server" CssClass="col-lg-2 control-label" Text="COMPLEMENTO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcomplemeto_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label20I" runat="server" CssClass="col-lg-2 control-label" Text="OBSERVAÇÕES:"></asp:Label>
                                <div class="col-lg-10 ">
                                    <asp:TextBox ID="TextBoxobs_PS_PESSOA_Ins" runat="server" Width="100%" CssClass="form-control" Height="150px" />

                                </div>
                            </div>
                              <div class="form-group">
                            <asp:Label ID="Label42_ins" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                            <div class="col-lg-10 control-label" style="text-align: left !important">
                                <asp:CheckBox ID="CheckBoxst_PS_PESSOA_ins" Checked ="true"  runat="server" />
                            </div>

                        </div>


                        </div>
                    </fieldset>

                </ContentTemplate>
            </asp:UpdatePanel>
        </InsertItemTemplate>
        <EditItemTemplate>
            <asp:UpdatePanel ID="UpdatePanelRadDataForm" runat="server">
                <ContentTemplate>

                    <div style="text-align: right !important">


                        <telerik:RadButton ID="UpdateButton" runat="server" ValidationGroup="Sim" CommandName="Update" CssClass ="col-lg-1" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton" runat="server" CssClass="col-lg-1" CausesValidation="False" CommandName="Cancel" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
                    <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO CLIENTE</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label40" runat="server" CssClass="col-lg-2 control-label" Text="CÓDIGO:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:Label ID="Labelid_PS_PESSOA" runat="server" CssClass="col-lg-2 control-label" Text='<%# Bind("id_PS_PESSOA") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="desc_PS_CIDADESLabel2" runat="server" CssClass="col-lg-2 control-label" Text="NOME FANTASIA:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_PESSOA" Width="100%" runat="server" CssClass="form-control" Text='<%# Bind("desc_PS_PESSOA") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBoxdesc_PS_PESSOA" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label10" runat="server" CssClass="col-lg-2 control-label" Text="RAZÃO SOCIAL:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxrazaosocial_PS_JURIDICA" runat="server" CssClass="form-control" Width="100%" Text='<%# Bind("razaosocial_PS_JURIDICA") %>' />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label11" runat="server" CssClass="col-lg-2 control-label" Text="CNPJ:"></asp:Label>
                                <div class="col-lg-4 ">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxCnpj" Width="100%" Mask="##.###.###/####-##" CssClass="form-control" Text='<%# Bind("CNPJ_PS_JURIDICA") %>' runat="server"></telerik:RadMaskedTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxCNPJ_PS_JURIDICA" ControlToValidate="RadMaskedTextBoxCnpj" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="Sim" />
                                </div>
                                <asp:Label ID="Label12" runat="server" CssClass="col-lg-2 control-label" Text="INSCRIÇÃO ESTADUAL:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxInsEstadual_PS_JURIDICA" Width="100%" runat="server" Text='<%# Bind("InsEstadual_PS_JURIDICA") %>' CssClass="form-control" />

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label21" runat="server" CssClass="col-lg-2 control-label" Text="CÓD DA MATRIZ"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcodMatriz_PS_CLIENTES" Width="100%" runat="server" Text='<%# Bind("codMatriz_PS_CLIENTES") %>' CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTextBoxCNPJ" runat="server" Enabled="True" TargetControlID="TextBoxcodMatriz_PS_CLIENTES" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="LabeldescMatriz" runat="server" Text='<%# Bind("descMatriz") %>'></asp:Label>
                                </div>
                            </div>

                        </div>
                    </fieldset>
                    <br />
                    <fieldset class="fieldsetForms">
                        <legend>ENDEREÇO</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label13" runat="server" CssClass="col-lg-2 control-label" Text="UF:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxuF" runat="server" Visible="false" Text='<%# Bind("cod_PS_UF") %>'></asp:TextBox>
                                    <telerik:RadDropDownList ID="RadDropDownListuF" Width="100%" OnSelectedIndexChanged="RadDropDownListuF_SelectedIndexChanged" SelectedValue='<%# Eval("cod_PS_UF") %>' runat="server" DataSourceID="SqlDataSourceUf" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                                </div>
                                <asp:Label ID="Label17" runat="server" CssClass="col-lg-2 control-label" Text="CIDADES:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:UpdatePanel ID="UpdatePanelRadDropDownListCidade" runat="server" UpdateMode="Always">
                                        <ContentTemplate></ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:TextBox ID="TextBoxid_PS_CIDADES" runat="server" Visible="false" Text='<%# Bind("id_PS_CIDADES") %>'></asp:TextBox>

                                    <telerik:RadDropDownList ID="RadDropDownListCidade" Width="100%" runat="server" DataSourceID="SqlDataSourceDropGrid" DataTextField="desc_PS_CIDADES" DataValueField="id_PS_CIDADES" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label15" runat="server" CssClass="col-lg-2 control-label" Text="BAIRRO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxbairro_PS_PESSOA" Width="100%" runat="server" CssClass="form-control" Text='<%# Bind("bairro_PS_PESSOA") %>' />
                                </div>
                                <asp:Label ID="Label16" runat="server" CssClass="col-lg-2 control-label" Text="CEP:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcep_PS_PESSOA" runat="server" Width="100%" CssClass="form-control" Text='<%# Bind("cep_PS_PESSOA") %>' Visible="false" />
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcep_PS_PESSOA" Width="100%" Mask="#####-###" Text='<%# Bind("cep_PS_PESSOA") %>' runat="server"></telerik:RadMaskedTextBox>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label14" runat="server" CssClass="col-lg-2 control-label" Text="RUA:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxendereco_PS_PESSOA" Width="100%" runat="server" CssClass="form-control" Text='<%# Bind("endereco_PS_PESSOA") %>' />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label18" runat="server" CssClass="col-lg-2 control-label" Text="NÚMERO:"></asp:Label>
                                <div class="col-lg-4 ">
                                    <asp:TextBox ID="TextBoxnumEndereco_PS_PESSOA" Width="100%" runat="server" CssClass="form-control" Text='<%# Bind("numEndereco_PS_PESSOA") %>' />
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNUM" runat="server" Enabled="True" TargetControlID="TextBoxnumEndereco_PS_PESSOA" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
                                </div>
                                <asp:Label ID="Label19" runat="server" CssClass="col-lg-2 control-label" Text="COMPLEMENTO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcomplemeto_PS_PESSOA" Width="100%" runat="server" CssClass="form-control" Text='<%# Bind("complemeto_PS_PESSOA") %>' />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label20" runat="server" CssClass="col-lg-2 control-label" Text="OBSERVAÇÕES:"></asp:Label>
                                <div class="col-lg-10 ">
                                    <asp:TextBox ID="TextBoxobs_PS_PESSOA" runat="server" Width="100%" CssClass="form-control" Height="150px" Text='<%# Bind("obs_PS_PESSOA") %>' />

                                </div>
                            </div>
                              <div class="form-group">
                            <asp:Label ID="Label42" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                            <div class="col-lg-10" style="text-align: left !important">
                                <asp:CheckBox ID="CheckBoxst_PS_PESSOA" Checked ='<%# Bind("st_PS_PESSOA") %>'  runat="server" />
                            </div>

                        </div>

                        </div>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
        </EditItemTemplate>

    </telerik:RadDataForm>

    <asp:SqlDataSource ID="SqlDataSourceRepresentantes" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" DeleteCommand="DELETE FROM CL_REPRE" InsertCommand="INSERT INTO CL_REPRE(idPessoaRepr_CL_REPRE, id_PS_CLIENTES) VALUES (@idPessoaRepr_CL_REPRE, @id_PS_CLIENTES)" SelectCommand="SELECT PS_PESSOA.desc_PS_PESSOA, CL_REPRE.idPessoaRepr_CL_REPRE FROM CL_REPRE INNER JOIN PS_PESSOA ON CL_REPRE.idPessoaRepr_CL_REPRE = PS_PESSOA.id_PS_PESSOA WHERE (CL_REPRE.id_PS_CLIENTES = @id_PS_CLIENTES)" UpdateCommand="UPDATE CL_REPRE SET idPessoaRepr_CL_REPRE = @idPessoaRepr_CL_REPRE, id_PS_CLIENTES = @idPessoaRepr_CL_REPRE">
        <InsertParameters>
            <asp:Parameter Name="idPessoaRepr_CL_REPRE" />
            <asp:Parameter Name="id_PS_CLIENTES" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id_PS_CLIENTES" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idPessoaRepr_CL_REPRE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuscaAtendente" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePessaoas" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPessoas" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_PESSOA(desc_PS_PESSOA, endereco_PS_PESSOA, numEndereco_PS_PESSOA, bairro_PS_PESSOA, cep_PS_PESSOA, id_PS_CIDADES, complemeto_PS_PESSOA, obs_PS_PESSOA, st_PS_PESSOA, tipoCadastro_PS_PESSOA) VALUES (@desc_PS_PESSOA, @endereco_PS_PESSOA, @numEndereco_PS_PESSOA, @bairro_PS_PESSOA, @cep_PS_PESSOA, @id_PS_CIDADES, @complemeto_PS_PESSOA, @obs_PS_PESSOA, @st_PS_PESSOA, @tipoCadastro_PS_PESSOA)" UpdateCommand="UPDATE PS_PESSOA SET desc_PS_PESSOA = @desc_PS_PESSOA, endereco_PS_PESSOA = @endereco_PS_PESSOA, numEndereco_PS_PESSOA = @numEndereco_PS_PESSOA, bairro_PS_PESSOA = @bairro_PS_PESSOA, cep_PS_PESSOA = @cep_PS_PESSOA, id_PS_CIDADES = @id_PS_CIDADES, complemeto_PS_PESSOA = @complemeto_PS_PESSOA, obs_PS_PESSOA = @obs_PS_PESSOA, st_PS_PESSOA = @st_PS_PESSOA, tipoCadastro_PS_PESSOA = @tipoCadastro_PS_PESSOA WHERE (id_PS_PESSOA = @id_ps_pessoa)">
        <InsertParameters>
            <asp:Parameter Name="desc_PS_PESSOA" />
            <asp:Parameter Name="endereco_PS_PESSOA" />
            <asp:Parameter Name="numEndereco_PS_PESSOA" />
            <asp:Parameter Name="bairro_PS_PESSOA" />
            <asp:Parameter Name="cep_PS_PESSOA" />
            <asp:Parameter Name="id_PS_CIDADES" />
            <asp:Parameter Name="complemeto_PS_PESSOA" />
            <asp:Parameter Name="obs_PS_PESSOA" />
            <asp:Parameter Name="st_PS_PESSOA" />
            <asp:Parameter Name="tipoCadastro_PS_PESSOA" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codIni" QueryStringField="id_pessoa" Type="Int32" />
            <asp:QueryStringParameter Name="codFim" QueryStringField="id_pessoa" Type="Int32" />
            <asp:QueryStringParameter Name="Desc" QueryStringField="Desc" Type="String" />
            <asp:QueryStringParameter Name="UF" QueryStringField="UF" Type="String" />
            <asp:QueryStringParameter Name="id_PS_CIDADES" QueryStringField="id_PS_CIDADES" Type="Int32" />
            <asp:Parameter Name="codDetalhes" Type="Int32" />
            <asp:Parameter Name="CNPJ_PS_JURIDICA" Type="Decimal" />
            <asp:Parameter Name="razaosocial_PS_JURIDICA" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="desc_PS_PESSOA" />
            <asp:Parameter Name="endereco_PS_PESSOA" />
            <asp:Parameter Name="numEndereco_PS_PESSOA" />
            <asp:Parameter Name="bairro_PS_PESSOA" />
            <asp:Parameter Name="cep_PS_PESSOA" />
            <asp:Parameter Name="id_PS_CIDADES" />
            <asp:Parameter Name="complemeto_PS_PESSOA" />
            <asp:Parameter Name="obs_PS_PESSOA" />
            <asp:Parameter Name="st_PS_PESSOA" />
            <asp:Parameter Name="tipoCadastro_PS_PESSOA" />
            <asp:Parameter Name="id_ps_pessoa" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUf" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDropGrid" CancelSelectOnNullParameter="False" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownCidade" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="cod_PS_UF" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUpdateInsert_PS_JURIDICA" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO PS_JURIDICA(id_PS_PESSOA, razaosocial_PS_JURIDICA, InsEstadual_PS_JURIDICA, CNPJ_PS_JURIDICA) VALUES (@id_PS_PESSOA, @razaosocial_PS_JURIDICA, @InsEstadual_PS_JURIDICA, @CNPJ_PS_JURIDICA)" SelectCommand="SELECT MAX(id_PS_PESSOA) AS id_PS_PESSOA FROM PS_PESSOA" UpdateCommand="UPDATE PS_JURIDICA SET razaosocial_PS_JURIDICA = @razaosocial_PS_JURIDICA, InsEstadual_PS_JURIDICA = @InsEstadual_PS_JURIDICA, st_PS_JURIDICA = 1, CNPJ_PS_JURIDICA = @CNPJ_PS_JURIDICA WHERE (id_PS_PESSOA = @id_PS_PESSOA)">
        <InsertParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="razaosocial_PS_JURIDICA" />
            <asp:Parameter Name="InsEstadual_PS_JURIDICA" />
            <asp:Parameter Name="CNPJ_PS_JURIDICA" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="razaosocial_PS_JURIDICA" />
            <asp:Parameter Name="InsEstadual_PS_JURIDICA" />
            <asp:Parameter Name="CNPJ_PS_JURIDICA" />
            <asp:Parameter Name="id_PS_PESSOA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCliente" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO PS_CLIENTES(id_PS_PESSOA, codMatriz_PS_CLIENTES, id_PS_EMPRESAS, id_PS_JURIDICA) VALUES (@id_PS_PESSOA, @codMatriz_PS_CLIENTES, 1, @id_PS_JURIDICA)" SelectCommand="SELECT MAX(id_PS_JURIDICA) AS id_PS_JURIDICA FROM PS_JURIDICA" UpdateCommand="UPDATE PS_CLIENTES SET codMatriz_PS_CLIENTES = @codMatriz_PS_CLIENTES WHERE (id_PS_PESSOA = @id_ps_pessoa)">
        <InsertParameters>
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="id_PS_JURIDICA" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="codMatriz_PS_CLIENTES" />
            <asp:Parameter Name="id_ps_pessoa" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
