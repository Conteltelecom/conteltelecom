Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class CadatroRepresentante
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then

            PersonalizarControles.SubRadWindowManager(RadWindowManagerMsg, 0)

        End If

    End Sub

    Private Sub RadGridCadRepresentantes_PreRender(sender As Object, e As EventArgs) Handles RadGridCadRepresentantes.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadRepresentantes, 1)

            RadGridCadRepresentantes.Rebind()

        End If

    End Sub

    Protected Sub RadDropDownListTipoPessoa_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.DropDownListEventArgs)

    End Sub

    Protected Sub RadDropDownListUF_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.DropDownListEventArgs)

        SqlDataSourceCidades.SelectParameters("cod_PS_UF").DefaultValue = e.Value
            Dim combo As RadDropDownList = DirectCast(sender, RadDropDownList)
            Dim item As GridEditFormItem = DirectCast(combo.NamingContainer, GridEditFormItem)
            Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(item.FindControl("RadDropDownListCidade"), RadDropDownList)
            SqlDataSourceCidades.DataBind()



    End Sub



    Private Sub RadGridCadRepresentantes_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCadRepresentantes.ItemDataBound
        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then

            Else
                Dim ditem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim RadDropDownListUf As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListUf"), RadDropDownList)
                SqlDataSourceCidades.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListUf.SelectedValue
                Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListCidade"), RadDropDownList)
                RadDropDownListid_PS_CIDADES.DataBind()
                Dim LabelDropCidades As Label = DirectCast(ditem.FindControl("LabelDropCidades"), Label)
                If Not [String].IsNullOrEmpty(LabelDropCidades.Text) Then
                    RadDropDownListid_PS_CIDADES.SelectedValue = LabelDropCidades.Text
                End If


            End If
        End If
    End Sub

    Private Sub RadGridCadRepresentantes_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadRepresentantes.ItemCommand
        Try


            If e.CommandName = RadGrid.PerformInsertCommandName Then
                Dim id_PS_PESSOA As Integer
                Dim RadTextBoxdesc_PS_PESSOA As New RadTextBox
                Dim RadTextBoxRazaosocial_PS_JURIDICA As New RadTextBox
                Dim RadDropDownListTipoPessoa As New RadDropDownList
                Dim RadTextBoxCNPJ_PS_JURIDICA As New RadMaskedTextBox
                Dim RadMaskedTextBoxcep_PS_PESSOA As New RadMaskedTextBox
                Dim RadDropDownListUF As New RadDropDownList
                Dim RadDropDownListCidade As New RadDropDownList
                Dim RadTextBoxBairro As New RadTextBox
                Dim RadTextBoxRua As New RadTextBox
                Dim RadNumericTextBoxNumero As New RadNumericTextBox
                Dim RadTextBoxComplemento As New RadTextBox
                Dim RadGridEmail As New RadGrid
                Dim RadGridTeefone As New RadGrid


                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                RadGridTeefone = DirectCast(eitem.FindControl("RadGridTeefone"), RadGrid)
                RadTextBoxdesc_PS_PESSOA = DirectCast(eitem.FindControl("RadTextBoxdesc_PS_PESSOA"), RadTextBox)
                RadTextBoxRazaosocial_PS_JURIDICA = DirectCast(eitem.FindControl("RadTextBoxRazaosocial_PS_JURIDICA"), RadTextBox)
                RadDropDownListTipoPessoa = DirectCast(eitem.FindControl("RadDropDownListTipoPessoa"), RadDropDownList)
                RadTextBoxCNPJ_PS_JURIDICA = DirectCast(eitem.FindControl("RadTextBoxCNPJ_PS_JURIDICA"), RadMaskedTextBox)
                RadMaskedTextBoxcep_PS_PESSOA = DirectCast(eitem.FindControl("RadMaskedTextBoxcep_PS_PESSOA"), RadMaskedTextBox)

                RadDropDownListCidade = DirectCast(eitem.FindControl("RadDropDownListCidade"), RadDropDownList)
                RadTextBoxBairro = DirectCast(eitem.FindControl("RadTextBoxBairro"), RadTextBox)
                RadTextBoxRua = DirectCast(eitem.FindControl("RadTextBoxRua"), RadTextBox)
                RadNumericTextBoxNumero = DirectCast(eitem.FindControl("RadNumericTextBoxNumero"), RadNumericTextBox)
                RadTextBoxComplemento = DirectCast(eitem.FindControl("RadTextBoxComplemento"), RadTextBox)

                Dim strSQL As String
                strSQL = "INSERT INTO [dbo].[PS_PESSOA]
           ([desc_PS_PESSOA]
           ,[endereco_PS_PESSOA]
           ,[numEndereco_PS_PESSOA]
           ,[bairro_PS_PESSOA]
           ,[cep_PS_PESSOA]
           ,[id_PS_CIDADES]
           ,[complemeto_PS_PESSOA]
           ,[tipoCadastro_PS_PESSOA]
           )
     VALUES
           (@desc_PS_PESSOA
           ,@endereco_PS_PESSOA
           ,@numEndereco_PS_PESSOA
           ,@bairro_PS_PESSOA
           ,@cep_PS_PESSOA
           ,@id_PS_CIDADES
           ,@complemeto_PS_PESSOA
           ,@tipoCadastro_PS_PESSOA
           );SELECT @id= SCOPE_IDENTITY()"

                Dim strConexao As New Sql
                Dim cnn As Data.SqlClient.SqlConnection
                Dim cmd As Data.SqlClient.SqlCommand
                Dim param As Data.SqlClient.SqlParameter
                'defina a string de conexão e cria uma nova conexão
                Dim connString As String = strConexao.StrConectionString()
                cnn = New Data.SqlClient.SqlConnection(connString)

                'define o comando a ser executado
                cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)

                'recebe os parâmetros DESCRIÇÃO
                cmd.Parameters.AddWithValue("@id", 0).Direction = ParameterDirection.Output

                param = New Data.SqlClient.SqlParameter("@desc_PS_PESSOA", Data.SqlDbType.VarChar) 'OK
                param.Value = If(IsNothing(RadTextBoxdesc_PS_PESSOA.Text) = False, RadTextBoxdesc_PS_PESSOA.Text, DBNull.Value)
                cmd.Parameters.Add(param)


                param = New Data.SqlClient.SqlParameter("@endereco_PS_PESSOA", Data.SqlDbType.VarChar) 'OK
                param.Value = If(IsNothing(RadTextBoxRua.Text) = False, RadTextBoxRua.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@numEndereco_PS_PESSOA", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(RadNumericTextBoxNumero.Text) = False, RadNumericTextBoxNumero.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@bairro_PS_PESSOA", Data.SqlDbType.VarChar) 'ok
                param.Value = If(IsNothing(RadTextBoxBairro.Text) = False, RadTextBoxBairro.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@cep_PS_PESSOA", Data.SqlDbType.VarChar) 'ok
                param.Value = If(IsNothing(RadMaskedTextBoxcep_PS_PESSOA.Text) = False, RadMaskedTextBoxcep_PS_PESSOA.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@id_PS_CIDADES", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(RadDropDownListCidade.SelectedValue) = False, RadDropDownListCidade.SelectedValue, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@complemeto_PS_PESSOA", Data.SqlDbType.VarChar) 'ok
                param.Value = If(IsNothing(RadTextBoxComplemento.Text) = False, RadTextBoxComplemento.Text, DBNull.Value)
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@tipoCadastro_PS_PESSOA", Data.SqlDbType.Int) 'ok
                param.Value = If(IsNothing(RadDropDownListTipoPessoa.SelectedValue) = False, RadDropDownListTipoPessoa.SelectedValue, DBNull.Value)
                cmd.Parameters.Add(param)

                'abre a conexão
                cnn.Open()
                'executa a instrução SQL se retornar
                '  cmd.ExecuteNonQuery()
                cmd.ExecuteScalar()
                id_PS_PESSOA = Convert.ToInt32(cmd.Parameters("@id").Value)
                '                'fecha a conexao
                cnn.Close()




                SqlDataSourceCadRepresentante.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA
                SqlDataSourceCadRepresentante.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceCadRepresentante.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                SqlDataSourceCadRepresentante.InsertParameters("id_PS_EMPRESAS").DefaultValue = Session("idEmpresa_PS_PESSOA")
                SqlDataSourceCadRepresentante.InsertParameters("idEmpresa_PS_PESSOA").DefaultValue = Session("id_PS_EMPRESAS")
                SqlDataSourceCadRepresentante.Insert()

                SqlDataSourcePsJuridica.InsertParameters("razaosocial_PS_JURIDICA").DefaultValue = RadTextBoxRazaosocial_PS_JURIDICA.Text
                SqlDataSourcePsJuridica.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA
                SqlDataSourcePsJuridica.InsertParameters("CNPJ_PS_JURIDICA").DefaultValue = RadTextBoxCNPJ_PS_JURIDICA.Text
                SqlDataSourcePsJuridica.Insert()


               



            End If

        Catch ex As Exception
            Dim clsMesnagem As New Mensagens

            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub
    Public Function MascaraCpfCnpj(cpf As Object) As String
        Return Validacoes.CNPJFormat(cpf)
    End Function
End Class