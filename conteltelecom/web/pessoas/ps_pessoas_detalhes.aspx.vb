Imports Telerik.Web.UI
Imports conteltelecom.Validacoes
Public Class ps_pessoas_detalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If Request.QueryString("id_pessoa") = "0" Or IsNothing(Request.QueryString("id_pessoa")) = True Then
                RadDataFormPessoasDetalhes.IsItemInserted = True
                RadDataFormPessoasDetalhes.Rebind()
            End If

        End If



    End Sub
    Function FTelefoneFormat(fone As Object) As String


        Return TelefoneFormat(fone)

    End Function
    Public Function CpfFormat(cpf As Object) As String

        Dim ClsValidacoes As New conteltelecom.Validacoes
        Return ClsValidacoes.CpfFormat(cpf)

    End Function
    Protected Sub CancelButton_Click(sender As Object, e As EventArgs)
        HttpContext.Current.Response.Redirect("~\web\pessoas\ps_pessoas.aspx")
    End Sub
    Protected Sub RadMaskedTextBoxcpf_PS_FISICA_Ins_TextChanged(sender As Object, e As EventArgs)
        Dim ClsValidacoes As New conteltelecom.Validacoes

        If RadDataFormPessoasDetalhes.Items.Count > 0 Then

        Else
            Dim RadMaskedTextBoxcpf_PS_FISICA_Ins As RadMaskedTextBox
            Dim RegularExpressionValidatorcpf_PS_FISICA_Ins As RequiredFieldValidator
            RegularExpressionValidatorcpf_PS_FISICA_Ins = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RequiredFieldValidatorcpf_PS_FISICA_Ins"), RequiredFieldValidator)
            RadMaskedTextBoxcpf_PS_FISICA_Ins = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxcpf_PS_FISICA_Ins"), RadMaskedTextBox)

            If RegularExpressionValidatorcpf_PS_FISICA_Ins.IsValid = True Then
                If ClsValidacoes.ValidaCPF(RadMaskedTextBoxcpf_PS_FISICA_Ins.Text) = False Then

                    Select Case ClsValidacoes.ValidaCPF(RadMaskedTextBoxcpf_PS_FISICA_Ins.Text)
                        Case 1
                            RegularExpressionValidatorcpf_PS_FISICA_Ins.IsValid = False
                            RegularExpressionValidatorcpf_PS_FISICA_Ins.Text = "CPF inválido"
                        Case 2
                            RegularExpressionValidatorcpf_PS_FISICA_Ins.IsValid = False
                            RegularExpressionValidatorcpf_PS_FISICA_Ins.Text = "CPF ja cadatrado"

                    End Select

                End If
                End If

            End If




    End Sub

    Protected Sub RadMaskedTextBoxfone01_PS_FISICA_TextChanged(sender As Object, e As EventArgs)

        Dim RadMaskedTextBoxfone01_PS_FISICA As RadMaskedTextBox
        If RadDataFormPessoasDetalhes.Items.Count > 0 Then

        Else
            RadMaskedTextBoxfone01_PS_FISICA = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone01_PS_FISICA_ins"), RadMaskedTextBox)
            If RadMaskedTextBoxfone01_PS_FISICA.Text.Length > 10 Then
                RadMaskedTextBoxfone01_PS_FISICA.Mask = "(##)#####-####"
            Else
                RadMaskedTextBoxfone01_PS_FISICA = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone01_PS_FISICA_ins"), RadMaskedTextBox)
                If RadMaskedTextBoxfone01_PS_FISICA.Text.Length <= 10 Then
                    RadMaskedTextBoxfone01_PS_FISICA.Mask = "(##)####-####"
                End If
            End If
        End If
    End Sub

    Protected Sub CancelButton_Ins_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub RadMaskedTextBoxfone02_PS_FISICA_TextChanged(sender As Object, e As EventArgs)

        Dim RadMaskedTextBoxfone02_PS_FISICA As RadMaskedTextBox
        If RadDataFormPessoasDetalhes.Items.Count > 0 Then

        Else
            RadMaskedTextBoxfone02_PS_FISICA = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone02_PS_FISICA_ins"), RadMaskedTextBox)
            If RadMaskedTextBoxfone02_PS_FISICA.Text.Length > 10 Then
                RadMaskedTextBoxfone02_PS_FISICA.Mask = "(##)#####-####"
            Else
                RadMaskedTextBoxfone02_PS_FISICA = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone01_PS_FISICA_ins"), RadMaskedTextBox)
                If RadMaskedTextBoxfone02_PS_FISICA.Text.Length <= 10 Then
                    RadMaskedTextBoxfone02_PS_FISICA.Mask = "(##)####-####"
                End If
            End If
        End If
    End Sub

    Protected Sub RadDropDownListuF_SelectedIndexChanged(sender As Object, e As DropDownListEventArgs)
        If RadDataFormPessoasDetalhes.Items.Count > 0 Then
            Dim RadDropDownListuF As RadDropDownList
            Dim RadDropDownListCidade As RadDropDownList

            RadDropDownListuF = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
            If IsNothing(RadDropDownListuF) = False Then
                SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue
                RadDropDownListCidade = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
                'RadDropDownListCidade.DataBind()
            End If
        Else
            Dim RadDropDownListuF_Ins As RadDropDownList
            Dim RadDropDownListCidade_Ins As RadDropDownList
            RadDropDownListuF_Ins = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDropDownListuF_Ins"), RadDropDownList)
            If IsNothing(RadDropDownListuF_Ins) = False Then
                SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF_Ins.SelectedValue
                RadDropDownListCidade_Ins = DirectCast(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDropDownListCidade_Ins"), RadDropDownList)
            End If
        End If
    End Sub

    Private Sub RadDataFormPessoasDetalhes_ItemCommand(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormPessoasDetalhes.ItemCommand
        Dim ClsValidacoes As New conteltelecom.Validacoes
        Dim ultimoId As Integer

        If e.CommandName = "PerformInsert" Then
            Dim TextBoxdesc_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxdesc_PS_PESSOA_Ins"), TextBox)
            Dim RadMaskedTextBoxcpf_PS_FISICA_Ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxcpf_PS_FISICA_Ins"), RadMaskedTextBox)
            Dim RadDatePickerdt_nasc_PS_FISICA_ins As RadDatePicker = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDatePickerdt_nasc_PS_FISICA_ins"), RadDatePicker)
            Dim TextBoxrg_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxrg_PS_FISICA_ins"), TextBox)
            Dim TextBoxrgEmissor_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxrgEmissor_PS_FISICA_ins"), TextBox)
            Dim RadMaskedTextBoxfone01_PS_FISICA_ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone01_PS_FISICA_ins"), RadMaskedTextBox)
            Dim RadMaskedTextBoxfone02_PS_FISICA_ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxfone02_PS_FISICA_ins"), RadMaskedTextBox)
            Dim TextBoxnomePai_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxnomePai_PS_FISICA_ins"), TextBox)
            Dim TextBoxnomeMae_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxnomeMae_PS_FISICA_ins"), TextBox)
            Dim TextBoxcargo_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxcargo_PS_FISICA_ins"), TextBox)
            Dim TextBoxperSociadade_ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxperSociadade_ins"), TextBox)
            Dim TextBoxemail_PS_FISICA As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxemail_PS_FISICA_ins"), TextBox)
            Dim RadDropDownListuF_Ins As RadDropDownList = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDropDownListuF_Ins"), RadDropDownList)

            Dim RadDropDownListid_PS_ESTADOCIVIL As RadDropDownList = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDropDownListid_PS_ESTADOCIVIL_INS"), RadDropDownList)
            Dim RadDropDownListCidade_Ins As RadDropDownList = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadDropDownListCidade_Ins"), RadDropDownList)
            Dim TextBoxbairro_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxbairro_PS_PESSOA_Ins"), TextBox)
            Dim RadMaskedTextBoxcep_PS_PESSOA_Ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("RadMaskedTextBoxcep_PS_PESSOA_Ins"), RadMaskedTextBox)
            Dim TextBoxendereco_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxendereco_PS_PESSOA_Ins"), TextBox)
            Dim TextBoxnumEndereco_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxnumEndereco_PS_PESSOA_Ins"), TextBox)
            Dim TextBoxcomplemeto_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxcomplemeto_PS_PESSOA_Ins"), TextBox)
            Dim TextBoxobs_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("TextBoxobs_PS_PESSOA_Ins"), TextBox)
            Dim CheckBoxst_PS_PESSOA_ins As CheckBox = CType(RadDataFormPessoasDetalhes.InsertItem.FindControl("CheckBoxst_PS_PESSOA_ins"), CheckBox)

            SqlDataSourcePessoasDetalhes.InsertParameters("desc_PS_PESSOA").DefaultValue = TextBoxdesc_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade_Ins.SelectedValue  'TextBoxrazaosocial_PS_JURIDICA.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("bairro_PS_PESSOA").DefaultValue = TextBoxbairro_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("cep_PS_PESSOA").DefaultValue = RadMaskedTextBoxcep_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("endereco_PS_PESSOA").DefaultValue = TextBoxendereco_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("numEndereco_PS_PESSOA").DefaultValue = TextBoxnumEndereco_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("complemeto_PS_PESSOA").DefaultValue = TextBoxcomplemeto_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("obs_PS_PESSOA").DefaultValue = TextBoxobs_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.InsertParameters("st_PS_PESSOA").DefaultValue = If(CheckBoxst_PS_PESSOA_ins.Checked = True, 1, 0)
            SqlDataSourcePessoasDetalhes.Insert()
            ultimoId = ClsValidacoes.UltimoId_PS_PESSOA

            SqlDataSourcePs_fisica.InsertParameters("cpf_PS_FISICA").DefaultValue = RadMaskedTextBoxcpf_PS_FISICA_Ins.Text
            SqlDataSourcePs_fisica.InsertParameters("fone01_PS_FISICA").DefaultValue = RadMaskedTextBoxfone01_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("fone02_PS_FISICA").DefaultValue = RadMaskedTextBoxfone02_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("email_PS_FISICA").DefaultValue = TextBoxemail_PS_FISICA.Text
            SqlDataSourcePs_fisica.InsertParameters("rg_PS_FISICA").DefaultValue = TextBoxrg_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("rgEmissor_PS_FISICA").DefaultValue = TextBoxrgEmissor_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("cargo_PS_FISICA").DefaultValue = TextBoxcargo_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("perSociadade").DefaultValue = TextBoxperSociadade_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("estadoCivil_PS_FISICA").DefaultValue = RadDropDownListid_PS_ESTADOCIVIL.SelectedValue
            SqlDataSourcePs_fisica.InsertParameters("dt_nasc_PS_FISICA").ConvertEmptyStringToNull = True
            SqlDataSourcePs_fisica.InsertParameters("dt_nasc_PS_FISICA").DefaultValue = If(RadDatePickerdt_nasc_PS_FISICA_ins.DateInput.Text <> "", RadDatePickerdt_nasc_PS_FISICA_ins.SelectedDate.Value, String.Empty)
            SqlDataSourcePs_fisica.InsertParameters("nomePai_PS_FISICA").DefaultValue = TextBoxnomePai_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("nomeMae_PS_FISICA").DefaultValue = TextBoxnomeMae_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.InsertParameters("id_PS_PESSOA").DefaultValue = ultimoId
            SqlDataSourcePs_fisica.Insert()
              HttpContext.Current.Response.Redirect("~\web\pessoas\ps_pessoas.aspx")

        End If



        If e.CommandName = "Update" Then
            Dim TextBoxdesc_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxdesc_PS_PESSOA"), TextBox)
            Dim RadMaskedTextBoxcpf_PS_FISICA_Ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadMaskedTextBoxcpf_PS_FISICA"), RadMaskedTextBox)
            Dim RadDatePickerdt_nasc_PS_FISICA_ins As RadDatePicker = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDatePickerdt_nasc_PS_FISICA"), RadDatePicker)
            Dim TextBoxrg_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxrg_PS_FISICA"), TextBox)
            Dim TextBoxrgEmissor_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxrgEmissor_PS_FISICA"), TextBox)
            Dim RadMaskedTextBoxfone01_PS_FISICA_ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadMaskedTextBoxfone01_PS_FISICA"), RadMaskedTextBox)
            Dim RadMaskedTextBoxfone02_PS_FISICA_ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadMaskedTextBoxfone02_PS_FISICA"), RadMaskedTextBox)
            Dim TextBoxnomePai_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxnomePai_PS_FISICA"), TextBox)
            Dim TextBoxnomeMae_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxnomeMae_PS_FISICA"), TextBox)
            Dim TextBoxcargo_PS_FISICA_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxcargo_PS_FISICA"), TextBox)
            Dim TextBoxperSociadade_ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxperSociadade"), TextBox)
            Dim TextBoxemail_PS_FISICA As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxemail_PS_FISICA"), TextBox)
            Dim RadDropDownListuF_Ins As RadDropDownList = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
            Dim LabelId As Label = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("LabelId"), Label)

            Dim RadDropDownListid_PS_ESTADOCIVIL As RadDropDownList = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListid_PS_ESTADOCIVIl"), RadDropDownList)
            Dim RadDropDownListCidade_Ins As RadDropDownList = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
            Dim TextBoxbairro_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxbairro_PS_PESSOA"), TextBox)
            Dim RadMaskedTextBoxcep_PS_PESSOA_Ins As RadMaskedTextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("RadMaskedTextBoxcep_PS_PESSOA"), RadMaskedTextBox)
            Dim TextBoxendereco_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxendereco_PS_PESSOA"), TextBox)
            Dim TextBoxnumEndereco_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxnumEndereco_PS_PESSOa"), TextBox)
            Dim TextBoxcomplemeto_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxcomplemeto_PS_PESSOA"), TextBox)
            Dim TextBoxobs_PS_PESSOA_Ins As TextBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxobs_PS_PESSOA"), TextBox)
            Dim CheckBoxst_PS_PESSOA_ins As CheckBox = CType(RadDataFormPessoasDetalhes.Items(0).FindControl("CheckBoxst_PS_PESSOA"), CheckBox)
            ultimoId = LabelId.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("desc_PS_PESSOA").DefaultValue = TextBoxdesc_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade_Ins.SelectedValue  'TextBoxrazaosocial_PS_JURIDICA.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("bairro_PS_PESSOA").DefaultValue = TextBoxbairro_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("cep_PS_PESSOA").DefaultValue = RadMaskedTextBoxcep_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("endereco_PS_PESSOA").DefaultValue = TextBoxendereco_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("numEndereco_PS_PESSOA").DefaultValue = TextBoxnumEndereco_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("complemeto_PS_PESSOA").DefaultValue = TextBoxcomplemeto_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("obs_PS_PESSOA").DefaultValue = TextBoxobs_PS_PESSOA_Ins.Text
            SqlDataSourcePessoasDetalhes.UpdateParameters("id_PS_PESSOA").DefaultValue = ultimoId
            SqlDataSourcePessoasDetalhes.UpdateParameters("st_PS_PESSOA").DefaultValue = If(CheckBoxst_PS_PESSOA_ins.Checked = True, 1, 0)
            SqlDataSourcePessoasDetalhes.Update()


            SqlDataSourcePs_fisica.UpdateParameters("cpf_PS_FISICA").DefaultValue = RadMaskedTextBoxcpf_PS_FISICA_Ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("fone01_PS_FISICA").DefaultValue = RadMaskedTextBoxfone01_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("fone02_PS_FISICA").DefaultValue = RadMaskedTextBoxfone02_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("email_PS_FISICA").DefaultValue = TextBoxemail_PS_FISICA.Text
            SqlDataSourcePs_fisica.UpdateParameters("cargo_PS_FISICA").DefaultValue = TextBoxcargo_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("perSociadade").DefaultValue = TextBoxperSociadade_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("rg_PS_FISICA").DefaultValue = TextBoxrg_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("rgEmissor_PS_FISICA").DefaultValue = TextBoxrgEmissor_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("estadoCivil_PS_FISICA").DefaultValue = RadDropDownListid_PS_ESTADOCIVIL.SelectedValue
            SqlDataSourcePs_fisica.UpdateParameters("dt_nasc_PS_FISICA").ConvertEmptyStringToNull = True

            SqlDataSourcePs_fisica.UpdateParameters("dt_nasc_PS_FISICA").DefaultValue = If(RadDatePickerdt_nasc_PS_FISICA_ins.DateInput.Text <> "", RadDatePickerdt_nasc_PS_FISICA_ins.SelectedDate.Value, String.Empty)
            SqlDataSourcePs_fisica.UpdateParameters("nomePai_PS_FISICA").DefaultValue = TextBoxnomePai_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("nomeMae_PS_FISICA").DefaultValue = TextBoxnomeMae_PS_FISICA_ins.Text
            SqlDataSourcePs_fisica.UpdateParameters("id_PS_PESSOA").DefaultValue = ultimoId
            SqlDataSourcePs_fisica.Update()

            RadDataFormPessoasDetalhes.DataBind()
        End If
    End Sub

    Private Sub RadDataFormPessoasDetalhes_PreRender(sender As Object, e As EventArgs) Handles RadDataFormPessoasDetalhes.PreRender

        '  If RadDataFormPessoasDetalhes.IsItemInserted = True Then


        If RadDataFormPessoasDetalhes.Items.Count > 0 Then
            Dim TextBoxuF As TextBox = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxuF"), TextBox)
            If IsNothing(TextBoxuF) = False Then


                Dim RadDropDownListuF As RadDropDownList = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
                Dim TextBoxid_PS_CIDADES As TextBox = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("TextBoxid_PS_CIDADES"), TextBox)
                Dim RadDropDownListCidade As RadDropDownList = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
                Dim LabelRadDropDownListid_PS_ESTADOCIVIL As Label = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("LabelRadDropDownListid_PS_ESTADOCIVIL"), Label)

                Dim RadDropDownListid_PS_ESTADOCIVIL As RadDropDownList = DirectCast(RadDataFormPessoasDetalhes.Items(0).FindControl("RadDropDownListid_PS_ESTADOCIVIL"), RadDropDownList)

                RadDropDownListid_PS_ESTADOCIVIL.SelectedValue = LabelRadDropDownListid_PS_ESTADOCIVIL.Text
                RadDropDownListCidade.SelectedValue = TextBoxid_PS_CIDADES.Text
                RadDropDownListuF.SelectedValue = TextBoxuF.Text
                SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue
            End If
        Else




        End If
        '  End If




    End Sub

    Private Sub RadDataFormPessoasDetalhes_ItemInserting(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormPessoasDetalhes.ItemInserting

    End Sub

    Protected Sub SqlDataSourceUF_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSourceUF.Selecting

    End Sub
End Class


