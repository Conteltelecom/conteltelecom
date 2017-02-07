Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class ps_cliente_detalhes
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack = False Then
            If Request.QueryString("id_cliente") = "0" Then
                RadDataForm1.IsItemInserted = True
                RadDataForm1.Rebind()
            End If

        End If

    End Sub

    Public Function FcnpjFormat(cnpj As Object) As String
        Return CNPJFormat(cnpj)

    End Function
    Public Function MacaraCep(cep As Object) As String
        Return FormatarCep(cep)

    End Function


    Private Sub RadDataForm1_ItemCommand(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataForm1.ItemCommand
        Dim id_PS_PESSOA As Integer = 0
        If e.CommandName = "PerformInsert" And RadDataForm1.IsItemInserted = True Then
            If RadDataForm1.IsItemInserted = True Then
                Dim TextBoxdesc_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxdesc_PS_PESSOA_Ins"), TextBox)
                Dim TextBoxrazaosocial_PS_JURIDICA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxrazaosocial_PS_JURIDICA_Ins"), TextBox)
                Dim TextBoxCNPJ_PS_JURIDICA As RadMaskedTextBox = CType(RadDataForm1.InsertItem.FindControl("RadMaskedTextBoxCnpj_Ins"), RadMaskedTextBox)
                Dim TextBoxInsEstadual_PS_JURIDICA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxInsEstadual_PS_JURIDICA_Ins"), TextBox)
                Dim TextBoxcodMatriz_PS_CLIENTES As New TextBox
                Dim autoCompleteBox As RadAutoCompleteBox
                autoCompleteBox = DirectCast(RadDataForm1.InsertItem.FindControl("RadAutoCompleteBoxMatriz_ins"), RadAutoCompleteBox)
                Dim idCompany As Integer = 0
                If AutoCompleteBox IsNot Nothing Then
                    For Each entry As AutoCompleteBoxEntry In AutoCompleteBox.Entries
                        If entry.Text = AutoCompleteBox.Text Then
                            idCompany = Convert.ToInt32(entry.Value)
                            Exit For
                        End If
                    Next
                End If

                TextBoxcodMatriz_PS_CLIENTES = DirectCast(RadDataForm1.InsertItem.FindControl("TextBoxcodMatriz_PS_CLIENTES_ins"), TextBox)

                TextBoxcodMatriz_PS_CLIENTES.Text = idCompany

                If IsNothing(TextBoxcodMatriz_PS_CLIENTES.Text) Then
                    TextBoxcodMatriz_PS_CLIENTES.Text = 0
                End If

                Dim RadDropDownListuF As RadDropDownList = CType(RadDataForm1.InsertItem.FindControl("RadDropDownListuF_Ins"), RadDropDownList)
                Dim RadDropDownListCidade As RadDropDownList = CType(RadDataForm1.InsertItem.FindControl("RadDropDownListCidade_Ins"), RadDropDownList)
                Dim TextBoxbairro_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxbairro_PS_PESSOA_Ins"), TextBox)
                Dim TextBoxcep_PS_PESSOA As RadMaskedTextBox = CType(RadDataForm1.InsertItem.FindControl("RadMaskedTextBoxcep_PS_PESSOA_Ins"), RadMaskedTextBox)
                Dim TextBoxendereco_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxendereco_PS_PESSOA_Ins"), TextBox)
                Dim TextBoxnumEndereco_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxnumEndereco_PS_PESSOA_Ins"), TextBox)
                Dim TextBoxcomplemeto_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxcomplemeto_PS_PESSOA_Ins"), TextBox)
                Dim TextBoxobs_PS_PESSOA As TextBox = CType(RadDataForm1.InsertItem.FindControl("TextBoxobs_PS_PESSOA_Ins"), TextBox)
                Dim CheckBoxst_PS_PESSOA As CheckBox = CType(RadDataForm1.InsertItem.FindControl("CheckBoxst_PS_PESSOA_ins"), CheckBox)




                SqlDataSourcePessaoas.InsertParameters("desc_PS_PESSOA").DefaultValue = TextBoxdesc_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade.SelectedValue  'TextBoxrazaosocial_PS_JURIDICA.Text
                SqlDataSourcePessaoas.InsertParameters("bairro_PS_PESSOA").DefaultValue = TextBoxbairro_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("cep_PS_PESSOA").DefaultValue = TextBoxcep_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("endereco_PS_PESSOA").DefaultValue = TextBoxendereco_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("numEndereco_PS_PESSOA").DefaultValue = TextBoxnumEndereco_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("complemeto_PS_PESSOA").DefaultValue = TextBoxcomplemeto_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("obs_PS_PESSOA").DefaultValue = TextBoxobs_PS_PESSOA.Text
                SqlDataSourcePessaoas.InsertParameters("st_PS_PESSOA").DefaultValue = If(CheckBoxst_PS_PESSOA.Checked = True, 1, 0)
                SqlDataSourcePessaoas.InsertParameters("tipoCadastro_PS_PESSOA").DefaultValue = 1
                SqlDataSourcePessaoas.Insert()
                Dim dvSql As DataView = CType(SqlDataSourceUpdateInsert_PS_JURIDICA.Select(DataSourceSelectArguments.Empty), DataView)

                If dvSql IsNot Nothing Then
                    For Each drvSql As DataRowView In dvSql
                        If IsDBNull(drvSql("id_PS_PESSOA")) = False Then
                            id_PS_PESSOA = drvSql("id_PS_PESSOA")

                        End If
                    Next

                End If
                SqlDataSourceUpdateInsert_PS_JURIDICA.InsertParameters("razaosocial_PS_JURIDICA").DefaultValue = TextBoxrazaosocial_PS_JURIDICA.Text
                SqlDataSourceUpdateInsert_PS_JURIDICA.InsertParameters("InsEstadual_PS_JURIDICA").DefaultValue = TextBoxInsEstadual_PS_JURIDICA.Text
                SqlDataSourceUpdateInsert_PS_JURIDICA.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA
                SqlDataSourceUpdateInsert_PS_JURIDICA.InsertParameters("CNPJ_PS_JURIDICA").DefaultValue = TextBoxCNPJ_PS_JURIDICA.Text

                'SqlDataSourcePessaoas.InsertParameters("RadDropDownListuF").DefaultValue = ""

                SqlDataSourceUpdateInsert_PS_JURIDICA.Insert()

                Dim dvSqlPS_JURIDICA As DataView = CType(SqlDataSourceCliente.Select(DataSourceSelectArguments.Empty), DataView)

                If dvSqlPS_JURIDICA IsNot Nothing Then
                    For Each drvSql As DataRowView In dvSqlPS_JURIDICA
                        If IsDBNull(drvSql("id_PS_JURIDICA")) = False Then
                            Dim id_PS_JURIDICA As String = drvSql("id_PS_JURIDICA")
                            SqlDataSourceCliente.InsertParameters("id_PS_JURIDICA").DefaultValue = id_PS_JURIDICA
                        End If
                    Next

                End If
                SqlDataSourceCliente.InsertParameters("codMatriz_PS_CLIENTES").DefaultValue = If(TextBoxcodMatriz_PS_CLIENTES.Text = "0", id_PS_PESSOA, idCompany)
                SqlDataSourceCliente.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA
                SqlDataSourceCliente.Insert()
                HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente.aspx")
            End If


        End If

        If e.CommandName = "Update" Then
            Dim Labelid_PS_PESSOA As Label = CType(RadDataForm1.Items(0).FindControl("Labelid_PS_PESSOA"), Label)
            Dim TextBoxdesc_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxdesc_PS_PESSOA"), TextBox)
            Dim TextBoxrazaosocial_PS_JURIDICA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxrazaosocial_PS_JURIDICA"), TextBox)
            Dim TextBoxCNPJ_PS_JURIDICA As RadMaskedTextBox = CType(RadDataForm1.Items(0).FindControl("RadMaskedTextBoxCnpj"), RadMaskedTextBox)
            Dim TextBoxInsEstadual_PS_JURIDICA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxInsEstadual_PS_JURIDICA"), TextBox)
            Dim TextBoxcodMatriz_PS_CLIENTES As New TextBox
            Dim autoCompleteBox As RadAutoCompleteBox
            autoCompleteBox = DirectCast(RadDataForm1.Items(0).FindControl("RadAutoCompleteBoxMatriz"), RadAutoCompleteBox)
            Dim idCompany As Integer = 0
                If autoCompleteBox IsNot Nothing Then
                    For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                        If entry.Text = autoCompleteBox.Text Then
                            idCompany = Convert.ToInt32(entry.Value)
                            Exit For
                        End If
                    Next
                End If

            TextBoxcodMatriz_PS_CLIENTES = DirectCast(RadDataForm1.Items(0).FindControl("TextBoxcodMatriz_PS_CLIENTES"), TextBox)
            TextBoxcodMatriz_PS_CLIENTES.Text = idCompany

            If Not [String].IsNullOrEmpty(TextBoxcodMatriz_PS_CLIENTES.Text) Then
                TextBoxcodMatriz_PS_CLIENTES.Text = Convert.ToString(TextBoxcodMatriz_PS_CLIENTES.Text)
            End If


            Dim RadDropDownListuF As RadDropDownList = CType(RadDataForm1.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
            Dim RadDropDownListCidade As RadDropDownList = CType(RadDataForm1.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
            Dim TextBoxbairro_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxbairro_PS_PESSOA"), TextBox)
            Dim TextBoxcep_PS_PESSOA As RadMaskedTextBox = CType(RadDataForm1.Items(0).FindControl("RadMaskedTextBoxcep_PS_PESSOA"), RadMaskedTextBox)
            Dim TextBoxendereco_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxendereco_PS_PESSOA"), TextBox)
            Dim TextBoxnumEndereco_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxnumEndereco_PS_PESSOA"), TextBox)
            Dim TextBoxcomplemeto_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxcomplemeto_PS_PESSOA"), TextBox)
            Dim TextBoxobs_PS_PESSOA As TextBox = CType(RadDataForm1.Items(0).FindControl("TextBoxobs_PS_PESSOA"), TextBox)
            Dim CheckBoxst_PS_PESSOA As CheckBox = CType(RadDataForm1.Items(0).FindControl("CheckBoxst_PS_PESSOA"), CheckBox)
            SqlDataSourcePessaoas.UpdateParameters("desc_PS_PESSOA").DefaultValue = TextBoxdesc_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidade.SelectedValue
            SqlDataSourcePessaoas.UpdateParameters("bairro_PS_PESSOA").DefaultValue = TextBoxbairro_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("cep_PS_PESSOA").DefaultValue = [String].Join("", System.Text.RegularExpressions.Regex.Split(TextBoxcep_PS_PESSOA.Text, "[^\d]"))
            SqlDataSourcePessaoas.UpdateParameters("endereco_PS_PESSOA").DefaultValue = TextBoxendereco_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("numEndereco_PS_PESSOA").DefaultValue = TextBoxnumEndereco_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("complemeto_PS_PESSOA").DefaultValue = TextBoxcomplemeto_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("obs_PS_PESSOA").DefaultValue = TextBoxobs_PS_PESSOA.Text
            SqlDataSourcePessaoas.UpdateParameters("st_PS_PESSOA").DefaultValue = If(CheckBoxst_PS_PESSOA.Checked = True, 1, 0)
            SqlDataSourcePessaoas.UpdateParameters("tipoCadastro_PS_PESSOA").DefaultValue = 1
            SqlDataSourcePessaoas.UpdateParameters("id_PS_PESSOA").DefaultValue = Labelid_PS_PESSOA.Text
            SqlDataSourcePessaoas.Update()
            SqlDataSourceUpdateInsert_PS_JURIDICA.UpdateParameters("razaosocial_PS_JURIDICA").DefaultValue = TextBoxrazaosocial_PS_JURIDICA.Text
            SqlDataSourceUpdateInsert_PS_JURIDICA.UpdateParameters("CNPJ_PS_JURIDICA").DefaultValue = [String].Join("", System.Text.RegularExpressions.Regex.Split(TextBoxCNPJ_PS_JURIDICA.Text, "[^\d]"))
            SqlDataSourceUpdateInsert_PS_JURIDICA.UpdateParameters("InsEstadual_PS_JURIDICA").DefaultValue = TextBoxInsEstadual_PS_JURIDICA.Text
            SqlDataSourceUpdateInsert_PS_JURIDICA.UpdateParameters("id_PS_PESSOA").DefaultValue = Labelid_PS_PESSOA.Text
            'SqlDataSourcePessaoas.InsertParameters("RadDropDownListuF").DefaultValue = ""
            SqlDataSourceCliente.UpdateParameters("codMatriz_PS_CLIENTES").DefaultValue = TextBoxcodMatriz_PS_CLIENTES.Text
            SqlDataSourceCliente.UpdateParameters("id_PS_PESSOA").DefaultValue = Labelid_PS_PESSOA.Text
            SqlDataSourceUpdateInsert_PS_JURIDICA.Update()
            SqlDataSourceCliente.Update()
            RadDataForm1.DataBind()


        End If
    End Sub

    Private Sub RadDataForm1_PreRender(sender As Object, e As EventArgs) Handles RadDataForm1.PreRender

        If IsPostBack = False Then


            If RadDataForm1.Items.Count > 0 Then
                Dim RadDropDownListuF As RadDropDownList
                Dim RadDropDownListCidade As RadDropDownList
                RadDropDownListuF = DirectCast(RadDataForm1.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
                Dim TextBoxid_PS_CIDADES As TextBox = DirectCast(RadDataForm1.Items(0).FindControl("TextBoxid_PS_CIDADES"), TextBox)
                If IsNothing(RadDropDownListuF) = False Then
                    SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue
                    RadDropDownListCidade = DirectCast(RadDataForm1.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
                    'RadDropDownListCidade.DataBind()
                    RadDropDownListCidade.SelectedValue = TextBoxid_PS_CIDADES.Text
                End If
            Else

            End If
        End If
    End Sub




    Protected Sub RadDropDownListuF_SelectedIndexChanged(sender As Object, e As DropDownListEventArgs)
        If RadDataForm1.Items.Count > 0 Then
            Dim RadDropDownListuF As RadDropDownList
            Dim RadDropDownListCidade As RadDropDownList
            RadDropDownListuF = DirectCast(RadDataForm1.Items(0).FindControl("RadDropDownListuF"), RadDropDownList)
            If IsNothing(RadDropDownListuF) = False Then
                SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue
                RadDropDownListCidade = DirectCast(RadDataForm1.Items(0).FindControl("RadDropDownListCidade"), RadDropDownList)
                'RadDropDownListCidade.DataBind()
            End If
        Else
            Dim RadDropDownListuF As RadDropDownList
            Dim RadDropDownListCidade As RadDropDownList
            RadDropDownListuF = DirectCast(RadDataForm1.InsertItem.FindControl("RadDropDownListuF_Ins"), RadDropDownList)
            If IsNothing(RadDropDownListuF) = False Then
                SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListuF.SelectedValue
                RadDropDownListCidade = DirectCast(RadDataForm1.InsertItem.FindControl("RadDropDownListCidade_Ins"), RadDropDownList)
            End If
        End If
    End Sub

    Private Sub RadDataForm1_ItemDataBound(sender As Object, e As RadDataFormItemEventArgs) Handles RadDataForm1.ItemDataBound
        Dim CslValidacoes As New conteltelecom.Validacoes
        Dim nome As String = ""
        Dim autoCompleteBox As RadAutoCompleteBox = DirectCast(e.Item.FindControl("RadAutoCompleteBoxMatriz"), RadAutoCompleteBox)
        Dim TextBoxcodMatriz_PS_CLIENTES_Ins As TextBox = DirectCast(RadDataForm1.Items(0).FindControl("TextBoxcodMatriz_PS_CLIENTES"), TextBox)

        If IsNothing(TextBoxcodMatriz_PS_CLIENTES_Ins) = False Then
            CslValidacoes.BuscaDadosPs_Juridica(TextBoxcodMatriz_PS_CLIENTES_Ins.Text, nome)
            autoCompleteBox.Entries.Add(New AutoCompleteBoxEntry(nome, TextBoxcodMatriz_PS_CLIENTES_Ins.Text))

        End If
    End Sub

    Protected Sub CancelButton_Click(sender As Object, e As EventArgs)
        HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente.aspx")
    End Sub

        Protected Sub RadAutoCompleteBoxMatriz_ins_TextChanged(sender As Object, e As AutoCompleteTextEventArgs)
        Dim TextBoxcodMatriz_PS_CLIENTES_Ins As TextBox
        Dim autoCompleteBox As RadAutoCompleteBox
        If RadDataForm1.Items.Count > 0 Then
            autoCompleteBox = DirectCast(RadDataForm1.Items(0).FindControl("RadAutoCompleteBoxMatriz"), RadAutoCompleteBox)
            Dim idCompany As Integer = 0
            If autoCompleteBox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                        Exit For
                    End If
                Next
            End If

            TextBoxcodMatriz_PS_CLIENTES_Ins = DirectCast(RadDataForm1.Items(0).FindControl("TextBoxcodMatriz_PS_CLIENTES"), TextBox)
            TextBoxcodMatriz_PS_CLIENTES_Ins.Text = idCompany

        Else
            autoCompleteBox = DirectCast(RadDataForm1.InsertItem.FindControl("RadAutoCompleteBoxMatriz_ins"), RadAutoCompleteBox)
            Dim idCompany As Integer = 0
            If autoCompleteBox IsNot Nothing Then
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                        Exit For
                    End If
                Next
            End If

            TextBoxcodMatriz_PS_CLIENTES_Ins = DirectCast(RadDataForm1.InsertItem.FindControl("TextBoxcodMatriz_PS_CLIENTES_ins"), TextBox)
            TextBoxcodMatriz_PS_CLIENTES_Ins.Text = idCompany
        End If
    End Sub

    Protected Sub TextBoxcodMatriz_PS_CLIENTES_Ins_TextChanged(sender As Object, e As EventArgs)
        Dim CslValidacoes As New conteltelecom.Validacoes
        Dim TextBoxcodMatriz_PS_CLIENTES_Ins As TextBox
        Dim autoCompleteBox As RadAutoCompleteBox
        Dim nome As String = ""
        If RadDataForm1.Items.Count > 0 Then
            autoCompleteBox = DirectCast(RadDataForm1.Items(0).FindControl("RadAutoCompleteBoxMatriz"), RadAutoCompleteBox)


            TextBoxcodMatriz_PS_CLIENTES_Ins = DirectCast(RadDataForm1.Items(0).FindControl("TextBoxcodMatriz_PS_CLIENTES"), TextBox)

            CslValidacoes.BuscaDadosPs_Juridica(TextBoxcodMatriz_PS_CLIENTES_Ins.Text, nome)
            autoCompleteBox.Entries.Add(New AutoCompleteBoxEntry(nome, TextBoxcodMatriz_PS_CLIENTES_Ins.Text))
        Else
            autoCompleteBox = DirectCast(RadDataForm1.InsertItem.FindControl("RadAutoCompleteBoxMatriz_ins"), RadAutoCompleteBox)
            TextBoxcodMatriz_PS_CLIENTES_Ins = DirectCast(RadDataForm1.InsertItem.FindControl("TextBoxcodMatriz_PS_CLIENTES"), TextBox)
            CslValidacoes.BuscaDadosPs_Juridica(TextBoxcodMatriz_PS_CLIENTES_Ins.Text, nome)
            autoCompleteBox.Entries.Add(New AutoCompleteBoxEntry(nome, TextBoxcodMatriz_PS_CLIENTES_Ins.Text))
        End If
    End Sub
End Class