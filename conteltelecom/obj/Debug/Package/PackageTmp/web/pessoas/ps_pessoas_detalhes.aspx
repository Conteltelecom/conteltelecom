<%@ Page Title="DETALHES DE PESSOAS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="ps_pessoas_detalhes.aspx.vb" Inherits="conteltelecom.ps_pessoas_detalhes" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">

    <telerik:RadDataForm ID="RadDataFormPessoasDetalhes" runat="server" DataSourceID="SqlDataSourcePessoasDetalhes" Skin="Bootstrap">
        <LayoutTemplate>
            <div id="itemPlaceholder" runat="server"></div>
        </LayoutTemplate>
        <ItemTemplate>

            <div class="rdfCommandButtons">
                <div style="text-align: right">
                    <telerik:RadButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="EDITAR" ToolTip="EDITAR">
                        <Icon PrimaryIconUrl="../../img/Editar.png" />
                    </telerik:RadButton>

                    <telerik:RadButton ID="CancelButtonVoltar" runat="server" OnClick="CancelButton_Click" CausesValidation="False" Text="CANCELAR" ToolTip="CANCLEAR">
                        <Icon PrimaryIconUrl="../../img/block.png" />
                    </telerik:RadButton>
                </div>

            </div>

            <fieldset class="fieldsetForms">
                <legend>INFORMAÇÕES PESSOAS</legend>
                <table class="table table-striped">
                    <tr>
                        <td colspan="1">
                            <asp:Label ID="Label4" runat="server" Font-Bold="true" Text="CÓDIGO:" />

                        </td>
                        <td colspan="3">
                            <asp:Label ID="id_PS_CIDADESLabel" Font-Bold="false" runat="server" Text='<%# Eval("id_PS_PESSOA") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <asp:Label ID="Label11" runat="server" Font-Bold="true" Text="NOME:" />
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Label12" Font-Bold="false" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server"  Font-Bold="true" Text="CPF:" />
                        </td>
                        <td>
                            <asp:Label ID="LabelCpf" Font-Bold="false" runat="server" Text='<%#Me.CpfFormat(Eval("cpf_PS_FISICA")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Font-Bold="true" Text="DATA NASCIMENTO:" />
                        </td>
                        <td>
                            <asp:Label ID="Label16" Font-Bold="false" runat="server" Text='<%# Eval("dt_nasc_PS_FISICA", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server"  Font-Bold="true" Text="RG:" />
                        </td>
                        <td>
                            <asp:Label ID="Label18" Font-Bold="false" runat="server" Text='<%# Eval("rg_PS_FISICA") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Font-Bold="true" Text="ORGÃO EMISSOR:" />
                        </td>
                        <td>
                            <asp:Label ID="Label20" Font-Bold="false" runat="server" Text='<%# Eval("rgEmissor_PS_FISICA") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="true" Text="ESTADO CIVIL:" />
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Label22" Font-Bold="false" runat="server" Text='<%# Eval("desc_PS_ESTADOCIVIL") %>' />
                        </td>
                                          </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label23" runat="server" Font-Bold="true" Text="TELEFONE:" />

                        </td>
                        <td>
                            <asp:Label ID="Label24" Font-Bold="false" runat="server" Text='<%# Me.FTelefoneFormat(Eval("fone01_PS_FISICA")) %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server"  Font-Bold="true" Text="CELULAR:" />
                        </td>
                        <td>
                            <asp:Label ID="Label26" Font-Bold="false" runat="server" Text='<%# Me.FTelefoneFormat(Eval("fone02_PS_FISICA")) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label45" runat="server" Font-Bold="true" Text="E-MAIL:" />
                        </td>
                        <td colspan ="3">
                            <asp:Label ID="Label46" Font-Bold="false" runat="server" Text='<%# Eval("email_PS_FISICA") %>' />
                        </td>
                      
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label47" runat="server"  Font-Bold="true" Text="NOME PAI:" />
                        </td>
                        <td>
                            <asp:Label ID="Label48" Font-Bold="false" runat="server" Text='<%# Eval("nomePai_PS_FISICA") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label49" runat="server"  Font-Bold="true" Text="NOME MÃE:" />
                        </td>
                        <td>
                            <asp:Label ID="Label50" Font-Bold="false" runat="server" Text='<%# Eval("nomeMae_PS_FISICA") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label51" runat="server" Font-Bold="true" Text="CARGO:" />
                        </td>
                        <td>
                            <asp:Label ID="Label52" Font-Bold="false" runat="server" Text='<%# Eval("cargo_PS_FISICA") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label53" runat="server"  Font-Bold="true" Text="%:" />
                        </td>
                        <td>
                            <asp:Label ID="Label54" Font-Bold="false" runat="server" Text='<%# Eval("perSociadade") %>' />
                        </td>
                    </tr>

                </table>
            </fieldset>
      
            <fieldset class="fieldsetForms">
                <legend>ENDEREÇO</legend>
                <table class="table table-striped">
                    <tr>
                        <td>
                            <asp:Label ID="Label27" runat="server" Font-Bold="true" Text="UF:" />

                        </td>
                        <td>
                            <asp:Label ID="Label28" Font-Bold="false" runat="server" Text='<%# Eval("cod_PS_UF") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label29" runat="server"  Font-Bold="true" Text="CIDADE:" />
                        </td>
                        <td>
                            <asp:Label ID="Label30" runat="server" Font-Bold="false" Text='<%# Eval("desc_PS_CIDADES") %>' />
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:Label ID="Label31" runat="server" Font-Bold="true" Text="BAIRRO:" />
                        </td>
                        <td>
                            <asp:Label ID="Label32" Font-Bold="false" runat="server" Text='<%# Eval("bairro_PS_PESSOA") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label33" runat="server" Font-Bold="true" Text="CEP:" />
                        </td>
                        <td>
                            <asp:Label ID="Label34" Font-Bold="false" runat="server" Text='<%# Eval("cep_PS_PESSOA") %>' />
                        </td>
                    </tr>
                    <tr>

                        <td colspan="1">
                            <asp:Label ID="Label35" runat="server" Font-Bold="true" Text="RUA:" />
                        </td>
                        <td colspan ="3">
                            <asp:Label ID="Label36" Font-Bold="false" runat="server" Text='<%# Eval("endereco_PS_PESSOA") %>' />
                        </td>
                       


                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label37" runat="server" Font-Bold="true" Text="NÚMERO:" />
                        </td>
                        <td>
                            <asp:Label ID="Label38" Font-Bold="false" runat="server" Text='<%# Eval("numEndereco_PS_PESSOA") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label39" runat="server" Font-Bold="true" Text="COMPLMENETO:" />
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Font-Bold="false" Text='<%# Eval("complemeto_PS_PESSOA") %>' />
                        </td>

                    </tr>
                    <tr>
                        <td colspan ="1">
                            <asp:Label ID="Label41" runat="server"  Font-Bold="true" Text="OBSERVAÇÕES:" />

                        </td>
                        <td colspan ="3">
                            <asp:Label ID="Label42" runat="server" Font-Bold="false" Text='<%# Eval("obs_PS_PESSOA") %>' />

                        </td>
                       
                    </tr>
                    <tr>
                        <td colspan="1"> 
                            <asp:Label ID="Label43" runat="server" Font-Bold="true" Text="SITUAÇÃO:" />
                        </td>
                        <td colspan ="3">
                            <asp:Label ID="Label44" runat="server" Font-Bold="false" Text='<%# If(Eval("st_PS_PESSOA") = 1, "ATIVO", "INATIVO") %>' />
                        </td>
                    </tr>

                </table>


            </fieldset>

        </ItemTemplate>
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanelRadDataForm_Ins" runat="server">

                <ContentTemplate>
                    <div style="text-align: right">

                        <telerik:RadButton ID="UpdateButtonI" runat="server" ValidationGroup="Sim" CommandName="PerformInsert" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton_Ins" runat="server" CausesValidation="False" OnClick="CancelButton_Ins_Click" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
                    <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO PESSOA</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelNome_ins" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_PESSOA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8i" ControlToValidate="TextBoxdesc_PS_PESSOA_Ins" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" />

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelCpf_Ins" runat="server" CssClass="col-lg-2 control-label" Text="CPF:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcpf_PS_FISICA_Ins" AutoPostBack="true" Width="100%" Mask="###.###.###-##" CssClass="form-control" runat="server">
                                    </telerik:RadMaskedTextBox>
                                    
                                </div>
                                <asp:Label ID="Label1_ins" runat="server" CssClass="col-lg-2 control-label" Text="DATA NASCIMENTO:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadDatePicker MinDate="1/1/1900"   ID="RadDatePickerdt_nasc_PS_FISICA_ins"  Width="100%" runat="server"></telerik:RadDatePicker>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Labelrg_PS_FISICA_ins" runat="server" CssClass="col-lg-2 control-label" Text="RG:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxrg_PS_FISICA_ins" Width="100%" runat="server" CssClass="form-control" />

                                </div>
                                <asp:Label ID="Label2" runat="server" CssClass="col-lg-2 control-label" Text="ÓRGÃO EMISSOR:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxrgEmissor_PS_FISICA_ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label9" runat="server" CssClass="col-lg-2 control-label" Text="ESTADO CIVIL:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadDropDownList ID="RadDropDownListid_PS_ESTADOCIVIL_INS" Width="100%" runat="server" DataSourceID="SqlDataSourcePS_ESTADOCIVIL" DataTextField="desc_PS_ESTADOCIVIL" DataValueField="id_PS_ESTADOCIVIL" Skin="Bootstrap"></telerik:RadDropDownList>

                                </div>
                                <div class="col-lg-6">
                                </div>

                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label3" runat="server" CssClass="col-lg-2 control-label" Text="TELEFONE:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxfone01_PS_FISICA_ins" AutoPostBack="true" CssClass="form-control" Width="100%" OnTextChanged="RadMaskedTextBoxfone01_PS_FISICA_TextChanged" runat="server" Mask="(##) ####-#####">
                                    </telerik:RadMaskedTextBox>
                                </div>
                                <asp:Label ID="Label4" runat="server" CssClass="col-lg-2 control-label" Text="CELULAR:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxfone02_PS_FISICA_ins" AutoPostBack="true" Width="100%" CssClass="form-control" OnTextChanged="RadMaskedTextBoxfone02_PS_FISICA_TextChanged" runat="server" Mask="(##) ####-#####">
                                    </telerik:RadMaskedTextBox>

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label10_ins" runat="server" CssClass="col-lg-2 control-label" Text="E-MAIL:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxemail_PS_FISICA_ins" Width="100%" runat="server" CssClass="form-control" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail_ins" ControlToValidate="TextBoxemail_PS_FISICA_ins" ValidationExpression="^(\s*,?\s*[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})+\s*$" runat="server" ErrorMessage="E-mail inválido" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label5" runat="server" CssClass="col-lg-2 control-label" Text="NOME DO PAI:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxnomePai_PS_FISICA_Ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                                <asp:Label ID="Label6" runat="server" CssClass="col-lg-2 control-label" Text="NOME DO MAE:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxnomeMae_PS_FISICA_ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label7" runat="server" CssClass="col-lg-2 control-label" Text="CARGO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcargo_PS_FISICA_ins" Width="100%" runat="server" CssClass="form-control" />
                                </div>
                                <asp:Label ID="Label8" runat="server" CssClass="col-lg-2 control-label" Text="%"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxperSociadade_ins" Width="100%" runat="server" CssClass="form-control" />
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
                                    <telerik:RadDropDownList ID="RadDropDownListuF_Ins" Width="100%" runat="server" DataSourceID="SqlDataSourceUf" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" OnSelectedIndexChanged="RadDropDownListuF_SelectedIndexChanged" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
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
                                    <asp:TextBox ID="TextBoxobs_PS_PESSOA_Ins" runat="server" TextMode="MultiLine" Width="100%" CssClass="form-control" Height="150px" />

                                </div>
                            </div>
                            <div class=" col-lg-12 form-group">
                                <asp:Label ID="Label42_ins" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                                <div class="col-lg-10 control-label">
                                    <asp:CheckBox ID="CheckBoxst_PS_PESSOA_ins" Checked="true" runat="server" />
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
                    <div style="text-align: right">
                        <telerik:RadButton ID="UpdateButton" runat="server" ValidationGroup="Sim" CommandName="Update" Text="SALVAR" ToolTip="SALVAR">
                            <Icon PrimaryIconUrl="../../img/accept.png" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="CANCELAR" ToolTip="CANCLEAR">
                            <Icon PrimaryIconUrl="../../img/block.png" />
                        </telerik:RadButton>
                    </div>
                    <fieldset class="fieldsetForms">
                        <legend>INFORMAÇÕES DO PESSOA</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label14" runat="server" CssClass="col-lg-2 control-label" Text="CÓD:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:Label ID="LabelId" runat="server" CssClass="col-lg-2 control-label" Text='<%# Eval("Id_PS_PESSOA") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelNome" runat="server" CssClass="col-lg-2 control-label" Text="NOME:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxdesc_PS_PESSOA" Width="100%" runat="server" Text='<%# Eval("desc_PS_PESSOA") %>' CssClass="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBoxdesc_PS_PESSOA" ErrorMessage="* Campo obrigatório." Display="Dynamic" runat="server" ForeColor="Red" />

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelCpf" runat="server" CssClass="col-lg-2 control-label" Text="CPF:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcpf_PS_FISICA" AutoPostBack="true" Text='<%# Eval("cpf_PS_FISICA") %>'  Width="100%" Mask="###.###.###-##" CssClass="form-control" runat="server">
                                    </telerik:RadMaskedTextBox>
                                   
                                </div>
                                <asp:Label ID="Label1" runat="server" CssClass="col-lg-2 control-label" Text="DATA NASCIMENTO:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadDatePicker MinDate="1/1/1900" DbSelectedDate='<%# Bind("dt_nasc_PS_FISICA") %>'  ID="RadDatePickerdt_nasc_PS_FISICA" Width="100%" runat="server"></telerik:RadDatePicker>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Labelrg_PS_FISICA" runat="server" CssClass="col-lg-2 control-label" Text="RG:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxrg_PS_FISICA" Text='<%# Eval("rg_PS_FISICA") %>' Width="100%" runat="server" CssClass="form-control" />

                                </div>
                                <asp:Label ID="LabelOE" runat="server" CssClass="col-lg-2 control-label" Text="ÓRGÃO EMISSOR:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxrgEmissor_PS_FISICA" Text='<%# Eval("rgEmissor_PS_FISICA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelEstadoCivil" runat="server" CssClass="col-lg-2 control-label" Text="ESTADO CIVIL:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:Label ID="LabelRadDropDownListid_PS_ESTADOCIVIL" runat="server" Text='<%# Eval("estadoCivil_PS_FISICA") %>' Visible="false"></asp:Label>
                                    <telerik:RadDropDownList ID="RadDropDownListid_PS_ESTADOCIVIL" Width="100%" runat="server" DataSourceID="SqlDataSourcePS_ESTADOCIVIL" DataTextField="desc_PS_ESTADOCIVIL" DataValueField="id_PS_ESTADOCIVIL" Skin="Bootstrap"></telerik:RadDropDownList>

                                </div>
                                <div class="col-lg-6">
                                </div>

                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelFone" runat="server" CssClass="col-lg-2 control-label" Text="TELEFONE:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxfone01_PS_FISICA" Text='<%# Eval("fone01_PS_FISICA") %>' AutoPostBack="true" CssClass="form-control" Width="100%" OnTextChanged="RadMaskedTextBoxfone01_PS_FISICA_TextChanged" runat="server" Mask="(##) ####-#####">
                                    </telerik:RadMaskedTextBox>
                                </div>
                                <asp:Label ID="LabelFone02" runat="server" CssClass="col-lg-2 control-label" Text="CELULAR:"></asp:Label>
                                <div class="col-lg-4">
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxfone02_PS_FISICA" Text='<%# Eval("fone02_PS_FISICA") %> ' AutoPostBack="true" Width="100%" CssClass="form-control" OnTextChanged="RadMaskedTextBoxfone02_PS_FISICA_TextChanged" runat="server" Mask="(##) ####-#####">
                                    </telerik:RadMaskedTextBox>

                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Label10" runat="server" CssClass="col-lg-2 control-label" Text="E-MAIL:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxemail_PS_FISICA" Text='<%# Eval("email_PS_FISICA") %> ' Width="100%" runat="server" CssClass="form-control" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ControlToValidate="TextBoxemail_PS_FISICA" ValidationExpression="^(\s*,?\s*[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})+\s*$" runat="server" ErrorMessage="E-mail inválido" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelNomePai" runat="server" CssClass="col-lg-2 control-label" Text="NOME DO PAI:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxnomePai_PS_FISICA" Text='<%# Eval("nomePai_PS_FISICA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                                <asp:Label ID="LabelNomeMae" runat="server" CssClass="col-lg-2 control-label" Text="NOME DO MAE:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxnomeMae_PS_FISICA" Text='<%# Eval("nomeMae_PS_FISICA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelCargo" runat="server" CssClass="col-lg-2 control-label" Text="CARGO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcargo_PS_FISICA" Text='<%# Eval("cargo_PS_FISICA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                                <asp:Label ID="LabelPer" runat="server" CssClass="col-lg-2 control-label" Text="%"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxperSociadade" Width="100%" Text='<%# Eval("perSociadade") %>' runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </div>

                    </fieldset>
                    <br />
                    <fieldset class="fieldsetForms">
                        <legend>ENDEREÇO</legend>
                        <div class="form-inline">
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="Labeluf" runat="server" CssClass="col-lg-2 control-label" Text="UF:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxuF" runat="server" Visible="false" Text='<%# Eval("cod_PS_UF") %>'></asp:TextBox>
                                    <telerik:RadDropDownList ID="RadDropDownListuF" Width="100%" runat="server" DataSourceID="SqlDataSourceUf" DataTextField="cod_PS_UF" DataValueField="cod_PS_UF" OnSelectedIndexChanged="RadDropDownListuF_SelectedIndexChanged" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                                </div>
                                <asp:Label ID="Labelcidades" runat="server" CssClass="col-lg-2 control-label" Text="CIDADES:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:UpdatePanel ID="UpdatePanelRadDropDownListCidade" runat="server" UpdateMode="Always">
                                        <ContentTemplate>
                                            <asp:TextBox ID="TextBoxid_PS_CIDADES" Text='<%# Eval("id_PS_CIDADES") %>' runat="server" Visible="false"></asp:TextBox>

                                            <telerik:RadDropDownList ID="RadDropDownListCidade" EnableViewState ="false"  Width="100%" runat="server" DataSourceID="SqlDataSourceDropGrid" DataTextField="desc_PS_CIDADES" DataValueField="id_PS_CIDADES" Skin="Bootstrap" AutoPostBack="True"></telerik:RadDropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelBairro" runat="server" CssClass="col-lg-2 control-label" Text="BAIRRO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxbairro_PS_PESSOA" Width="100%" runat="server" Text='<%# Eval("bairro_PS_PESSOA") %>' CssClass="form-control" />
                                </div>
                                <asp:Label ID="LabelCep" runat="server" CssClass="col-lg-2 control-label" Text="CEP:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcep_PS_PESSOA" runat="server" Width="100%" CssClass="form-control" Visible="false" />
                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBoxcep_PS_PESSOA" Text='<%# Eval("cep_PS_PESSOA") %>' Width="100%" Mask="#####-###" runat="server"></telerik:RadMaskedTextBox>
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelRua" runat="server" CssClass="col-lg-2 control-label" Text="RUA:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="TextBoxendereco_PS_PESSOA" Text='<%# Eval("endereco_PS_PESSOA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelNum" runat="server" CssClass="col-lg-2 control-label" Text="NÚMERO:"></asp:Label>
                                <div class="col-lg-4 ">
                                    <asp:TextBox ID="TextBoxnumEndereco_PS_PESSOA" Text='<%# Eval("numEndereco_PS_PESSOA") %>' Width="100%" runat="server" CssClass="form-control" />
                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNUM" runat="server" Enabled="True" TargetControlID="TextBoxnumEndereco_PS_PESSOA" ValidChars="0123456789"></asp:FilteredTextBoxExtender>
                                </div>
                                <asp:Label ID="LabelComplemento" runat="server" CssClass="col-lg-2 control-label" Text="COMPLEMENTO:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="TextBoxcomplemeto_PS_PESSOA" Text='<%# Eval("complemeto_PS_PESSOA") %>' Width="100%" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12 form-group">
                                <asp:Label ID="LabelObs" runat="server" CssClass="col-lg-2 control-label" Text="OBSERVAÇÕES:"></asp:Label>
                                <div class="col-lg-10 ">
                                    <asp:TextBox ID="TextBoxobs_PS_PESSOA" Text='<%# Eval("obs_PS_PESSOA") %>' runat="server" Width="100%" CssClass="form-control" Height="150px" TextMode="MultiLine" />

                                </div>
                            </div>
                            <div class=" col-lg-12 form-group">
                                <asp:Label ID="LabelSituacao" runat="server" CssClass="col-lg-2 control-label" Font-Bold="true" Text="SITUAÇÃO:" />
                                <div class="col-lg-10 ">
                                <asp:CheckBox ID="CheckBoxst_PS_PESSOA" Checked='<%# Eval("st_PS_PESSOA") %>' runat="server" />
                                    </div>

                            </div>


                        </div>
                    </fieldset>

                </ContentTemplate>
            </asp:UpdatePanel>

        </EditItemTemplate>
    </telerik:RadDataForm>
    <asp:SqlDataSource ID="SqlDataSourcePessoasDetalhes" CancelSelectOnNullParameter="False"  runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadGridPessoaFisica" SelectCommandType="StoredProcedure" InsertCommand="INSERT INTO PS_PESSOA(desc_PS_PESSOA, endereco_PS_PESSOA, numEndereco_PS_PESSOA, bairro_PS_PESSOA, id_PS_CIDADES, complemeto_PS_PESSOA, obs_PS_PESSOA, st_PS_PESSOA, tipoCadastro_PS_PESSOA, cep_PS_PESSOA) VALUES (@desc_PS_PESSOA, @endereco_PS_PESSOA, @numEndereco_PS_PESSOA, @bairro_PS_PESSOA, @id_PS_CIDADES, @complemeto_PS_PESSOA, @obs_PS_PESSOA, @st_PS_PESSOA, 0, @cep_PS_PESSOA)" UpdateCommand="UPDATE PS_PESSOA SET desc_PS_PESSOA = @desc_PS_PESSOA, endereco_PS_PESSOA = @endereco_PS_PESSOA, numEndereco_PS_PESSOA = @numEndereco_PS_PESSOA, bairro_PS_PESSOA = @bairro_PS_PESSOA, cep_PS_PESSOA = @cep_PS_PESSOA, id_PS_CIDADES = @id_PS_CIDADES, complemeto_PS_PESSOA = @complemeto_PS_PESSOA, obs_PS_PESSOA = @obs_PS_PESSOA, st_PS_PESSOA = @st_PS_PESSOA WHERE (id_PS_PESSOA = @id_PS_PESSOA)">
        <InsertParameters>
            <asp:Parameter Name="desc_PS_PESSOA" />
            <asp:Parameter Name="endereco_PS_PESSOA" />
            <asp:Parameter Name="numEndereco_PS_PESSOA" />
            <asp:Parameter Name="bairro_PS_PESSOA" />
            <asp:Parameter Name="id_PS_CIDADES" />
            <asp:Parameter Name="complemeto_PS_PESSOA" />
            <asp:Parameter Name="obs_PS_PESSOA" />
            <asp:Parameter Name="st_PS_PESSOA" />
            <asp:Parameter Name="cep_PS_PESSOA" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="codIni" QueryStringField="id_pessoa" Type="Int32"  />
            <asp:QueryStringParameter Name="codFim" QueryStringField="id_pessoa" Type="Int32" />
            <asp:Parameter Name="Desc" Type="String" />
            <asp:Parameter Name="UF" Type="String" />
            <asp:Parameter Name="id_PS_CIDADES" Type="Int32" />
            <asp:Parameter Name="cpf_PS_FISICA" Type="Decimal" />
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
            <asp:Parameter Name="id_PS_PESSOA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTipoContato" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownTipoContato" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePs_fisica" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" InsertCommand="INSERT INTO PS_FISICA(cpf_PS_FISICA, fone02_PS_FISICA, fone01_PS_FISICA, email_PS_FISICA, rg_PS_FISICA, rgEmissor_PS_FISICA, estadoCivil_PS_FISICA, dt_nasc_PS_FISICA, nomePai_PS_FISICA, nomeMae_PS_FISICA, perSociadade, id_PS_PESSOA, cargo_PS_FISICA) VALUES (@cpf_PS_FISICA, @fone02_PS_FISICA, @fone01_PS_FISICA, @email_PS_FISICA, @rg_PS_FISICA, @rgEmissor_PS_FISICA, @estadoCivil_PS_FISICA, @dt_nasc_PS_FISICA, @nomePai_PS_FISICA, @nomeMae_PS_FISICA, @perSociadade, @id_PS_PESSOA, @cargo_PS_FISICA)" SelectCommand="SELECT MAX(id_PS_PESSOA) AS id_PS_PESSOA FROM PS_PESSOA" UpdateCommand="UPDATE PS_FISICA SET cpf_PS_FISICA = @cpf_PS_FISICA, fone01_PS_FISICA = @fone01_PS_FISICA, fone02_PS_FISICA = @fone02_PS_FISICA, email_PS_FISICA = @email_PS_FISICA, rg_PS_FISICA = @rg_PS_FISICA, rgEmissor_PS_FISICA = @rgEmissor_PS_FISICA, estadoCivil_PS_FISICA = @estadoCivil_PS_FISICA, dt_nasc_PS_FISICA = @dt_nasc_PS_FISICA, nomePai_PS_FISICA = @nomePai_PS_FISICA, nomeMae_PS_FISICA = @nomeMae_PS_FISICA, perSociadade = @perSociadade, cargo_PS_FISICA = @cargo_PS_FISICA WHERE (id_PS_PESSOA = @id_PS_PESSOA)">
        <InsertParameters>
            <asp:Parameter Name="cpf_PS_FISICA" />
            <asp:Parameter Name="fone02_PS_FISICA" />
            <asp:Parameter Name="fone01_PS_FISICA" />
            <asp:Parameter Name="email_PS_FISICA" />
            <asp:Parameter Name="rg_PS_FISICA" />
            <asp:Parameter Name="rgEmissor_PS_FISICA" />
            <asp:Parameter Name="estadoCivil_PS_FISICA" />
            <asp:Parameter Name="dt_nasc_PS_FISICA" />
            <asp:Parameter Name="nomePai_PS_FISICA" />
            <asp:Parameter Name="nomeMae_PS_FISICA" />
            <asp:Parameter Name="perSociadade" />
            <asp:Parameter Name="id_PS_PESSOA" />
            <asp:Parameter Name="cargo_PS_FISICA" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cpf_PS_FISICA" />
            <asp:Parameter Name="fone01_PS_FISICA" />
            <asp:Parameter Name="fone02_PS_FISICA" />
            <asp:Parameter Name="email_PS_FISICA" />
            <asp:Parameter Name="rg_PS_FISICA" />
            <asp:Parameter Name="rgEmissor_PS_FISICA" />
            <asp:Parameter Name="estadoCivil_PS_FISICA" />
            <asp:Parameter Name="dt_nasc_PS_FISICA" />
            <asp:Parameter Name="nomePai_PS_FISICA" />
            <asp:Parameter Name="nomeMae_PS_FISICA" />
            <asp:Parameter Name="perSociadade" />
            <asp:Parameter Name="cargo_PS_FISICA" />
            <asp:Parameter Name="id_PS_PESSOA" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceUF" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownUF" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDropGrid" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownCidade" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="cod_PS_UF" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePS_ESTADOCIVIL" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="DropDownEstadoCivil" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
